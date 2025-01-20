@interface IDSDirectMessageConnection
+ (BOOL)isDirectMessagingRequested:(id)a3;
- (BOOL)canUseDirectMessaging;
- (BOOL)conciseACKSupported;
- (BOOL)connectionIsIncoming;
- (BOOL)connectionSetupInProgress;
- (BOOL)directMessagingAllowed;
- (BOOL)directMessagingSupported;
- (BOOL)isMessageEligible:(id)a3 options:(id)a4 destinationDevice:(id)a5;
- (BOOL)peerIsConnected;
- (BOOL)peerIsNearby;
- (BOOL)peerSupportsDeviceConnection;
- (BOOL)pendingAckTimerSuspended;
- (BOOL)trafficClassInitialized;
- (BOOL)trafficClassTLVProcessed;
- (BOOL)upgradedTrafficClass;
- (IDSDevice)device;
- (IDSDirectMessageConnection)initWithServiceName:(id)a3 queue:(id)a4 delegate:(id)a5;
- (IDSDirectMessageConnectionDelegate)delegate;
- (IDSServiceProperties)serviceProperties;
- (IMPowerAssertion)assertion;
- (NSDictionary)powerAssertionOptions;
- (NSMutableArray)connectionMessageSendQueue;
- (NSMutableDictionary)messageIDToMessageDictionary;
- (NSMutableDictionary)queueOneToMessageIDDictionary;
- (NSString)currentStreamName;
- (NSString)peerID;
- (NSString)serviceName;
- (OS_dispatch_queue)connectionQueue;
- (OS_dispatch_source)pendingAckTimer;
- (OS_dispatch_source)reporterTimer;
- (OS_nw_connection)connection;
- (_IDSDeviceConnection)deviceConnection;
- (char)shortServiceNameCString;
- (id)createDispatchDataForMessageSend:(id)a3 isAck:(BOOL)a4 ackMessageId:(unsigned int)add;
- (id)description;
- (int)connectionState;
- (int)directMessagingReportStatsMSEC;
- (int)directMessagingRetryMSEC;
- (int)directMessagingTimeOutMSEC;
- (int)notifyToken;
- (int64_t)idsPriorityToUse;
- (int64_t)trafficClassApplied;
- (unint64_t)directMessagingState;
- (unint64_t)identifier;
- (unint64_t)incomingMessageBytes;
- (unint64_t)incomingMessageCount;
- (unint64_t)outgoingMessageBytes;
- (unint64_t)outgoingMessageCount;
- (unsigned)dataProtectionClass;
- (unsigned)getMessageTypeForFirstMessage;
- (unsigned)trafficClassToUse;
- (void)cancel;
- (void)cancelPendingAckTimer;
- (void)clearPowerAssertion;
- (void)dealloc;
- (void)dequeueMessages;
- (void)failedToSendMessage:(id)a3 responseCode:(int64_t)a4;
- (void)getPowerAssertion;
- (void)invalidate;
- (void)logConnectionStatisticsInPowerDictionary;
- (void)parseDirectMessagingState;
- (void)processIncomingMessage:(id)a3 messageType:(unsigned __int8)a4 messageIdentifier:(unsigned int)a5;
- (void)receiveMessages;
- (void)receivedDirectMessagingSocketWithContext:(id)a3;
- (void)resetConnection;
- (void)resumePendingAckTimer;
- (void)sendAckForMessageID:(unsigned int)a3 guidToAck:(id)a4;
- (void)sendAppAckWithGUID:(id)a3;
- (void)sendMessageWithParameters:(id)a3 options:(id)a4;
- (void)setAssertion:(id)a3;
- (void)setConciseACKSupported:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionIsIncoming:(BOOL)a3;
- (void)setConnectionMessageSendQueue:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setConnectionSetupInProgress:(BOOL)a3;
- (void)setConnectionState:(int)a3;
- (void)setCurrentStreamName:(id)a3;
- (void)setDataProtectionClass:(unsigned int)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinationDevice:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDeviceConnection:(id)a3;
- (void)setDirectMessagingAllowed:(BOOL)a3;
- (void)setDirectMessagingReportStatsMSEC:(int)a3;
- (void)setDirectMessagingRetryMSEC:(int)a3;
- (void)setDirectMessagingState:(unint64_t)a3;
- (void)setDirectMessagingSupported:(BOOL)a3;
- (void)setDirectMessagingTimeOutMSEC:(int)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setIdsPriorityToUse:(int64_t)a3;
- (void)setIncomingMessageBytes:(unint64_t)a3;
- (void)setIncomingMessageCount:(unint64_t)a3;
- (void)setMessageIDToMessageDictionary:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setOutgoingMessageBytes:(unint64_t)a3;
- (void)setOutgoingMessageCount:(unint64_t)a3;
- (void)setPeerID:(id)a3;
- (void)setPeerIsConnected:(BOOL)a3;
- (void)setPeerIsNearby:(BOOL)a3;
- (void)setPeerSupportsDeviceConnection:(BOOL)a3;
- (void)setPendingAckTimer:(id)a3;
- (void)setPendingAckTimerSuspended:(BOOL)a3;
- (void)setPowerAssertionOptions:(id)a3;
- (void)setQueueOneToMessageIDDictionary:(id)a3;
- (void)setReporterTimer:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setServiceProperties:(id)a3;
- (void)setShortServiceNameCString:(char *)a3;
- (void)setTrafficClassApplied:(int64_t)a3;
- (void)setTrafficClassInitialized:(BOOL)a3;
- (void)setTrafficClassTLVProcessed:(BOOL)a3;
- (void)setTrafficClassToUse:(unsigned int)a3;
- (void)setUpgradedTrafficClass:(BOOL)a3;
- (void)setupConnectionIfApplicable;
- (void)setupIDSDeviceConnection;
- (void)startPowerLogReportTimer;
- (void)suspendPendingAckTimer;
- (void)updateConnectedDevices:(id)a3;
- (void)updateConnection:(id)a3;
- (void)updateMetadata:(id)a3;
- (void)updateTrafficClass:(unsigned __int16)a3;
@end

@implementation IDSDirectMessageConnection

- (IDSDirectMessageConnection)initWithServiceName:(id)a3 queue:(id)a4 delegate:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)IDSDirectMessageConnection;
  v12 = [(IDSDirectMessageConnection *)&v29 init];
  v13 = v12;
  if (v12)
  {
    v12->_identifier = atomic_fetch_add(&qword_1E92DCA00, 1uLL);
    objc_storeStrong((id *)&v12->_serviceName, a3);
    v14 = [(NSString *)v13->_serviceName stringByReplacingOccurrencesOfString:@"com.apple.private.alloy." withString:&stru_1EE2476E8];
    if ([v14 length])
    {
      v15 = (char *)malloc_type_calloc(1uLL, [v14 length] + 1, 0xD8F7420AuLL);
      v13->_shortServiceNameCString = v15;
      id v16 = v14;
      strlcpy(v15, (const char *)[v16 UTF8String], objc_msgSend(v16, "length") + 1);
    }
    objc_storeStrong((id *)&v13->_connectionQueue, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queueOneToMessageIDDictionary = v13->_queueOneToMessageIDDictionary;
    v13->_queueOneToMessageIDDictionary = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    messageIDToMessageDictionary = v13->_messageIDToMessageDictionary;
    v13->_messageIDToMessageDictionary = v19;

    v13->_notifyToken = -1;
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F6B5A0]) initWithServiceIdentifier:v13->_serviceName];
    serviceProperties = v13->_serviceProperties;
    v13->_serviceProperties = (IDSServiceProperties *)v21;

    v23 = v13->_serviceProperties;
    if (!v23)
    {
      [(IDSDirectMessageConnection *)v13 cancel];

      v27 = 0;
      goto LABEL_10;
    }
    v13->_dataProtectionClass = [(IDSServiceProperties *)v23 dataProtectionClass];
    assertion = v13->_assertion;
    v13->_assertion = 0;

    powerAssertionOptions = v13->_powerAssertionOptions;
    v13->_powerAssertionOptions = 0;

    *(void *)&v13->_directMessagingTimeOutMSEC = 21474836500000;
    v13->_directMessagingReportStatsMSEC = 60;
    v26 = +[IDSLogging IDSDirectMessagingConnection];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v13;
      _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "%@ Created", buf, 0xCu);
    }
  }
  v27 = v13;
LABEL_10:

  return v27;
}

- (void)parseDirectMessagingState
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = +[IDSLogging IDSDirectMessagingConnection];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t directMessagingState = self->_directMessagingState;
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2048;
    unint64_t v11 = directMessagingState;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "%@ parsing direct messaging state: %llu", (uint8_t *)&v8, 0x16u);
  }

  self->_BOOL directMessagingSupported = 0;
  *(_WORD *)&self->_peerSupportsDeviceConnection = 0;
  unint64_t v5 = self->_directMessagingState;
  if ((v5 & 2) == 0)
  {
    if ((v5 & 1) == 0) {
      goto LABEL_12;
    }
    self->_BOOL directMessagingSupported = 1;
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  [(IDSDirectMessageConnection *)self invalidate];
  [(IDSDirectMessageConnection *)self setDestinationDevice:0];
  if (!self->_directMessagingSupported) {
    goto LABEL_12;
  }
  unint64_t v5 = self->_directMessagingState;
  if ((v5 & 4) != 0) {
LABEL_9:
  }
    self->_peerSupportsDeviceConnection = 1;
LABEL_10:
  if ((v5 & 8) != 0) {
    self->_conciseACKSupported = 1;
  }
LABEL_12:
  v6 = +[IDSLogging IDSDirectMessagingConnection];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL directMessagingSupported = self->_directMessagingSupported;
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 1024;
    LODWORD(v11) = directMessagingSupported;
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "%@ direct messaging supported: %d", (uint8_t *)&v8, 0x12u);
  }
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = +[IDSLogging IDSDirectMessagingConnection];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t identifier = self->_identifier;
    shortServiceNameCString = self->_shortServiceNameCString;
    if (!shortServiceNameCString) {
      shortServiceNameCString = "<unknown>";
    }
    *(_DWORD *)buf = 134218242;
    unint64_t v9 = identifier;
    __int16 v10 = 2080;
    unint64_t v11 = shortServiceNameCString;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "[%llu %s] Dealloc", buf, 0x16u);
  }

  [(IDSDirectMessageConnection *)self cancel];
  v6 = self->_shortServiceNameCString;
  if (v6)
  {
    free(v6);
    self->_shortServiceNameCString = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)IDSDirectMessageConnection;
  [(IDSDirectMessageConnection *)&v7 dealloc];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v3, "appendFormat:", @"[%llu ", self->_identifier);
  shortServiceNameCString = self->_shortServiceNameCString;
  if (!shortServiceNameCString) {
    shortServiceNameCString = "<unknown>";
  }
  objc_msgSend(v3, "appendFormat:", @"%s ", shortServiceNameCString);
  objc_msgSend(v3, "appendFormat:", @"%s]", nw_connection_state_to_string());

  return v3;
}

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = +[IDSLogging IDSDirectMessagingConnection];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "%@ Cancel", (uint8_t *)&v5, 0xCu);
  }

  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
  }
  [(IDSDirectMessageConnection *)self invalidate];
}

- (void)invalidate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = +[IDSLogging IDSDirectMessagingConnection];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    int v5 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "%@ Invalidate", (uint8_t *)&v4, 0xCu);
  }

  [(IDSDirectMessageConnection *)self resetConnection];
  [(IDSDirectMessageConnection *)self updateMetadata:0];
  [(IDSDirectMessageConnection *)self cancelPendingAckTimer];
  [(NSMutableDictionary *)self->_messageIDToMessageDictionary removeAllObjects];
  [(NSMutableDictionary *)self->_queueOneToMessageIDDictionary removeAllObjects];
  [(NSMutableArray *)self->_connectionMessageSendQueue removeAllObjects];
}

- (void)setDestinationDevice:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    int v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A2B6B4();
    }
  }
  objc_storeStrong((id *)&self->_device, a3);
  unint64_t v9 = +[IDSLogging IDSDirectMessagingConnection];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    device = self->_device;
    int v11 = 138412546;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    v14 = device;
    _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "%@ Updated destination device: %@", (uint8_t *)&v11, 0x16u);
  }

  if (self->_connectionIsIncoming)
  {
    self->_connectionIsIncoming = 0;
    [(IDSDirectMessageConnection *)self setupIDSDeviceConnection];
  }
}

- (BOOL)canUseDirectMessaging
{
  return self->_directMessagingSupported && self->_directMessagingAllowed;
}

+ (BOOL)isDirectMessagingRequested:(id)a3
{
  id v3 = a3;
  int v4 = [v3 objectForKey:@"IDSSendMessageOptionDirectMessaging"];
  char v5 = [v4 BOOLValue];

  if (v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v3 objectForKey:@"IDSSendMessageOptionFireAndForget"];
  if (![v6 BOOLValue])
  {

    goto LABEL_6;
  }
  char v7 = _os_feature_enabled_impl();

  if ((v7 & 1) == 0)
  {
LABEL_6:
    BOOL v8 = 0;
    goto LABEL_7;
  }
LABEL_4:
  BOOL v8 = 1;
LABEL_7:

  return v8;
}

- (BOOL)isMessageEligible:(id)a3 options:(id)a4 destinationDevice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    __int16 v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A2B74C();
    }
  }
  if (![(IDSDirectMessageConnection *)self canUseDirectMessaging]) {
    goto LABEL_14;
  }
  if (!self->_trafficClassInitialized)
  {
    if (v10) {
      goto LABEL_11;
    }
LABEL_14:
    LOBYTE(v16) = 0;
    goto LABEL_22;
  }
  int64_t trafficClassApplied = self->_trafficClassApplied;
  uint64_t v15 = [v8 priority];
  LOBYTE(v16) = 0;
  if (v10 && trafficClassApplied == v15)
  {
LABEL_11:
    v17 = (void *)IDSCopyIDForDevice(v10);
    if (v17)
    {
      v18 = [v8 destinations];
      v19 = [v18 destinationURIs];
      if ([v19 containsObject:*MEMORY[0x1E4F6ADA8]])
      {
      }
      else
      {
        v20 = [v8 destinations];
        uint64_t v21 = [v20 destinationURIs];
        int v22 = [v21 containsObject:v17];

        if (!v22) {
          goto LABEL_20;
        }
      }
      if (([v8 allowCloudDelivery] & 1) == 0)
      {
        v23 = [v9 objectForKey:@"IDSSendMessageOptionAllowCloudDeliveryKey"];
        char v24 = [v23 BOOLValue];

        if ((v24 & 1) == 0 && ([v8 nonWaking] & 1) == 0)
        {
          v25 = [v9 objectForKey:@"IDSSendMessageOptionNonWaking"];
          char v26 = [v25 BOOLValue];

          if ((v26 & 1) == 0)
          {
            v28 = [v8 data];
            if (v28 || ([v8 message], (v28 = objc_claimAutoreleasedReturnValue()) != 0))
            {
            }
            else
            {
              id v16 = [v8 protobuf];

              if (!v16) {
                goto LABEL_21;
              }
            }
            LOBYTE(v16) = [(id)objc_opt_class() isDirectMessagingRequested:v9];
LABEL_21:

            goto LABEL_22;
          }
        }
      }
    }
LABEL_20:
    LOBYTE(v16) = 0;
    goto LABEL_21;
  }
LABEL_22:

  return (char)v16;
}

- (void)updateConnectedDevices:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    char v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2B7E4();
    }
  }
  id v8 = +[IDSLogging IDSDirectMessagingConnection];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v31 = self;
    __int16 v32 = 2112;
    *(void *)v33 = v4;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "%@ connected devices changed %@", buf, 0x16u);
  }

  if ([v4 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v14, "_internal", (void)v26);
          int v16 = [v15 isDefaultPairedDevice];

          if (v16)
          {
            if (!self->_device) {
              [(IDSDirectMessageConnection *)self setDestinationDevice:v14];
            }
            v18 = [v14 _internal];
            int v19 = [v18 isConnected];

            if (self->_peerIsConnected == v19)
            {
              int v20 = 0;
            }
            else
            {
              self->_BOOL peerIsConnected = v19;
              int v20 = 1;
            }
            uint64_t v21 = [v14 _internal];
            int v22 = [v21 isNearby];

            if (self->_peerIsNearby != v22)
            {
              self->_BOOL peerIsNearby = v22;
              int v20 = 1;
            }

            BOOL v17 = v20 != 0;
            goto LABEL_26;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v36 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  BOOL v17 = 0;
  *(_WORD *)&self->_BOOL peerIsConnected = 0;
LABEL_26:
  v23 = +[IDSLogging IDSDirectMessagingConnection];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    BOOL peerIsNearby = self->_peerIsNearby;
    BOOL peerIsConnected = self->_peerIsConnected;
    *(_DWORD *)buf = 138413058;
    v31 = self;
    __int16 v32 = 1024;
    *(_DWORD *)v33 = peerIsNearby;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = peerIsConnected;
    __int16 v34 = 1024;
    BOOL v35 = v17;
    _os_log_impl(&dword_19190B000, v23, OS_LOG_TYPE_DEFAULT, "%@ peerIsNearby %d peerIsConnected %d changed %d", buf, 0x1Eu);
  }

  if (v17) {
    [(IDSDirectMessageConnection *)self dequeueMessages];
  }
}

- (void)updateMetadata:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    char v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2B87C();
    }
  }
  id v8 = +[IDSLogging IDSDirectMessagingConnection];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "%@ received direct-messaging metadata %@", buf, 0x16u);
  }

  if (v4)
  {
    id v9 = [v4 objectForKeyedSubscript:@"directMsgAllowedForServices"];
    uint64_t v10 = v9;
    if (v9) {
      self->_BOOL directMessagingAllowed = [v9 containsObject:self->_serviceName];
    }
    uint64_t v11 = +[IDSLogging IDSDirectMessagingConnection];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL directMessagingAllowed = self->_directMessagingAllowed;
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      __int16 v25 = 1024;
      LODWORD(v26) = directMessagingAllowed;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "%@ direct messaging allowed: %d", buf, 0x12u);
    }

    if (self->_directMessagingAllowed)
    {
      if (self->_notifyToken == -1)
      {
        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, self);
        objc_copyWeak(&v21, (id *)buf);
        im_notify_register_dispatch();
        [(IDSDirectMessageConnection *)self parseDirectMessagingState];
        objc_destroyWeak(&v21);
        objc_destroyWeak((id *)buf);
      }
      __int16 v13 = [v4 objectForKeyedSubscript:@"peerIDForDirectMsg"];
      peerID = self->_peerID;
      self->_peerID = v13;

      v22[0] = *MEMORY[0x1E4F6C248];
      uint64_t v15 = [NSNumber numberWithInt:getpid()];
      v23[0] = v15;
      v22[1] = *MEMORY[0x1E4F6C238];
      int v16 = [v4 objectForKeyedSubscript:@"pidForIDSD"];
      v23[1] = v16;
      uint64_t v17 = *MEMORY[0x1E4F6C230];
      v22[2] = *MEMORY[0x1E4F6C240];
      v22[3] = v17;
      v23[2] = @"IDSDirectMessaging";
      v23[3] = @"com.apple.ids";
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
      powerAssertionOptions = self->_powerAssertionOptions;
      self->_powerAssertionOptions = v18;

      [(IDSDirectMessageConnection *)self startPowerLogReportTimer];
    }
  }
  else
  {
    self->_peerSupportsDeviceConnection = 0;
    self->_BOOL directMessagingAllowed = 0;
    int v20 = self->_peerID;
    self->_peerID = 0;

    self->_conciseACKSupported = 0;
  }
}

- (void)resetConnection
{
  self->_connectionSetupInProgress = 0;
  self->_connectionIsIncoming = 0;
  *(_WORD *)&self->_trafficClassInitialized = 0;
  self->_int64_t trafficClassApplied = 0;
  currentStreamName = self->_currentStreamName;
  self->_currentStreamName = 0;

  deviceConnection = self->_deviceConnection;
  if (deviceConnection)
  {
    [(_IDSDeviceConnection *)deviceConnection close];
    char v5 = self->_deviceConnection;
    self->_deviceConnection = 0;
  }
  connection = self->_connection;
  if (connection)
  {
    nw_connection_cancel(connection);
    char v7 = self->_connection;
  }
  else
  {
    char v7 = 0;
  }
  self->_connection = 0;

  self->_connectionState = 0;
  self->_upgradedTrafficClass = 0;
  [(IDSDirectMessageConnection *)self resumePendingAckTimer];
  pendingAckTimer = self->_pendingAckTimer;
  if (pendingAckTimer)
  {
    dispatch_source_cancel(pendingAckTimer);
    id v9 = self->_pendingAckTimer;
    self->_pendingAckTimer = 0;

    [(IDSDirectMessageConnection *)self logConnectionStatisticsInPowerDictionary];
  }
  reporterTimer = self->_reporterTimer;
  if (reporterTimer)
  {
    dispatch_source_cancel(reporterTimer);
    uint64_t v11 = self->_reporterTimer;
    self->_reporterTimer = 0;
  }

  [(IDSDirectMessageConnection *)self clearPowerAssertion];
}

- (void)updateConnection:(id)a3
{
  id v5 = a3;
  p_connection = &self->_connection;
  if (self->_connection) {
    [(IDSDirectMessageConnection *)self resetConnection];
  }
  objc_storeStrong((id *)&self->_connection, a3);
  if (*p_connection)
  {
    nw_connection_set_queue((nw_connection_t)*p_connection, (dispatch_queue_t)self->_connectionQueue);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    connection = self->_connection;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_19192146C;
    handler[3] = &unk_1E5729450;
    objc_copyWeak(&v10, &location);
    id v9 = v5;
    nw_connection_set_state_changed_handler(connection, handler);
    nw_connection_start((nw_connection_t)*p_connection);
    self->_connectionSetupInProgress = 1;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)updateTrafficClass:(unsigned __int16)a3
{
  if (self->_connection) {
    MEMORY[0x1F40F2C28]();
  }
}

- (void)setupIDSDeviceConnection
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_device)
  {
    if (!self->_currentStreamName)
    {
      id v3 = (NSString *)objc_msgSend([NSString alloc], "initWithFormat:", @"dmsg-%s", -[NSString UTF8String](self->_serviceName, "UTF8String"));
      currentStreamName = self->_currentStreamName;
      self->_currentStreamName = v3;
    }
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6B178]];
    int v6 = [NSNumber numberWithUnsignedInt:self->_dataProtectionClass];
    [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F6B158]];

    [v5 setObject:self->_serviceName forKeyedSubscript:*MEMORY[0x1E4F6B188]];
    [v5 setObject:self->_currentStreamName forKeyedSubscript:*MEMORY[0x1E4F6B198]];
    [v5 setObject:&unk_1EE28B190 forKeyedSubscript:*MEMORY[0x1E4F6B170]];
    char v7 = [NSNumber numberWithInteger:self->_idsPriorityToUse];
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F6B180]];

    [v5 setObject:&unk_1EE28B1A8 forKeyedSubscript:*MEMORY[0x1E4F6B148]];
    uint64_t v8 = [(IDSDirectMessageConnection *)self getMessageTypeForFirstMessage];
    id v9 = [NSNumber numberWithUnsignedChar:v8];
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F6B168]];

    id v10 = NSNumber;
    ids_monotonic_time();
    uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
    [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F6B110]];

    self->_connectionSetupInProgress = 1;
    *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    uint64_t v12 = [_IDSDeviceConnection alloc];
    device = self->_device;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_191921904;
    v16[3] = &unk_1E5729478;
    objc_copyWeak(&v17, (id *)location);
    v14 = [(_IDSDeviceConnection *)v12 initWithDevice:device options:v5 completionHandler:v16 queue:self->_connectionQueue];
    deviceConnection = self->_deviceConnection;
    self->_deviceConnection = v14;

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v5 = +[IDSLogging IDSDirectMessagingConnection];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 138412290;
      *(void *)&location[4] = self;
      _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "%@ Invalid device", location, 0xCu);
    }
  }
}

- (void)receivedDirectMessagingSocketWithContext:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    char v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2B9A0();
    }
  }
  uint64_t v8 = +[IDSLogging IDSDirectMessagingConnection];
  id v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412546;
      int v22 = self;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "%@ Received context %@", (uint8_t *)&v21, 0x16u);
    }

    id v10 = [v4 objectForKeyedSubscript:@"streamName"];
    id v9 = v10;
    if (!v10)
    {
      uint64_t v12 = +[IDSLogging IDSDirectMessagingConnection];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_191A2B95C(v12);
      }
      goto LABEL_35;
    }
    uint64_t v11 = [v10 substringFromIndex:[v10 rangeOfString:@"dmsg-"]];
    uint64_t v12 = v11;
    if (self->_currentStreamName
      && -[NSObject isEqualToString:](v11, "isEqualToString:")
      && self->_connectionSetupInProgress)
    {
      __int16 v13 = +[IDSLogging IDSDirectMessagingConnection];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        v14 = "we are the originator";
        uint64_t v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_INFO;
        uint32_t v17 = 2;
LABEL_30:
        _os_log_impl(&dword_19190B000, v15, v16, v14, (uint8_t *)&v21, v17);
        goto LABEL_34;
      }
      goto LABEL_34;
    }
    if (self->_connectionSetupInProgress && !self->_connection)
    {
      __int16 v13 = +[IDSLogging IDSDirectMessagingConnection];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        int v22 = self;
        v14 = "%@ Ignoring incoming request as existing request is in progress";
        uint64_t v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        uint32_t v17 = 12;
        goto LABEL_30;
      }
LABEL_34:

LABEL_35:
      goto LABEL_36;
    }
    if (self->_deviceConnection) {
      [(IDSDirectMessageConnection *)self resetConnection];
    }
    v18 = [v4 objectForKeyedSubscript:@"streamFlags"];
    __int16 v13 = v18;
    if (v18)
    {
      char v19 = [v18 unsignedLongLongValue];
      if ((v19 & 4) != 0)
      {
        int64_t v20 = 200;
        goto LABEL_32;
      }
      if ((v19 & 8) != 0)
      {
        int64_t v20 = 300;
        goto LABEL_32;
      }
      if ((v19 & 0x10) != 0)
      {
        int64_t v20 = 100;
LABEL_32:
        self->_idsPriorityToUse = v20;
      }
    }
    objc_storeStrong((id *)&self->_currentStreamName, v12);
    self->_connectionIsIncoming = 1;
    [(IDSDirectMessageConnection *)self setupIDSDeviceConnection];
    goto LABEL_34;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_191A2B918(v9);
  }
LABEL_36:
}

- (void)setupConnectionIfApplicable
{
  connectionMessageSendQueue = self->_connectionMessageSendQueue;
  if (connectionMessageSendQueue
    && [(NSMutableArray *)connectionMessageSendQueue count]
    && self->_peerIsConnected
    && !self->_connectionSetupInProgress
    && self->_connectionState != 3)
  {
    [(IDSDirectMessageConnection *)self setupIDSDeviceConnection];
  }
}

- (void)receiveMessages
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = self->_connection;
  connection = self->_connection;
  completion[0] = MEMORY[0x1E4F143A8];
  completion[1] = 3221225472;
  completion[2] = sub_191921E84;
  completion[3] = &unk_1E57294C8;
  objc_copyWeak(&v8, &location);
  id v5 = v3;
  char v7 = v5;
  nw_connection_receive(connection, 0xCu, 0xCu, completion);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)processIncomingMessage:(id)a3 messageType:(unsigned __int8)a4 messageIdentifier:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  int v82 = a4;
  v98[3] = *MEMORY[0x1E4F143B8];
  char v7 = sub_191922BB8(a3);
  uint64_t v8 = [v7 objectForKeyedSubscript:@"ids-dm-iri"];
  id v9 = [v7 objectForKeyedSubscript:@"ids-dm-ori"];
  id v10 = NSNumber;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", atomic_fetch_add_explicit(&qword_1E92DE270, 1uLL, memory_order_relaxed) + 1);
  v86 = self;
  __int16 v13 = self->_serviceName;
  unsigned int v81 = v5;
  v14 = [NSNumber numberWithUnsignedInt:v5];
  uint64_t v15 = [v7 objectForKeyedSubscript:@"ids-dm-spmf"];
  char v16 = [v15 unsignedCharValue];

  uint32_t v17 = [v7 objectForKey:@"ids-dm-tc"];
  v89 = [v7 objectForKeyedSubscript:@"ids-dm-cd"];
  v88 = [v7 objectForKeyedSubscript:@"ids-dm-cm"];
  v18 = v7;
  v87 = [v7 objectForKeyedSubscript:@"ids-dm-cpb"];
  id v19 = v9;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v91 = v13;
  uint64_t v80 = *MEMORY[0x1E4F6B0A8];
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v13);
  [v20 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F6B0A0]];
  id v90 = v19;
  [v20 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F6B098]];
  v92 = (void *)v8;
  [v20 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F6B080]];
  [v20 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F6B060]];
  v85 = (void *)v11;
  [v20 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F6B068]];
  [v20 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6B088]];
  if ((v16 & 4) != 0) {
    [v20 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6B0C8]];
  }
  if (v16) {
    [v20 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6B078]];
  }
  int v21 = v19;
  if (v17)
  {
    -[IDSDirectMessageConnection updateTrafficClass:](v86, "updateTrafficClass:", [v17 unsignedShortValue]);
    v86->_trafficClassTLVProcessed = 1;
  }
  int v22 = v86->_peerID;
  __int16 v23 = v22;
  switch(v82)
  {
    case 1:
      uint64_t v24 = [(IDSDirectMessageConnection *)v86 delegate];
      if (!v24) {
        goto LABEL_18;
      }
      uint64_t v25 = (void *)v24;
      [(IDSDirectMessageConnection *)v86 delegate];
      id v26 = v18;
      v28 = uint64_t v27 = v23;
      char v29 = objc_opt_respondsToSelector();

      __int16 v23 = v27;
      v18 = v26;

      if ((v29 & 1) == 0) {
        goto LABEL_18;
      }
      v30 = [(IDSDirectMessageConnection *)v86 delegate];
      [v30 connection:v86 incomingDataFromDirectConnection:v89 withGUID:v90 forTopic:v91 toIdentifier:0 fromID:v23 context:v20];
      goto LABEL_17;
    case 3:
      uint64_t v31 = [(IDSDirectMessageConnection *)v86 delegate];
      if (!v31) {
        goto LABEL_18;
      }
      __int16 v32 = (void *)v31;
      [(IDSDirectMessageConnection *)v86 delegate];
      v33 = v18;
      v35 = __int16 v34 = v23;
      char v36 = objc_opt_respondsToSelector();

      __int16 v23 = v34;
      v18 = v33;

      if ((v36 & 1) == 0) {
        goto LABEL_18;
      }
      v30 = [(IDSDirectMessageConnection *)v86 delegate];
      [v30 connection:v86 incomingMessageFromDirectConnection:v88 withGUID:v90 forTopic:v91 toIdentifier:0 fromID:v23 context:v20];
      goto LABEL_17;
    case 5:
      uint64_t v37 = [(IDSDirectMessageConnection *)v86 delegate];
      if (!v37) {
        goto LABEL_18;
      }
      v38 = (void *)v37;
      [(IDSDirectMessageConnection *)v86 delegate];
      v39 = v18;
      v41 = v40 = v23;
      char v42 = objc_opt_respondsToSelector();

      __int16 v23 = v40;
      v18 = v39;

      if ((v42 & 1) == 0) {
        goto LABEL_18;
      }
      v30 = [(IDSDirectMessageConnection *)v86 delegate];
      [v30 connection:v86 incomingProtobufFromDirectConnection:v87 withGUID:v90 forTopic:v91 toIdentifier:0 fromID:v23 context:v20];
LABEL_17:

LABEL_18:
      [(IDSDirectMessageConnection *)v86 sendAckForMessageID:v81 guidToAck:v90];
      break;
    case 7:
      v83 = v22;
      uint64_t v43 = v81;
      if (v86->_conciseACKSupported
        || ([v18 objectForKeyedSubscript:@"ids-dm-afsqnm"],
            v44 = objc_claimAutoreleasedReturnValue(),
            uint64_t v43 = bswap32([v44 unsignedIntValue]),
            v44,
            v86->_conciseACKSupported))
      {
        messageIDToMessageDictionary = v86->_messageIDToMessageDictionary;
        v46 = [NSNumber numberWithUnsignedInt:v43];
        v47 = [(NSMutableDictionary *)messageIDToMessageDictionary objectForKeyedSubscript:v46];

        BOOL v48 = v47 == 0;
        if (v47)
        {
          uint64_t v49 = [v47 objectForKeyedSubscript:@"ids-dm-msg-guid"];

          v92 = (void *)v49;
        }
      }
      else
      {
        BOOL v48 = 0;
      }
      v50 = +[IDSLogging IDSDirectMessagingConnection];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t identifier = v86->_identifier;
        shortServiceNameCString = v86->_shortServiceNameCString;
        if (!shortServiceNameCString) {
          shortServiceNameCString = "<unknown>";
        }
        *(_DWORD *)buf = 134218754;
        unint64_t v94 = identifier;
        __int16 v95 = 2080;
        v96 = shortServiceNameCString;
        __int16 v97 = 1024;
        LODWORD(v98[0]) = v43;
        WORD2(v98[0]) = 2112;
        *(void *)((char *)v98 + 6) = v92;
        _os_log_impl(&dword_19190B000, v50, OS_LOG_TYPE_DEFAULT, "[%llu %s] received ack for seq num %u guid: %@", buf, 0x26u);
      }

      if (v92)
      {
        v53 = v86->_messageIDToMessageDictionary;
        uint64_t v54 = v43;
        v55 = [NSNumber numberWithUnsignedInt:v43];
        v56 = [(NSMutableDictionary *)v53 objectForKeyedSubscript:v55];

        char v57 = v48;
        if (!v56)
        {
          v58 = +[IDSLogging IDSDirectMessagingConnection];
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v59 = v86->_identifier;
            v60 = v86->_shortServiceNameCString;
            if (!v60) {
              v60 = "<unknown>";
            }
            *(_DWORD *)buf = 134218498;
            unint64_t v94 = v59;
            __int16 v95 = 2080;
            v96 = v60;
            __int16 v97 = 2112;
            v98[0] = v92;
            _os_log_impl(&dword_19190B000, v58, OS_LOG_TYPE_DEFAULT, "[%llu %s] message for guid %@ already timed out", buf, 0x20u);
          }

          char v57 = 1;
        }
      }
      else
      {
        uint64_t v54 = v43;
        char v57 = v48;
      }
      v70 = v12;
      v71 = v86->_messageIDToMessageDictionary;
      v72 = [NSNumber numberWithUnsignedInt:v54];
      [(NSMutableDictionary *)v71 setObject:0 forKeyedSubscript:v72];

      if (![(NSMutableDictionary *)v86->_messageIDToMessageDictionary count])
      {
        [(IDSDirectMessageConnection *)v86 suspendPendingAckTimer];
        [(IDSDirectMessageConnection *)v86 clearPowerAssertion];
      }
      __int16 v23 = v83;
      if (v57) {
        goto LABEL_50;
      }
      uint64_t v73 = [(IDSDirectMessageConnection *)v86 delegate];
      if (!v73) {
        goto LABEL_50;
      }
      v74 = (void *)v73;
      v75 = [(IDSDirectMessageConnection *)v86 delegate];
      char v76 = objc_opt_respondsToSelector();

      if (v76)
      {
        id v77 = objc_alloc_init(MEMORY[0x1E4F1CA60]);

        [v77 setObject:&unk_1EE28B190 forKeyedSubscript:*MEMORY[0x1E4F6B070]];
        [v77 setObject:v83 forKeyedSubscript:*MEMORY[0x1E4F6B090]];
        [v77 setObject:v91 forKeyedSubscript:v80];
        v78 = [(IDSDirectMessageConnection *)v86 delegate];
        LOBYTE(v79) = 0;
        __int16 v23 = v83;
        [v78 connection:v86 incomingAckWithIdentifier:v92 forTopic:v91 toIdentifier:0 fromIdentifier:v83 hasBeenDeliveredWithContext:v77 isAppAck:v79];

        id v20 = v77;
LABEL_50:
        uint64_t v12 = v70;
        int v21 = v90;
      }
      else
      {
        uint64_t v12 = v70;
        int v21 = v90;
        __int16 v23 = v83;
      }
      break;
    case 9:
      v84 = v12;
      v61 = +[IDSLogging IDSDirectMessagingConnection];
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v62 = v86->_identifier;
        v63 = v86->_shortServiceNameCString;
        if (!v63) {
          v63 = "<unknown>";
        }
        *(_DWORD *)buf = 134218498;
        unint64_t v94 = v62;
        __int16 v95 = 2080;
        v96 = v63;
        __int16 v97 = 2112;
        v98[0] = v8;
        _os_log_impl(&dword_19190B000, v61, OS_LOG_TYPE_DEFAULT, "[%llu %s] received App-Level ack for: %@", buf, 0x20u);
      }

      uint64_t v64 = [(IDSDirectMessageConnection *)v86 delegate];
      if (!v64) {
        goto LABEL_42;
      }
      v65 = (void *)v64;
      v66 = v23;
      v67 = [(IDSDirectMessageConnection *)v86 delegate];
      char v68 = objc_opt_respondsToSelector();

      if (v68)
      {
        v69 = [(IDSDirectMessageConnection *)v86 delegate];
        LOBYTE(v79) = 1;
        __int16 v23 = v66;
        [v69 connection:v86 incomingAckWithIdentifier:v8 forTopic:v91 toIdentifier:0 fromIdentifier:v66 hasBeenDeliveredWithContext:v20 isAppAck:v79];

LABEL_42:
        uint64_t v12 = v84;
      }
      else
      {
        uint64_t v12 = v84;
        __int16 v23 = v66;
      }
      break;
    default:
      break;
  }
}

- (void)sendAckForMessageID:(unsigned int)a3 guidToAck:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F6B590]);
  uint64_t v8 = v7;
  if (!self->_conciseACKSupported) {
    [v7 setPeerResponseIdentifier:v6];
  }
  id v19 = @"ids-dm-snd-params";
  v20[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  id v10 = [(IDSDirectMessageConnection *)self createDispatchDataForMessageSend:v9 isAck:1 ackMessageId:v4];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  connection = self->_connection;
  completion[0] = MEMORY[0x1E4F143A8];
  completion[1] = 3221225472;
  completion[2] = sub_19192308C;
  completion[3] = &unk_1E57294F0;
  objc_copyWeak(&v16, &location);
  uint64_t v12 = *MEMORY[0x1E4F38C58];
  id v13 = v6;
  id v15 = v13;
  int v17 = v4;
  nw_connection_send(connection, v10, v12, 0, completion);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)sendAppAckWithGUID:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2BB1C();
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F6B590]);
  id v9 = [MEMORY[0x1E4F1C9E8] dictionary];
  [v8 setMessage:v9];

  [v8 setPeerResponseIdentifier:v4];
  id v10 = [NSNumber numberWithInteger:244];
  [v8 setCommand:v10];

  id v20 = @"ids-dm-snd-params";
  v21[0] = v8;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  uint64_t v12 = [(IDSDirectMessageConnection *)self createDispatchDataForMessageSend:v11 isAck:0 ackMessageId:0];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  connection = self->_connection;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1919233EC;
  v16[3] = &unk_1E5729518;
  objc_copyWeak(&v18, &location);
  v14 = *MEMORY[0x1E4F38C58];
  id v15 = v4;
  id v17 = v15;
  nw_connection_send(connection, v12, v14, 0, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (unsigned)getMessageTypeForFirstMessage
{
  if (![(NSMutableArray *)self->_connectionMessageSendQueue count]) {
    return 0;
  }
  id v3 = [(NSMutableArray *)self->_connectionMessageSendQueue firstObject];
  id v4 = [v3 objectForKeyedSubscript:@"ids-dm-snd-params"];
  uint64_t v5 = [v4 message];

  if (v5)
  {
    unsigned __int8 v6 = 3;
  }
  else
  {
    id v7 = [v4 data];

    if (v7)
    {
      unsigned __int8 v6 = 1;
    }
    else
    {
      id v8 = [v4 protobuf];

      if (v8)
      {
        unsigned __int8 v6 = 5;
      }
      else
      {
        id v9 = [v4 command];

        if (v9)
        {
          id v10 = [v4 command];
          if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            if ([v10 integerValue] == 244) {
              unsigned __int8 v6 = 9;
            }
            else {
              unsigned __int8 v6 = 0;
            }
          }
          else
          {
            unsigned __int8 v6 = 0;
          }
        }
        else
        {
          unsigned __int8 v6 = 0;
        }
      }
    }
  }

  return v6;
}

- (id)createDispatchDataForMessageSend:(id)a3 isAck:(BOOL)a4 ackMessageId:(unsigned int)add
{
  *(void *)&v70[2036] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  if (!a4)
  {
    id v10 = [v8 objectForKeyedSubscript:@"ids-dm-msg-id"];
    add = [v10 unsignedIntValue];
  }
  if (!add) {
    add = atomic_fetch_add(dword_1E92DCD68, 1u);
  }
  unsigned int v60 = add;
  uint64_t v11 = [v9 objectForKeyedSubscript:@"ids-dm-snd-params"];
  uint64_t v12 = [v11 data];
  id v13 = [v11 message];
  uint64_t v14 = [v11 protobuf];
  id v15 = [v11 messageUUID];
  id v16 = [v11 peerResponseIdentifier];
  if (a4)
  {
    char v59 = 7;
    goto LABEL_19;
  }
  id v17 = [v11 command];
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v17 integerValue] == 244)
  {
    char v18 = 9;
  }
  else if (v13)
  {
    char v18 = 3;
  }
  else if (v12)
  {
    char v18 = 1;
  }
  else
  {
    if (!v14)
    {
      char v59 = 0;
      goto LABEL_18;
    }
    char v18 = 5;
  }
  char v59 = v18;
LABEL_18:

LABEL_19:
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  char v67 = 0;
  if ([v11 expectsPeerResponse])
  {
    char v67 = 1;
    if (([v11 wantsAppAck] & 1) == 0)
    {
LABEL_25:
      LOBYTE(v66) = 3;
      v69[0] = 0x1000000;
      id v21 = v19;
      [v21 appendBytes:&v66 length:1];
      [v21 appendBytes:v69 length:4];
      [v21 appendBytes:&v67 length:1];

      goto LABEL_26;
    }
    char v20 = 5;
LABEL_24:
    char v67 = v20;
    goto LABEL_25;
  }
  if ([v11 wantsAppAck])
  {
    char v20 = 4;
    goto LABEL_24;
  }
LABEL_26:
  uint64_t v64 = v9;
  v65 = (void *)v14;
  v61 = v16;
  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v22 = [v16 dataUsingEncoding:4];
      unsigned int v23 = [v22 length];
      id v24 = v22;
      uint64_t v25 = [v24 bytes];
      LOBYTE(v66) = 4;
      v69[0] = bswap32(v23);
      id v26 = v19;
      [v26 appendBytes:&v66 length:1];
      [v26 appendBytes:v69 length:4];
      [v26 appendBytes:v25 length:v23];
    }
  }
  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v27 = [v15 length];
      uint64_t v28 = [v15 bytes];
      LOBYTE(v66) = 5;
      v69[0] = bswap32(v27);
      id v29 = v19;
      [v29 appendBytes:&v66 length:1];
      [v29 appendBytes:v69 length:4];
      [v29 appendBytes:v28 length:v27];
    }
  }
  unint64_t v62 = v15;
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v30 = [v12 length];
      uint64_t v31 = [v12 bytes];
      LOBYTE(v66) = 6;
      v69[0] = bswap32(v30);
      id v32 = v19;
      [v32 appendBytes:&v66 length:1];
      [v32 appendBytes:v69 length:4];
      [v32 appendBytes:v31 length:v30];
    }
  }
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [v13 plistData];
      unsigned int v34 = [v33 length];
      id v35 = v33;
      uint64_t v36 = [v35 bytes];
      LOBYTE(v66) = 7;
      v69[0] = bswap32(v34);
      id v37 = v19;
      [v37 appendBytes:&v66 length:1];
      [v37 appendBytes:v69 length:4];
      [v37 appendBytes:v36 length:v34];
    }
  }
  if (v65)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v38 = [v65 plistData];
      unsigned int v39 = [v38 length];
      id v40 = v38;
      uint64_t v41 = [v40 bytes];
      LOBYTE(v66) = 8;
      v69[0] = bswap32(v39);
      id v42 = v19;
      [v42 appendBytes:&v66 length:1];
      [v42 appendBytes:v69 length:4];
      [v42 appendBytes:v41 length:v39];
    }
  }
  v63 = v13;
  if (!self->_trafficClassTLVProcessed && !self->_peerSupportsDeviceConnection)
  {
    __int16 v66 = bswap32(LOWORD(self->_trafficClassToUse)) >> 16;
    char v68 = 10;
    v69[0] = 0x2000000;
    id v43 = v19;
    [v43 appendBytes:&v68 length:1];
    [v43 appendBytes:v69 length:4];
    [v43 appendBytes:&v66 length:2];

    self->_trafficClassTLVProcessed = 1;
  }
  v44 = v12;
  unsigned int v45 = [v19 length];
  v46 = [v11 queueOneIdentifier];

  if (v46)
  {
    queueOneToMessageIDDictionary = self->_queueOneToMessageIDDictionary;
    BOOL v48 = [v11 queueOneIdentifier];
    [(NSMutableDictionary *)queueOneToMessageIDDictionary setObject:0 forKeyedSubscript:v48];
  }
  uint64_t v49 = self;
  unsigned int v50 = bswap32(v45);
  unsigned int v51 = bswap32(v60);
  bzero(v69, 0x800uLL);
  int v52 = [v19 length];
  size_t v53 = (v52 + 12);
  if (v53 >= 0x801)
  {
    v55 = malloc_type_malloc((v52 + 12), 0xDF43047CuLL);
    uint64_t v54 = v55 + 3;
  }
  else
  {
    uint64_t v54 = v70;
    v55 = v69;
  }
  *(unsigned char *)v55 = 1;
  *((unsigned char *)v55 + 1) = v59;
  *((_WORD *)v55 + 1) = 0;
  v55[1] = v51;
  v55[2] = v50;
  id v56 = v19;
  memcpy(v54, (const void *)[v56 bytes], objc_msgSend(v56, "length"));
  dispatch_data_t v57 = dispatch_data_create(v55, v53, (dispatch_queue_t)v49->_connectionQueue, 0);
  if (v55 != v69) {
    free(v55);
  }

  return v57;
}

- (void)cancelPendingAckTimer
{
  [(IDSDirectMessageConnection *)self resumePendingAckTimer];
  pendingAckTimer = self->_pendingAckTimer;
  if (pendingAckTimer)
  {
    dispatch_source_cancel(pendingAckTimer);
    id v4 = self->_pendingAckTimer;
    self->_pendingAckTimer = 0;
  }
  self->_pendingAckTimerSuspended = 0;
}

- (void)resumePendingAckTimer
{
  if (self->_pendingAckTimerSuspended)
  {
    pendingAckTimer = self->_pendingAckTimer;
    if (pendingAckTimer)
    {
      dispatch_resume(pendingAckTimer);
      self->_pendingAckTimerSuspended = 0;
    }
  }
}

- (void)suspendPendingAckTimer
{
  if (!self->_pendingAckTimerSuspended)
  {
    pendingAckTimer = self->_pendingAckTimer;
    if (pendingAckTimer)
    {
      dispatch_suspend(pendingAckTimer);
      self->_pendingAckTimerSuspended = 1;
    }
  }
}

- (void)failedToSendMessage:(id)a3 responseCode:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKeyedSubscript:@"ids-dm-msg-guid"];
    id v9 = [v7 objectForKeyedSubscript:@"ids-dm-msg-id"];
    id v10 = +[IDSLogging IDSDirectMessagingConnection];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v8;
      __int16 v18 = 2048;
      int64_t v19 = a4;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Message %@ failed to send due to %ld", (uint8_t *)&v16, 0x16u);
    }

    uint64_t v11 = [(NSMutableDictionary *)self->_messageIDToMessageDictionary objectForKeyedSubscript:v9];

    if (v11)
    {
      uint64_t v12 = [(IDSDirectMessageConnection *)self delegate];

      if (v12)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained connection:self messageSendFailed:v8 responseCode:a4];
      }
      [(NSMutableDictionary *)self->_messageIDToMessageDictionary setObject:0 forKeyedSubscript:v9];
    }
    [(NSMutableArray *)self->_connectionMessageSendQueue removeObject:v7];
    uint64_t v14 = [v7 objectForKeyedSubscript:@"ids-dm-snd-params"];
    id v15 = [v14 queueOneIdentifier];
    if (v15) {
      [(NSMutableDictionary *)self->_queueOneToMessageIDDictionary setObject:0 forKeyedSubscript:v15];
    }
    [(IDSDirectMessageConnection *)self clearPowerAssertion];
  }
}

- (void)sendMessageWithParameters:(id)a3 options:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (NSString *)a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A2BDFC();
    }
  }
  if ([v6 priority] == 300
    && ([(IDSServiceProperties *)self->_serviceProperties allowUrgentMessages] & 1) == 0)
  {
    [v6 setPriority:200];
    uint64_t v11 = +[IDSLogging IDSDirectMessagingConnection];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t identifier = self->_identifier;
      if (self->_shortServiceNameCString) {
        shortServiceNameCString = self->_shortServiceNameCString;
      }
      else {
        shortServiceNameCString = "<unknown>";
      }
      uint64_t v14 = [v6 identifier];
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = identifier;
      __int16 v53 = 2080;
      uint64_t v54 = shortServiceNameCString;
      __int16 v55 = 2112;
      id v56 = v14;
      __int16 v57 = 2112;
      v58 = serviceName;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "[%llu %s] Downgrading priority of message with guid %@ to Default from Urgent, client %@ is not configured to send urgent messages", buf, 0x2Au);
    }
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v16 setObject:v6 forKeyedSubscript:@"ids-dm-snd-params"];
  [v16 setObject:v7 forKeyedSubscript:@"ids-dm-options"];
  id v17 = [NSNumber numberWithUnsignedLongLong:mach_continuous_time()];
  [v16 setObject:v17 forKeyedSubscript:@"ids-dm-snd-time"];

  __int16 v18 = NSNumber;
  atomic_fetch_add(dword_1E92DCD68, 1u);
  int64_t v19 = objc_msgSend(v18, "numberWithUnsignedInt:");
  [v16 setObject:v19 forKeyedSubscript:@"ids-dm-msg-id"];
  uint64_t v20 = [v6 identifier];
  [v16 setObject:v20 forKeyedSubscript:@"ids-dm-msg-guid"];

  [(NSMutableDictionary *)self->_messageIDToMessageDictionary setObject:v16 forKeyedSubscript:v19];
  id v21 = +[IDSLogging IDSDirectMessagingConnection];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v22 = self->_identifier;
    if (self->_shortServiceNameCString) {
      unsigned int v23 = self->_shortServiceNameCString;
    }
    else {
      unsigned int v23 = "<unknown>";
    }
    id v24 = [v6 identifier];
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = v22;
    __int16 v53 = 2080;
    uint64_t v54 = v23;
    __int16 v55 = 2112;
    id v56 = v24;
    __int16 v57 = 2112;
    v58 = v7;
    _os_log_impl(&dword_19190B000, v21, OS_LOG_TYPE_DEFAULT, "[%llu %s] Client requesting to send message with guid %@ options %@", buf, 0x2Au);
  }
  if (!self->_connectionMessageSendQueue)
  {
    uint64_t v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    connectionMessageSendQueue = self->_connectionMessageSendQueue;
    self->_connectionMessageSendQueue = v25;
  }
  unsigned int v27 = [(IDSDevice *)self->_device _internal];
  if (([v27 relationship] & 2) == 0)
  {

    goto LABEL_23;
  }
  char v28 = [(IDSServiceProperties *)self->_serviceProperties wantsTinkerDevices];

  if (v28)
  {
LABEL_23:
    if (!self->_trafficClassInitialized)
    {
      *(int64x2_t *)&self->_idsPriorityToUse = vdupq_n_s64(0xC8uLL);
      if ([v6 priority] == 300)
      {
        self->_trafficClassToUse = 700;
        self->_idsPriorityToUse = 300;
        self->_int64_t trafficClassApplied = [v6 priority];
      }
      if ([v6 priority] == 100)
      {
        self->_trafficClassToUse = 200;
        self->_idsPriorityToUse = 100;
        self->_int64_t trafficClassApplied = [v6 priority];
      }
      self->_trafficClassInitialized = 1;
    }
    if (!self->_pendingAckTimer)
    {
      id v29 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_connectionQueue);
      dispatch_time_t v30 = dispatch_time(0, 2000000000);
      dispatch_source_set_timer(v29, v30, 0x77359400uLL, 0x5F5E100uLL);
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = sub_191924AB4;
      handler[3] = &unk_1E5729568;
      objc_copyWeak(&v51, (id *)buf);
      uint64_t v31 = v29;
      unsigned int v50 = v31;
      dispatch_source_set_event_handler(v31, handler);
      dispatch_resume(v31);
      pendingAckTimer = self->_pendingAckTimer;
      self->_pendingAckTimer = (OS_dispatch_source *)v31;
      v33 = v31;

      self->_pendingAckTimerSuspended = 0;
      objc_destroyWeak(&v51);
      objc_destroyWeak((id *)buf);
    }
    [(IDSDirectMessageConnection *)self resumePendingAckTimer];
    unsigned int v34 = [v6 queueOneIdentifier];
    if (v34)
    {
      uint64_t v35 = [(NSMutableDictionary *)self->_queueOneToMessageIDDictionary objectForKeyedSubscript:v34];
      if (v35)
      {
        uint64_t v36 = (void *)v35;
        uint64_t v37 = [(NSMutableDictionary *)self->_messageIDToMessageDictionary objectForKeyedSubscript:v35];
        if (v37)
        {
          v38 = (void *)v37;
          uint64_t v39 = [(NSMutableArray *)self->_connectionMessageSendQueue indexOfObject:v37];
          if (v39 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v41 = v39;
            id v42 = +[IDSLogging IDSDirectMessagingConnection];
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              id v43 = self->_shortServiceNameCString;
              if (!v43) {
                id v43 = "<unknown>";
              }
              v46 = v43;
              unint64_t v47 = self->_identifier;
              BOOL v48 = [v38 objectForKeyedSubscript:@"ids-dm-msg-guid"];
              unsigned int v45 = [v6 identifier];
              *(_DWORD *)buf = 134218754;
              *(void *)&uint8_t buf[4] = v47;
              __int16 v53 = 2080;
              uint64_t v54 = v46;
              __int16 v55 = 2112;
              id v56 = v48;
              __int16 v57 = 2112;
              v58 = v45;
              _os_log_impl(&dword_19190B000, v42, OS_LOG_TYPE_DEFAULT, "[%llu %s] Replacing guid: %@ with guid: %@", buf, 0x2Au);
            }
            [(NSMutableArray *)self->_connectionMessageSendQueue replaceObjectAtIndex:v41 withObject:v16];
            [(NSMutableDictionary *)self->_messageIDToMessageDictionary setObject:0 forKeyedSubscript:v36];

            v44 = [v16 objectForKeyedSubscript:@"ids-dm-msg-id"];
            [(NSMutableDictionary *)self->_queueOneToMessageIDDictionary setObject:v44 forKeyedSubscript:v34];

            goto LABEL_41;
          }
        }
        id v40 = [v16 objectForKeyedSubscript:@"ids-dm-msg-id"];
        [(NSMutableDictionary *)self->_queueOneToMessageIDDictionary setObject:v40 forKeyedSubscript:v34];
      }
      else
      {
        uint64_t v36 = [v16 objectForKeyedSubscript:@"ids-dm-msg-id"];
        [(NSMutableDictionary *)self->_queueOneToMessageIDDictionary setObject:v36 forKeyedSubscript:v34];
      }
    }
    [(NSMutableArray *)self->_connectionMessageSendQueue addObject:v16];
LABEL_41:
    [(IDSDirectMessageConnection *)self dequeueMessages];

    goto LABEL_42;
  }
  [(IDSDirectMessageConnection *)self failedToSendMessage:v16 responseCode:32];
LABEL_42:
}

- (void)dequeueMessages
{
  if ([(IDSDirectMessageConnection *)self canUseDirectMessaging])
  {
    [(IDSDirectMessageConnection *)self setupConnectionIfApplicable];
    connectionMessageSendQueue = self->_connectionMessageSendQueue;
    if (connectionMessageSendQueue)
    {
      if ([(NSMutableArray *)connectionMessageSendQueue count]
        && self->_connectionState == 3
        && self->_peerIsConnected)
      {
        [(IDSDirectMessageConnection *)self getPowerAssertion];
        id v4 = [(NSMutableArray *)self->_connectionMessageSendQueue firstObject];
        uint64_t v5 = [v4 objectForKeyedSubscript:@"ids-dm-msg-id"];
        int v6 = [v5 unsignedIntValue];
        id v7 = [v4 objectForKeyedSubscript:@"ids-dm-snd-params"];
        id v8 = [v7 identifier];
        id location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, self);
        if ([v7 requireBluetooth] && !self->_peerIsNearby)
        {
          [(NSMutableArray *)self->_connectionMessageSendQueue removeFirstObject];
          connectionQueue = self->_connectionQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_19192502C;
          block[3] = &unk_1E5729568;
          objc_copyWeak(&v20, &location);
          id v19 = v4;
          dispatch_async(connectionQueue, block);

          objc_destroyWeak(&v20);
        }
        else
        {
          int v9 = [(IDSDirectMessageConnection *)self createDispatchDataForMessageSend:v4 isAck:0 ackMessageId:0];
          size = (void *)dispatch_data_get_size(v9);
          [(NSMutableArray *)self->_connectionMessageSendQueue removeFirstObject];
          connection = self->_connection;
          uint64_t v12 = *MEMORY[0x1E4F38C58];
          completion[0] = MEMORY[0x1E4F143A8];
          completion[1] = 3221225472;
          completion[2] = sub_19192508C;
          completion[3] = &unk_1E5729590;
          objc_copyWeak(v16, &location);
          int v17 = v6;
          id v15 = v8;
          v16[1] = size;
          nw_connection_send(connection, v9, v12, 0, completion);

          objc_destroyWeak(v16);
        }
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)getPowerAssertion
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_assertion)
  {
    if (self->_powerAssertionOptions)
    {
      id v3 = objc_alloc(MEMORY[0x1E4F6C3B0]);
      id v9 = [NSString stringWithFormat:@"ids-dm-%@", self->_serviceName];
      id v4 = (IMPowerAssertion *)objc_msgSend(v3, "initWithIdentifier:timeoutSec:properties:", 40.0);
      assertion = self->_assertion;
      self->_assertion = v4;
    }
    else
    {
      int v6 = +[IDSLogging IDSDirectMessagingConnection];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t identifier = self->_identifier;
        shortServiceNameCString = self->_shortServiceNameCString;
        if (!shortServiceNameCString) {
          shortServiceNameCString = "<unknown>";
        }
        *(_DWORD *)buf = 134218242;
        unint64_t v11 = identifier;
        __int16 v12 = 2080;
        id v13 = shortServiceNameCString;
        _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "[%llu %s] Error! powerAssertionOptions is nil. Cannot get power assertion.", buf, 0x16u);
      }
    }
  }
}

- (void)clearPowerAssertion
{
  if (self->_assertion)
  {
    messageIDToMessageDictionary = self->_messageIDToMessageDictionary;
    if (!messageIDToMessageDictionary || ![(NSMutableDictionary *)messageIDToMessageDictionary count])
    {
      self->_assertion = 0;
      MEMORY[0x1F41817F8]();
    }
  }
}

- (void)startPowerLogReportTimer
{
  reporterTimer = self->_reporterTimer;
  if (reporterTimer) {
    dispatch_source_cancel(reporterTimer);
  }
  id v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_connectionQueue);
  uint64_t v5 = self->_reporterTimer;
  self->_reporterTimer = v4;

  int v6 = self->_reporterTimer;
  dispatch_time_t v7 = dispatch_time(0, 100000000);
  dispatch_source_set_timer(v6, v7, 1000000000 * self->_directMessagingReportStatsMSEC, 0x5F5E100uLL);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v8 = self->_reporterTimer;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1919254AC;
  v9[3] = &unk_1E57295B8;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v8, v9);
  dispatch_resume((dispatch_object_t)self->_reporterTimer);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)logConnectionStatisticsInPowerDictionary
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = [NSString stringWithFormat:@"ids-dm-%@", self->_serviceName];
  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:self->_outgoingMessageBytes];
  int v6 = [NSNumber numberWithUnsignedLongLong:self->_outgoingMessageCount];
  dispatch_time_t v7 = [NSNumber numberWithUnsignedLongLong:self->_incomingMessageBytes];
  id v8 = [NSNumber numberWithUnsignedLongLong:self->_incomingMessageCount];
  id v9 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"IDSLocalStatisticsCategory", v5, @"IDSLocalOutgoingMessageBytes", v6, @"IDSLocalOutgoingMessages", v7, @"IDSLocalIncomingMessageBytes", v8, @"IDSLocalIncomingMessages", 0);

  IDSPowerLogDictionary();
  id v10 = +[IDSLogging IDSDirectMessagingConnection];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t identifier = self->_identifier;
    shortServiceNameCString = self->_shortServiceNameCString;
    if (!shortServiceNameCString) {
      shortServiceNameCString = "<unknown>";
    }
    *(_DWORD *)buf = 134218498;
    unint64_t v14 = identifier;
    __int16 v15 = 2080;
    id v16 = shortServiceNameCString;
    __int16 v17 = 2112;
    __int16 v18 = v9;
    _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "[%llu %s] logConnectionStatisticsInPowerDictionary: %@", buf, 0x20u);
  }
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_unint64_t identifier = a3;
}

- (char)shortServiceNameCString
{
  return self->_shortServiceNameCString;
}

- (void)setShortServiceNameCString:(char *)a3
{
  self->_shortServiceNameCString = a3;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (int)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int)a3
{
  self->_connectionState = a3;
}

- (BOOL)connectionSetupInProgress
{
  return self->_connectionSetupInProgress;
}

- (void)setConnectionSetupInProgress:(BOOL)a3
{
  self->_connectionSetupInProgress = a3;
}

- (NSMutableArray)connectionMessageSendQueue
{
  return self->_connectionMessageSendQueue;
}

- (void)setConnectionMessageSendQueue:(id)a3
{
}

- (IDSDirectMessageConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSDirectMessageConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)upgradedTrafficClass
{
  return self->_upgradedTrafficClass;
}

- (void)setUpgradedTrafficClass:(BOOL)a3
{
  self->_upgradedTrafficClass = a3;
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
}

- (BOOL)connectionIsIncoming
{
  return self->_connectionIsIncoming;
}

- (void)setConnectionIsIncoming:(BOOL)a3
{
  self->_connectionIsIncoming = a3;
}

- (BOOL)pendingAckTimerSuspended
{
  return self->_pendingAckTimerSuspended;
}

- (void)setPendingAckTimerSuspended:(BOOL)a3
{
  self->_pendingAckTimerSuspended = a3;
}

- (BOOL)directMessagingAllowed
{
  return self->_directMessagingAllowed;
}

- (void)setDirectMessagingAllowed:(BOOL)a3
{
  self->_BOOL directMessagingAllowed = a3;
}

- (OS_dispatch_source)pendingAckTimer
{
  return self->_pendingAckTimer;
}

- (void)setPendingAckTimer:(id)a3
{
}

- (OS_dispatch_source)reporterTimer
{
  return self->_reporterTimer;
}

- (void)setReporterTimer:(id)a3
{
}

- (NSMutableDictionary)queueOneToMessageIDDictionary
{
  return self->_queueOneToMessageIDDictionary;
}

- (void)setQueueOneToMessageIDDictionary:(id)a3
{
}

- (NSMutableDictionary)messageIDToMessageDictionary
{
  return self->_messageIDToMessageDictionary;
}

- (void)setMessageIDToMessageDictionary:(id)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_int notifyToken = a3;
}

- (BOOL)directMessagingSupported
{
  return self->_directMessagingSupported;
}

- (void)setDirectMessagingSupported:(BOOL)a3
{
  self->_BOOL directMessagingSupported = a3;
}

- (unsigned)trafficClassToUse
{
  return self->_trafficClassToUse;
}

- (void)setTrafficClassToUse:(unsigned int)a3
{
  self->_trafficClassToUse = a3;
}

- (int64_t)idsPriorityToUse
{
  return self->_idsPriorityToUse;
}

- (void)setIdsPriorityToUse:(int64_t)a3
{
  self->_idsPriorityToUse = a3;
}

- (BOOL)trafficClassInitialized
{
  return self->_trafficClassInitialized;
}

- (void)setTrafficClassInitialized:(BOOL)a3
{
  self->_trafficClassInitialized = a3;
}

- (int64_t)trafficClassApplied
{
  return self->_trafficClassApplied;
}

- (void)setTrafficClassApplied:(int64_t)a3
{
  self->_int64_t trafficClassApplied = a3;
}

- (BOOL)trafficClassTLVProcessed
{
  return self->_trafficClassTLVProcessed;
}

- (void)setTrafficClassTLVProcessed:(BOOL)a3
{
  self->_trafficClassTLVProcessed = a3;
}

- (BOOL)peerIsConnected
{
  return self->_peerIsConnected;
}

- (void)setPeerIsConnected:(BOOL)a3
{
  self->_BOOL peerIsConnected = a3;
}

- (BOOL)peerIsNearby
{
  return self->_peerIsNearby;
}

- (void)setPeerIsNearby:(BOOL)a3
{
  self->_BOOL peerIsNearby = a3;
}

- (IDSDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (_IDSDeviceConnection)deviceConnection
{
  return self->_deviceConnection;
}

- (void)setDeviceConnection:(id)a3
{
}

- (NSString)currentStreamName
{
  return self->_currentStreamName;
}

- (void)setCurrentStreamName:(id)a3
{
}

- (BOOL)peerSupportsDeviceConnection
{
  return self->_peerSupportsDeviceConnection;
}

- (void)setPeerSupportsDeviceConnection:(BOOL)a3
{
  self->_peerSupportsDeviceConnection = a3;
}

- (BOOL)conciseACKSupported
{
  return self->_conciseACKSupported;
}

- (void)setConciseACKSupported:(BOOL)a3
{
  self->_conciseACKSupported = a3;
}

- (unint64_t)directMessagingState
{
  return self->_directMessagingState;
}

- (void)setDirectMessagingState:(unint64_t)a3
{
  self->_unint64_t directMessagingState = a3;
}

- (int)directMessagingTimeOutMSEC
{
  return self->_directMessagingTimeOutMSEC;
}

- (void)setDirectMessagingTimeOutMSEC:(int)a3
{
  self->_directMessagingTimeOutMSEC = a3;
}

- (int)directMessagingRetryMSEC
{
  return self->_directMessagingRetryMSEC;
}

- (void)setDirectMessagingRetryMSEC:(int)a3
{
  self->_directMessagingRetryMSEC = a3;
}

- (int)directMessagingReportStatsMSEC
{
  return self->_directMessagingReportStatsMSEC;
}

- (void)setDirectMessagingReportStatsMSEC:(int)a3
{
  self->_directMessagingReportStatsMSEC = a3;
}

- (unsigned)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setDataProtectionClass:(unsigned int)a3
{
  self->_dataProtectionClass = a3;
}

- (IDSServiceProperties)serviceProperties
{
  return self->_serviceProperties;
}

- (void)setServiceProperties:(id)a3
{
}

- (IMPowerAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (NSDictionary)powerAssertionOptions
{
  return self->_powerAssertionOptions;
}

- (void)setPowerAssertionOptions:(id)a3
{
}

- (unint64_t)outgoingMessageBytes
{
  return self->_outgoingMessageBytes;
}

- (void)setOutgoingMessageBytes:(unint64_t)a3
{
  self->_outgoingMessageBytes = a3;
}

- (unint64_t)outgoingMessageCount
{
  return self->_outgoingMessageCount;
}

- (void)setOutgoingMessageCount:(unint64_t)a3
{
  self->_outgoingMessageCount = a3;
}

- (unint64_t)incomingMessageBytes
{
  return self->_incomingMessageBytes;
}

- (void)setIncomingMessageBytes:(unint64_t)a3
{
  self->_incomingMessageBytes = a3;
}

- (unint64_t)incomingMessageCount
{
  return self->_incomingMessageCount;
}

- (void)setIncomingMessageCount:(unint64_t)a3
{
  self->_incomingMessageCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertionOptions, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_serviceProperties, 0);
  objc_storeStrong((id *)&self->_currentStreamName, 0);
  objc_storeStrong((id *)&self->_deviceConnection, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_messageIDToMessageDictionary, 0);
  objc_storeStrong((id *)&self->_queueOneToMessageIDDictionary, 0);
  objc_storeStrong((id *)&self->_reporterTimer, 0);
  objc_storeStrong((id *)&self->_pendingAckTimer, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionMessageSendQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end