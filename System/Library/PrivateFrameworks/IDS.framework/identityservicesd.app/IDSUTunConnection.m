@interface IDSUTunConnection
- (BOOL)_isMagnetConnection;
- (BOOL)_isWiProxPeer;
- (BOOL)_messageHasValidEncryptionStatus:(id)a3;
- (BOOL)_messageIsAllowedToSendMessageOnTopic:(id)a3;
- (BOOL)_nonBTAllowedForClientID:(id)a3;
- (BOOL)_nonThreadSafeIsConnected;
- (BOOL)_performFallbackIfNecessary:(id)a3;
- (BOOL)_resourceTransferUUIDAlreaadyReceived:(id)a3;
- (BOOL)_shouldAWDLogMessage:(id)a3;
- (BOOL)_storeIncomingClassADataMesageIfNeeded:(id)a3 topic:(id)a4 sequenceNumber:(unsigned int)a5;
- (BOOL)_storeIncomingClassCDataMessageIfNeeded:(id)a3 topic:(id)a4 sequenceNumber:(unsigned int)a5;
- (BOOL)checkServiceCompability:(id)a3 localMessage:(id)a4;
- (BOOL)enableOTR;
- (BOOL)hasSpaceForMessagesWithDataProtectionClass:(unsigned int)a3;
- (BOOL)isAlwaysConnected;
- (BOOL)isCloudEnabled;
- (BOOL)isConnected;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIdle;
- (BOOL)isMagnetIndicatingPeerIsAwake;
- (BOOL)supportsLegacyOTRSessionToken;
- (BOOL)supportsMessageOfType:(int64_t)a3;
- (IDSUTunConnection)cloudConnection;
- (IDSUTunConnection)initWithIdentifier:(id)a3 socketPriority:(int64_t)a4 btUUID:(id)a5 uniqueID:(id)a6 incomingServiceMap:(id)a7 outgoingServiceMap:(id)a8 isCloudEnabled:(BOOL)a9 shouldUseIPsecLink:(BOOL)a10;
- (IDSUTunConnectionDelegate)delegate;
- (NSArray)supportedMessageTypes;
- (NSDictionary)cumulativeIncomingStatistics;
- (NSDictionary)cumulativeOutgoingStatistics;
- (NSDictionary)queueStatistics;
- (NSDictionary)sendingMessageStatistics;
- (NSString)cbuuid;
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (double)_dequeueMessagesTimerInterval;
- (double)_fallbackTimeoutForService:(id)a3;
- (double)_nanoConnectedFallbackTimeoutForService:(id)a3;
- (double)_nanoDisconnectedFallbackTimeoutForService:(id)a3;
- (double)rtt;
- (id)_UTunDeliveryController;
- (id)_decryptOTREncrtypedMessage:(id)a3;
- (id)_encryptDataWithOTR:(id)a3 token:(id)a4;
- (id)_encryptionController;
- (id)_nonThreadSafeSocketOptions;
- (id)_now;
- (id)_sendingMessageStatisticsForClass:(unsigned int)a3;
- (id)serviceController;
- (int64_t)_socketToNiceCommand:(unsigned __int8)a3;
- (int64_t)idsPriority;
- (int64_t)priority;
- (unint64_t)_currentLink;
- (unint64_t)_inflightMessageCount;
- (unint64_t)_inflightMessageCountForClass:(unsigned int)a3;
- (unint64_t)_inflightMessageCountForType:(int64_t)a3;
- (unint64_t)_pendingOutgoingBytesForClass:(unsigned int)a3;
- (unint64_t)_sendingMessageCountForClass:(unsigned int)a3;
- (unint64_t)_sendingMessageCountForType:(int64_t)a3;
- (unint64_t)maxQueueSize;
- (unsigned)_calculateRandomDelayForCloudMessagingRequest;
- (unsigned)dataProtectionClass;
- (void)_addIncomingMessageSize:(unint64_t)a3 forTopic:(id)a4;
- (void)_addMessageSize:(unint64_t)a3 forTopic:(id)a4 direction:(unsigned __int8)a5 dataProtectionClass:(unsigned int)a6 isResource:(BOOL)a7;
- (void)_addOutgoingMessageSize:(unint64_t)a3 forTopic:(id)a4 dataProtectionClass:(unsigned int)a5 isResource:(BOOL)a6;
- (void)_addStatsFromDict:(id)a3 toAggregate:(id)a4;
- (void)_assertQuickRelayForCloudMessaging;
- (void)_checkAndStartConnection;
- (void)_clearLastFallbackWithReason:(id)a3;
- (void)_clearSendingPowerAssertionWithReason:(id)a3;
- (void)_connectivityChanged;
- (void)_decryptPublicKeyEncryptedMessage:(id)a3 completionBlock:(id)a4;
- (void)_dequeueMessages;
- (void)_dequeueMessagesTimerDidFire:(id)a3;
- (void)_dequeueTimerFiredOnMain:(id)a3;
- (void)_dumpLogs;
- (void)_fallbackTimerFired;
- (void)_fallbackTimerFiredOnMain;
- (void)_flushMessagesAll:(BOOL)a3 response:(int64_t)a4;
- (void)_handleBecomingEmpty;
- (void)_handleBecomingEmptyForDataProtectionClass:(unsigned int)a3;
- (void)_handleBecomingEmptyOfCloudMessages;
- (void)_handleOTRDecryptionError:(id)a3;
- (void)_handleOTRDecryptionSuccess:(id)a3;
- (void)_invalidateMessagesDequeueTimer;
- (void)_messageTimedOut:(id)a3 localMessage:(id)a4;
- (void)_nonThreadSafeStopConnection;
- (void)_noteReceivedResourceTransferUUID:(id)a3;
- (void)_optionallyDecryptMessage:(id)a3 completionBlock:(id)a4;
- (void)_processDecryptedMessage:(id)a3;
- (void)_processIncomingDataMessage:(id)a3;
- (void)_processIncomingResourceTransferMessage:(id)a3 messageUUID:(id)a4 streamID:(unsigned __int16)a5 topic:(id)a6 wantsAppAck:(BOOL)a7 expectsPeerResponse:(BOOL)a8 peerResponseIdentifier:(id)a9 isDefaultPairedDevice:(BOOL)a10 didWakeHint:(BOOL)a11;
- (void)_processMessage:(id)a3 withSequenceNumberBlock:(id)a4;
- (void)_removeMessageFromStatistics:(id)a3;
- (void)_removeSocketPairMessage:(id)a3 localMessage:(id)a4 reason:(id)a5 detailedError:(id)a6 responseCode:(int64_t)a7;
- (void)_removeSocketPairMessage:(id)a3 localMessage:(id)a4 reason:(id)a5 responseCode:(int64_t)a6;
- (void)_requeueMessages:(id)a3;
- (void)_requeueSendingMessage:(id)a3;
- (void)_resetFallbackTimeout:(double)a3 useNextFallback:(BOOL)a4;
- (void)_resetTimeout:(id)a3;
- (void)_sendAckForMessage:(id)a3;
- (void)_sendEncryptedMessage:(id)a3;
- (void)_sendExpiredAckForMessage:(id)a3;
- (void)_sendOTREncryptedMessage:(id)a3 useEncryption:(BOOL)a4 streamID:(unsigned __int16)a5 forPriority:(int64_t)a6 flag:(int)a7 token:(id)a8;
- (void)_sendOTREncryptionQueue:(id)a3 streamID:(unsigned __int16)a4;
- (void)_sendPublicKeyEncryptedMessage:(id)a3;
- (void)_sendSocketMessage:(id)a3;
- (void)_sendSocketMessage:(id)a3 ignoreSequenceNumber:(BOOL)a4;
- (void)_startAndSetupSocketPairConnection:(IDSUTunConnection *)self capabilityFlags:(SEL)a2 instanceID:(id)a3 serviceMinCompatibilityVersion:(unint64_t)a4 socketDescriptor:(unsigned __int8 *)(a5;
- (void)_startConnection;
- (void)_startConnectionForContinuityPeer;
- (void)_startMessagesDequeueMessagesTimer;
- (void)_startNWConnectinForIPsecCase:(int)a3 controlChannelVersion:(id)a4 capabilityFlags:(unint64_t)a5 instanceID:(unsigned __int8 *)(a6 serviceMinCompatibilityVersion:;
- (void)_timeoutTimerFired;
- (void)_timeoutTimerFiredOnMain;
- (void)_updateDictionary:(id)a3 addMessageSize:(int64_t)a4 addMessageCount:(int64_t)a5;
- (void)admissionPolicyChangedForTopic:(id)a3 allowed:(BOOL)a4;
- (void)cancelMessageID:(id)a3;
- (void)classStorageBecameAvailable:(id)a3;
- (void)clearStats;
- (void)connection:(id)a3 didReceiveDataMessage:(id)a4;
- (void)connectionBecameEmpty;
- (void)connectionBecameEmpty:(id)a3;
- (void)connectionDidClose;
- (void)connectionDidClose:(id)a3;
- (void)connectionDidReachInFlightMessageLowWaterMark:(id)a3;
- (void)connectionDidReceiveBytes:(id)a3;
- (void)dealloc;
- (void)didReceiveDataMessage:(id)a3;
- (void)dropDisallowedMessages;
- (void)flushAllMessagesForReason:(int64_t)a3;
- (void)forceOTRNegotiation:(id)a3 priority:(int64_t)a4 completionBlock:(id)a5;
- (void)handleOTRNegotiationComplete:(id)a3;
- (void)handleOTRNegotiationTimeout:(id)a3;
- (void)invalidateTimeoutTimer;
- (void)kickProgressBlockForMessageID:(id)a3;
- (void)resumeConnectivity;
- (void)retryWaitingMessages;
- (void)sendAckForMessageWithSequenceNumber:(unsigned int)a3;
- (void)sendMessage:(id)a3;
- (void)setCbuuid:(id)a3;
- (void)setCloudConnection:(id)a3;
- (void)setDataProtectionClass:(unsigned int)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceBTUUID:(id)a3;
- (void)setEnableOTR:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3 withReason:(id)a4;
- (void)setIdsPriority:(int64_t)a3;
- (void)setIsAlwaysConnected:(BOOL)a3;
- (void)setIsMagnetIndicatingPeerIsAwake:(BOOL)a3;
- (void)setMaxQueueSize:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setSupportedMessageTypes:(id)a3;
- (void)setSupportsLegacyOTRSessionToken:(BOOL)a3;
- (void)trafficClassesChanged;
@end

@implementation IDSUTunConnection

- (BOOL)isIdle
{
  v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:self->_priority];

  if ([(IDSUTunConnection *)self _inflightMessageCount]) {
    return 0;
  }
  if (!self->_isCloudEnabled) {
    return 1;
  }
  ids_monotonic_time();
  double v6 = v5;
  [(IDSSocketPairConnectionProtocol *)self->_socketConnection lastSocketActivityTime];
  return v6 - v7 >= 10.0;
}

- (unint64_t)_inflightMessageCount
{
  unint64_t v3 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue count];
  return (unint64_t)[(NSMutableArray *)self->_sendingMessages count] + v3;
}

- (IDSUTunConnection)cloudConnection
{
  return self->_cloudConnection;
}

- (IDSUTunConnection)initWithIdentifier:(id)a3 socketPriority:(int64_t)a4 btUUID:(id)a5 uniqueID:(id)a6 incomingServiceMap:(id)a7 outgoingServiceMap:(id)a8 isCloudEnabled:(BOOL)a9 shouldUseIPsecLink:(BOOL)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v38.receiver = self;
  v38.super_class = (Class)IDSUTunConnection;
  v21 = [(IDSUTunConnection *)&v38 init];
  if (v21)
  {
    v22 = (NSString *)[v16 copy];
    identifier = v21->_identifier;
    v21->_identifier = v22;

    uint64_t v24 = [(NSString *)v21->_identifier stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    otrTokenIdentifier = v21->_otrTokenIdentifier;
    v21->_otrTokenIdentifier = (NSString *)v24;

    v26 = (NSString *)[v17 copy];
    cbuuid = v21->_cbuuid;
    v21->_cbuuid = v26;

    v28 = (NSString *)[v18 copy];
    uniqueID = v21->_uniqueID;
    v21->_uniqueID = v28;

    v30 = [[IDSLocalDeliveryQueue alloc] initWithIdentifier:v16];
    deliveryQueue = v21->_deliveryQueue;
    v21->_deliveryQueue = v30;

    v21->_priority = a4;
    v21->_isMagnetIndicatingPeerIsAwake = 1;
    *(_WORD *)&v21->_useSharedOTRSession = 257;
    v21->_isCloudEnabled = a9;
    v21->_shouldUseIPsecLink = a10;
    objc_storeStrong((id *)&v21->_incomingServiceMap, a7);
    objc_storeStrong((id *)&v21->_outgoingServiceMap, a8);
    v32 = +[NSNotificationCenter defaultCenter];
    [v32 addObserver:v21 selector:"classStorageBecameAvailable:" name:@"__kIDSOTRKeyStorageClassStorageIsAvailableNotification" object:0];

    v33 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v34 = (const __CFString *)v21->_identifier;
      *(_DWORD *)buf = 138412546;
      CFStringRef v40 = v34;
      __int16 v41 = 2048;
      v42 = v21;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Initing UTunConnection %@ %p", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    if (v21->_shouldUseIPsecLink)
    {
      v21->_shouldUseNWFraming = IMGetDomainBoolForKeyWithDefaultValue();
      v35 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        if (v21->_shouldUseNWFraming) {
          CFStringRef v36 = @"YES";
        }
        else {
          CFStringRef v36 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v40 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "shouldUseNWFramingOverIPsecString: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
    }
  }

  return v21;
}

- (void)dealloc
{
  unint64_t v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138412546;
    v13 = identifier;
    __int16 v14 = 2048;
    v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deallocing UTunConnection %@ %p", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v9 = self->_identifier;
    v10 = self;
    _IDSLogV();
  }
  double v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  [(IDSUTunConnection *)self _nonThreadSafeStopConnection];
  [(IMTimer *)self->_fallbackTimer invalidate];
  fallbackTimer = self->_fallbackTimer;
  self->_fallbackTimer = 0;

  [(IMTimer *)self->_timeoutTimer invalidate];
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;

  [(IMTimer *)self->_dequeueTimer invalidate];
  dequeueTimer = self->_dequeueTimer;
  self->_dequeueTimer = 0;

  v11.receiver = self;
  v11.super_class = (Class)IDSUTunConnection;
  [(IDSUTunConnection *)&v11 dealloc];
}

- (NSString)description
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  double v5 = [(IDSUTunConnection *)self name];
  double v6 = +[NSString stringWithFormat:@"<%@: %p, name: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (BOOL)_isWiProxPeer
{
  if (self->_isCloudEnabled) {
    return 0;
  }
  else {
    return ![(IDSUTunConnection *)self _isMagnetConnection];
  }
}

- (unint64_t)_sendingMessageCountForClass:(unsigned int)a3
{
  sendingMessages = self->_sendingMessages;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100269064;
  v7[3] = &unk_100987330;
  unsigned int v8 = a3;
  v4 = [(NSMutableArray *)sendingMessages indexesOfObjectsPassingTest:v7];
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (unint64_t)_sendingMessageCountForType:(int64_t)a3
{
  sendingMessages = self->_sendingMessages;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10026913C;
  v7[3] = &unk_100987350;
  void v7[4] = a3;
  v4 = [(NSMutableArray *)sendingMessages indexesOfObjectsPassingTest:v7];
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (unint64_t)_inflightMessageCountForClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v5 = -[IDSLocalDeliveryQueue countForDataProtectionClass:](self->_deliveryQueue, "countForDataProtectionClass:");
  return [(IDSUTunConnection *)self _sendingMessageCountForClass:v3] + v5;
}

- (unint64_t)_inflightMessageCountForType:(int64_t)a3
{
  unint64_t v5 = -[IDSLocalDeliveryQueue countForDataMessageType:](self->_deliveryQueue, "countForDataMessageType:");
  return [(IDSUTunConnection *)self _sendingMessageCountForType:a3] + v5;
}

- (BOOL)hasSpaceForMessagesWithDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  if (self->_maxQueueSize
    && ![(IDSUTunConnection *)self isIdle]
    && (unint64_t v6 = [(IDSUTunConnection *)self _pendingOutgoingBytesForClass:v3],
        v6 >= self->_maxQueueSize))
  {
    unint64_t v8 = v6;
    v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t maxQueueSize = self->_maxQueueSize;
      unint64_t v11 = [(IDSUTunConnection *)self _inflightMessageCountForClass:v3];
      CFStringRef v12 = @"Class D";
      if (v3 == 1) {
        CFStringRef v12 = @"Class A";
      }
      *(_DWORD *)buf = 138413058;
      if (!v3) {
        CFStringRef v12 = @"Class C";
      }
      CFStringRef v15 = v12;
      __int16 v16 = 2048;
      unint64_t v17 = v8;
      __int16 v18 = 2048;
      unint64_t v19 = maxQueueSize;
      __int16 v20 = 2048;
      unint64_t v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Insufficient space for {dataProtectionClass: %@}, {pendingOutgoingBytes:%lu}, {maxQueueSize:%lu}, {inflightMessageCount:%lu}", buf, 0x2Au);
    }

    int v7 = os_log_shim_legacy_logging_enabled();
    if (v7)
    {
      int v7 = _IDSShouldLog();
      if (v7)
      {
        [(IDSUTunConnection *)self _inflightMessageCountForClass:v3];
        _IDSLogV();
        LOBYTE(v7) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (id)_sendingMessageStatisticsForClass:(unsigned int)a3
{
  statistics = self->_statistics;
  v4 = +[NSNumber numberWithUnsignedInt:*(void *)&a3];
  unint64_t v5 = [(NSMutableDictionary *)statistics objectForKey:v4];
  id v6 = [v5 copy];

  return v6;
}

- (void)_addStatsFromDict:(id)a3 toAggregate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = [&off_1009D2D10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(&off_1009D2D10);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        CFStringRef v12 = [v5 objectForKey:v11];
        v13 = (char *)[v12 unsignedLongLongValue];

        __int16 v14 = [v6 objectForKey:v11];
        CFStringRef v15 = &v13[(void)[v14 unsignedLongLongValue]];

        __int16 v16 = +[NSNumber numberWithUnsignedLongLong:v15];
        [v6 setObject:v16 forKey:v11];
      }
      id v8 = [&off_1009D2D10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }
  unint64_t v17 = [v5 objectForKey:@"localDeliveryQueueStatsLastDeliveredTime"];
  [v17 doubleValue];
  double v19 = v18;

  __int16 v20 = [v6 objectForKey:@"localDeliveryQueueStatsLastDeliveredTime"];
  [v20 doubleValue];
  double v22 = v21;

  if (v19 > v22)
  {
    v23 = +[NSNumber numberWithDouble:v19];
    [v6 setObject:v23 forKey:@"localDeliveryQueueStatsLastDeliveredTime"];
  }
}

- (NSDictionary)sendingMessageStatistics
{
  id v25 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v3 = [(NSMutableDictionary *)self->_statistics allValues];
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v36;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [*(id *)(*((void *)&v35 + 1) + 8 * i) allKeys];
        v10 = +[NSSet setWithArray:v9];
        [v4 unionSet:v10];
      }
      id v6 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v6);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v23 = v4;
  id v11 = [v23 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v23);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
        id v15 = objc_alloc_init((Class)NSMutableDictionary);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v16 = obj;
        id v17 = [v16 countByEnumeratingWithState:&v27 objects:v39 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v28;
          do
          {
            for (k = 0; k != v18; k = (char *)k + 1)
            {
              if (*(void *)v28 != v19) {
                objc_enumerationMutation(v16);
              }
              double v21 = [*(id *)(*((void *)&v27 + 1) + 8 * (void)k) objectForKey:v14];
              [(IDSUTunConnection *)self _addStatsFromDict:v21 toAggregate:v15];
            }
            id v18 = [v16 countByEnumeratingWithState:&v27 objects:v39 count:16];
          }
          while (v18);
        }

        [v25 setObject:v15 forKey:v14];
      }
      id v12 = [v23 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v12);
  }

  return (NSDictionary *)v25;
}

- (NSDictionary)queueStatistics
{
  uint64_t v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:self->_priority];

  deliveryQueue = self->_deliveryQueue;

  return [(IDSLocalDeliveryQueue *)deliveryQueue statistics];
}

- (void)setDeviceBTUUID:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  if (v4 && self->_cbuuid && !-[NSString isEqualToString:](v4, "isEqualToString:"))
  {
    id v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      cbuuid = self->_cbuuid;
      *(_DWORD *)buf = 138412802;
      id v16 = self;
      __int16 v17 = 2112;
      id v18 = cbuuid;
      __int16 v19 = 2112;
      __int16 v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ changing cbuuid from %@ to %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v13 = self->_cbuuid;
      uint64_t v14 = v4;
      id v12 = self;
      _IDSLogV();
    }
    if (self->_cbuuid != v4)
    {
      v10 = (NSString *)[(NSString *)v4 copy];
      id v11 = self->_cbuuid;
      self->_cbuuid = v10;
    }
    if ([(IDSUTunConnection *)self _isWiProxPeer])
    {
      [(IDSUTunConnection *)self _nonThreadSafeStopConnection];
      if (self->_enabled) {
        [(IDSUTunConnection *)self _startConnection];
      }
    }
  }
  else
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = self->_cbuuid;
      *(_DWORD *)buf = 138412802;
      id v16 = self;
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2112;
      __int16 v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ ignoring cbuuid update from %@ to %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)setEnabled:(BOOL)a3 withReason:(id)a4
{
  BOOL v4 = a3;
  id v37 = a4;
  id v6 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v6 assertRunningWithPriority:self->_priority];

  uint64_t v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v8 = @"YES";
    if (self->_enabled) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    v49 = self;
    if (!v4) {
      CFStringRef v8 = @"NO";
    }
    __int16 v50 = 2112;
    CFStringRef v51 = v9;
    __int16 v52 = 2112;
    CFStringRef v53 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@ enabled state changed: %@ -> %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v10 = @"YES";
    if (self->_enabled) {
      CFStringRef v11 = @"YES";
    }
    else {
      CFStringRef v11 = @"NO";
    }
    if (!v4) {
      CFStringRef v10 = @"NO";
    }
    CFStringRef v35 = v11;
    CFStringRef v36 = v10;
    long long v34 = self;
    _IDSLogV();
  }
  if (self->_enabled != v4)
  {
    self->_enabled = v4;
    if (v4)
    {
      [(IDSUTunConnection *)self _startConnection];
    }
    else
    {
      if (self->_socketConnection && [(IDSUTunConnection *)self _isWiProxPeer])
      {
        unsigned int v12 = [(IDSUTunConnection *)self _nonThreadSafeIsConnected];
        v13 = +[IDSUTunController sharedInstance];
        uint64_t v14 = [(IDSUTunConnection *)self _nonThreadSafeSocketOptions];
        [v13 suspendSocketWithOptions:v14];

        self->_connectionSuspended = 1;
        if (v12) {
          [(IDSUTunConnection *)self _connectivityChanged];
        }
      }
      else
      {
        [(IDSUTunConnection *)self _nonThreadSafeStopConnection];
      }
      if (v37)
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v15 = [(NSMutableArray *)self->_sendingMessages copy];
        id v16 = [v15 countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v43;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v43 != v17) {
                objc_enumerationMutation(v15);
              }
              __int16 v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              objc_msgSend(v19, "context", v34);
              __int16 v20 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue();
              double v21 = [(IDSUTunConnection *)v20 topic];
              unsigned int v22 = [v21 hasPrefix:@"com.apple.private.alloy.continuity"];

              if (v22)
              {
                id v23 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v49 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Removing continuity message %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  long long v34 = v20;
                  _IDSLogV();
                }
                [(IDSUTunConnection *)self _removeSocketPairMessage:v19, v20, @"WPConnection failed", v37, 29, v34 localMessage reason detailedError responseCode];
              }
            }
            id v16 = [v15 countByEnumeratingWithState:&v42 objects:v47 count:16];
          }
          while (v16);
        }

        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v24 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue messages];
        id v25 = [v24 copy];

        id v26 = [v25 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v39;
          do
          {
            for (j = 0; j != v26; j = (char *)j + 1)
            {
              if (*(void *)v39 != v27) {
                objc_enumerationMutation(v25);
              }
              long long v29 = *(IDSUTunConnection **)(*((void *)&v38 + 1) + 8 * (void)j);
              long long v30 = [(IDSUTunConnection *)v29 topic];
              unsigned int v31 = [v30 hasPrefix:@"com.apple.private.alloy.continuity"];

              if (v31)
              {
                long long v32 = [(IDSUTunConnection *)v29 underlyingSocketPairMessage];
                long long v33 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v49 = v29;
                  _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Removing continuity message %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  long long v34 = v29;
                  _IDSLogV();
                }
                [(IDSUTunConnection *)self _removeSocketPairMessage:v32, v29, @"WPConnection failed", v37, 29, v34 localMessage reason detailedError responseCode];
              }
            }
            id v26 = [v25 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v26);
        }
      }
    }
  }
}

- (BOOL)isMagnetIndicatingPeerIsAwake
{
  return self->_isMagnetIndicatingPeerIsAwake;
}

- (void)setIsMagnetIndicatingPeerIsAwake:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  if (self->_isMagnetIndicatingPeerIsAwake != v3)
  {
    self->_isMagnetIndicatingPeerIsAwake = v3;
    if (v3)
    {
      if ([(IDSLocalDeliveryQueue *)self->_deliveryQueue count])
      {
        id v6 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v7 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue count];
          id v8 = [(NSMutableArray *)self->_sendingMessages count];
          *(_DWORD *)buf = 138412802;
          v13 = self;
          __int16 v14 = 2048;
          unint64_t v15 = v7;
          __int16 v16 = 2048;
          id v17 = v8;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ Peer awake state changed to YES with %lu pending messages (%lu sending). Kicking queue to service non-waking messages.", buf, 0x20u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          unint64_t v10 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue count];
          id v11 = [(NSMutableArray *)self->_sendingMessages count];
          CFStringRef v9 = self;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            unint64_t v10 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue count];
            id v11 = [(NSMutableArray *)self->_sendingMessages count];
            CFStringRef v9 = self;
            _IDSLogV();
          }
        }
        [(IDSUTunConnection *)self _dequeueMessages];
      }
    }
  }
}

- (id)_encryptionController
{
  return +[IDSEncryptionController sharedInstance];
}

- (id)_UTunDeliveryController
{
  return +[IDSUTunDeliveryController sharedInstance];
}

- (void)_nonThreadSafeStopConnection
{
  BOOL v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    __int16 v14 = self;
    __int16 v15 = 2080;
    __int16 v16 = "-[IDSUTunConnection _nonThreadSafeStopConnection]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%p: %s", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v11 = self;
    unsigned int v12 = "-[IDSUTunConnection _nonThreadSafeStopConnection]";
    _IDSLogV();
  }
  BOOL v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = +[NSThread callStackSymbols];
    *(_DWORD *)buf = 138412290;
    __int16 v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v11 = +[NSThread callStackSymbols];
    _IDSLogV();
  }
  unsigned int v6 = [(IDSUTunConnection *)self _nonThreadSafeIsConnected];
  socketConnection = self->_socketConnection;
  if (socketConnection)
  {
    [(IDSSocketPairConnectionProtocol *)socketConnection endSession];
    id v8 = self->_socketConnection;
    self->_socketConnection = 0;
  }
  if (v6) {
    [(IDSUTunConnection *)self _connectivityChanged];
  }
  if (self->_openSocketCalled)
  {
    CFStringRef v9 = [(IDSUTunConnection *)self _nonThreadSafeSocketOptions];
    if (v9)
    {
      unint64_t v10 = +[IDSUTunController sharedInstance];
      [v10 closeSocketWithOptions:v9];

      self->_openSocketCalled = 0;
    }
  }
  self->_connectionSuspended = 0;
}

- (BOOL)_isMagnetConnection
{
  return [(NSString *)self->_uniqueID isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID];
}

- (id)_nonThreadSafeSocketOptions
{
  BOOL v3 = self->_cbuuid;
  if ([(IDSUTunConnection *)self _isMagnetConnection])
  {
    p_uniqueID = (NSString **)&kIDSDefaultPairedDeviceID;
  }
  else
  {
    if ([(IDSUTunConnection *)self _isWiProxPeer]) {
      goto LABEL_6;
    }
    p_uniqueID = &self->_uniqueID;
  }
  id v5 = *p_uniqueID;

  BOOL v3 = v5;
LABEL_6:
  v17[0] = @"account";
  v17[1] = @"service";
  v18[0] = @"idstest";
  v18[1] = @"localdelivery";
  v18[2] = self->_identifier;
  v17[2] = IDSOpenSocketOptionStreamNameKey;
  v17[3] = IDSOpenSocketOptionPriorityKey;
  unsigned int v6 = +[NSNumber numberWithInteger:self->_priority];
  v18[3] = v6;
  v17[4] = IDSOpenSocketOptionCloudEnabledKey;
  unint64_t v7 = +[NSNumber numberWithBool:self->_isCloudEnabled];
  v18[4] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];
  CFStringRef v9 = +[NSMutableDictionary dictionaryWithDictionary:v8];

  if (![(IDSUTunConnection *)self _isMagnetConnection])
  {
LABEL_10:
    unsigned int v12 = &off_1009D19F8;
    goto LABEL_11;
  }
  unint64_t v10 = [(IDSUTunConnection *)self _UTunDeliveryController];
  if ([v10 enableOTR])
  {

    goto LABEL_10;
  }
  BOOL v11 = !self->_shouldUseIPsecLink;

  if (!v11) {
    goto LABEL_10;
  }
  __int16 v15 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "OTR is disabled on magnet connection, enable stream encryption.", v16, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  unsigned int v12 = &off_1009D19E0;
LABEL_11:
  CFDictionarySetValue(v9, IDSOpenSocketOptionEncryptionMethodKey, v12);
  if (v3) {
    CFDictionarySetValue(v9, IDSOpenSocketOptionCBUUIDKey, v3);
  }
  uniqueID = self->_uniqueID;
  if (uniqueID) {
    CFDictionarySetValue(v9, IDSOpenSocketOptionDeviceUniqueIDKey, uniqueID);
  }

  return v9;
}

- (void)_startConnectionForContinuityPeer
{
  if (self->_enabled)
  {
    BOOL v3 = [(IDSUTunConnection *)self _UTunDeliveryController];
    BOOL v4 = [v3 pendingContinuityPeerID:self->_cbuuid];

    id v5 = [(IDSUTunConnection *)self _UTunDeliveryController];
    unsigned int v6 = [v5 lockedContinuityPeerID:self->_cbuuid];

    if (v4 && ![v4 isEqualToString:self->_uniqueID]
      || v6 && ([v6 isEqualToString:self->_uniqueID] & 1) == 0)
    {
      [(IDSUTunConnection *)self setEnabled:0];
      unint64_t v7 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        if (v4) {
          id v8 = v4;
        }
        else {
          id v8 = v6;
        }
        uniqueID = self->_uniqueID;
        *(_DWORD *)buf = 138412546;
        BOOL v11 = v8;
        __int16 v12 = 2112;
        v13 = uniqueID;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Found pending or locked continuity peer %@, disable connection for %@.", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    else
    {
      [(IDSUTunConnection *)self _startConnection];
    }
  }
}

- (void)_checkAndStartConnection
{
  if (self->_enabled)
  {
    if ([(IDSUTunConnection *)self _isWiProxPeer])
    {
      [(IDSUTunConnection *)self _startConnectionForContinuityPeer];
    }
    else
    {
      [(IDSUTunConnection *)self _startConnection];
    }
  }
}

- (void)resumeConnectivity
{
  BOOL v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:self->_priority];

  id v5 = +[IDSUTunController sharedInstance];
  BOOL v4 = [(IDSUTunConnection *)self _nonThreadSafeSocketOptions];
  [v5 resumeSocketWithOptions:v4 shouldLogCall:0];
}

- (void)_startConnection
{
  BOOL v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:self->_priority];

  BOOL v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ _startConnection", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v13 = self;
    _IDSLogV();
  }
  if (!self->_isAlwaysConnected && [(IDSUTunConnection *)self _isWiProxPeer])
  {
    id v5 = +[IDSWPLinkManager sharedInstance];
    [v5 connectToPeer:self->_cbuuid];
  }
  unsigned int v6 = +[IDSUTunController sharedInstance];
  unint64_t v7 = [(IDSUTunConnection *)self _nonThreadSafeSocketOptions];
  [v6 resumeSocketWithOptions:v7 shouldLogCall:1];

  if (self->_connectionSuspended)
  {
    self->_connectionSuspended = 0;
  }
  else if (!self->_openSocketCalled)
  {
    [(IDSUTunConnection *)self _nonThreadSafeStopConnection];
    id v8 = [(IDSUTunConnection *)self _nonThreadSafeSocketOptions];
    if (v8)
    {
      CFStringRef v9 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "IDS internally calling UTUN's openSocketWithOptions", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
      self->_openSocketCalled = 1;
      unint64_t v10 = +[IDSUTunController sharedInstance];
      BOOL v11 = +[IDSDaemonPriorityQueueController sharedInstance];
      __int16 v12 = [v11 queueForPriority:self->_priority];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10026AFAC;
      v14[3] = &unk_1009810E0;
      v14[4] = self;
      [v10 openSocketWithOptions:v8 queue:v12 completionHandler:v14];
    }
  }
}

- (void)_startNWConnectinForIPsecCase:(int)a3 controlChannelVersion:(id)a4 capabilityFlags:(unint64_t)a5 instanceID:(unsigned __int8 *)(a6 serviceMinCompatibilityVersion:
{
  uint64_t v10 = *(void *)&a3;
  __int16 v12 = (IDSUTunConnection *)a4;
  v13 = [IDSNWSocketPairConnection alloc];
  __int16 v14 = +[IDSDaemonPriorityQueueController sharedInstance];
  __int16 v15 = [v14 queueForPriority:self->_priority];
  __int16 v16 = [(IDSNWSocketPairConnection *)v13 initWithSocket:v10 queue:v15 delegate:self priority:self->_priority identifier:self->_identifier];

  if (((a5 >> 2) & 1) != self->_resumeResourceTransfers) {
    self->_resumeResourceTransfers = (a5 & 4) != 0;
  }
  if ((a5 & 1) != self->_newServiceSupported) {
    self->_newServiceSupported = a5 & 1;
  }
  self->_int serviceMinCompatibilityVersion = a7;
  if (((a5 >> 3) & 1) != self->_supportDynamicServices) {
    self->_supportDynamicServices = (a5 & 8) != 0;
  }
  if (((a5 >> 4) & 1) != self->_supportDynamicServicesOptimization) {
    self->_supportDynamicServicesOptimization = (a5 & 0x10) != 0;
  }
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v17;
  *(_OWORD *)&out[16] = v17;
  uuid_unparse_upper((const unsigned __int8 *)a6, out);
  id v18 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v19 = @"YES";
    if (self->_useSharedOTRSession) {
      CFStringRef v20 = @"YES";
    }
    else {
      CFStringRef v20 = @"NO";
    }
    if (self->_useNamedOTRSessionToken) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    if (self->_resumeResourceTransfers) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    if (self->_newServiceSupported) {
      CFStringRef v23 = @"YES";
    }
    else {
      CFStringRef v23 = @"NO";
    }
    int serviceMinCompatibilityVersion = self->_serviceMinCompatibilityVersion;
    if (!self->_supportDynamicServices) {
      CFStringRef v19 = @"NO";
    }
    *(_DWORD *)buf = 138414338;
    long long v32 = v12;
    __int16 v33 = 2080;
    long long v34 = out;
    __int16 v35 = 2048;
    unint64_t v36 = a5;
    __int16 v37 = 2112;
    CFStringRef v38 = v20;
    __int16 v39 = 2112;
    CFStringRef v40 = v21;
    __int16 v41 = 2112;
    CFStringRef v42 = v22;
    __int16 v43 = 2112;
    CFStringRef v44 = v23;
    __int16 v45 = 2112;
    CFStringRef v46 = v19;
    __int16 v47 = 1024;
    int v48 = serviceMinCompatibilityVersion;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "UTunConnection receives remote controlChannelVersion %@ instance ID [%s] flags %016llX, use shared OTR session %@, use named OTR session token %@, resume resource transfers %@, new service supported %@, dynamic services %@ service minimum compatibility version %u", buf, 0x58u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  uuid_copy(self->_remoteInstanceID, (const unsigned __int8 *)a6);
  if ([(IDSUTunPeerServiceMap *)self->_incomingServiceMap setRemoteInstanceID:a6])
  {
    unsigned __int8 v25 = [(IDSUTunPeerServiceMap *)self->_outgoingServiceMap setRemoteInstanceID:a6];
    [(NSMutableDictionary *)self->_incomingServiceMapUpdateCounter removeAllObjects];
    if (v25)
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10026BC80;
      v30[3] = &unk_1009873A0;
      v30[4] = self;
      id v26 = objc_retainBlock(v30);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10026BC90;
      v29[3] = &unk_1009873C8;
      v29[4] = self;
      uint64_t v27 = objc_retainBlock(v29);
      [(IDSNWSocketPairConnection *)v16 setOTREncryptionBlock:v26 decryptionBlock:v27];
      [(IDSNWSocketPairConnection *)v16 start];
      objc_storeStrong((id *)&self->_socketConnection, v16);

      goto LABEL_39;
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_incomingServiceMapUpdateCounter removeAllObjects];
  }
  long long v28 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v32 = self;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@ openSocket returned with connection to old instance - stop and reconnect", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  objc_storeStrong((id *)&self->_socketConnection, v16);
  [(IDSUTunConnection *)self _nonThreadSafeStopConnection];
  [(IDSUTunConnection *)self _checkAndStartConnection];
LABEL_39:
}

- (void)_startAndSetupSocketPairConnection:(IDSUTunConnection *)self capabilityFlags:(SEL)a2 instanceID:(id)a3 serviceMinCompatibilityVersion:(unint64_t)a4 socketDescriptor:(unsigned __int8 *)(a5
{
  uint64_t v7 = *(void *)&a7;
  __int16 v12 = (IDSUTunConnection *)a3;
  v13 = [IDSSocketPairConnection alloc];
  __int16 v14 = +[IDSDaemonPriorityQueueController sharedInstance];
  __int16 v15 = [v14 queueForPriority:self->_priority];
  if (self->_useNamedOTRSessionToken) {
    otrTokenIdentifier = self->_otrTokenIdentifier;
  }
  else {
    otrTokenIdentifier = 0;
  }
  long long v17 = [(IDSSocketPairConnection *)v13 initWithSocket:v7 queue:v15 delegate:self priority:self->_priority connectionID:otrTokenIdentifier linkType:[(IDSUTunConnection *)self _currentLink]];

  [(IDSSocketPairConnection *)v17 setFragmentationSize:8000];
  [(IDSSocketPairConnection *)v17 setInFlightMessageCountLowWaterMark:3];
  if ([(IDSUTunConnection *)self _isMagnetConnection]) {
    uint64_t v18 = 16000;
  }
  else {
    uint64_t v18 = 0xFFFFFFFFLL;
  }
  [(IDSSocketPairConnection *)v17 setMaxAllowedMessageSize:v18];
  if ([(IDSUTunConnection *)self _isMagnetConnection])
  {
    if (((a4 >> 1) & 1) != self->_useSharedOTRSession) {
      self->_useSharedOTRSession = (a4 & 2) != 0;
    }
    if (((a4 >> 6) & 1) != self->_useNamedOTRSessionToken) {
      self->_useNamedOTRSessionToken = (a4 & 0x40) != 0;
    }
  }
  if (((a4 >> 2) & 1) != self->_resumeResourceTransfers) {
    self->_resumeResourceTransfers = (a4 & 4) != 0;
  }
  if ((a4 & 1) != self->_newServiceSupported) {
    self->_newServiceSupported = a4 & 1;
  }
  self->_int serviceMinCompatibilityVersion = a6;
  if (((a4 >> 3) & 1) != self->_supportDynamicServices) {
    self->_supportDynamicServices = (a4 & 8) != 0;
  }
  if (((a4 >> 4) & 1) != self->_supportDynamicServicesOptimization) {
    self->_supportDynamicServicesOptimization = (a4 & 0x10) != 0;
  }
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v19;
  *(_OWORD *)&out[16] = v19;
  uuid_unparse_upper((const unsigned __int8 *)a5, out);
  CFStringRef v20 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v21 = @"YES";
    if (self->_useSharedOTRSession) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    if (self->_useNamedOTRSessionToken) {
      CFStringRef v23 = @"YES";
    }
    else {
      CFStringRef v23 = @"NO";
    }
    if (self->_resumeResourceTransfers) {
      CFStringRef v24 = @"YES";
    }
    else {
      CFStringRef v24 = @"NO";
    }
    if (self->_newServiceSupported) {
      CFStringRef v25 = @"YES";
    }
    else {
      CFStringRef v25 = @"NO";
    }
    int serviceMinCompatibilityVersion = self->_serviceMinCompatibilityVersion;
    if (!self->_supportDynamicServices) {
      CFStringRef v21 = @"NO";
    }
    *(_DWORD *)buf = 138414338;
    v56 = v12;
    __int16 v57 = 2080;
    v58 = out;
    __int16 v59 = 2048;
    unint64_t v60 = a4;
    __int16 v61 = 2112;
    CFStringRef v62 = v22;
    __int16 v63 = 2112;
    CFStringRef v64 = v23;
    __int16 v65 = 2112;
    CFStringRef v66 = v24;
    __int16 v67 = 2112;
    CFStringRef v68 = v25;
    __int16 v69 = 2112;
    CFStringRef v70 = v21;
    __int16 v71 = 1024;
    int v72 = serviceMinCompatibilityVersion;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "UTunConnection receives remote controlChannelVersion %@ instance ID [%s] flags %016llX, use shared OTR session %@, use named OTR session token %@, resume resource transfers %@, new service supported %@, dynamic services %@ service minimum compatibility version %u", buf, 0x58u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    uint64_t v27 = self->_useSharedOTRSession ? @"YES" : @"NO";
    long long v28 = self->_useNamedOTRSessionToken ? @"YES" : @"NO";
    long long v29 = self->_resumeResourceTransfers ? @"YES" : @"NO";
    long long v30 = self->_newServiceSupported ? @"YES" : @"NO";
    unsigned int v31 = self->_supportDynamicServices ? @"YES" : @"NO";
    CFStringRef v51 = v31;
    uint64_t v52 = self->_serviceMinCompatibilityVersion;
    v49 = v29;
    __int16 v50 = v30;
    __int16 v47 = v27;
    int v48 = v28;
    __int16 v45 = out;
    unint64_t v46 = a4;
    CFStringRef v44 = v12;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if (self->_useSharedOTRSession) {
        CFStringRef v32 = @"YES";
      }
      else {
        CFStringRef v32 = @"NO";
      }
      if (self->_useNamedOTRSessionToken) {
        CFStringRef v33 = @"YES";
      }
      else {
        CFStringRef v33 = @"NO";
      }
      if (self->_resumeResourceTransfers) {
        CFStringRef v34 = @"YES";
      }
      else {
        CFStringRef v34 = @"NO";
      }
      if (self->_newServiceSupported) {
        CFStringRef v35 = @"YES";
      }
      else {
        CFStringRef v35 = @"NO";
      }
      if (self->_supportDynamicServices) {
        CFStringRef v36 = @"YES";
      }
      else {
        CFStringRef v36 = @"NO";
      }
      CFStringRef v51 = (__CFString *)v36;
      uint64_t v52 = self->_serviceMinCompatibilityVersion;
      v49 = (__CFString *)v34;
      __int16 v50 = (__CFString *)v35;
      __int16 v47 = (__CFString *)v32;
      int v48 = (__CFString *)v33;
      __int16 v45 = out;
      unint64_t v46 = a4;
      CFStringRef v44 = v12;
      _IDSLogV();
    }
  }
  uuid_copy(self->_remoteInstanceID, (const unsigned __int8 *)a5);
  if ([(IDSUTunPeerServiceMap *)self->_incomingServiceMap setRemoteInstanceID:a5])
  {
    unsigned __int8 v37 = [(IDSUTunPeerServiceMap *)self->_outgoingServiceMap setRemoteInstanceID:a5];
    [(NSMutableDictionary *)self->_incomingServiceMapUpdateCounter removeAllObjects];
    if (v37)
    {
      if ([(IDSUTunConnection *)self _isMagnetConnection])
      {
        if ([@"5" isEqualToString:@"5"])
        {
          id v38 = [(IDSUTunConnection *)v12 integerValue];
          if ((uint64_t)v38 < (uint64_t)[@"5" integerValue])
          {
            self->_shouldAbortOnMissingTopic = 1;
            __int16 v39 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v56 = v12;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "This is for phone/watch (_isMagnetConnection == YES), self version is 5 for Tigris, and remote watch is %@ - this is a case where a missing topic should result in an abort() call", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                CFStringRef v44 = v12;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  CFStringRef v44 = v12;
                  _IDSLogV();
                }
              }
            }
          }
        }
      }
      [(NSMutableDictionary *)self->_tokenToOTRError removeAllObjects];
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_10026C404;
      v54[3] = &unk_1009873A0;
      v54[4] = self;
      CFStringRef v40 = objc_retainBlock(v54);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_10026C414;
      v53[3] = &unk_1009873C8;
      v53[4] = self;
      __int16 v41 = objc_retainBlock(v53);
      [(IDSSocketPairConnection *)v17 setOTREncryptionBlock:v40 decryptionBlock:v41];
      if (self->_useNamedOTRSessionToken) {
        CFStringRef v42 = self->_otrTokenIdentifier;
      }
      else {
        CFStringRef v42 = 0;
      }
      [(IDSSocketPairConnection *)v17 setConnectionID:v42];
      [(IDSSocketPairConnection *)v17 start];
      objc_storeStrong((id *)&self->_socketConnection, v17);

      goto LABEL_92;
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_incomingServiceMapUpdateCounter removeAllObjects];
  }
  __int16 v43 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v56 = self;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%@ openSocket returned with connection to old instance - stop and reconnect", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  objc_storeStrong((id *)&self->_socketConnection, v17);
  [(IDSUTunConnection *)self _nonThreadSafeStopConnection];
  [(IDSUTunConnection *)self _checkAndStartConnection];
LABEL_92:
}

- (void)sendMessage:(id)a3
{
  id v59 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  CFStringRef v70 = _os_activity_create((void *)&_mh_execute_header, "UTUNConnection sendMessage", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v70, &state);
  BOOL v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:self->_priority];

  BOOL v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    if ([v59 nonWaking]) {
      CFStringRef v5 = @"(non waking)";
    }
    else {
      CFStringRef v5 = @"(is waking)";
    }
    unint64_t v6 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue count];
    qos_class_t v7 = qos_class_self();
    *(_DWORD *)buf = 138413314;
    v74 = self;
    __int16 v75 = 2112;
    CFStringRef v76 = v5;
    __int16 v77 = 2112;
    id v78 = v59;
    __int16 v79 = 2048;
    unint64_t v80 = v6;
    __int16 v81 = 1024;
    qos_class_t v82 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ enqueuing %@ message %@ messageCount %lu - QoS=0x%x", buf, 0x30u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    if ([v59 nonWaking]) {
      CFStringRef v8 = @"(non waking)";
    }
    else {
      CFStringRef v8 = @"(is waking)";
    }
    unint64_t v56 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue count];
    uint64_t v57 = qos_class_self();
    CFStringRef v53 = v8;
    id v55 = v59;
    CFStringRef v51 = self;
    _IDSLogV();
  }
  objc_msgSend(v59, "topic", v51, v53, v55, v56, v57);
  unint64_t v60 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue();
  CFStringRef v9 = [v59 queueOneIdentifier];
  if (v9 && v60)
  {
    uint64_t v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v74 = v60;
      __int16 v75 = 2112;
      CFStringRef v76 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Message with topic %@ has queueOneIdentifier %@, flushing older messages that match.", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v52 = v60;
      v54 = v9;
      _IDSLogV();
    }
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v11 = [(NSMutableArray *)self->_sendingMessages copy];
    id v12 = [v11 countByEnumeratingWithState:&v65 objects:v72 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v66;
LABEL_21:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v66 != v13) {
          objc_enumerationMutation(v11);
        }
        __int16 v15 = *(void **)(*((void *)&v65 + 1) + 8 * v14);
        __int16 v16 = [v15 context];
        long long v17 = [v16 queueOneIdentifier];
        if ([v17 isEqualToString:v9])
        {
          uint64_t v18 = [v16 topic];
          unsigned __int8 v19 = [v18 isEqualToString:v60];

          if (v19)
          {
            id v20 = v15;

            if (v20) {
              goto LABEL_44;
            }
            goto LABEL_32;
          }
        }
        else
        {
        }
        if (v12 == (id)++v14)
        {
          id v12 = [v11 countByEnumeratingWithState:&v65 objects:v72 count:16];
          if (v12) {
            goto LABEL_21;
          }
          break;
        }
      }
    }

    __int16 v16 = 0;
LABEL_32:
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    CFStringRef v21 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue messages];
    id v22 = [v21 countByEnumeratingWithState:&v61 objects:v71 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v62;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v62 != v23) {
            objc_enumerationMutation(v21);
          }
          CFStringRef v25 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          id v26 = [v25 queueOneIdentifier];
          if ([v26 isEqualToString:v9])
          {
            uint64_t v27 = [v25 topic];
            unsigned int v28 = [v27 isEqualToString:v60];

            if (v28)
            {
              id v29 = v25;

              __int16 v16 = v29;
              goto LABEL_43;
            }
          }
          else
          {
          }
        }
        id v22 = [v21 countByEnumeratingWithState:&v61 objects:v71 count:16];
      }
      while (v22);
    }
LABEL_43:

    id v20 = 0;
LABEL_44:
    [(IDSUTunConnection *)self _removeSocketPairMessage:v20 localMessage:v16 reason:@"queue one identifier" responseCode:13];
  }
  long long v30 = [v59 expirationDate];
  BOOL v31 = v30 == 0;

  if (v31)
  {
    if ([(IDSUTunConnection *)self _isWiProxPeer]) {
      +[NSDate dateWithTimeIntervalSinceNow:30.0];
    }
    else {
    CFStringRef v32 = +[NSDate dateWithTimeIntervalSinceNow:120.0];
    }
    [v59 setExpirationDate:v32];
  }
  CFStringRef v33 = [v59 resourcePath];
  BOOL v34 = v33 == 0;

  if (!v34) {
    [v59 setManualQueueRemoval:1];
  }
  [(IDSLocalDeliveryQueue *)self->_deliveryQueue enqueueMessage:v59];
  self->_cachedBytes[[v59 dataProtectionClass]] = -1;
  +[NSDate timeIntervalSinceReferenceDate];
  objc_msgSend(v59, "setTimeEnqueued:");
  CFStringRef v35 = [v59 fallbackBlock];

  if (v35)
  {
    fallbackMessages = self->_fallbackMessages;
    if (!fallbackMessages)
    {
      unsigned __int8 v37 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      id v38 = self->_fallbackMessages;
      self->_fallbackMessages = v37;

      fallbackMessages = self->_fallbackMessages;
    }
    [(NSMutableArray *)fallbackMessages addObject:v59];
    __int16 v39 = [v59 topic];
    id v40 = [v39 isEqualToString:@"com.apple.private.alloy.phonecontinuity"];

    [(IDSUTunConnection *)self _resetFallbackTimeout:v40 useNextFallback:0.0];
  }
  BOOL isMagnetIndicatingPeerIsAwake = self->_isMagnetIndicatingPeerIsAwake;
  unsigned int v42 = [v59 nonWaking] ^ 1;
  BOOL v43 = isMagnetIndicatingPeerIsAwake;
  if ([(IDSUTunConnection *)self _isMagnetConnection]
    && (id)[(IDSUTunConnection *)self _currentLink] != (id)1
    && [v59 nonCloudWaking])
  {
    CFStringRef v44 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v45 = [v59 messageUUID];
      *(_DWORD *)buf = 138412290;
      v74 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Attempting to send nonCloudWaking message on non-magnet connection. Coallescing {guid: %@}", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v52 = [v59 messageUUID];
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          uint64_t v52 = objc_msgSend(v59, "messageUUID", v52);
          _IDSLogV();
        }
      }
    }
    [(IDSUTunConnection *)self _startMessagesDequeueMessagesTimer];
    BOOL v43 = 0;
    unsigned int v42 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v46 = self->_socketConnection;
  }
  else {
    unint64_t v46 = 0;
  }
  if ((unint64_t)[(IDSSocketPairConnectionProtocol *)v46 inFlightMessageCount] <= 5)
  {
    if ((v43 | v42) == 1)
    {
      [v59 setDidWakeHint:v42 & !v43];
      __int16 v47 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v74 = self;
        __int16 v75 = 1024;
        LODWORD(v76) = v42 & !v43;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "%@ socket buffer is empty, dequeuing a message.  didWakeHint(%d)", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        uint64_t v52 = self;
        v54 = (__CFString *)(v42 & !v43);
        _IDSLogV();
      }
      [(IDSUTunConnection *)self _dequeueMessages];
    }
    else
    {
      int v48 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v74 = self;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%@ Waiting for remote device wake before dequeuing message.", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        uint64_t v52 = self;
        _IDSLogV();
      }
    }
  }
  v49 = [(IMTimer *)self->_timeoutTimer fireDate];
  __int16 v50 = [v59 expirationDate];
  if (!v49 || [v49 compare:v50] == (id)1) {
    [(IDSUTunConnection *)self _resetTimeout:v50];
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)cancelMessageID:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  if ([v4 length])
  {
    unint64_t v24 = [(IDSUTunConnection *)self _sendingMessageCountForClass:1];
    unint64_t v23 = [(IDSUTunConnection *)self _sendingMessageCountForClass:0];
    unint64_t v22 = [(IDSUTunConnection *)self _sendingMessageCountForClass:2];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    unint64_t v6 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue messages];
    id v7 = 0;
    id v8 = [v6 countByEnumeratingWithState:&v29 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v30;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v12 = [v11 messageUUID];
          unsigned int v13 = [v12 isEqualToIgnoringCase:v4];

          if (v13)
          {
            if (!v7) {
              id v7 = objc_alloc_init((Class)NSMutableArray);
            }
            [v7 addObject:v11];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v29 objects:v36 count:16];
      }
      while (v8);
    }

    if ([v7 count])
    {
      uint64_t v14 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Cancelling messages %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v21 = v7;
        _IDSLogV();
      }
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v15 = v7;
      id v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v26;
        do
        {
          for (j = 0; j != v16; j = (char *)j + 1)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v15);
            }
            unsigned __int8 v19 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
            id v20 = objc_msgSend(v19, "underlyingSocketPairMessage", v21);
            [v19 setCompletionBlock:0];
            [(IDSUTunConnection *)self _removeSocketPairMessage:v20 localMessage:v19 reason:@"Client Canceled" responseCode:2];
          }
          id v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v16);
      }
    }
    if (v24 && ![(IDSUTunConnection *)self _sendingMessageCountForClass:1]) {
      [(IDSUTunConnection *)self _handleBecomingEmptyForDataProtectionClass:1];
    }
    if (v23 && ![(IDSUTunConnection *)self _sendingMessageCountForClass:0]) {
      [(IDSUTunConnection *)self _handleBecomingEmptyForDataProtectionClass:0];
    }
    if (v22 && ![(IDSUTunConnection *)self _sendingMessageCountForClass:2]) {
      [(IDSUTunConnection *)self _handleBecomingEmptyForDataProtectionClass:2];
    }
  }
}

- (void)kickProgressBlockForMessageID:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v6 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue messages];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [v11 messageUUID];
        unsigned int v13 = [v12 isEqualToIgnoringCase:v4];

        if (v13) {
          [v11 kickProgressBlock];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (BOOL)isConnected
{
  BOOL v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:self->_priority];

  return [(IDSUTunConnection *)self _nonThreadSafeIsConnected];
}

- (BOOL)_nonThreadSafeIsConnected
{
  return self->_socketConnection && !self->_connectionSuspended;
}

- (void)_handleBecomingEmptyForDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  CFStringRef v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  if (![(IDSUTunConnection *)self _inflightMessageCount])
  {
    [(IDSUTunConnection *)self _handleBecomingEmpty];
    [(IDSUTunConnection *)self _handleBecomingEmptyOfCloudMessages];
  }
  if ([(IDSUTunConnection *)self hasSpaceForMessagesWithDataProtectionClass:v3])
  {
    unint64_t v6 = +[IDSDaemonPriorityQueueController sharedInstance];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10026D578;
    v7[3] = &unk_10097FDE8;
    void v7[4] = self;
    int v8 = v3;
    [v6 performBlockMainQueue:v7];
  }
}

- (void)_handleBecomingEmpty
{
  uint64_t v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:self->_priority];

  [(IDSUTunConnection *)self _clearSendingPowerAssertionWithReason:@"All queues are empty"];
  id v4 = +[IDSDaemonPriorityQueueController sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10026D694;
  v5[3] = &unk_10097E4D0;
  v5[4] = self;
  [v4 performBlockMainQueue:v5];
}

- (void)_handleBecomingEmptyOfCloudMessages
{
  uint64_t v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10026D778;
  v4[3] = &unk_10097E4D0;
  v4[4] = self;
  [v3 performBlockMainQueue:v4];
}

- (void)_connectivityChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "connection:connectivityChanged:", self, -[IDSUTunConnection _nonThreadSafeIsConnected](self, "_nonThreadSafeIsConnected"));

  [(IMTimer *)self->_fallbackTimer invalidate];
  fallbackTimer = self->_fallbackTimer;
  self->_fallbackTimer = 0;

  [(IDSUTunConnection *)self _resetFallbackTimeout:0 useNextFallback:0.0];
}

- (void)_clearLastFallbackWithReason:(id)a3
{
  id v4 = a3;
  if (self->_lastFallback)
  {
    CFStringRef v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clearing fallback stickiness due to: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    lastFallback = self->_lastFallback;
    self->_lastFallback = 0;
  }
}

- (double)_nanoConnectedFallbackTimeoutForService:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.private.alloy.willow"]) {
    double v4 = 6.0;
  }
  else {
    double v4 = 60.0;
  }
  CFStringRef v5 = [@"utun-push-fallback-connected-timeout-" stringByAppendingString:v3];
  unint64_t v6 = +[IDSServerBag sharedInstance];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      double v4 = v8;
      uint64_t v9 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with a fallback timeout of %f", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
    }
  }

  return v4;
}

- (double)_nanoDisconnectedFallbackTimeoutForService:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.private.alloy.willow"]) {
    double v4 = 5.0;
  }
  else {
    double v4 = 20.0;
  }
  CFStringRef v5 = [@"utun-push-fallback-disconnected-timeout-" stringByAppendingString:v3];
  unint64_t v6 = +[IDSServerBag sharedInstance];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      double v4 = v8;
      uint64_t v9 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with a fallback timeout of %f", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
    }
  }

  return v4;
}

- (double)_fallbackTimeoutForService:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  lastFallback = self->_lastFallback;
  if (lastFallback)
  {
    [(NSDate *)lastFallback timeIntervalSinceNow];
    double v8 = fabs(v7);
    if (v8 < 0.5)
    {
      double v9 = 0.1;
      goto LABEL_24;
    }
    double v9 = 0.0;
    if (v8 < 1800.0) {
      goto LABEL_24;
    }
    [(IDSUTunConnection *)self _clearLastFallbackWithReason:@"expiration"];
  }
  if (IMGetDomainBoolForKey())
  {
    uint64_t v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "   **** cloud fallback disabled ****", v16, 2u);
    }

    double v9 = 1000000000.0;
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
  else if ([(IDSUTunConnection *)self _isWiProxPeer])
  {
    id v11 = +[IDSServerBag sharedInstanceForBagType:1];
    double v12 = [v11 objectForKey:@"ids-local-cloud-fallback-delay"];

    if (v12)
    {
      [v12 doubleValue];
      if (v13 >= 0.0) {
        double v9 = v13;
      }
      else {
        double v9 = 1000000000.0;
      }
    }
    else
    {
      [(IDSUTunConnection *)self isConnected];
      double v9 = 0.0;
    }
  }
  else
  {
    if ([(IDSUTunConnection *)self isConnected]) {
      [(IDSUTunConnection *)self _nanoConnectedFallbackTimeoutForService:v4];
    }
    else {
      [(IDSUTunConnection *)self _nanoDisconnectedFallbackTimeoutForService:v4];
    }
    double v9 = v14;
  }
LABEL_24:

  return v9;
}

- (BOOL)_performFallbackIfNecessary:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  +[NSDate timeIntervalSinceReferenceDate];
  double v7 = v6;
  [v4 timeEnqueued];
  double v9 = v8;
  if (([v4 didFallback] & 1) != 0
    || ([v4 topic],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        double v11 = v7 - v9,
        [(IDSUTunConnection *)self _fallbackTimeoutForService:v10],
        double v13 = v12,
        v10,
        v11 <= v13))
  {
    BOOL v18 = 0;
  }
  else
  {
    double v14 = [v4 fallbackBlock];
    if (v14)
    {
      long long v15 = (NSDate *)objc_alloc_init((Class)NSDate);
      lastFallback = self->_lastFallback;
      self->_lastFallback = v15;

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v17 = self->_socketConnection;
      }
      else {
        long long v17 = 0;
      }
      [(IDSSocketPairConnectionProtocol *)v17 setNotifyWhenConnectionReceivesBytes:1];
      unsigned __int8 v19 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v20 = [v4 messageID];
        id v21 = [v4 messageUUID];
        unint64_t v22 = [v4 expirationDate];
        *(_DWORD *)buf = 138413058;
        unsigned int v42 = self;
        __int16 v43 = 1024;
        unsigned int v44 = v20;
        __int16 v45 = 2112;
        id v46 = v21;
        __int16 v47 = 2112;
        int v48 = v22;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ performing cloud fallback for message[%u] %@ which is scheduled to expire %@", buf, 0x26u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v23 = [v4 messageID];
          unint64_t v24 = [v4 messageUUID];
          [v4 expirationDate];
          CFStringRef v36 = v35 = v24;
          CFStringRef v33 = self;
          id v34 = v23;
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            id v25 = objc_msgSend(v4, "messageID", self, v23, v24, v36);
            long long v26 = [v4 messageUUID];
            [v4 expirationDate];
            CFStringRef v36 = v35 = v26;
            CFStringRef v33 = self;
            id v34 = v25;
            _IDSLogV();
          }
        }
      }
      objc_msgSend(v4, "setDidFallback:", 1, v33, v34, v35, v36);
      long long v27 = [v4 toURI];
      long long v28 = [v4 toDeviceID];
      long long v29 = +[IDSDaemonPriorityQueueController sharedInstance];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10026E384;
      v37[3] = &unk_100981860;
      id v39 = v28;
      id v40 = v14;
      id v38 = v27;
      id v30 = v28;
      id v31 = v27;
      [v29 performBlockMainQueue:v37];
    }
    BOOL v18 = 1;
  }

  return v18;
}

- (void)_resetFallbackTimeout:(double)a3 useNextFallback:(BOOL)a4
{
  if (!self->_fallbackTimer)
  {
    if (!a4)
    {
      double v6 = [(NSMutableArray *)self->_fallbackMessages firstObject];
      double v7 = v6;
      if (!v6) {
        return;
      }
      [v6 timeEnqueued];
      double v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      [v8 timeIntervalSinceNow];
      double v10 = v9;
      double v11 = [v7 topic];
      [(IDSUTunConnection *)self _fallbackTimeoutForService:v11];
      a3 = v10 + v12;
    }
    double v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      unsigned __int8 v19 = self;
      __int16 v20 = 2048;
      double v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ - messages in queue in need of fallback, setting timer for: %f", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    id v14 = objc_alloc((Class)IMTimer);
    if (a3 < 0.005) {
      a3 = 0.005;
    }
    long long v15 = im_primary_queue();
    long long v16 = (IMTimer *)[v14 initWithTimeInterval:0 name:0 shouldWake:self target:"_fallbackTimerFired" selector:0 userInfo:v15 queue:a3];
    fallbackTimer = self->_fallbackTimer;
    self->_fallbackTimer = v16;
  }
}

- (void)_fallbackTimerFiredOnMain
{
  id v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026E624;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_fallbackTimerFired
{
  im_assert_primary_base_queue();
  id v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10026E6C4;
  v4[3] = &unk_10097E4D0;
  v4[4] = self;
  [v3 performBlockWithPriority:v4 priority:self->_priority];
}

- (void)invalidateTimeoutTimer
{
  [(IMTimer *)self->_timeoutTimer invalidate];
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;
}

- (void)_resetTimeout:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  if (!v4)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    double v6 = self->_sendingMessages;
    id v4 = 0;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v36;
      do
      {
        double v9 = 0;
        do
        {
          if (*(void *)v36 != v8) {
            objc_enumerationMutation(v6);
          }
          double v10 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)v9) context];
          double v11 = [v10 expirationDate];
          double v12 = v11;
          if (!v4 || [v11 compare:v4] == (id)-1)
          {
            id v13 = v12;

            id v4 = v13;
          }

          double v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v7);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v14 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue messages];
    id v15 = [v14 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v32;
      do
      {
        long long v17 = 0;
        do
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v14);
          }
          BOOL v18 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)v17) expirationDate];
          unsigned __int8 v19 = v18;
          if (!v4 || [v18 compare:v4] == (id)-1)
          {
            id v20 = v19;

            id v4 = v20;
          }

          long long v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v14 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v15);
    }
  }
  [(IMTimer *)self->_timeoutTimer invalidate];
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;

  if (v4)
  {
    [v4 timeIntervalSinceNow];
    double v23 = v22 + 0.5;
    if (v23 >= 1.0) {
      double v24 = v23;
    }
    else {
      double v24 = 1.0;
    }
    id v25 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v40 = self;
      __int16 v41 = 2048;
      double v42 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@ - messages in queue, setting timer for: %f", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    id v26 = objc_alloc((Class)IMTimer);
    long long v27 = im_primary_queue();
    long long v28 = (IMTimer *)[v26 initWithTimeInterval:0 name:0 shouldWake:self target:"_timeoutTimerFired" selector:0 userInfo:v27 queue:v24];
    long long v29 = self->_timeoutTimer;
    self->_timeoutTimer = v28;
  }
  else
  {
    id v30 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = self;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@ - no messages in queue, clearing timer", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)_timeoutTimerFiredOnMain
{
  id v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026F1A0;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_timeoutTimerFired
{
  im_assert_primary_base_queue();
  id v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10026F240;
  v4[3] = &unk_10097E4D0;
  v4[4] = self;
  [v3 performBlockWithPriority:v4 priority:self->_priority];
}

- (BOOL)_shouldAWDLogMessage:(id)a3
{
  id v3 = [a3 command];
  BOOL v4 = [v3 integerValue] != (id)244;

  return v4;
}

- (void)_messageTimedOut:(id)a3 localMessage:(id)a4
{
  id v32 = a3;
  id v6 = a4;
  id v7 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v7 assertRunningWithPriority:self->_priority];

  id v8 = [v6 dataProtectionClass];
  unint64_t v9 = [(IDSUTunConnection *)self _inflightMessageCountForClass:v8];
  if ([(IDSUTunConnection *)self _shouldAWDLogMessage:v6])
  {
    id v10 = objc_alloc((Class)IDSLocalMessageTimedOutMetric);
    double v11 = [v6 awdTopic];
    id v12 = objc_msgSend(v10, "initWithService:isToDefaultPairedDevice:messageSize:linkType:deliveryError:RTT:priority:", v11, -[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"), objc_msgSend(v6, "sentMessageDataSize"), -[IDSUTunConnection _currentLink](self, "_currentLink"), 101, 0, objc_msgSend(v6, "priority"));

    id v13 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v13 logMetric:v12];

    id v14 = +[IDSAWDLogging sharedInstance];
    id v15 = [v6 awdTopic];
    objc_msgSend(v14, "messageDeliveredForService:isToDefaultPairedDevice:messageSize:linkType:deliveryError:RTT:priority:", v15, -[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"), objc_msgSend(v6, "sentMessageDataSize"), -[IDSUTunConnection _currentLink](self, "_currentLink"), 101, 0, objc_msgSend(v6, "priority"));
  }
  uint64_t v16 = [(IDSUTunConnection *)self _UTunDeliveryController];
  unsigned int v17 = [v16 isConnected];

  BOOL v18 = [(IDSUTunConnection *)self _UTunDeliveryController];
  unsigned __int8 v19 = [v18 isCloudConnected];

  id v20 = [(IDSUTunConnection *)self _UTunDeliveryController];
  unsigned __int8 v21 = [v20 isClassCConnected];

  double v22 = [(IDSUTunConnection *)self _UTunDeliveryController];
  unsigned int v23 = [v22 isTerminusRegistered];

  unsigned int v24 = 0;
  if (v17 && (v21 & 1) == 0)
  {
    if (v8 < 2) {
      unsigned int v24 = v23;
    }
    else {
      unsigned int v24 = 0;
    }
  }
  if (v17)
  {
    if ([v6 nonWaking])
    {
      CFStringRef v25 = @"This message was a non-waking message and the destination device for this message did not wake before the timeout fired";
      id v26 = self;
      id v27 = v32;
      id v28 = v6;
      uint64_t v29 = 34;
      goto LABEL_21;
    }
  }
  else
  {
    if (self->_isCloudEnabled) {
      unsigned __int8 v30 = v19;
    }
    else {
      unsigned __int8 v30 = 0;
    }
    if ((v30 & 1) == 0)
    {
      CFStringRef v25 = @"The destination device for this message did not connected before the timeout fired.";
      id v26 = self;
      id v27 = v32;
      id v28 = v6;
      uint64_t v29 = 33;
      goto LABEL_21;
    }
  }
  if ([v32 wasWrittenToConnection])
  {
    CFStringRef v25 = @"This message was written into the connection, but did not receive an ack. Check Bluetooth conditions and that your process is not hung on the receiver.";
    id v26 = self;
    id v27 = v32;
    id v28 = v6;
    uint64_t v29 = 35;
  }
  else
  {
    id v27 = v32;
    if (v24)
    {
      CFStringRef v25 = @"This message requires class C connection, but the devices are not ClassC connected, because the remote device is locked.";
      id v26 = self;
      id v28 = v6;
      uint64_t v29 = 36;
    }
    else
    {
      CFStringRef v25 = @"timed out";
      id v26 = self;
      id v28 = v6;
      uint64_t v29 = 12;
    }
  }
LABEL_21:
  [(IDSUTunConnection *)v26 _removeSocketPairMessage:v27 localMessage:v28 reason:v25 responseCode:v29];
  unint64_t v31 = [(IDSUTunConnection *)self _inflightMessageCountForClass:v8];
  if (v9 && !v31) {
    [(IDSUTunConnection *)self _handleBecomingEmptyForDataProtectionClass:v8];
  }
}

- (void)_removeSocketPairMessage:(id)a3 localMessage:(id)a4 reason:(id)a5 responseCode:(int64_t)a6
{
}

- (void)_removeSocketPairMessage:(id)a3 localMessage:(id)a4 reason:(id)a5 detailedError:(id)a6 responseCode:(int64_t)a7
{
  id v12 = a3;
  unint64_t v13 = (unint64_t)a4;
  id v47 = a5;
  id v46 = a6;
  id v14 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v14 assertRunningWithPriority:self->_priority];

  if ((unint64_t)v12 | v13)
  {
    if (v12)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (a7 && (isKindOfClass & 1) != 0)
      {
        id v16 = v12;
        id v17 = [v16 sequenceNumber];
        id v18 = [v16 streamID];
        unsigned __int8 v19 = [v16 messageUUID];
        id v20 = +[IDSSocketPairResourceTransferMessage cancelMessageWithSequenceNumber:v17 streamID:v18 messageUUID:v19 cancelReason:5];

        unsigned __int8 v21 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v57 = self;
          __int16 v58 = 2112;
          unint64_t v59 = (unint64_t)v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ sending resource transfer cancel message %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          __int16 v41 = self;
          double v42 = v20;
          _IDSLogV();
        }
        -[IDSUTunConnection _sendSocketMessage:ignoreSequenceNumber:](self, "_sendSocketMessage:ignoreSequenceNumber:", v20, 1, v41, v42);
      }
      [(IDSUTunConnection *)self _removeMessageFromStatistics:v13];
      [(NSMutableArray *)self->_sendingMessages removeObject:v12];
      if (![(NSMutableArray *)self->_sendingMessages count])
      {
        sendingMessages = self->_sendingMessages;
        self->_sendingMessages = 0;
      }
      if (!self->_sendingMessages) {
        [(IDSUTunConnection *)self _clearSendingPowerAssertionWithReason:@"No in flight messages remaining"];
      }
    }
    unsigned int v23 = [(id)v13 progressBlock];

    if (v23)
    {
      unsigned int v24 = [(id)v13 progressBlock];
      v24[2](v24, 0, 0, 0, 0, 1);

      [(id)v13 setProgressBlock:0];
    }
    CFStringRef v25 = [(id)v13 completionBlock];
    if (v25)
    {
      id v26 = [(id)v13 toDeviceID];
      id v27 = [(NSString *)self->_cbuuid copy];
      double rtt = self->_rtt;
      uint64_t v29 = +[IDSDaemonPriorityQueueController sharedInstance];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100270078;
      v48[3] = &unk_1009873F0;
      int64_t v54 = a7;
      id v49 = v27;
      id v50 = v26;
      double v55 = rtt;
      id v51 = (id)v13;
      id v52 = v46;
      id v53 = v25;
      id v30 = v26;
      id v31 = v27;
      [v29 performBlockMainQueue:v48];
    }
    [(IDSLocalDeliveryQueue *)self->_deliveryQueue dequeueMessage:v13];
    self->_cachedBytes[[(id)v13 dataProtectionClass]] = -1;
    [(NSMutableArray *)self->_fallbackMessages removeObject:v13];
    if (![(NSMutableArray *)self->_fallbackMessages count])
    {
      fallbackMessages = self->_fallbackMessages;
      self->_fallbackMessages = 0;
    }
    long long v33 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = [(id)v13 messageUUID];
      unsigned int v35 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue count];
      unsigned int v36 = [(NSMutableArray *)self->_sendingMessages count];
      *(_DWORD *)buf = 138413314;
      uint64_t v57 = (IDSUTunConnection *)v12;
      __int16 v58 = 2112;
      unint64_t v59 = v13;
      __int16 v60 = 2112;
      id v61 = v34;
      __int16 v62 = 1024;
      unsigned int v63 = v36 + v35;
      __int16 v64 = 2112;
      id v65 = v47;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Message %@ %@ %@ removed, total message count %d - %@", buf, 0x30u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        long long v37 = [(id)v13 messageUUID];
        unint64_t v38 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue count];
        unsigned int v44 = (char *)[(NSMutableArray *)self->_sendingMessages count] + v38;
        id v45 = v47;
        double v42 = (void *)v13;
        __int16 v43 = v37;
        __int16 v41 = (IDSUTunConnection *)v12;
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          id v39 = objc_msgSend((id)v13, "messageUUID", v12, v13, v37, v44, v47);
          unint64_t v40 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue count];
          unsigned int v44 = (char *)[(NSMutableArray *)self->_sendingMessages count] + v40;
          id v45 = v47;
          double v42 = (void *)v13;
          __int16 v43 = v39;
          __int16 v41 = (IDSUTunConnection *)v12;
          _IDSLogV();
        }
      }
    }
    if (!v12) {
      [(id)v13 setUnderlyingSocketPairMessage:0];
    }
    objc_msgSend(v12, "setContext:", 0, v41, v42, v43, v44, v45);
    [v12 setCancelled:1];
  }
}

- (BOOL)_messageIsAllowedToSendMessageOnTopic:(id)a3
{
  id v4 = a3;
  if ([(IDSUTunConnection *)self _isMagnetConnection])
  {
    CFStringRef v5 = +[IDSDServiceController sharedInstance];
    id v6 = [v5 serviceWithPushTopic:v4];

    id v7 = [v6 allowedTrafficClasses];
    id v8 = [(IDSUTunConnection *)self _UTunDeliveryController];
    unint64_t v9 = [v8 allowedTrafficClasses];

    if ((_IDSIsTrafficAllowed() & 1) == 0)
    {
      double v11 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v18 = v4;
        __int16 v19 = 2112;
        id v20 = v7;
        __int16 v21 = 2112;
        double v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Message on service %@ not allowed! Attempted to send on traffic classes: %@ Permitted traffic classes: %@", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v15 = v7;
          id v16 = v9;
          id v14 = v4;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v15 = v7;
            id v16 = v9;
            id v14 = v4;
            _IDSLogV();
          }
        }
      }
      if (objc_msgSend(v9, "count", v14, v15, v16))
      {
        BOOL v10 = 0;
        goto LABEL_13;
      }
      unint64_t v13 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Overriding previous decision on message for topic %@ due to feature flag that allows messages will empty traffic classes", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
    }
    BOOL v10 = 1;
LABEL_13:

    goto LABEL_14;
  }
  BOOL v10 = 1;
LABEL_14:

  return v10;
}

- (NSArray)supportedMessageTypes
{
  return self->_supportedMessageTypes;
}

- (void)admissionPolicyChangedForTopic:(id)a3 allowed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![v6 length])
  {
    [(NSMutableSet *)self->_admissionDeniedTopics removeAllObjects];
    id v8 = +[IDSDaemonPriorityQueueController sharedInstance];
    unint64_t v9 = v8;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10027072C;
    v25[3] = &unk_10097E4D0;
    v25[4] = self;
    int64_t priority = self->_priority;
    double v11 = v25;
    goto LABEL_6;
  }
  id v7 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v7 assertRunningWithPriority:self->_priority];

  if (v4)
  {
    if ([(NSMutableSet *)self->_admissionDeniedTopics containsObject:v6])
    {
      [(NSMutableSet *)self->_admissionDeniedTopics removeObject:v6];
      id v8 = +[IDSDaemonPriorityQueueController sharedInstance];
      unint64_t v9 = v8;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100270734;
      v24[3] = &unk_10097E4D0;
      v24[4] = self;
      int64_t priority = self->_priority;
      double v11 = v24;
LABEL_6:
      [v8 performBlockWithPriority:v11 priority:priority];
    }
  }
  else
  {
    uint64_t v20 = 0;
    __int16 v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    id v12 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue messages];
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    id v16 = sub_10027073C;
    id v17 = &unk_100987418;
    id v13 = v6;
    id v18 = v13;
    __int16 v19 = &v20;
    [v12 enumerateObjectsWithOptions:2 usingBlock:&v14];

    if (*((unsigned char *)v21 + 24)) {
      -[NSMutableSet addObject:](self->_admissionDeniedTopics, "addObject:", v13, v14, v15, v16, v17);
    }

    _Block_object_dispose(&v20, 8);
  }
}

- (BOOL)checkServiceCompability:(id)a3 localMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 minCompatibilityVersion]
    || self->_newServiceSupported
    && ([v7 minCompatibilityVersion] == (id)1
     || self->_newServiceSupported
     && (unint64_t serviceMinCompatibilityVersion = self->_serviceMinCompatibilityVersion,
         (unint64_t)[v7 minCompatibilityVersion] <= serviceMinCompatibilityVersion)))
  {
    BOOL v18 = 1;
  }
  else
  {
    id v9 = objc_alloc((Class)IDSLocalMessageDeliveryServiceNotCompatibleMetric);
    BOOL v10 = [v7 awdTopic];
    double v11 = [v7 toDeviceID];
    uint64_t v12 = IDSDeviceDefaultPairedDeviceUniqueID;
    id v13 = objc_msgSend(v9, "initWithService:isToDefaultPairedDevice:messageSize:linkType:deliveryError:RTT:priority:", v10, objc_msgSend(v11, "isEqualToString:", IDSDeviceDefaultPairedDeviceUniqueID), 0, 0, 3, 0, objc_msgSend(v7, "priority"));

    id v14 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v14 logMetric:v13];

    uint64_t v15 = +[IDSAWDLogging sharedInstance];
    id v16 = [v7 awdTopic];
    id v17 = [v7 toDeviceID];
    objc_msgSend(v15, "messageDeliveredForService:isToDefaultPairedDevice:messageSize:linkType:deliveryError:RTT:priority:", v16, objc_msgSend(v17, "isEqualToString:", v12), 0, 0, 3, 0, objc_msgSend(v7, "priority"));

    [(IDSUTunConnection *)self _removeSocketPairMessage:v6 localMessage:v7 reason:@"remote does not support new service" responseCode:23];
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)supportsMessageOfType:(int64_t)a3
{
  supportedMessageTypes = self->_supportedMessageTypes;
  BOOL v4 = +[NSNumber numberWithLongLong:a3];
  LOBYTE(supportedMessageTypes) = [(NSArray *)supportedMessageTypes containsObject:v4];

  return (char)supportedMessageTypes;
}

- (BOOL)_nonBTAllowedForClientID:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[FTDeviceSupport sharedInstance];
  unsigned __int8 v5 = [v4 nonBluetoothAvailableForBundleId:v3];

  return v5;
}

- (id)serviceController
{
  return +[IDSDServiceController sharedInstance];
}

- (id)_now
{
  return +[NSDate date];
}

- (unsigned)_calculateRandomDelayForCloudMessagingRequest
{
  id v3 = +[IDSServerBag sharedInstance];
  BOOL v4 = [v3 objectForKey:@"cloud-messaging-on-the-hour-max-delay-in-ms"];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = [v4 intValue];
    id v6 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v22 = @"cloud-messaging-on-the-hour-max-delay-in-ms";
      __int16 v23 = 1024;
      int v24 = (int)v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Server Bag {%@:%d}", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        CFStringRef v17 = @"cloud-messaging-on-the-hour-max-delay-in-ms";
        id v19 = v5;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          CFStringRef v17 = @"cloud-messaging-on-the-hour-max-delay-in-ms";
          id v19 = v5;
          _IDSLogV();
        }
      }
    }
  }
  else
  {
    LODWORD(v5) = 2000;
  }
  id v7 = +[IDSServerBag sharedInstance];
  id v8 = [v7 objectForKey:@"cloud-messaging-top-of-the-hour-definition-in-seconds"];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = [v8 intValue];
    BOOL v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v22 = @"cloud-messaging-top-of-the-hour-definition-in-seconds";
      __int16 v23 = 1024;
      int v24 = (int)v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Server Bag {%@:%d}", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        CFStringRef v18 = @"cloud-messaging-top-of-the-hour-definition-in-seconds";
        id v20 = v9;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          CFStringRef v18 = @"cloud-messaging-top-of-the-hour-definition-in-seconds";
          id v20 = v9;
          _IDSLogV();
        }
      }
    }
  }
  else
  {
    LODWORD(v9) = 5;
  }
  id v11 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  uint64_t v12 = [(IDSUTunConnection *)self _now];
  if (v12)
  {
    id v13 = [v11 components:192 fromDate:v12];
  }
  else
  {
    id v13 = 0;
  }
  id v14 = objc_msgSend(v13, "minute", v18, v20);
  if ((uint64_t)[v13 second] + 60 * (void)v14 <= v9) {
    uint32_t v15 = arc4random_uniform(v5 << (self->_priority != 300));
  }
  else {
    uint32_t v15 = 0;
  }

  return v15;
}

- (void)_assertQuickRelayForCloudMessaging
{
  if (self->_shouldUseIPsecLink)
  {
    id v3 = [(IDSUTunConnection *)self _UTunDeliveryController];
    unsigned __int8 v4 = [v3 isTerminusConnected];

    if ((v4 & 1) == 0)
    {
      uint64_t v5 = [(IDSUTunConnection *)self _calculateRandomDelayForCloudMessagingRequest];
      id v6 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint32_t v15 = self;
        __int16 v16 = 1024;
        int v17 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ Assert QuickRelay after %d ms", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        BOOL v10 = self;
        uint64_t v11 = v5;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          BOOL v10 = self;
          uint64_t v11 = v5;
          _IDSLogV();
        }
      }
      id v7 = +[IDSDaemonPriorityQueueController sharedInstance];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100271084;
      v13[3] = &unk_10097E4D0;
      v13[4] = self;
      [v7 performBlockMainQueue:v13 afterTimeMSec:v5];
    }
  }
  else
  {
    id v12 = +[IDSUTunController sharedInstance];
    unsigned int v8 = [(IDSUTunConnection *)self _isMagnetConnection];
    p_uniqueID = &self->_uniqueID;
    if (v8) {
      p_uniqueID = (NSString **)&kIDSDefaultPairedDeviceID;
    }
    [v12 startGlobalLinkForDevice:*p_uniqueID];
  }
}

- (void)_dequeueMessages
{
  id v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:self->_priority];

  unint64_t v138 = [(IDSUTunConnection *)self _sendingMessageCountForClass:1];
  unint64_t v139 = [(IDSUTunConnection *)self _sendingMessageCountForClass:0];
  unint64_t v137 = [(IDSUTunConnection *)self _sendingMessageCountForClass:2];
  [(IDSUTunConnection *)self _invalidateMessagesDequeueTimer];
  if ([(IDSUTunConnection *)self _isMagnetConnection]
    && !self->_isCloudEnabled
    && [(IDSUTunConnection *)self supportsMessageOfType:6]
    && ![(IDSUTunConnection *)self _inflightMessageCountForType:6])
  {
    [(IDSUTunConnection *)self _handleBecomingEmptyOfCloudMessages];
  }
  if (self->_isCloudEnabled && ![(IDSUTunConnection *)self _inflightMessageCount]) {
    [(IDSUTunConnection *)self _handleBecomingEmptyOfCloudMessages];
  }
  unsigned __int8 v4 = [(IDSSocketPairConnectionProtocol *)self->_socketConnection inFlightMessages];
  id v5 = [v4 count];
  if ((unint64_t)v5 >= 7)
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v151 = self;
      __int16 v152 = 2048;
      *(void *)v153 = v5;
      *(_WORD *)&v153[8] = 1024;
      *(_DWORD *)v154 = 6;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ utun socket pair connection inFlightMessageCount %lu (max %u) - do not dequeue", buf, 0x1Cu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    goto LABEL_200;
  }
  admissionDeniedTopics = self->_admissionDeniedTopics;
  if (!admissionDeniedTopics)
  {
    unsigned int v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v9 = self->_admissionDeniedTopics;
    self->_admissionDeniedTopics = v8;

    admissionDeniedTopics = self->_admissionDeniedTopics;
  }
  +[NSMutableSet setWithSet:admissionDeniedTopics];
  v148[0] = _NSConcreteStackBlock;
  v148[1] = 3221225472;
  v148[2] = sub_100272EB8;
  v148[3] = &unk_100987440;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v149 = v10;
  [v4 enumerateObjectsUsingBlock:v148];
  uint64_t v11 = [(NSMutableDictionary *)self->_tokenToOTREncryptionQueue allValues];
  v146[0] = _NSConcreteStackBlock;
  v146[1] = 3221225472;
  v146[2] = sub_100272F18;
  v146[3] = &unk_100987468;
  id v12 = v10;
  id v147 = v12;
  [v11 enumerateObjectsUsingBlock:v146];
  id v13 = +[IDSFoundationLog UTunConnection];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    unint64_t v15 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue count];
    *(_DWORD *)buf = 138412802;
    v151 = self;
    __int16 v152 = 2112;
    *(void *)v153 = identifier;
    *(_WORD *)&v153[8] = 2048;
    *(void *)v154 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@ _dequeueMessage - %@ messageCount %lu", buf, 0x20u);
  }

  if (qword_100A4C458 != -1) {
    dispatch_once(&qword_100A4C458, &stru_100987488);
  }
  if (byte_100A4C450)
  {
    __int16 v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "**** Local IDS connectivity is disabled, only using cloud ****", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    goto LABEL_199;
  }
  if (self->_isCloudEnabled)
  {
    int v17 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isCloudEnabled = self->_isCloudEnabled;
      unsigned int v19 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue count];
      CFStringRef v20 = @"YES";
      *(_DWORD *)buf = 138412802;
      v151 = self;
      if (!isCloudEnabled) {
        CFStringRef v20 = @"NO";
      }
      __int16 v152 = 2112;
      *(void *)v153 = v20;
      *(_WORD *)&v153[8] = 1024;
      *(_DWORD *)v154 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "UTunConnection _isCloudEnabled:%@ (%@, messageCount:%d)", buf, 0x1Cu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      CFStringRef v21 = @"YES";
      CFStringRef v22 = self->_isCloudEnabled ? @"YES" : @"NO";
      v101 = (IMPowerAssertion *)v22;
      unint64_t v102 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue count];
      v99 = self;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        if (!self->_isCloudEnabled) {
          CFStringRef v21 = @"NO";
        }
        unint64_t v23 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue count];
        v101 = (IMPowerAssertion *)v21;
        unint64_t v102 = v23;
        v99 = self;
        _IDSLogV();
      }
    }
    if ([(IDSLocalDeliveryQueue *)self->_deliveryQueue count]) {
      [(IDSUTunConnection *)self _assertQuickRelayForCloudMessaging];
    }
  }
  if (self->_shouldUseIPsecLink)
  {
    int v24 = [(IDSUTunConnection *)self _UTunDeliveryController];
    unsigned __int8 v25 = [v24 isTerminusConnected];
  }
  else
  {
    unsigned __int8 v25 = 1;
  }
  if (![(IDSUTunConnection *)self isConnected]
    || (self->_isCloudEnabled ? (char v26 = 1) : (char v26 = v25), (v26 & 1) == 0))
  {
    v96 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      v97 = self->_identifier;
      *(_DWORD *)buf = 138412290;
      v151 = (IDSUTunConnection *)v97;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "%@ is not available, waiting.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    goto LABEL_199;
  }
  if (v5 == (id)6) {
    goto LABEL_190;
  }
  uint64_t v27 = 0;
  uint64_t v132 = 6 - (void)v5;
  remoteInstanceID = self->_remoteInstanceID;
  while (2)
  {
    uint64_t v135 = v27;
    id v28 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue nextSocketPairMessageNotOnServices:v12];
    uint64_t v29 = [(IDSUTunConnection *)v28 context];
    if (!v28)
    {
      if (![(NSMutableArray *)self->_sendingMessages count]) {
        [(IDSUTunConnection *)self _clearSendingPowerAssertionWithReason:@"No messages waiting for acks"];
      }
      goto LABEL_189;
    }
    id v30 = 0;
    while (1)
    {
      id v31 = [v29 topic];

      if (![(IDSUTunConnection *)self _messageIsAllowedToSendMessageOnTopic:v31])
      {
        [v29 setDeniedToSend:1];
        id v32 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          long long v33 = [v29 messageUUID];
          *(_DWORD *)buf = 138412290;
          v151 = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Message with guid %@ not allowed due to its traffic class", buf, 0xCu);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v99 = [v29 messageUUID];
            _IDSLogTransport();

            if (_IDSShouldLog())
            {
              v99 = objc_msgSend(v29, "messageUUID", v99);
              _IDSLogV();
            }
          }
        }
        goto LABEL_63;
      }
      if ([(IDSUTunConnection *)self checkServiceCompability:v28 localMessage:v29])
      {
        break;
      }
LABEL_63:
      -[IDSLocalDeliveryQueue nextSocketPairMessageNotOnServices:](self->_deliveryQueue, "nextSocketPairMessageNotOnServices:", v12, v99);
      id v34 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue();

      uint64_t v35 = [(IDSUTunConnection *)v34 context];

      id v30 = v31;
      uint64_t v29 = (void *)v35;
      id v28 = v34;
      if (!v34)
      {

        uint64_t v29 = (void *)v35;
        goto LABEL_189;
      }
    }
    unsigned __int8 v36 = [v29 manualQueueRemoval];
    if ((v36 & 1) == 0)
    {
      [v29 setUnderlyingSocketPairMessage:0];
      [(IDSLocalDeliveryQueue *)self->_deliveryQueue dequeueMessage:v29];
    }
    if (!self->_sendingPowerAssertion)
    {
      if (v31)
      {
        long long v37 = +[NSString stringWithFormat:@"IDSUTunConnection-sending-%@", v31];
      }
      else
      {
        long long v37 = @"IDSUTunConnection-sending";
      }
      unint64_t v38 = (IMPowerAssertion *)[objc_alloc((Class)IMPowerAssertion) initWithIdentifier:v37 timeout:120.0];
      sendingPowerAssertion = self->_sendingPowerAssertion;
      self->_sendingPowerAssertion = v38;

      unint64_t v40 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v41 = self->_sendingPowerAssertion;
        *(_DWORD *)buf = 138412546;
        v151 = self;
        __int16 v152 = 2112;
        *(void *)v153 = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%@ created sending power assertion %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v99 = self;
        v101 = self->_sendingPowerAssertion;
        _IDSLogV();
      }
    }
    -[IDSUTunConnection setTopic:](v28, "setTopic:", v31, v99, v101);
    if (self->_supportDynamicServices && (objc_opt_respondsToSelector() & 1) != 0)
    {
      char v145 = 0;
      unsigned __int16 v144 = -21846;
      if (self->_supportDynamicServicesOptimization)
      {
        if ([(IDSUTunPeerServiceMap *)self->_outgoingServiceMap translateServiceName:v31 toStreamID:&v144 createIfNotFound:0 mappingCreated:0 remoteInstanceID:remoteInstanceID remoteInstanceIDChanged:&v145])
        {
          double v42 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            __int16 v43 = [v29 messageUUID];
            *(_DWORD *)buf = 138412802;
            v151 = v43;
            __int16 v152 = 2112;
            *(void *)v153 = v31;
            *(_WORD *)&v153[8] = 1024;
            *(_DWORD *)v154 = v144;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "Translated message %@ with servicename %@ to streamID %u", buf, 0x1Cu);
          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            unsigned int v44 = [v29 messageUUID];
            v101 = (IMPowerAssertion *)v31;
            unint64_t v102 = v144;
            v99 = v44;
            _IDSLogV();
          }
          -[IDSUTunConnection setStreamID:](v28, "setStreamID:", v144, v99);
          [(IDSUTunConnection *)v28 setUseDynamicServiceName:0];
        }
        else
        {
          [(IDSUTunConnection *)v28 setUseDynamicServiceName:1];
          unsigned __int8 v143 = 0;
          unsigned __int16 v142 = 0;
          if ([(IDSUTunPeerServiceMap *)self->_incomingServiceMap translateServiceName:v31 toStreamID:&v142 createIfNotFound:1 mappingCreated:&v143 remoteInstanceID:remoteInstanceID remoteInstanceIDChanged:&v145])
          {
            id v45 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              log = v45;
              id v46 = [v29 messageUUID];
              int v47 = v142;
              int v48 = v143;
              unsigned int v49 = [(IDSUTunConnection *)v28 streamID];
              *(_DWORD *)buf = 138413314;
              CFStringRef v50 = @"YES";
              if (!v48) {
                CFStringRef v50 = @"NO";
              }
              v151 = v46;
              __int16 v152 = 2112;
              *(void *)v153 = v31;
              *(_WORD *)&v153[8] = 1024;
              *(_DWORD *)v154 = v47;
              *(_WORD *)&v154[4] = 2112;
              *(void *)&v154[6] = v50;
              *(_WORD *)&v154[14] = 1024;
              *(_DWORD *)&v154[16] = v49;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Piggybacking message %@ with servicename %@ with incoming streamID %u created %@ (old id %u)", buf, 0x2Cu);

              id v45 = log;
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v51 = [v29 messageUUID];
              unint64_t v52 = v142;
              if (v143) {
                CFStringRef v53 = @"YES";
              }
              else {
                CFStringRef v53 = @"NO";
              }
              CFStringRef v103 = v53;
              unint64_t v104 = [(IDSUTunConnection *)v28 streamID];
              v101 = (IMPowerAssertion *)v31;
              unint64_t v102 = v52;
              v99 = v51;
              _IDSLogV();
            }
            -[IDSUTunConnection setStreamID:](v28, "setStreamID:", v142, v99);
            if (!self->_incomingServiceMapUpdateCounter)
            {
              Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              incomingServiceMapUpdateCounter = self->_incomingServiceMapUpdateCounter;
              self->_incomingServiceMapUpdateCounter = Mutable;
            }
            CFDictionarySetValue((CFMutableDictionaryRef)self->_incomingServiceMapUpdateCounter, v31, &off_1009D1A10);
          }
          else
          {
            unint64_t v56 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v57 = [v29 messageUUID];
              *(_DWORD *)buf = 138412546;
              v151 = v57;
              __int16 v152 = 2112;
              *(void *)v153 = v31;
              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Remote instance changed while receiving message %@ with topic %@ - continue and dispatch reconnect", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                v99 = [v29 messageUUID];
                v101 = (IMPowerAssertion *)v31;
                _IDSLogTransport();

                if (_IDSShouldLog())
                {
                  v99 = objc_msgSend(v29, "messageUUID", v99, v31);
                  v101 = (IMPowerAssertion *)v31;
                  _IDSLogV();
                }
              }
            }
            -[IDSUTunConnection setStreamID:](v28, "setStreamID:", 0, v99);
          }
        }
      }
      else
      {
        [(IDSUTunConnection *)v28 setUseDynamicServiceName:1];
      }
    }
    uint64_t v58 = [(IDSUTunConnection *)self serviceController];
    unint64_t v59 = [(id)v58 serviceWithPushTopic:v31];
    os_log_t loga = [v59 dataUsageBundleID];

    LOBYTE(v58) = !self->_shouldUseIPsecLink;
    unsigned int v60 = [(IDSUTunConnection *)self _isMagnetConnection];
    if (v58)
    {
      if (v60)
      {
        int v63 = (id)[(IDSUTunConnection *)self _currentLink] != (id)1;
        goto LABEL_115;
      }
LABEL_114:
      int v63 = 0;
      goto LABEL_115;
    }
    if (!v60) {
      goto LABEL_114;
    }
    id v61 = [(IDSUTunConnection *)self _UTunDeliveryController];
    unsigned int v62 = [v61 isTerminusConnectedOverBluetooth];

    int v63 = v62 ^ 1;
LABEL_115:
    if ([loga length]
      && (([(IDSUTunConnection *)self _nonBTAllowedForClientID:loga] | v63 ^ 1) & 1) == 0)
    {
      v95 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "Non BT usage is not allowed, failing message", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      [(IDSUTunConnection *)self _removeSocketPairMessage:v28 localMessage:v29 reason:@"Celluar Useage Policy states that BT is required" responseCode:15];
LABEL_182:

      uint64_t v27 = v135 + 1;
      if (v135 + 1 == v132) {
        goto LABEL_190;
      }
      continue;
    }
    break;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!self->_sendingMessages)
  {
    __int16 v64 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    sendingMessages = self->_sendingMessages;
    self->_sendingMessages = v64;
  }
  if (isKindOfClass)
  {
    [(NSMutableArray *)self->_sendingMessages removeObject:v28];
    if (self->_priority != 300 && ([v29 bypassDuet] & 1) == 0)
    {
      v120 = [v29 duetIdentifiersOverride];
      if (![v120 count])
      {
        long long v66 = +[IDSDServiceController sharedInstance];
        long long v67 = [v66 serviceWithPushTopic:v31];
        uint64_t v68 = [v67 duetIdentifiers];

        v120 = (void *)v68;
      }
      __int16 v69 = [v29 messageUUID];
      CFStringRef v70 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"dequeueMessages check for %@ %u", v69, [v29 messageID]);

      __int16 v71 = +[IDSDuetInterface sharedInstance];
      int64_t priority = self->_priority;
      v113 = +[IDSDaemonPriorityQueueController sharedInstance];
      int v72 = [v113 queueForPriority:self->_priority];
      v140[0] = _NSConcreteStackBlock;
      v140[1] = 3221225472;
      v140[2] = sub_100272FD0;
      v140[3] = &unk_100980D88;
      v140[4] = self;
      id v141 = v31;
      [v71 forceCheckAvailabilityForValues:v120 priority:priority logString:v70 fromQueue:v72 withCompletionBlock:v140];
    }
  }
  [(NSMutableArray *)self->_sendingMessages addObject:v28];
  if (v31) {
    [v12 addObject:v31];
  }
  if ((isKindOfClass & 1) == 0)
  {
LABEL_139:
    if ([v29 manualQueueRemoval])
    {
      v112 = 0;
    }
    else
    {
      v122 = [v29 payload];
      v115 = (char *)[v122 length];
      __int16 v79 = [v29 protobuf];
      unint64_t v80 = [v79 data];
      id v81 = [v80 length];

      v112 = (IMPowerAssertion *)&v115[(void)v81];
    }
    qos_class_t v82 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v83 = @"URGENT";
      if ([v29 priority] != (id)300)
      {
        if ([v29 priority] == (id)200) {
          CFStringRef v83 = @"Default";
        }
        else {
          CFStringRef v83 = @"Sync";
        }
      }
      v108 = [v29 payload];
      id v107 = [v108 length];
      id v116 = [v29 topic];
      id v123 = [v29 domainHash];
      id v84 = [v29 messageUUID];
      unsigned int v85 = [v29 messageID];
      *(_DWORD *)buf = 138544898;
      v151 = (IDSUTunConnection *)v83;
      __int16 v152 = 2048;
      *(void *)v153 = v112;
      *(_WORD *)&v153[8] = 2048;
      *(void *)v154 = v107;
      *(_WORD *)&v154[8] = 2114;
      *(void *)&v154[10] = v116;
      *(_WORD *)&v154[18] = 2114;
      id v155 = v123;
      __int16 v156 = 2114;
      id v157 = v84;
      __int16 v158 = 1024;
      unsigned int v159 = v85;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "* Dequeuing for Sending %{public}@ priority local message payload of data size: %lu/%lu   for topic: %{public}@:%{public}@  guid: %{public}@  messageID: %d", buf, 0x44u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      CFStringRef v86 = @"URGENT";
      if ([v29 priority] != (id)300)
      {
        if ([v29 priority] == (id)200) {
          CFStringRef v86 = @"Default";
        }
        else {
          CFStringRef v86 = @"Sync";
        }
      }
      v124 = [v29 payload];
      id v109 = [v124 length];
      v87 = [v29 topic];
      v117 = [v29 domainHash];
      v105 = [v29 messageUUID];
      id v106 = [v29 messageID];
      CFStringRef v103 = v87;
      unint64_t v104 = (unint64_t)v117;
      v101 = v112;
      unint64_t v102 = (unint64_t)v109;
      v99 = (void *)v86;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        CFStringRef v88 = @"URGENT";
        if (objc_msgSend(v29, "priority", v99, v112, v109, v87, v117, v105, v106) != (id)300)
        {
          if ([v29 priority] == (id)200) {
            CFStringRef v88 = @"Default";
          }
          else {
            CFStringRef v88 = @"Sync";
          }
        }
        v125 = [v29 payload];
        id v110 = [v125 length];
        v89 = [v29 topic];
        v118 = [v29 domainHash];
        v105 = [v29 messageUUID];
        id v106 = [v29 messageID];
        CFStringRef v103 = v89;
        unint64_t v104 = (unint64_t)v118;
        v101 = v112;
        unint64_t v102 = (unint64_t)v110;
        v99 = (void *)v88;
        _IDSLogV();
      }
    }
    objc_msgSend(v29, "setSentMessageDataSize:", -[IDSUTunConnection underlyingDataLength](v28, "underlyingDataLength", v99));
    -[IDSUTunConnection _addOutgoingMessageSize:forTopic:dataProtectionClass:isResource:](self, "_addOutgoingMessageSize:forTopic:dataProtectionClass:isResource:", [v29 sentMessageDataSize], v31, objc_msgSend(v29, "dataProtectionClass"), isKindOfClass & 1);
    v90 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v91 = [(NSMutableArray *)self->_sendingMessages count];
      unsigned int v92 = [v12 count];
      *(_DWORD *)buf = 138412802;
      v151 = v28;
      __int16 v152 = 1024;
      *(_DWORD *)v153 = v91;
      *(_WORD *)&v153[4] = 1024;
      *(_DWORD *)&v153[6] = v92;
      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Message %@ added to queue, total message count %d, sendingTopics count %d", buf, 0x18u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v101 = (IMPowerAssertion *)[(NSMutableArray *)self->_sendingMessages count];
      unint64_t v102 = (unint64_t)[v12 count];
      v100 = v28;
      _IDSLogV();
    }
    if (-[IDSUTunConnection _shouldAWDLogMessage:](self, "_shouldAWDLogMessage:", v29, v100))
    {
      id v126 = objc_alloc((Class)IDSLocalDeliveryMessageSentMetric);
      v130 = [v29 awdTopic];
      id v127 = objc_msgSend(v126, "initWithService:isToDefaultPairedDevice:messageSize:linkType:priority:", v130, -[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"), objc_msgSend(v29, "sentMessageDataSize"), -[IDSUTunConnection _currentLink](self, "_currentLink"), objc_msgSend(v29, "priority"));

      v93 = +[IDSCoreAnalyticsLogger defaultLogger];
      [v93 logMetric:v127];

      v131 = +[IDSAWDLogging sharedInstance];
      v119 = [v29 awdTopic];
      objc_msgSend(v131, "messageSentForService:isToDefaultPairedDevice:messageSize:linkType:priority:", v119, -[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"), objc_msgSend(v29, "sentMessageDataSize"), -[IDSUTunConnection _currentLink](self, "_currentLink"), objc_msgSend(v29, "priority"));
    }
    [(IDSUTunConnection *)self _sendSocketMessage:v28];
    [(IDSUTunConnection *)v28 setWasWrittenToConnection:1];
    if (v31
      && [v31 hasPrefix:@"com.apple.private.alloy.idstool.testservice"]
      && IMGetDomainBoolForKey())
    {
      v94 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v151 = v28;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "Send duplicate message %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v99 = v28;
        _IDSLogV();
      }
      -[IDSUTunConnection _sendSocketMessage:](self, "_sendSocketMessage:", v28, v99);
    }
    goto LABEL_182;
  }
  v73 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v151 = self;
    __int16 v152 = 2112;
    *(void *)v153 = v28;
    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "%@ resource transfer sender %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v99 = self;
    v101 = (IMPowerAssertion *)v28;
    _IDSLogV();
  }
  v74 = v28;
  [(IDSUTunConnection *)v74 setMaxChunkSize:4000];
  [(IDSUTunConnection *)v74 setResumeResourceTransfers:self->_resumeResourceTransfers];
  v114 = [(IDSUTunConnection *)v74 nextMessage];
  if (v114)
  {
    __int16 v75 = [v29 progressBlock];

    if (v75)
    {
      id v121 = objc_alloc_init((Class)IDSDeliveryContext);
      [v121 setIdsResponseCode:0];
      [v121 setLastCall:0];
      CFStringRef v76 = [v29 progressBlock];
      __int16 v77 = +[NSNumber numberWithUnsignedLongLong:[(IDSUTunConnection *)v74 nextByte]];
      id v78 = +[NSNumber numberWithUnsignedLongLong:[(IDSUTunConnection *)v74 totalBytes]];
      ((void (**)(void, id, void *, void *, uint64_t, void))v76)[2](v76, v121, v77, v78, 1, 0);
    }
    if ([(IDSUTunConnection *)v74 isDone])
    {
      [v29 setUnderlyingSocketPairMessage:0];
      [(IDSLocalDeliveryQueue *)self->_deliveryQueue dequeueMessage:v29];
    }
    id v28 = v114;

    goto LABEL_139;
  }
  v98 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v151 = self;
    __int16 v152 = 2112;
    *(void *)v153 = v74;
    _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "%@ cannot read message to deliver for resource transfer %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v99 = self;
    v101 = (IMPowerAssertion *)v74;
    _IDSLogV();
  }
  [(IDSUTunConnection *)self _removeSocketPairMessage:v74, v29, @"cannot read chunk of resource", 17, v99, v101, v102, v103, v104, v105, v106 localMessage reason responseCode];

  uint64_t v29 = v74;
LABEL_189:

LABEL_190:
  if (v138 && ![(IDSUTunConnection *)self _sendingMessageCountForClass:1]) {
    [(IDSUTunConnection *)self _handleBecomingEmptyForDataProtectionClass:1];
  }
  if (v139 && ![(IDSUTunConnection *)self _sendingMessageCountForClass:0]) {
    [(IDSUTunConnection *)self _handleBecomingEmptyForDataProtectionClass:0];
  }
  if (v137 && ![(IDSUTunConnection *)self _sendingMessageCountForClass:2]) {
    [(IDSUTunConnection *)self _handleBecomingEmptyForDataProtectionClass:2];
  }
LABEL_199:

LABEL_200:
}

- (void)trafficClassesChanged
{
  id v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:self->_priority];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unsigned __int8 v4 = self->_sendingMessages;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      unsigned int v8 = 0;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v28 + 1) + 8 * (void)v8) context];
        [v9 setDeniedToSend:0];

        unsigned int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v6);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = self->_fallbackMessages;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * (void)v14) setDeniedToSend:0];
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v15 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue messages];
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      unsigned int v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) setDeniedToSend:0];
        unsigned int v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }

  [(IDSUTunConnection *)self _dequeueMessages];
}

- (void)clearStats
{
  id v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:self->_priority];

  deliveryQueue = self->_deliveryQueue;

  [(IDSLocalDeliveryQueue *)deliveryQueue clearStats];
}

- (void)_clearSendingPowerAssertionWithReason:(id)a3
{
  id v4 = a3;
  if (self->_sendingPowerAssertion)
  {
    id v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clearing power assertion: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    sendingPowerAssertion = self->_sendingPowerAssertion;
    self->_sendingPowerAssertion = 0;
  }
}

- (void)_sendSocketMessage:(id)a3
{
}

- (void)_sendSocketMessage:(id)a3 ignoreSequenceNumber:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v7 assertRunningWithPriority:self->_priority];

  id v8 = [v6 context];
  if (!a4)
  {
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v6 sequenceNumber];
LABEL_4:
      int v10 = 1;
      goto LABEL_13;
    }
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v8 messageID];
      [v6 setSequenceNumber:v9];
      id v11 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v18) = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "* Sending message with sequence number %u", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
      goto LABEL_4;
    }
  }
  id v9 = 0;
  int v10 = 0;
LABEL_13:
  IMTimeOfDay();
  objc_msgSend(v8, "setTimeSent:");
  if (!a4)
  {
    id v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      unsigned int v14 = [v8 messageID];
      if (v10)
      {
        unint64_t v15 = +[NSString stringWithFormat:@"with sequenceNumber %u", v9];
      }
      else
      {
        unint64_t v15 = &stru_10099BE78;
      }
      *(_DWORD *)buf = 138413058;
      uint64_t v18 = identifier;
      __int16 v19 = 2048;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      long long v22 = v15;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ Sending message[%lu] %@ %@.", buf, 0x2Au);
      if (v10) {
    }
      }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      [v8 messageID];
      if (v10)
      {
        id v16 = +[NSString stringWithFormat:@"with sequenceNumber %u", v9];
        _IDSLogV();
      }
      else
      {
        _IDSLogV();
      }
    }
  }
  kdebug_trace();
  if ([(IDSUTunConnection *)self _messageHasValidEncryptionStatus:v6]) {
    [(IDSSocketPairConnectionProtocol *)self->_socketConnection sendDataMessage:v6 canFragment:[(IDSUTunConnection *)self _isMagnetConnection]];
  }
  else {
    [(IDSUTunConnection *)self _sendEncryptedMessage:v6];
  }
}

- (void)_updateDictionary:(id)a3 addMessageSize:(int64_t)a4 addMessageCount:(int64_t)a5
{
  id v8 = a3;
  id v9 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v9 assertRunningWithPriority:self->_priority];

  id v17 = [v8 objectForKey:@"localDeliveryQueueStatMessageCount"];
  int v10 = [v8 objectForKey:@"localDeliveryQueueStatBytes"];
  id v11 = (char *)[v17 unsignedLongLongValue];
  id v12 = (char *)[v10 unsignedLongLongValue];
  uint64_t v13 = &v11[a5];
  unsigned int v14 = &v12[a4];
  unint64_t v15 = +[NSNumber numberWithUnsignedLongLong:v13];
  [v8 setObject:v15 forKey:@"localDeliveryQueueStatMessageCount"];

  id v16 = +[NSNumber numberWithUnsignedLongLong:v14];
  [v8 setObject:v16 forKey:@"localDeliveryQueueStatBytes"];
}

- (void)_addMessageSize:(unint64_t)a3 forTopic:(id)a4 direction:(unsigned __int8)a5 dataProtectionClass:(unsigned int)a6 isResource:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  int v9 = a5;
  id v12 = a4;
  if (!v12) {
    goto LABEL_30;
  }
  if (v9 == 1)
  {
    uint64_t v21 = 48;
LABEL_16:
    Mutable = [*(id *)((char *)&self->super.isa + v21) objectForKey:v12];
    if (!Mutable) {
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    [(IDSUTunConnection *)self _updateDictionary:Mutable addMessageSize:a3 addMessageCount:!v7];
    __int16 v23 = *(Class *)((char *)&self->super.isa + v21);
    if (!v23)
    {
      id v24 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      long long v25 = *(Class *)((char *)&self->super.isa + v21);
      *(Class *)((char *)&self->super.isa + v21) = v24;

      __int16 v23 = *(Class *)((char *)&self->super.isa + v21);
    }
    [v23 setObject:Mutable forKey:v12];
    long long v26 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      int64_t priority = self->_priority;
      uint64_t v28 = *(uint64_t *)((char *)&self->super.isa + v21);
      *(_DWORD *)buf = 136315906;
      long long v31 = "-[IDSUTunConnection _addMessageSize:forTopic:direction:dataProtectionClass:isResource:]";
      __int16 v32 = 1024;
      int v33 = priority;
      __int16 v34 = 1024;
      int v35 = v9;
      __int16 v36 = 2112;
      uint64_t v37 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%s: priority %d updated direction %d stats %@", buf, 0x22u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }

    goto LABEL_30;
  }
  if (!v9)
  {
    if (!v7)
    {
      statistics = self->_statistics;
      unsigned int v14 = +[NSNumber numberWithUnsignedInt:v8];
      id v15 = [(NSMutableDictionary *)statistics objectForKey:v14];

      if (!self->_statistics)
      {
        id v16 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        id v17 = self->_statistics;
        self->_statistics = v16;
      }
      if (!v15)
      {
        id v15 = objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v18 = self->_statistics;
        __int16 v19 = +[NSNumber numberWithUnsignedInt:v8];
        [(NSMutableDictionary *)v18 setObject:v15 forKey:v19];
      }
      uint64_t v20 = [v15 objectForKey:v12];
      if (!v20) {
        uint64_t v20 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      }
      [(IDSUTunConnection *)self _updateDictionary:v20 addMessageSize:a3 addMessageCount:1];
      if (!v15) {
        id v15 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      }
      [v15 setObject:v20 forKey:v12];
    }
    uint64_t v21 = 40;
    goto LABEL_16;
  }
  long long v29 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    long long v31 = "-[IDSUTunConnection _addMessageSize:forTopic:direction:dataProtectionClass:isResource:]";
    __int16 v32 = 1024;
    int v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s: statsDictionary is nil for direction %d", buf, 0x12u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    _IDSWarnV();
    _IDSLogV();
    _IDSLogTransport();
  }
LABEL_30:
}

- (void)_addIncomingMessageSize:(unint64_t)a3 forTopic:(id)a4
{
}

- (void)_addOutgoingMessageSize:(unint64_t)a3 forTopic:(id)a4 dataProtectionClass:(unsigned int)a5 isResource:(BOOL)a6
{
  self->_cachedBytes[a5] = -1;
}

- (void)_removeMessageFromStatistics:(id)a3
{
  id v17 = a3;
  id v4 = [v17 topic];
  id v5 = [v17 dataProtectionClass];
  if (!v4) {
    goto LABEL_12;
  }
  id v6 = v5;
  statistics = self->_statistics;
  uint64_t v8 = +[NSNumber numberWithUnsignedInt:v5];
  id v9 = [(NSMutableDictionary *)statistics objectForKey:v8];

  if (!self->_statistics)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    unsigned int v14 = self->_statistics;
    self->_statistics = Mutable;

    if (v9) {
      goto LABEL_4;
    }
LABEL_8:
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    id v15 = self->_statistics;
    id v16 = +[NSNumber numberWithUnsignedInt:v6];
    [(NSMutableDictionary *)v15 setObject:v9 forKey:v16];

    goto LABEL_4;
  }
  if (!v9) {
    goto LABEL_8;
  }
LABEL_4:
  int v10 = [v9 objectForKey:v4];
  if (v10)
  {
    -[IDSUTunConnection _updateDictionary:addMessageSize:addMessageCount:](self, "_updateDictionary:addMessageSize:addMessageCount:", v10, -(uint64_t)[v17 sentMessageDataSize], -1);
    id v11 = [v10 objectForKey:@"localDeliveryQueueStatMessageCount"];
    id v12 = [v11 unsignedLongLongValue];

    if (v12) {
      [v9 setObject:v10 forKey:v4];
    }
    else {
      [v9 removeObjectForKey:v4];
    }
    self->_cachedBytes[v6] = -1;
  }

LABEL_12:
}

- (unint64_t)_pendingOutgoingBytesForClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  unint64_t result = self->_cachedBytes[v3];
  if ((result & 0x8000000000000000) != 0)
  {
    cachedBytes = self->_cachedBytes;
    uint64_t v30 = v3;
    uint64_t v28 = self;
    unsigned int v29 = v3;
    __int16 v34 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue statisticsForDataProtectionClass:v3];
    [v34 allKeys];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v7)
    {
      id v8 = v7;
      int64_t v9 = 0;
      uint64_t v10 = *(void *)v40;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = [v34 objectForKey:*(void *)(*((void *)&v39 + 1) + 8 * i)];
          uint64_t v13 = [v12 objectForKey:@"localDeliveryQueueStatBytes"];
          uint64_t v14 = (uint64_t)[v13 unsignedLongLongValue];

          id v15 = [v12 objectForKey:@"localDeliveryQueueStatMessageCount"];
          id v16 = [v15 unsignedLongLongValue];

          v9 += (v14 & ~(v14 >> 63)) + 12288 * (void)v16;
        }
        id v8 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v8);
    }
    else
    {
      int64_t v9 = 0;
    }
    id v17 = [(IDSUTunConnection *)v28 _sendingMessageStatisticsForClass:v29];
    uint64_t v18 = [v17 allKeys];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obja = v18;
    id v19 = [obja countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v36;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(obja);
          }
          __int16 v23 = [v17 objectForKey:*(void *)(*((void *)&v35 + 1) + 8 * (void)j)];
          id v24 = [v23 objectForKey:@"localDeliveryQueueStatBytes"];
          long long v25 = (char *)[v24 unsignedLongLongValue];

          long long v26 = [v23 objectForKey:@"localDeliveryQueueStatMessageCount"];
          id v27 = [v26 unsignedLongLongValue];

          v9 += (int64_t)&v25[12288 * (void)v27];
        }
        id v20 = [obja countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v20);
    }

    cachedBytes[v30] = v9;
    return cachedBytes[v30];
  }
  return result;
}

- (double)_dequeueMessagesTimerInterval
{
  return 600.0;
}

- (void)_startMessagesDequeueMessagesTimer
{
  uint64_t v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:self->_priority];

  if (self->_dequeueTimer)
  {
    id v4 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Request to start messageDequeueTimer ignored -- timer already running", v12, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  else
  {
    id v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting messageDequeueTimer", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    id v6 = objc_alloc((Class)IMTimer);
    [(IDSUTunConnection *)self _dequeueMessagesTimerInterval];
    double v8 = v7;
    int64_t v9 = im_primary_queue();
    uint64_t v10 = (IMTimer *)[v6 initWithTimeInterval:@"com.apple.identityservices.IDSUTunConnection-dequeueMessages" name:1 shouldWake:self target:"_dequeueMessagesTimerDidFire:" selector:0 userInfo:v9 queue:v8];
    dequeueTimer = self->_dequeueTimer;
    self->_dequeueTimer = v10;
  }
}

- (void)_dequeueTimerFiredOnMain:(id)a3
{
  id v4 = a3;
  id v5 = im_primary_queue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100274548;
  v7[3] = &unk_10097E440;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_invalidateMessagesDequeueTimer
{
  uint64_t v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:self->_priority];

  dequeueTimer = self->_dequeueTimer;
  if (dequeueTimer)
  {
    [(IMTimer *)dequeueTimer invalidate];
    id v5 = self->_dequeueTimer;
    self->_dequeueTimer = 0;
  }
}

- (void)_dequeueMessagesTimerDidFire:(id)a3
{
  im_assert_primary_base_queue();
  id v4 = +[IDSDaemonPriorityQueueController sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10027465C;
  v5[3] = &unk_10097E4D0;
  v5[4] = self;
  [v4 performBlockWithPriority:v5 priority:self->_priority];
}

- (void)_requeueSendingMessage:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 reset];
  }
  id v4 = [v5 context];
  if (v4)
  {
    [(IDSLocalDeliveryQueue *)self->_deliveryQueue pushMessage:v4];
    [(IDSUTunConnection *)self _removeMessageFromStatistics:v4];
  }
}

- (void)_requeueMessages:(id)a3
{
  id v4 = a3;
  id v5 = [v4 componentsSeparatedByString:@"-"];
  if ((unint64_t)[v5 count] > 2)
  {
    id v7 = v5;
  }
  else
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "_otrTokenToArray: invalid OTR token %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      id v20 = v4;
      _IDSLogTransport();
    }
    id v7 = 0;
  }

  if (v7)
  {
    id v8 = [v7 objectAtIndex:0];
    id v9 = objc_alloc_init((Class)NSMutableIndexSet);
    unsigned int v10 = [v8 isEqualToString:@"idsotr"];
    id v11 = [v7 objectAtIndex:2];
    id v12 = v11;
    if (v10)
    {
      unsigned int v13 = [v11 intValue];

      sendingMessages = self->_sendingMessages;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100274C38;
      v28[3] = &unk_1009874B0;
      unsigned int v30 = v13;
      v28[4] = self;
      id v29 = v9;
      [(NSMutableArray *)sendingMessages enumerateObjectsWithOptions:2 usingBlock:v28];
    }
    else
    {
      int v15 = [v11 BOOLValue];

      id v16 = self->_sendingMessages;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100274D10;
      v23[3] = &unk_1009874D8;
      char v27 = v15;
      id v24 = v8;
      long long v25 = self;
      id v26 = v9;
      [(NSMutableArray *)v16 enumerateObjectsWithOptions:2 usingBlock:v23];
    }
    if (objc_msgSend(v9, "count", v20))
    {
      [(NSMutableArray *)self->_sendingMessages removeObjectsAtIndexes:v9];
      id v17 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [v9 count];
        *(_DWORD *)buf = 134218242;
        id v32 = v18;
        __int16 v33 = 2112;
        id v34 = v4;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Requeued %lu sending messages for %@.", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v21 = [v9 count];
          id v22 = v4;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v21 = objc_msgSend(v9, "count", v21, v4);
            id v22 = v4;
            _IDSLogV();
          }
        }
      }
    }
    id v19 = -[NSMutableDictionary objectForKey:](self->_tokenToOTREncryptionQueue, "objectForKey:", v4, v21, v22);
    [v19 removeAllObjects];

    [(IDSUTunConnection *)self _dequeueMessages];
  }
}

- (void)handleOTRNegotiationComplete:(id)a3
{
  id v6 = a3;
  id v4 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v4 assertRunningWithPriority:self->_priority];

  id v5 = +[IDSOTRController sharedInstance];
  [v5 setSessionReady:v6];

  [(IDSUTunConnection *)self _requeueMessages:v6];
}

- (void)handleOTRNegotiationTimeout:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  id v6 = [v4 componentsSeparatedByString:@"-"];
  id v7 = [v6 objectAtIndex:0];

  if ([v7 isEqualToString:@"idsotr"] && !self->_useSharedOTRSession)
  {
    int v15 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "OTR negotiation timed out for %@ but remote device doesn't support shared session.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v19 = v4;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v19 = v4;
          _IDSLogV();
        }
      }
    }
    tokenToOTRError = self->_tokenToOTRError;
    if (!tokenToOTRError)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      id v18 = self->_tokenToOTRError;
      self->_tokenToOTRError = Mutable;

      tokenToOTRError = self->_tokenToOTRError;
    }
    -[NSMutableDictionary setObject:forKey:](tokenToOTRError, "setObject:forKey:", &__kCFBooleanFalse, v4, v19);
    [(IDSUTunConnection *)self _requeueMessages:v4];
  }
  else if ([(IDSUTunConnection *)self isConnected])
  {
    id v8 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "OTR negotiation timed out for %@, retry.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v19 = v4;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v19 = v4;
          _IDSLogV();
        }
      }
    }
    id v9 = +[IDSOTRController sharedInstance];
    [v9 startOTRNegotiationWithDeviceIfNeeded:IDSDeviceDefaultPairedDeviceUniqueID token:v4 reset:1 errorHandler:0];
  }
  else
  {
    unsigned int v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "OTR negotiation timed out for %@, clear error state and requeue all messages.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v19 = v4;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v19 = v4;
          _IDSLogV();
        }
      }
    }
    id v11 = self->_tokenToOTRError;
    if (!v11)
    {
      id v12 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      unsigned int v13 = self->_tokenToOTRError;
      self->_tokenToOTRError = v12;

      id v11 = self->_tokenToOTRError;
    }
    uint64_t v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0, v19);
    [(NSMutableDictionary *)v11 setObject:v14 forKey:v4];

    [(IDSUTunConnection *)self _requeueMessages:v4];
  }
}

- (void)setEnableOTR:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  if (self->_enableOTR != v3)
  {
    self->_enableOTR = v3;
    if (v3)
    {
      id v6 = +[IDSOTRController sharedInstance];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1002756A0;
      v19[3] = &unk_100987500;
      v19[4] = self;
      [v6 addOTRSessionBlock:1 sessionBlock:v19 key:self->_otrTokenIdentifier];

      id v7 = +[IDSOTRController sharedInstance];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1002756AC;
      v18[3] = &unk_100987500;
      v18[4] = self;
      [v7 addOTRSessionBlock:2 sessionBlock:v18 key:self->_otrTokenIdentifier];

      if (self->_supportsLegacyOTRSessionToken)
      {
        id v8 = +[IDSOTRController sharedInstance];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1002756B8;
        v17[3] = &unk_100987500;
        v17[4] = self;
        id v9 = +[NSNumber numberWithInteger:self->_priority];
        [v8 addOTRSessionBlock:1 sessionBlock:v17 key:v9];

        unsigned int v10 = +[IDSOTRController sharedInstance];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1002756C4;
        v16[3] = &unk_100987500;
        v16[4] = self;
        id v11 = +[NSNumber numberWithInteger:self->_priority];
        [v10 addOTRSessionBlock:2 sessionBlock:v16 key:v11];
      }
    }
    [(NSMutableDictionary *)self->_tokenToOTRError removeAllObjects];
    id v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v13 = @"Enable";
      BOOL v14 = !self->_enableOTR;
      int64_t priority = self->_priority;
      *(_DWORD *)buf = 138412802;
      if (v14) {
        CFStringRef v13 = @"Disable";
      }
      CFStringRef v21 = v13;
      __int16 v22 = 2048;
      __int16 v23 = self;
      __int16 v24 = 2048;
      int64_t v25 = priority;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ OTR for UTunConnection %p, priority %ld", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
}

- (void)classStorageBecameAvailable:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  id v6 = [v5 queueForPriority:self->_priority];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10027579C;
  v8[3] = &unk_10097E440;
  id v9 = v4;
  unsigned int v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (id)_encryptDataWithOTR:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v19 = 0;
  ids_monotonic_time();
  double v9 = v8;
  unsigned int v10 = [(IDSUTunConnection *)self _encryptionController];
  id v11 = [v10 OTREncryptData:v6 OTRToken:v7 priority:self->_priority error:&v19];

  ids_monotonic_time();
  if (v19)
  {
    CFStringRef v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      id v21 = v19;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to encrypt UTunConnection message! Error %ld", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }

    id v11 = 0;
  }
  else
  {
    double v14 = v12 - v9;
    int v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v6 length];
      id v17 = [v11 length];
      *(_DWORD *)buf = 138413058;
      id v21 = v7;
      __int16 v22 = 2048;
      id v23 = v16;
      __int16 v24 = 2048;
      id v25 = v17;
      __int16 v26 = 2048;
      double v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Encrypted message for token %@  original size: %lu  encrypted size: %lu  elapsed: %.6f", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      [v6 length];
      [v11 length];
      _IDSLogV();
    }
  }

  return v11;
}

- (void)_sendOTREncryptedMessage:(id)a3 useEncryption:(BOOL)a4 streamID:(unsigned __int16)a5 forPriority:(int64_t)a6 flag:(int)a7 token:(id)a8
{
  unsigned __int16 v10 = a6;
  uint64_t v11 = a5;
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a8;
  if (([v14 cancelled] & 1) == 0)
  {
    if (self->_shouldUseNWFraming)
    {
      [(IDSSocketPairConnectionProtocol *)self->_socketConnection sendDataMessage:v14 canFragment:1];
      goto LABEL_18;
    }
    BOOL v16 = !self->_useSharedOTRSession;
    uint64_t v17 = [v14 underlyingData];
    id v18 = (void *)v17;
    if (!v16)
    {
      if (!v17) {
        goto LABEL_18;
      }
      id v19 = [v14 context];
      unsigned int v20 = [v19 messageID];

      LODWORD(v31) = v20;
      id v21 = [objc_alloc((Class)IDSSocketPairOTRMessage) initWithVersion:1 encrypted:0 shouldEncrypt:v12 protectionClass:a7 streamID:v11 priority:v10 sequenceNumber:v31 data:v18];
      __int16 v22 = [v14 topic];
      [v21 setTopic:v22];

      id v23 = [v14 context];
      [v21 setContext:v23];

      [(IDSSocketPairConnectionProtocol *)self->_socketConnection sendDataMessage:v21 canFragment:1];
LABEL_17:

      goto LABEL_18;
    }
    if (v12)
    {
      uint64_t v24 = [(IDSUTunConnection *)self _encryptDataWithOTR:v17 token:v15];

      id v18 = (void *)v24;
    }
    if (v18)
    {
      id v25 = [v14 context];
      id v26 = [v25 messageID];

      double v27 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v35 = v15;
        __int16 v36 = 1024;
        BOOL v37 = v12;
        __int16 v38 = 1024;
        int v39 = (int)v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Send OTR message for %{public}@ E:%u SN:%u.", buf, 0x18u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          BOOL v32 = v12;
          id v33 = v26;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            BOOL v32 = v12;
            id v33 = v26;
            _IDSLogV();
          }
        }
      }
      id v28 = objc_msgSend(objc_alloc((Class)IDSSocketPairOTREncryptedMessage), "initWithVersion:encrypted:streamID:priority:sequenceNumber:fileXfer:data:", 1, v12, v11, v10, v26, a7 != 0, v18, v32, v33);
      id v29 = [v14 topic];
      [v28 setTopic:v29];

      unsigned int v30 = [v14 context];
      [v28 setContext:v30];

      [(IDSSocketPairConnectionProtocol *)self->_socketConnection sendDataMessage:v28 canFragment:1];
      goto LABEL_17;
    }
  }
LABEL_18:
}

- (void)_sendOTREncryptionQueue:(id)a3 streamID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v7 assertRunningWithPriority:self->_priority];

  id v18 = [v6 componentsSeparatedByString:@"-"];
  if ((unint64_t)[v18 count] > 2)
  {
    double v9 = [v18 objectAtIndex:1];
    signed int v10 = [v9 intValue];

    uint64_t v11 = [v18 objectAtIndex:2];
    id v12 = [v11 intValue];

    BOOL v13 = v4 != 43258 && self->_enableOTR;
    id v14 = [(NSMutableDictionary *)self->_tokenToOTREncryptionQueue objectForKey:v6];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v20;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v14);
          }
          [(IDSUTunConnection *)self _sendOTREncryptedMessage:*(void *)(*((void *)&v19 + 1) + 8 * i) useEncryption:v13 streamID:v4 forPriority:v10 flag:v12 token:v6];
        }
        id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
    [v14 removeAllObjects];
  }
  else
  {
    double v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "_sendOTREncryptionQueue: invalid OTR token %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)_sendPublicKeyEncryptedMessage:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_shouldUseNWFraming)
  {
    [(IDSSocketPairConnectionProtocol *)self->_socketConnection sendDataMessage:v4 canFragment:1];
  }
  else
  {
    id v6 = [v4 underlyingData];
    id v7 = [(IDSUTunConnection *)self _encryptionController];
    uniqueID = self->_uniqueID;
    int64_t priority = self->_priority;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002765D0;
    v11[3] = &unk_100987528;
    v11[4] = self;
    id v12 = v6;
    id v13 = v5;
    id v10 = v6;
    [v7 legacyPublicKeyEncryptData:v10 withEncryptedAttributes:0 toDeviceID:uniqueID priority:priority completionBlock:v11];
  }
}

- (void)_sendEncryptedMessage:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  if (v4)
  {
    if ([(IDSUTunConnection *)self _isMagnetConnection])
    {
      id v6 = [v4 context];
      uint64_t v7 = [v6 topic];

      double v8 = [v4 context];
      int64_t priority = (int64_t)[v8 priority];

      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      BOOL v11 = (v7 | priority) != 0;
      if (!(v7 | priority))
      {
        int64_t priority = self->_priority;
        uint64_t v7 = @"com.apple.private.alloy.utunconnection";
      }
      if (self->_useSharedOTRSession)
      {
        id v12 = +[IDSDServiceController sharedInstance];
        id v13 = [v12 serviceWithPushTopic:v7];
        id v14 = [v13 dataProtectionClass];

        if (self->_useNamedOTRSessionToken)
        {
          id v15 = self->_otrTokenIdentifier;
          uint64_t v16 = +[NSString stringWithFormat:@"%@-%u-%1u-%@", @"idsotr", priority, v14, v15];

          goto LABEL_12;
        }
        uint64_t v17 = +[NSString stringWithFormat:@"%@-%u-%1u", @"idsotr", priority, v14];
      }
      else
      {
        uint64_t v17 = +[NSString stringWithFormat:@"%@-%u-%1u", v7, priority, isKindOfClass & 1];
      }
      uint64_t v16 = (void *)v17;
LABEL_12:
      id v18 = [(IDSUTunConnection *)self _UTunDeliveryController];
      long long v19 = [v18 hashForString:v7];
      unsigned __int16 v20 = (unsigned __int16)[v19 unsignedIntValue];

      if (!v11)
      {
        [(IDSUTunConnection *)self _sendOTREncryptedMessage:v4 useEncryption:0 streamID:v20 forPriority:priority flag:0 token:v16];
LABEL_33:

        goto LABEL_34;
      }
      tokenToOTREncryptionQueue = self->_tokenToOTREncryptionQueue;
      if (!tokenToOTREncryptionQueue)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        id v23 = self->_tokenToOTREncryptionQueue;
        self->_tokenToOTREncryptionQueue = Mutable;

        tokenToOTREncryptionQueue = self->_tokenToOTREncryptionQueue;
      }
      uint64_t v24 = [(NSMutableDictionary *)tokenToOTREncryptionQueue objectForKey:v16];
      id v25 = v24;
      if (v24)
      {
        [v24 addObject:v4];
      }
      else
      {
        id v25 = objc_alloc_init((Class)NSMutableArray);
        [v25 addObject:v4];
        [(NSMutableDictionary *)self->_tokenToOTREncryptionQueue setObject:v25 forKey:v16];
      }
      if (self->_enableOTR)
      {
        id v26 = +[IDSOTRController sharedInstance];
        unsigned __int8 v27 = [v26 isSessionReady:v16];

        if ((v27 & 1) == 0 && v20 != 43258)
        {
          id v28 = [(NSMutableDictionary *)self->_tokenToOTRError objectForKey:v16];
          unsigned __int8 v29 = [v28 BOOLValue];

          if (v29)
          {
            unsigned int v30 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v44[0] = v16;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "OTR session negotiation for %@ is in progress", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  _IDSLogV();
                }
              }
            }
          }
          else
          {
            tokenToOTRError = self->_tokenToOTRError;
            id v35 = +[NSNumber numberWithBool:1];
            [(NSMutableDictionary *)tokenToOTRError setObject:v35 forKey:v16];

            __int16 v36 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109378;
              LODWORD(v44[0]) = v20;
              WORD2(v44[0]) = 2112;
              *(void *)((char *)v44 + 6) = v16;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Waiting OTR session for %04x(%@) ...", buf, 0x12u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              uint64_t v39 = v20;
              long long v40 = v16;
              _IDSLogV();
            }
            BOOL v37 = +[IDSOTRController sharedInstance];
            uint64_t v38 = IDSDeviceDefaultPairedDeviceUniqueID;
            v41[0] = _NSConcreteStackBlock;
            v41[1] = 3221225472;
            v41[2] = sub_100277060;
            v41[3] = &unk_100987550;
            v41[4] = self;
            id v42 = v4;
            [v37 startOTRNegotiationWithDeviceIfNeeded:v38 token:v16 reset:0 errorHandler:v41];
          }
          goto LABEL_32;
        }
        BOOL v32 = self;
        id v33 = v16;
        uint64_t v31 = v20;
      }
      else
      {
        uint64_t v31 = v20;
        BOOL v32 = self;
        id v33 = v16;
      }
      [(IDSUTunConnection *)v32 _sendOTREncryptionQueue:v33 streamID:v31];
LABEL_32:

      goto LABEL_33;
    }
    [(IDSUTunConnection *)self _sendPublicKeyEncryptedMessage:v4];
  }
LABEL_34:
}

- (BOOL)_storeIncomingClassCDataMessageIfNeeded:(id)a3 topic:(id)a4 sequenceNumber:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  double v9 = (NSMutableDictionary *)a4;
  id v10 = +[IDSOTRKeyStorage sharedInstance];
  [v10 lock];

  BOOL v11 = +[IDSOTRKeyStorage sharedInstance];
  unsigned __int8 v12 = [v11 isSessionStoreAvailableForDataProtectionClass:0];

  id v13 = IDSDataProtectionClassStringFromDataProtectionClass();
  id v14 = [(NSMutableDictionary *)self->_dataProtectedIncomingMessages objectForKey:v13];
  id v15 = v14;
  if (v14) {
    unsigned __int8 v16 = 0;
  }
  else {
    unsigned __int8 v16 = v12;
  }
  if (v16)
  {
    id v15 = 0;
  }
  else if ([v14 containsObject:v8])
  {
    long long v19 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v9;
      __int16 v29 = 1024;
      int v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Session key store is not available for class C, but %@ message (%u) is already stored.", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v25 = v9;
        uint64_t v26 = v5;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v25 = v9;
          uint64_t v26 = v5;
          _IDSLogV();
        }
      }
    }
  }
  else
  {
    unsigned __int16 v20 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v9;
      __int16 v29 = 1024;
      int v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Session key store is not available for class C, holding on to %@ message (%u)", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v25 = v9;
        uint64_t v26 = v5;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v25 = v9;
          uint64_t v26 = v5;
          _IDSLogV();
        }
      }
    }
    if (!self->_dataProtectedIncomingMessages)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      dataProtectedIncomingMessages = self->_dataProtectedIncomingMessages;
      self->_dataProtectedIncomingMessages = Mutable;
    }
    if (!v15) {
      id v15 = objc_alloc_init((Class)NSMutableArray);
    }
    objc_msgSend(v15, "addObject:", v8, v25, v26);
    [(NSMutableDictionary *)self->_dataProtectedIncomingMessages setObject:v15 forKey:v13];
    id v23 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = self->_dataProtectedIncomingMessages;
      *(_DWORD *)buf = 138412290;
      id v28 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Current pending messages %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v25 = self->_dataProtectedIncomingMessages;
      _IDSLogV();
    }
  }
  uint64_t v17 = +[IDSOTRKeyStorage sharedInstance];
  [v17 unlock];

  return v16 ^ 1;
}

- (BOOL)_storeIncomingClassADataMesageIfNeeded:(id)a3 topic:(id)a4 sequenceNumber:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  double v9 = (NSMutableDictionary *)a4;
  id v10 = +[IDSOTRKeyStorage sharedInstance];
  [v10 lock];

  BOOL v11 = +[IDSOTRKeyStorage sharedInstance];
  unsigned int v12 = [v11 isUnderLock];

  id v13 = IDSDataProtectionClassStringFromDataProtectionClass();
  id v14 = [(NSMutableDictionary *)self->_dataProtectedIncomingMessages objectForKey:v13];
  id v15 = v14;
  if (v14) {
    unsigned int v12 = 1;
  }
  if (v12 == 1)
  {
    if ([v14 containsObject:v8])
    {
      unsigned __int8 v16 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        unsigned __int8 v27 = v9;
        __int16 v28 = 1024;
        int v29 = v5;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Session key store is not available for class A, but %@ message (%u) is already stored.", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v24 = v9;
          uint64_t v25 = v5;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            uint64_t v24 = v9;
            uint64_t v25 = v5;
            _IDSLogV();
          }
        }
      }
    }
    else
    {
      long long v19 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        unsigned __int8 v27 = v9;
        __int16 v28 = 1024;
        int v29 = v5;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Session key store is not available for class A, holding on to %@ message (%u)", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v24 = v9;
          uint64_t v25 = v5;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            uint64_t v24 = v9;
            uint64_t v25 = v5;
            _IDSLogV();
          }
        }
      }
      if (!self->_dataProtectedIncomingMessages)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        dataProtectedIncomingMessages = self->_dataProtectedIncomingMessages;
        self->_dataProtectedIncomingMessages = Mutable;
      }
      if (!v15) {
        id v15 = objc_alloc_init((Class)NSMutableArray);
      }
      objc_msgSend(v15, "addObject:", v8, v24, v25);
      [(NSMutableDictionary *)self->_dataProtectedIncomingMessages setObject:v15 forKey:v13];
      long long v22 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = self->_dataProtectedIncomingMessages;
        *(_DWORD *)buf = 138412290;
        unsigned __int8 v27 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Current pending messages %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        uint64_t v24 = self->_dataProtectedIncomingMessages;
        _IDSLogV();
      }
    }
  }
  else
  {
    id v15 = 0;
  }
  uint64_t v17 = +[IDSOTRKeyStorage sharedInstance];
  [v17 unlock];

  return v12;
}

- (void)_handleOTRDecryptionSuccess:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  tokenToOTRError = self->_tokenToOTRError;
  if (!tokenToOTRError)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v8 = self->_tokenToOTRError;
    self->_tokenToOTRError = Mutable;

    tokenToOTRError = self->_tokenToOTRError;
  }
  double v9 = [(NSMutableDictionary *)tokenToOTRError objectForKey:v4];
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    BOOL v11 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Clear OTR error map for %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v14 = v4;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v14 = v4;
          _IDSLogV();
        }
      }
    }
    unsigned int v12 = self->_tokenToOTRError;
    id v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0, v14);
    [(NSMutableDictionary *)v12 setObject:v13 forKey:v4];
  }
}

- (void)_handleOTRDecryptionError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  tokenToOTRError = self->_tokenToOTRError;
  if (!tokenToOTRError)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v8 = self->_tokenToOTRError;
    self->_tokenToOTRError = Mutable;

    tokenToOTRError = self->_tokenToOTRError;
  }
  double v9 = [(NSMutableDictionary *)tokenToOTRError objectForKey:v4];
  unsigned __int8 v10 = [v9 BOOLValue];

  if (v10)
  {
    BOOL v11 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "OTR session for %@ is in error state, skip negotiation.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v22 = v4;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v22 = v4;
          _IDSLogV();
        }
      }
    }
  }
  else
  {
    unsigned int v12 = self->_tokenToOTRError;
    id v13 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)v12 setObject:v13 forKey:v4];

    id v14 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Set OTR error map for %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v22 = v4;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v22 = v4;
          _IDSLogV();
        }
      }
    }
    id v15 = +[IDSOTRController sharedInstance];
    [v15 startOTRNegotiationWithDeviceIfNeeded:IDSDeviceDefaultPairedDeviceUniqueID token:v4 reset:1 errorHandler:0];
  }
  id v16 = objc_msgSend(v4, "componentsSeparatedByString:", @"-", v22);
  if ((unint64_t)[v16 count] > 2)
  {
    id v18 = [v16 objectAtIndex:0];
    long long v19 = [v16 objectAtIndex:2];
    id v20 = [v19 intValue];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v21 = self->_socketConnection;
    }
    else {
      long long v21 = 0;
    }
    if ([v18 isEqualToString:@"idsotr"]) {
      [(IDSSocketPairConnectionProtocol *)v21 removePendingMessagesForProtectionClass:v20];
    }
  }
  else
  {
    uint64_t v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "_handleOTRDecryptionError: invalid OTR token %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (id)_decryptOTREncrtypedMessage:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 command];
  unsigned int v6 = v5;
  if (v5 - 25 > 0xFFFFFFFD)
  {
    if (v5 == 23 && self->_useSharedOTRSession)
    {
      double v9 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)unint64_t v59 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "*** Recv old OTREncryptedMessage but remote device asserts useSharedOTRSession message %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        id v45 = v4;
        _IDSLogTransport();
      }
    }
    else if (v5 != 23)
    {
      id v10 = [v4 encrypted];
      unsigned int v11 = [v4 versionNumber];
      id v12 = [v4 streamID];
      unsigned int v13 = [v4 priority];
      id v52 = [v4 sequenceNumber];
      id v14 = [v4 protectionClass];
LABEL_16:
      id v15 = [(IDSUTunConnection *)self _UTunDeliveryController];
      id v16 = [v15 topicForStreamID:v12];

      if (self->_supportDynamicServices || self->_useSharedOTRSession)
      {
LABEL_18:
        if (v6 == 23)
        {
          long long v19 = +[IDSDServiceController sharedInstance];
          id v20 = [v19 serviceWithPushTopic:v16];
          LODWORD(v14) = [v20 dataProtectionClass];

          id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-%u-%1u", v16, v13, [v4 fileXfer]);
          long long v21 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            *(void *)unint64_t v59 = v18;
            *(_WORD *)&v59[8] = 1024;
            *(_DWORD *)unsigned int v60 = v10;
            *(_WORD *)&v60[4] = 1024;
            *(_DWORD *)&v60[6] = v52;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Recv OTR message for %{public}@ E:%u SN:%u.", buf, 0x18u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              id v49 = v52;
              id v45 = v18;
              unint64_t v47 = v10;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                unint64_t v47 = (unint64_t)v10;
                id v49 = v52;
                id v45 = v18;
                _IDSLogV();
              }
            }
          }
        }
        else if (self->_useSharedOTRSession)
        {
          if (!self->_useNamedOTRSessionToken)
          {
            id v18 = +[NSString stringWithFormat:@"%@-%u-%1u", @"idsotr", v13, v14];
            if (v10)
            {
LABEL_30:
              if (!v14
                && [(IDSUTunConnection *)self _storeIncomingClassCDataMessageIfNeeded:v4 topic:v16 sequenceNumber:v52])
              {
                id v22 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)unint64_t v59 = v18;
                  *(_WORD *)&v59[8] = 1024;
                  *(_DWORD *)unsigned int v60 = v52;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Stored class C OTR message for %@, sequneceNumber:%u.", buf, 0x12u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    _IDSLogTransport();
                    if (_IDSShouldLog()) {
                      _IDSLogV();
                    }
                  }
                }
LABEL_87:
                id v8 = 0;
                goto LABEL_77;
              }
              id v23 = +[IDSOTRController sharedInstance];
              unsigned __int8 v24 = [v23 isSessionReady:v18];
              if (v12 == 43258) {
                char v25 = 1;
              }
              else {
                char v25 = v24;
              }

              if ((v25 & 1) != 0
                || (+[IDSOTRController sharedInstance],
                    uint64_t v26 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v27 = [v26 hasMessagableOTRSessionForToken:v18],
                    v26,
                    v27))
              {
                uint64_t v57 = 0;
                __int16 v28 = [v4 data];
                ids_monotonic_time();
                double v30 = v29;
                uint64_t v31 = [(IDSUTunConnection *)self _encryptionController];
                BOOL v32 = [v31 OTRDecryptData:v28 OTRToken:v18 priority:v13 error:&v57];

                ids_monotonic_time();
                if (!v57)
                {
                  double v34 = v33 - v30;
                  id v35 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                  {
                    id v36 = [v28 length];
                    id v37 = [v32 length];
                    *(_DWORD *)buf = 138413058;
                    *(void *)unint64_t v59 = v18;
                    *(_WORD *)&v59[8] = 2048;
                    *(void *)unsigned int v60 = v36;
                    *(_WORD *)&v60[8] = 2048;
                    *(void *)&v60[10] = v37;
                    __int16 v61 = 2048;
                    double v62 = v34;
                    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Decrypted message for %@  original size: %lu  unencrypted size: %lu  elapsed: %.6f", buf, 0x2Au);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    double v51 = v34;
                    id v48 = [v28 length];
                    id v50 = [v32 length];
                    id v46 = v18;
                    _IDSLogV();
                  }
                  if ((v25 & 1) == 0)
                  {
                    uint64_t v38 = +[IDSOTRController sharedInstance];
                    [v38 setSessionReady:v18];
                  }
                  uint64_t v39 = +[IDSDaemonPriorityQueueController sharedInstance];
                  v55[0] = _NSConcreteStackBlock;
                  v55[1] = 3221225472;
                  v55[2] = sub_100278CF8;
                  v55[3] = &unk_10097E440;
                  v55[4] = self;
                  id v56 = v18;
                  [v39 performBlockWithPriority:v55 priority:self->_priority];

                  goto LABEL_76;
                }
              }
              else
              {
                long long v40 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)unint64_t v59 = v18;
                  _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "*** OTR session for %@ is not ready.", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    id v46 = v18;
                    _IDSLogTransport();
                    if (_IDSShouldLog())
                    {
                      id v46 = v18;
                      _IDSLogV();
                    }
                  }
                }
                if (v14 == 1
                  && [(IDSUTunConnection *)self _storeIncomingClassADataMesageIfNeeded:v4 topic:v16 sequenceNumber:v52])
                {
                  long long v41 = OSLogHandleForTransportCategory();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)unint64_t v59 = v18;
                    *(_WORD *)&v59[8] = 1024;
                    *(_DWORD *)unsigned int v60 = v52;
                    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Stored class A OTR message for %@ sequenceNumber:%u, ignore decryption failure.", buf, 0x12u);
                  }

                  if (os_log_shim_legacy_logging_enabled())
                  {
                    if (_IDSShouldLogTransport())
                    {
                      _IDSLogTransport();
                      if (_IDSShouldLog()) {
                        _IDSLogV();
                      }
                    }
                  }
                  BOOL v32 = 0;
                  goto LABEL_76;
                }
                BOOL v32 = 0;
              }
              id v42 = +[IDSDaemonPriorityQueueController sharedInstance];
              v53[0] = _NSConcreteStackBlock;
              v53[1] = 3221225472;
              v53[2] = sub_100278D04;
              v53[3] = &unk_10097E440;
              v53[4] = self;
              id v54 = v18;
              [v42 performBlockWithPriority:v53 priority:self->_priority];

LABEL_76:
              id v8 = v32;
LABEL_77:

              goto LABEL_78;
            }
LABEL_50:
            BOOL v32 = objc_msgSend(v4, "data", v45, v47, v49);
            goto LABEL_76;
          }
          uint64_t v17 = self->_otrTokenIdentifier;
          id v18 = +[NSString stringWithFormat:@"%@-%u-%1u-%@", @"idsotr", v13, v14, v17];
        }
        else
        {
          id v18 = 0;
        }
        if (v10) {
          goto LABEL_30;
        }
        goto LABEL_50;
      }
      if (v16 || v12 != 43258)
      {
        if (v16) {
          goto LABEL_18;
        }
      }
      else if (self->_priority == v13)
      {
        id v16 = @"com.apple.private.alloy.utunconnection";
        goto LABEL_18;
      }
      unsigned int v44 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110144;
        *(_DWORD *)unint64_t v59 = v6;
        *(_WORD *)&v59[4] = 1024;
        *(_DWORD *)&v59[6] = v52;
        *(_WORD *)unsigned int v60 = 1024;
        *(_DWORD *)&v60[2] = v12;
        *(_WORD *)&v60[6] = 1024;
        *(_DWORD *)&v60[8] = v11;
        *(_WORD *)&v60[12] = 1024;
        *(_DWORD *)&v60[14] = v13;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "*** Recv OTR message with unknown topic, command:%d, sequenceNumber:%u, streamID:%04x, version:%u, priority:%d", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
      id v16 = 0;
      id v18 = 0;
      goto LABEL_87;
    }
    unsigned int v11 = objc_msgSend(v4, "versionNumber", v45);
    id v10 = [v4 encrypted];
    id v12 = [v4 streamID];
    unsigned int v13 = [v4 priority];
    id v52 = [v4 sequenceNumber];
    id v14 = 0;
    goto LABEL_16;
  }
  uint64_t v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)unint64_t v59 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Attempt to decrypt invalid message type %u.", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    _IDSWarnV();
    _IDSLogV();
    _IDSLogTransport();
  }
  id v8 = 0;
LABEL_78:

  return v8;
}

- (void)_decryptPublicKeyEncryptedMessage:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 data];
  id v8 = [(IDSUTunConnection *)self _encryptionController];
  uniqueID = self->_uniqueID;
  int64_t priority = self->_priority;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100278E0C;
  v13[3] = &unk_100987578;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  [v8 legacyPublicKeyDecryptData:v12 toDeviceID:uniqueID priority:priority completionBlock:v13];
}

- (void)_optionallyDecryptMessage:(id)a3 completionBlock:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void *))a4;
  uint64_t v7 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v7 assertRunningWithPriority:self->_priority];

  unsigned int v8 = [v11 command];
  unsigned int v9 = v8;
  if (v8 == 23 || v8 == 5)
  {
    if ([(IDSUTunConnection *)self _isMagnetConnection])
    {
      if (v9 == 5) {
        [v11 data];
      }
      else {
      id v10 = [(IDSUTunConnection *)self _decryptOTREncrtypedMessage:v11];
      }
      v6[2](v6, v10);
    }
    else
    {
      [(IDSUTunConnection *)self _decryptPublicKeyEncryptedMessage:v11 completionBlock:v6];
    }
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (BOOL)_messageHasValidEncryptionStatus:(id)a3
{
  unsigned int v3 = [a3 command];
  return v3 == 23 || (v3 & 0xFE) == 4;
}

- (void)dropDisallowedMessages
{
  unsigned int v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:self->_priority];

  [(IDSUTunConnection *)self _flushMessagesAll:0 response:20];
}

- (void)flushAllMessagesForReason:(int64_t)a3
{
  unsigned int v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  if (a3) {
    int64_t v6 = a3;
  }
  else {
    int64_t v6 = 14;
  }

  [(IDSUTunConnection *)self _flushMessagesAll:1 response:v6];
}

- (void)_flushMessagesAll:(BOOL)a3 response:(int64_t)a4
{
  unsigned int v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  int64_t v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v79 = kIDSDefaultPairedDeviceID;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Flush all messages for peer %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v46 = kIDSDefaultPairedDeviceID;
    _IDSLogV();
  }
  id v7 = [(NSMutableArray *)self->_sendingMessages _copyForEnumerating];
  id v48 = objc_alloc_init((Class)NSMutableIndexSet);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v7;
  id v50 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (v50)
  {
    uint64_t v53 = 0;
    uint64_t v49 = *(void *)v73;
    do
    {
      for (i = 0; i != v50; i = (char *)i + 1)
      {
        if (*(void *)v73 != v49) {
          objc_enumerationMutation(obj);
        }
        unsigned int v9 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        id v10 = [v9 context];
        id v11 = v10;
        if (a3
          || ([v10 topic],
              id v12 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v13 = [(IDSUTunConnection *)self _messageIsAllowedToSendMessageOnTopic:v12], v12, (v13 & 1) == 0))
        {
          if ([(IDSUTunConnection *)self _shouldAWDLogMessage:v11])
          {
            id v14 = objc_alloc((Class)IDSLocalMessageDeliveryConnectionResetMetric);
            id v15 = [v11 awdTopic];
            id v16 = objc_msgSend(v14, "initWithService:isToDefaultPairedDevice:messageSize:linkType:deliveryError:RTT:priority:", v15, -[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"), objc_msgSend(v11, "sentMessageDataSize"), -[IDSUTunConnection _currentLink](self, "_currentLink"), 102, 0, objc_msgSend(v11, "priority"));

            uint64_t v17 = +[IDSCoreAnalyticsLogger defaultLogger];
            [v17 logMetric:v16];

            id v18 = +[IDSAWDLogging sharedInstance];
            long long v19 = [v11 awdTopic];
            objc_msgSend(v18, "messageDeliveredForService:isToDefaultPairedDevice:messageSize:linkType:deliveryError:RTT:priority:", v19, -[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"), objc_msgSend(v11, "sentMessageDataSize"), -[IDSUTunConnection _currentLink](self, "_currentLink"), 102, 0, objc_msgSend(v11, "priority"));
          }
          [(IDSUTunConnection *)self _removeMessageFromStatistics:v11];
          if (a4 == 31
            || ([v11 completionBlock], (id v20 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            id v25 = 0;
          }
          else
          {
            long long v21 = [v11 toDeviceID];
            id v22 = [(NSString *)self->_cbuuid copy];
            double rtt = self->_rtt;
            unsigned __int8 v24 = +[IDSDaemonPriorityQueueController sharedInstance];
            v65[0] = _NSConcreteStackBlock;
            v65[1] = 3221225472;
            v65[2] = sub_100279C48;
            v65[3] = &unk_1009875A0;
            int64_t v70 = a4;
            id v66 = v22;
            id v67 = v21;
            double v71 = rtt;
            id v68 = v11;
            id v25 = v20;
            id v69 = v25;
            id v26 = v21;
            id v27 = v22;
            [v24 performBlockMainQueue:v65];
          }
          [(IDSLocalDeliveryQueue *)self->_deliveryQueue dequeueMessage:v11];
          [v9 setContext:0];
          [v9 setCancelled:1];
          [v48 addIndex:v53];

          ++v53;
        }
      }
      id v50 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
    }
    while (v50);
  }

  [(NSMutableArray *)self->_sendingMessages removeObjectsAtIndexes:v48];
  __int16 v28 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue messages];
  id v29 = [v28 _copyForEnumerating];

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v30 = v29;
  id v31 = [v30 countByEnumeratingWithState:&v61 objects:v76 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v62;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v62 != v32) {
          objc_enumerationMutation(v30);
        }
        double v34 = *(void **)(*((void *)&v61 + 1) + 8 * (void)j);
        if (!a3)
        {
          id v35 = [*(id *)(*((void *)&v61 + 1) + 8 * (void)j) topic];
          unsigned __int8 v36 = [(IDSUTunConnection *)self _messageIsAllowedToSendMessageOnTopic:v35];

          if (v36) {
            continue;
          }
        }
        [(IDSUTunConnection *)self _removeMessageFromStatistics:v34];
        if (a4 == 31)
        {
          id v37 = 0;
        }
        else
        {
          id v37 = [v34 completionBlock];
          if (v37)
          {
            uint64_t v38 = [v34 toDeviceID];
            id v39 = [(NSString *)self->_cbuuid copy];
            double v40 = self->_rtt;
            long long v41 = +[IDSDaemonPriorityQueueController sharedInstance];
            v54[0] = _NSConcreteStackBlock;
            v54[1] = 3221225472;
            v54[2] = sub_100279D64;
            v54[3] = &unk_1009875A0;
            double v60 = v40;
            id v55 = v38;
            id v56 = v39;
            int64_t v59 = a4;
            uint64_t v57 = v34;
            id v37 = v37;
            id v58 = v37;
            id v42 = v39;
            id v43 = v38;
            [v41 performBlockMainQueue:v54];
          }
        }
        [v34 setUnderlyingSocketPairMessage:0];
        [(IDSLocalDeliveryQueue *)self->_deliveryQueue dequeueMessage:v34];
      }
      id v31 = [v30 countByEnumeratingWithState:&v61 objects:v76 count:16];
    }
    while (v31);
  }

  fallbackMessages = self->_fallbackMessages;
  self->_fallbackMessages = 0;

  tokenToOTREncryptionQueue = self->_tokenToOTREncryptionQueue;
  self->_tokenToOTREncryptionQueue = 0;
}

- (int64_t)_socketToNiceCommand:(unsigned __int8)a3
{
  if (a3 > 0x34u) {
    return -1;
  }
  else {
    return qword_100794620[(char)a3];
  }
}

- (void)sendAckForMessageWithSequenceNumber:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [objc_alloc((Class)IDSSocketPairAckMessage) initWithSequenceNumber:*(void *)&a3];
  [(IDSUTunConnection *)self setEnabled:1];
  int64_t v6 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = v5;
    __int16 v11 = 1024;
    int v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Broadcast: Sending ack %@ for received sequence number %d", buf, 0x12u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v7 = v5;
    uint64_t v8 = v3;
    _IDSLogTransport();
  }
  -[IDSUTunConnection _sendSocketMessage:ignoreSequenceNumber:](self, "_sendSocketMessage:ignoreSequenceNumber:", v5, 1, v7, v8);
}

- (void)_sendAckForMessage:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10027A0A0;
  v6[3] = &unk_100983148;
  v6[4] = self;
  [(IDSUTunConnection *)self _processMessage:v4 withSequenceNumberBlock:v6];
}

- (void)_sendExpiredAckForMessage:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10027A164;
  v6[3] = &unk_100983148;
  v6[4] = self;
  [(IDSUTunConnection *)self _processMessage:v4 withSequenceNumberBlock:v6];
}

- (void)_processMessage:(id)a3 withSequenceNumberBlock:(id)a4
{
  id v6 = a3;
  id v5 = (void (**)(id, id))a4;
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    v5[2](v5, [v6 sequenceNumber]);
  }
}

- (unint64_t)_currentLink
{
  uint64_t v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:self->_priority];

  if (![(IDSUTunConnection *)self isConnected]) {
    return 0;
  }
  if ([(IDSUTunConnection *)self _isMagnetConnection])
  {
    id v4 = +[IDSUTunController sharedInstance];
    id v5 = [v4 linkManager];
    id v6 = (char *)[v5 currentDefaultDeviceLinkType];

    if ((unint64_t)(v6 - 1) <= 3) {
      return qword_1007947C8[(void)(v6 - 1)];
    }
    return 0;
  }
  return 3;
}

- (void)_noteReceivedResourceTransferUUID:(id)a3
{
  id v4 = a3;
  receivedResourceTransferUUIDs = self->_receivedResourceTransferUUIDs;
  if (!receivedResourceTransferUUIDs)
  {
    id v6 = +[NSMutableSet set];
    id v7 = +[NSMutableSet set];
    uint64_t v8 = +[IMPair pairWithFirst:v6 second:v7];
    unsigned int v9 = self->_receivedResourceTransferUUIDs;
    self->_receivedResourceTransferUUIDs = v8;

    receivedResourceTransferUUIDs = self->_receivedResourceTransferUUIDs;
  }
  id v10 = [(IMPair *)receivedResourceTransferUUIDs first];
  __int16 v11 = [(IMPair *)self->_receivedResourceTransferUUIDs second];
  if (([v10 containsObject:v4] & 1) != 0
    || ([v11 containsObject:v4] & 1) != 0)
  {
    goto LABEL_12;
  }
  id v12 = [v10 count];
  unsigned __int8 v13 = +[IDSFoundationLog UTunConnection];
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if ((unint64_t)v12 < 0x64)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received UUID list adding message UUID %@", buf, 0xCu);
    }

    [v10 addObject:v4];
LABEL_12:
    id v15 = v10;
    id v10 = v11;
    goto LABEL_13;
  }
  if (v14)
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v4;
    __int16 v20 = 2112;
    long long v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received UUID list adding message UUID %@, purging old UUIDs %@", buf, 0x16u);
  }

  id v15 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", v4, 0);
  id v16 = +[IMPair pairWithFirst:v15 second:v10];
  uint64_t v17 = self->_receivedResourceTransferUUIDs;
  self->_receivedResourceTransferUUIDs = v16;

LABEL_13:
}

- (BOOL)_resourceTransferUUIDAlreaadyReceived:(id)a3
{
  id v4 = a3;
  id v5 = [(IMPair *)self->_receivedResourceTransferUUIDs first];
  if ([v5 containsObject:v4])
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    id v7 = [(IMPair *)self->_receivedResourceTransferUUIDs second];
    unsigned __int8 v6 = [v7 containsObject:v4];
  }
  return v6;
}

- (void)_processIncomingResourceTransferMessage:(id)a3 messageUUID:(id)a4 streamID:(unsigned __int16)a5 topic:(id)a6 wantsAppAck:(BOOL)a7 expectsPeerResponse:(BOOL)a8 peerResponseIdentifier:(id)a9 isDefaultPairedDevice:(BOOL)a10 didWakeHint:(BOOL)a11
{
  uint64_t v14 = a5;
  id v17 = a3;
  id v18 = a4;
  id v139 = a6;
  unint64_t v137 = v17;
  id v138 = a9;
  if (v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v134 = a7;
      id v19 = v17;
      v136 = v19;
      if (self->_resumeResourceTransfers)
      {
        __int16 v20 = v19;
        switch([v19 type])
        {
          case 0u:
            BOOL v133 = a8;
            long long v21 = [(NSMutableDictionary *)self->_incomingResourceTransfers objectForKey:v18];
            id v22 = v21;
            if (!v21)
            {
              if (([(NSMutableSet *)self->_resettingIncomingResourceTransfers containsObject:v18] & 1) == 0)
              {
                id v48 = +[IDSSocketPairResourceTransferMessage resumeMessageWithSequenceNumber:0 streamID:v14 messageUUID:v18 nextByteOffset:0];
                uint64_t v49 = v48;
                if (self->_supportDynamicServices)
                {
                  if (self->_supportDynamicServicesOptimization) {
                    [v48 setStreamID:1];
                  }
                  else {
                    [v48 setTopic:v139];
                  }
                }
                [(IDSUTunConnection *)self _sendSocketMessage:v49 ignoreSequenceNumber:1];
                resettingIncomingResourceTransfers = self->_resettingIncomingResourceTransfers;
                if (!resettingIncomingResourceTransfers)
                {
                  v99 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
                  v100 = self->_resettingIncomingResourceTransfers;
                  self->_resettingIncomingResourceTransfers = v99;

                  resettingIncomingResourceTransfers = self->_resettingIncomingResourceTransfers;
                }
                [(NSMutableSet *)resettingIncomingResourceTransfers addObject:v18];
                v101 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v18;
                  _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "IDSSocketPairCommandResourceTransferMessage cannot find receiver for message %@ - asking sender to reset", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    _IDSLogTransport();
                    if (_IDSShouldLog()) {
                      _IDSLogV();
                    }
                  }
                }
              }
              goto LABEL_161;
            }
            unsigned int v23 = [v21 appendMessage:v136 receiverError:0];
            resumingIncomingResourceTransfers = self->_resumingIncomingResourceTransfers;
            if (v23)
            {
              [(NSMutableSet *)resumingIncomingResourceTransfers removeObject:v18];
              if (![(NSMutableSet *)self->_resumingIncomingResourceTransfers count])
              {
                id v25 = self->_resumingIncomingResourceTransfers;
                self->_resumingIncomingResourceTransfers = 0;
              }
              goto LABEL_172;
            }
            if (([(NSMutableSet *)resumingIncomingResourceTransfers containsObject:v18] & 1) == 0)
            {
              long long v63 = +[IDSSocketPairResourceTransferMessage resumeMessageWithSequenceNumber:streamID:messageUUID:nextByteOffset:](IDSSocketPairResourceTransferMessage, "resumeMessageWithSequenceNumber:streamID:messageUUID:nextByteOffset:", 0, v14, v18, [v22 totalBytesReceived]);
              long long v64 = v63;
              if (self->_supportDynamicServices)
              {
                if (self->_supportDynamicServicesOptimization) {
                  [v63 setStreamID:1];
                }
                else {
                  [v63 setTopic:v139];
                }
              }
              [(IDSUTunConnection *)self _sendSocketMessage:v64 ignoreSequenceNumber:1];
              v120 = self->_resumingIncomingResourceTransfers;
              if (!v120)
              {
                id v121 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
                v122 = self->_resumingIncomingResourceTransfers;
                self->_resumingIncomingResourceTransfers = v121;

                v120 = self->_resumingIncomingResourceTransfers;
              }
              [(NSMutableSet *)v120 addObject:v18];
              id v123 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v18;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = [v136 byteOffset];
                *(_WORD *)&buf[22] = 2048;
                v183 = (uint64_t (*)(uint64_t, uint64_t))[v22 totalBytesReceived];
                _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "IDSSocketPairCommandResourceTransferMessage received %@ @ incorrect offset %llu (should be @%llu)", buf, 0x20u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  id v129 = [v136 byteOffset];
                  id v131 = [v22 totalBytesReceived];
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    objc_msgSend(v136, "byteOffset", v18, v129, v131);
                    [v22 totalBytesReceived];
                    _IDSLogV();
                  }
                }
              }
            }
            goto LABEL_185;
          case 1u:
            BOOL v133 = a8;
            if ([(IDSUTunConnection *)self _resourceTransferUUIDAlreaadyReceived:v18])
            {
              double v33 = +[IDSFoundationLog UTunConnection];
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v18;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Duplicate file transfer setup detected {duplicateUUID: %@}", buf, 0xCu);
              }

              double v34 = +[IDSSocketPairResourceTransferMessage cancelMessageWithSequenceNumber:0 streamID:v14 messageUUID:v18 cancelReason:6];
              id v35 = v34;
              if (self->_supportDynamicServices)
              {
                if (self->_supportDynamicServicesOptimization) {
                  [v34 setStreamID:1];
                }
                else {
                  [v34 setTopic:v139];
                }
              }
              double v71 = self->_resettingIncomingResourceTransfers;
              if (!v71)
              {
                long long v72 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
                long long v73 = self->_resettingIncomingResourceTransfers;
                self->_resettingIncomingResourceTransfers = v72;

                double v71 = self->_resettingIncomingResourceTransfers;
              }
              [(NSMutableSet *)v71 addObject:v18];
              [(IDSUTunConnection *)self _sendSocketMessage:v35 ignoreSequenceNumber:1];
            }
            [(NSMutableSet *)self->_resettingIncomingResourceTransfers removeObject:v18];
            id v22 = [(NSMutableDictionary *)self->_incomingResourceTransfers objectForKey:v18];
            if (v22)
            {
              if (([(NSMutableSet *)self->_resumingIncomingResourceTransfers containsObject:v18] & 1) == 0)
              {
                long long v74 = +[IDSSocketPairResourceTransferMessage resumeMessageWithSequenceNumber:streamID:messageUUID:nextByteOffset:](IDSSocketPairResourceTransferMessage, "resumeMessageWithSequenceNumber:streamID:messageUUID:nextByteOffset:", 0, v14, v18, [v22 totalBytesReceived]);
                long long v75 = v74;
                if (self->_supportDynamicServices)
                {
                  if (self->_supportDynamicServicesOptimization) {
                    [v74 setStreamID:1];
                  }
                  else {
                    [v74 setTopic:v139];
                  }
                }
                [(IDSUTunConnection *)self _sendSocketMessage:v75 ignoreSequenceNumber:1];
                unsigned int v91 = self->_resumingIncomingResourceTransfers;
                if (!v91)
                {
                  unsigned int v92 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
                  v93 = self->_resumingIncomingResourceTransfers;
                  self->_resumingIncomingResourceTransfers = v92;

                  unsigned int v91 = self->_resumingIncomingResourceTransfers;
                }
                [(NSMutableSet *)v91 addObject:v18];
                v94 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                {
                  id v95 = [v22 totalBytesReceived];
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v18;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = v95;
                  _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "IDSSocketPairCommandResourceTransferMessage already receiving message %@ @%llu", buf, 0x16u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    id v124 = v18;
                    unint64_t v125 = (unint64_t)[v22 totalBytesReceived];
                    _IDSLogTransport();
                    if (_IDSShouldLog())
                    {
                      id v96 = objc_msgSend(v22, "totalBytesReceived", v18, v125);
                      id v124 = v18;
                      unint64_t v125 = (unint64_t)v96;
                      _IDSLogV();
                    }
                  }
                }
              }
LABEL_167:
              int v85 = 0;
              goto LABEL_168;
            }
            LOBYTE(v175) = 0;
            if (IMGetDomainBoolForKey())
            {
              LOBYTE(v175) = IMGetCachedDomainIntForKeyWithDefaultValue();
LABEL_107:
              CFStringRef v86 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v18;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v175;
                _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "IDSSocketPairCommandResourceTransferMessage could not create receiver from message %@ (reason %d)", buf, 0x12u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  id v124 = v18;
                  unint64_t v125 = v175;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    id v124 = v18;
                    unint64_t v125 = v175;
                    _IDSLogV();
                  }
                }
              }
              if ((_BYTE)v175)
              {
                v87 = +[IDSSocketPairResourceTransferMessage cancelMessageWithSequenceNumber:streamID:messageUUID:cancelReason:](IDSSocketPairResourceTransferMessage, "cancelMessageWithSequenceNumber:streamID:messageUUID:cancelReason:", 0, v14, v18);
                CFStringRef v88 = v87;
                if (self->_supportDynamicServices)
                {
                  if (self->_supportDynamicServicesOptimization) {
                    [v87 setStreamID:1];
                  }
                  else {
                    [v87 setTopic:v139];
                  }
                }
                unint64_t v104 = self->_resettingIncomingResourceTransfers;
                if (!v104)
                {
                  v105 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
                  id v106 = self->_resettingIncomingResourceTransfers;
                  self->_resettingIncomingResourceTransfers = v105;

                  unint64_t v104 = self->_resettingIncomingResourceTransfers;
                }
                -[NSMutableSet addObject:](v104, "addObject:", v18, v124, v125);
                [(IDSUTunConnection *)self _sendSocketMessage:v88 ignoreSequenceNumber:1];
              }
              id v22 = 0;
              goto LABEL_167;
            }
            id v22 = [objc_alloc((Class)IDSSocketPairResourceTransferReceiver) initWithMessage:v136 resumeResourceTransfers:1 receiverError:&v175];
            CFStringRef v76 = [v22 expiryDate];
            [v76 timeIntervalSinceNow];
            double v78 = v77;

            dispatch_time_t v79 = dispatch_time(0, (uint64_t)(v78 * 1000000000.0));
            unint64_t v80 = +[IDSDaemonPriorityQueueController sharedInstance];
            id v81 = [v80 queueForPriority:self->_priority];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10027C420;
            block[3] = &unk_1009875C8;
            block[4] = self;
            id key = v18;
            id v180 = key;
            double v181 = v78;
            dispatch_after(v79, v81, block);

            if (!v22) {
              goto LABEL_107;
            }
            [(NSMutableSet *)self->_resumingIncomingResourceTransfers removeObject:key];
            if (![(NSMutableSet *)self->_resumingIncomingResourceTransfers count])
            {
              qos_class_t v82 = self->_resumingIncomingResourceTransfers;
              self->_resumingIncomingResourceTransfers = 0;
            }
            if (!self->_incomingResourceTransfers)
            {
              Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              incomingResourceTransfers = self->_incomingResourceTransfers;
              self->_incomingResourceTransfers = Mutable;
            }
            CFDictionarySetValue((CFMutableDictionaryRef)self->_incomingResourceTransfers, key, v22);
            int v85 = 1;
LABEL_168:
            if ([(NSMutableSet *)self->_resettingIncomingResourceTransfers count])
            {
              if (v85) {
                goto LABEL_172;
              }
              goto LABEL_185;
            }
            id v107 = self->_resettingIncomingResourceTransfers;
            self->_resettingIncomingResourceTransfers = 0;

            if (!v85) {
              goto LABEL_185;
            }
            break;
          case 2u:
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&uint8_t buf[16] = 0x2020000000;
            LOBYTE(v183) = 0;
            uint64_t v175 = 0;
            v176 = &v175;
            uint64_t v177 = 0x2020000000;
            uint64_t v178 = 0x7FFFFFFFFFFFFFFFLL;
            sendingMessages = self->_sendingMessages;
            v169[0] = _NSConcreteStackBlock;
            v169[1] = 3221225472;
            v169[2] = sub_10027C5AC;
            v169[3] = &unk_1009875F0;
            id v37 = v18;
            id v170 = v37;
            id v135 = v20;
            id v171 = v135;
            v172 = self;
            v173 = &v175;
            v174 = buf;
            [(NSMutableArray *)sendingMessages enumerateObjectsUsingBlock:v169];
            if (v176[3] != 0x7FFFFFFFFFFFFFFFLL) {
              -[NSMutableArray removeObjectAtIndex:](self->_sendingMessages, "removeObjectAtIndex:");
            }
            if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
              goto LABEL_153;
            }
            long long v167 = 0u;
            long long v168 = 0u;
            long long v165 = 0u;
            long long v166 = 0u;
            uint64_t v38 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue messages];
            id v39 = [v38 countByEnumeratingWithState:&v165 objects:v192 count:16];
            if (!v39) {
              goto LABEL_152;
            }
            uint64_t v40 = *(void *)v166;
            while (2)
            {
              for (i = 0; i != v39; i = (char *)i + 1)
              {
                if (*(void *)v166 != v40) {
                  objc_enumerationMutation(v38);
                }
                id v42 = *(void **)(*((void *)&v165 + 1) + 8 * i);
                id v43 = [v42 messageUUID];
                if (v43)
                {
                  unsigned int v44 = [v42 messageUUID];
                  unsigned int v45 = [v44 isEqualToString:v37];

                  if (v45)
                  {
                    *(unsigned char *)(*(void *)&buf[8] + 24) = 1;
                    id v65 = [v42 socketPairMessage];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v66 = v65;
                      id v67 = [v135 byteOffset];
                      id v68 = OSLogHandleForTransportCategory();
                      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                      {
                        id v69 = [v135 byteOffset];
                        id v70 = [v66 nextByte];
                        *(_DWORD *)v186 = 138412802;
                        id v187 = v37;
                        __int16 v188 = 2048;
                        id v189 = v69;
                        __int16 v190 = 2048;
                        id v191 = v70;
                        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "IDSSocketPairCommandResourceTransferMessage got resume message for %@ @ %llu (was sending %llu)", v186, 0x20u);
                      }

                      if (os_log_shim_legacy_logging_enabled())
                      {
                        if (_IDSShouldLogTransport())
                        {
                          id v126 = [v135 byteOffset];
                          id v130 = [v66 nextByte];
                          _IDSLogTransport();
                          if (_IDSShouldLog())
                          {
                            objc_msgSend(v135, "byteOffset", v37, v126, v130);
                            [v66 nextByte];
                            _IDSLogV();
                          }
                        }
                      }
                      if (v67) {
                        [v66 setNextByte:v67];
                      }
                      else {
                        [v66 reset];
                      }
                    }
                    else
                    {
                      v89 = OSLogHandleForTransportCategory();
                      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
                      {
                        id v90 = [v135 byteOffset];
                        *(_DWORD *)v186 = 138412802;
                        id v187 = v37;
                        __int16 v188 = 2048;
                        id v189 = v90;
                        __int16 v190 = 2112;
                        id v191 = v65;
                        _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "IDSSocketPairCommandResourceTransferMessage got resume message for %@ @ %llu (ignoring nonmatching message %@)", v186, 0x20u);
                      }

                      if (os_log_shim_legacy_logging_enabled())
                      {
                        if (_IDSShouldLogTransport())
                        {
                          id v127 = [v135 byteOffset];
                          _IDSLogTransport();
                          if (_IDSShouldLog())
                          {
                            objc_msgSend(v135, "byteOffset", v37, v127, v65);
                            _IDSLogV();
                          }
                        }
                      }
                    }

                    goto LABEL_152;
                  }
                }
              }
              id v39 = [v38 countByEnumeratingWithState:&v165 objects:v192 count:16];
              if (v39) {
                continue;
              }
              break;
            }
LABEL_152:

LABEL_153:
            if (!*(unsigned char *)(*(void *)&buf[8] + 24))
            {
              unint64_t v102 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
              {
                id v103 = [v135 byteOffset];
                *(_DWORD *)v186 = 138412546;
                id v187 = v37;
                __int16 v188 = 2048;
                id v189 = v103;
                _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "IDSSocketPairCommandResourceTransferMessage got resume message for %@ @ %llu (sender not found)", v186, 0x16u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  id v128 = [v135 byteOffset];
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    objc_msgSend(v135, "byteOffset", v37, v128);
                    _IDSLogV();
                  }
                }
              }
            }

            _Block_object_dispose(&v175, 8);
            _Block_object_dispose(buf, 8);
            goto LABEL_161;
          case 3u:
            id v46 = [v20 cancelReason];
            id v22 = [(NSMutableDictionary *)self->_incomingResourceTransfers objectForKey:v18];
            if (v22)
            {
              unint64_t v47 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v18;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v46;
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Got cancel message for incoming file %@ cancelReason %u", buf, 0x12u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  id v124 = v18;
                  unint64_t v125 = v46;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    id v124 = v18;
                    unint64_t v125 = (unint64_t)v46;
                    _IDSLogV();
                  }
                }
              }
              objc_msgSend(v22, "abortTransfer", v124, v125);
              [(NSMutableDictionary *)self->_incomingResourceTransfers removeObjectForKey:v18];
              goto LABEL_185;
            }
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&uint8_t buf[16] = 0x3032000000;
            v183 = sub_10027C82C;
            v184 = sub_10027C83C;
            id v185 = 0;
            uint64_t v175 = 0;
            v176 = &v175;
            uint64_t v177 = 0x2020000000;
            uint64_t v178 = 0x7FFFFFFFFFFFFFFFLL;
            id v50 = self->_sendingMessages;
            v159[0] = _NSConcreteStackBlock;
            v159[1] = 3221225472;
            v159[2] = sub_10027C844;
            v159[3] = &unk_100987618;
            v162 = buf;
            id v51 = v18;
            char v164 = (char)v46;
            id v160 = v51;
            v161 = self;
            v163 = &v175;
            [(NSMutableArray *)v50 enumerateObjectsUsingBlock:v159];
            if (v176[3] != 0x7FFFFFFFFFFFFFFFLL) {
              -[NSMutableArray removeObjectAtIndex:](self->_sendingMessages, "removeObjectAtIndex:");
            }
            if (*(void *)(*(void *)&buf[8] + 40)) {
              goto LABEL_69;
            }
            id v52 = [(IDSLocalDeliveryQueue *)self->_deliveryQueue messages];
            v155[0] = _NSConcreteStackBlock;
            v155[1] = 3221225472;
            v155[2] = sub_10027CA70;
            v155[3] = &unk_100987640;
            id v53 = v51;
            id v156 = v53;
            id v157 = &v175;
            __int16 v158 = buf;
            [v52 enumerateObjectsUsingBlock:v155];

            if (*(void *)(*(void *)&buf[8] + 40))
            {
LABEL_69:
              id v54 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v186 = 138412546;
                id v187 = v51;
                __int16 v188 = 1024;
                LODWORD(v189) = v46;
                _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Got cancel message for outgoing file %@ cancelReason %u", v186, 0x12u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  id v124 = v51;
                  unint64_t v125 = v46;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    id v124 = v51;
                    unint64_t v125 = (unint64_t)v46;
                    _IDSLogV();
                  }
                }
              }
              id v55 = objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "context", v124, v125);
              id v56 = [v55 completionBlock];
              uint64_t v57 = +[IDSDevicePolicyController sharedInstance];
              unsigned __int8 v58 = [v57 shouldBlackOutDeviceWithCbuuid:self->_cbuuid];

              double rtt = self->_rtt;
              double v60 = +[IDSDaemonPriorityQueueController sharedInstance];
              v149[0] = _NSConcreteStackBlock;
              v149[1] = 3221225472;
              v149[2] = sub_10027CB5C;
              v149[3] = &unk_100987668;
              char v153 = (char)v46;
              id v61 = v55;
              id v150 = v61;
              double v152 = rtt;
              unsigned __int8 v154 = v58;
              id v62 = v56;
              id v151 = v62;
              [v60 performBlockMainQueue:v149];
            }
            else
            {
              v97 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v186 = 138412546;
                id v187 = v53;
                __int16 v188 = 1024;
                LODWORD(v189) = v46;
                _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "IDSSocketPairCommandResourceTransferMessage got cancel message for %@ cancelReason %u, but no sender or receiver found", v186, 0x12u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  _IDSLogTransport();
                  if (_IDSShouldLog()) {
                    _IDSLogV();
                  }
                }
              }
            }

            _Block_object_dispose(&v175, 8);
            _Block_object_dispose(buf, 8);

            goto LABEL_161;
          default:
            goto LABEL_161;
        }
        goto LABEL_172;
      }
      BOOL v133 = a8;
      __int16 v28 = [(NSMutableDictionary *)self->_incomingResourceTransfers objectForKey:v18];
      id v22 = v28;
      if (v28)
      {
        if ([v28 appendMessage:v136 receiverError:0]) {
          goto LABEL_172;
        }
        [v22 abortTransfer];
        id v29 = [objc_alloc((Class)IDSSocketPairResourceTransferReceiver) initWithMessage:v136 resumeResourceTransfers:0 receiverError:0];

        id v22 = v29;
        if (!v29)
        {
LABEL_27:
          if (!v22)
          {
            uint64_t v32 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v136;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "IDSSocketPairCommandResourceTransferMessage could not create receiver from message %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  _IDSLogV();
                }
              }
            }
LABEL_161:
            id v22 = 0;
            goto LABEL_185;
          }
LABEL_172:
          v108 = [v22 finalizedMessageDictionaryIfDone];
          if (v108)
          {
            id v109 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "IDSSocketPairCommandResourceTransferMessage received and completed", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
              _IDSLogV();
            }
            -[IDSUTunConnection _addIncomingMessageSize:forTopic:](self, "_addIncomingMessageSize:forTopic:", [v22 totalBytesReceived], v139);
            id v110 = objc_alloc((Class)IDSLocalDeliveryMessageReceivedMetric);
            v111 = [v136 data];
            id v112 = objc_msgSend(v110, "initWithService:isFromDefaultPairedDevice:messageSize:linkType:priority:", v139, a10, objc_msgSend(v111, "length"), -[IDSUTunConnection _currentLink](self, "_currentLink"), self->_priority);

            v113 = +[IDSCoreAnalyticsLogger defaultLogger];
            [v113 logMetric:v112];

            v114 = +[IDSAWDLogging sharedInstance];
            v115 = [v136 data];
            objc_msgSend(v114, "messageReceivedForService:isFromDefaultPairedDevice:messageSize:linkType:priority:", v139, a10, objc_msgSend(v115, "length"), -[IDSUTunConnection _currentLink](self, "_currentLink"), self->_priority);

            id v116 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[IDSUTunConnection _socketToNiceCommand:](self, "_socketToNiceCommand:", [v136 command]));
            v140[0] = _NSConcreteStackBlock;
            v140[1] = 3221225472;
            v140[2] = sub_10027CD5C;
            v140[3] = &unk_100987690;
            v140[4] = self;
            id v141 = v108;
            id v142 = v139;
            id v143 = v116;
            BOOL v146 = v134;
            BOOL v147 = v133;
            id v144 = v138;
            id v117 = v18;
            id v145 = v117;
            BOOL v148 = a11;
            id v118 = v116;
            [(IDSUTunConnection *)self _processMessage:v136 withSequenceNumberBlock:v140];
            [(NSMutableDictionary *)self->_incomingResourceTransfers removeObjectForKey:v117];
          }
          else
          {
            v119 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "IDSSocketPairCommandResourceTransferMessage received - waiting for more", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
              _IDSLogV();
            }
          }

LABEL_185:
          goto LABEL_186;
        }
      }
      else
      {
        id v22 = [objc_alloc((Class)IDSSocketPairResourceTransferReceiver) initWithMessage:v136 resumeResourceTransfers:0 receiverError:0];
        if (!self->_incomingResourceTransfers)
        {
          id v30 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          id v31 = self->_incomingResourceTransfers;
          self->_incomingResourceTransfers = v30;
        }
        if (!v22) {
          goto LABEL_27;
        }
      }
      CFDictionarySetValue((CFMutableDictionaryRef)self->_incomingResourceTransfers, v18, v22);
      goto LABEL_27;
    }
    id v27 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "IDSSocketPairCommandResourceTransferMessage should be IDSSocketPairResourceTransferMessage", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      goto LABEL_13;
    }
  }
  else
  {
    id v26 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "IDSSocketPairCommandResourceTransferMessage requires a messageUUID", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
LABEL_13:
    }
      _IDSLogV();
  }
LABEL_186:
}

- (void)_processIncomingDataMessage:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:self->_priority];

  if ([(IDSUTunConnection *)self _messageHasValidEncryptionStatus:v4]
    || [(IDSUTunConnection *)self _isMagnetConnection])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10027D070;
    v7[3] = &unk_1009876B8;
    id v8 = v4;
    unsigned int v9 = self;
    [(IDSUTunConnection *)self _optionallyDecryptMessage:v8 completionBlock:v7];
  }
  else
  {
    unsigned __int8 v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v11 = self;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@ received a message that we cannot accept without encryption! %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)_processDecryptedMessage:(id)a3
{
  id v4 = a3;
  unint64_t v165 = [(IDSUTunConnection *)self _sendingMessageCountForClass:1];
  unint64_t v164 = [(IDSUTunConnection *)self _sendingMessageCountForClass:0];
  unint64_t v163 = [(IDSUTunConnection *)self _sendingMessageCountForClass:2];
  unsigned int v158 = [(IDSUTunConnection *)self _isMagnetConnection];
  if (objc_opt_respondsToSelector())
  {
    long long v168 = [v4 messageUUID];
  }
  else
  {
    long long v168 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    double v167 = [v4 peerResponseIdentifier];
  }
  else
  {
    double v167 = 0.0;
  }
  if (objc_opt_respondsToSelector()) {
    id v5 = [v4 expectsPeerResponse];
  }
  else {
    id v5 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    id v6 = [v4 wantsAppAck];
  }
  else {
    id v6 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v161 = [v4 didWakeHint];
  }
  else {
    unsigned __int8 v161 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v4 expiryDate];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"NO";
    *(_DWORD *)buf = 138544386;
    *(void *)v263 = v168;
    if (v5) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    if (v6) {
      CFStringRef v9 = @"YES";
    }
    *(_WORD *)&v263[8] = 2112;
    *(double *)&v263[10] = v167;
    *(_WORD *)&v263[18] = 2112;
    *(void *)&v263[20] = v10;
    *(_WORD *)&v263[28] = 2112;
    *(void *)&v263[30] = v9;
    *(_WORD *)&v263[38] = 2112;
    *(void *)&v263[40] = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received message has messageUUID %{public}@ peerResponseID %@ expectsPeerResponse? %@ wantsAppAck %@ remoteExpiryDate: %@", buf, 0x34u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    *(double *)&__int16 v11 = v5 ? COERCE_DOUBLE(@"YES") : COERCE_DOUBLE(@"NO");
    *(double *)&__int16 v12 = v6 ? COERCE_DOUBLE(@"YES") : COERCE_DOUBLE(@"NO");
    double v156 = *(double *)&v12;
    id v157 = v7;
    double v154 = v167;
    double v155 = *(double *)&v11;
    id v150 = v168;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      double v156 = *(double *)&v12;
      id v157 = v7;
      double v154 = v167;
      double v155 = *(double *)&v11;
      id v150 = v168;
      _IDSLogV();
    }
  }
  if (v7)
  {
    [v7 timeIntervalSinceNow];
    if (v13 < 0.0)
    {
      uint64_t v14 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v263 = v168;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received a message that has passed its expiry date, sending back an expired ack MessageUUID: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v150 = v168;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v150 = v168;
            _IDSLogV();
          }
        }
      }
      -[IDSUTunConnection _sendExpiredAckForMessage:](self, "_sendExpiredAckForMessage:", v4, v150, *(void *)&v154, *(void *)&v155, *(void *)&v156, v157);
      goto LABEL_177;
    }
  }
  if (self->_needsHandshake && [v4 command] != 4)
  {
    unsigned __int8 v24 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      unsigned int v26 = [v4 command];
      *(_DWORD *)buf = 138412802;
      *(void *)v263 = self;
      *(_WORD *)&v263[8] = 2112;
      *(void *)&v263[10] = identifier;
      *(_WORD *)&v263[18] = 1024;
      *(_DWORD *)&v263[20] = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%@ [%@] received a %d message when it was expecting a handshake!", buf, 0x1Cu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        double v154 = *(double *)&self->_identifier;
        *(void *)&double v155 = [v4 command];
        id v150 = self;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v27 = self->_identifier;
          unsigned int v28 = objc_msgSend(v4, "command", self, *(void *)&v154, *(void *)&v155);
          double v154 = *(double *)&v27;
          *(void *)&double v155 = v28;
          id v150 = self;
          _IDSLogV();
        }
      }
    }
    id v29 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Incompatible IDS version number!", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    id v30 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Incompatible IDS version number - please make sure your build versions match!", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    id v31 = +[IMLockdownManager sharedInstance];
    unsigned int v32 = [v31 isInternalInstall];

    if (v32) {
      [(IDSUTunConnection *)self _dumpLogs];
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      *(double *)&unsigned int v159 = 0.0;
      double key = 0.0;
      goto LABEL_131;
    }
    *(double *)&unsigned int v159 = COERCE_DOUBLE([v4 streamID]);
    if (!self->_supportDynamicServices)
    {
      double v33 = [(IDSUTunConnection *)self _UTunDeliveryController];
      double key = [v33 topicForStreamID:v159];

      goto LABEL_131;
    }
    double key = [v4 topic];
    char v261 = 0;
    if (key != 0.0)
    {
      if (!self->_supportDynamicServicesOptimization) {
        goto LABEL_123;
      }
      if (v159)
      {
        [(IDSUTunPeerServiceMap *)self->_outgoingServiceMap associateServiceName:*(void *)&key withStreamID:v159 remoteInstanceID:self->_remoteInstanceID remoteInstanceIDChanged:&v261];
        if (v261) {
          goto LABEL_124;
        }
      }
      char v260 = 0;
      LOWORD(v216) = 0;
      if (-[IDSUTunPeerServiceMap translateServiceName:toStreamID:createIfNotFound:mappingCreated:remoteInstanceID:remoteInstanceIDChanged:](self->_incomingServiceMap, "translateServiceName:toStreamID:createIfNotFound:mappingCreated:remoteInstanceID:remoteInstanceIDChanged:", *(void *)&key, &v216, 1, &v260, self->_remoteInstanceID, &v261, v150, *(void *)&v154, *(void *)&v155, *(void *)&v156, v157))
      {
        incomingServiceMapUpdateCounter = self->_incomingServiceMapUpdateCounter;
        if (!incomingServiceMapUpdateCounter)
        {
          Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          id v17 = self->_incomingServiceMapUpdateCounter;
          self->_incomingServiceMapUpdateCounter = Mutable;

          incomingServiceMapUpdateCounter = self->_incomingServiceMapUpdateCounter;
        }
        id v18 = [(NSMutableDictionary *)incomingServiceMapUpdateCounter objectForKey:*(void *)&key];
        if ((uint64_t)[v18 integerValue] < 2)
        {
          if (v18 && (uint64_t)[v18 integerValue] < 1) {
            goto LABEL_122;
          }
          +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v18 integerValue] + 1);
          __int16 v20 = (char *)objc_claimAutoreleasedReturnValue();
          if (v20) {
            CFDictionarySetValue((CFMutableDictionaryRef)self->_incomingServiceMapUpdateCounter, *(const void **)&key, v20);
          }
        }
        else
        {
          CFDictionarySetValue((CFMutableDictionaryRef)self->_incomingServiceMapUpdateCounter, *(const void **)&key, &off_1009D1A10);
          id v19 = objc_alloc((Class)IDSSocketPairServiceMapMessage);
          __int16 v20 = (char *)[v19 initWithReason:1 mappedStreamID:(unsigned __int16)v216 serviceName:*(void *)&key];
          [(IDSUTunConnection *)self _sendSocketMessage:v20 ignoreSequenceNumber:1];
          long long v21 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            if (v260) {
              CFStringRef v22 = @"YES";
            }
            else {
              CFStringRef v22 = @"NO";
            }
            *(_DWORD *)buf = 138413314;
            *(void *)v263 = v168;
            *(_WORD *)&v263[8] = 2112;
            *(double *)&v263[10] = key;
            *(_WORD *)&v263[18] = 1024;
            *(_DWORD *)&v263[20] = (unsigned __int16)v216;
            *(_WORD *)&v263[24] = 2112;
            *(void *)&v263[26] = v22;
            *(_WORD *)&v263[34] = 2112;
            *(void *)&v263[36] = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Incoming message %@ servicename %@ streamID-found %u newly-created %@ (serviceMapMessage %@)", buf, 0x30u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            if (v260) {
              *(double *)&CFStringRef v23 = COERCE_DOUBLE(@"YES");
            }
            else {
              *(double *)&CFStringRef v23 = COERCE_DOUBLE(@"NO");
            }
            double v156 = *(double *)&v23;
            id v157 = v20;
            *(void *)&double v155 = (unsigned __int16)v216;
            id v150 = v168;
            double v154 = key;
            _IDSLogV();
          }
        }

LABEL_122:
        goto LABEL_123;
      }
      if (!v260)
      {
        id v42 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v263 = v168;
          *(_WORD *)&v263[8] = 2112;
          *(double *)&v263[10] = key;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Cannot create mapping while receiving message %@ with topic %@ - continuing", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v150 = v168;
          double v154 = key;
          _IDSLogV();
        }
      }
LABEL_123:
      if (v261)
      {
LABEL_124:
        id v43 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v263 = v168;
          *(_WORD *)&v263[8] = 2112;
          *(double *)&v263[10] = key;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Remote instance changed while receiving message %@ with topic %@ - continue and dispatch reconnect", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            id v150 = v168;
            double v154 = key;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              id v150 = v168;
              double v154 = key;
              _IDSLogV();
            }
          }
        }
        [(IDSUTunConnection *)self _nonThreadSafeStopConnection];
        dispatch_time_t v44 = dispatch_time(0, 0);
        unsigned int v45 = +[IDSDaemonPriorityQueueController sharedInstance];
        id v46 = [v45 queueForPriority:self->_priority];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10028028C;
        block[3] = &unk_10097E4D0;
        block[4] = self;
        dispatch_after(v44, v46, block);
      }
LABEL_131:
      switch(objc_msgSend(v4, "command", v150))
      {
        case 0u:
          goto LABEL_150;
        case 1u:
        case 0x25u:
          id v64 = v4;
          uint64_t v216 = 0;
          v217 = (double *)&v216;
          uint64_t v218 = 0x2020000000;
          uint64_t v219 = 0x7FFFFFFFFFFFFFFFLL;
          sendingMessages = self->_sendingMessages;
          v213[0] = _NSConcreteStackBlock;
          v213[1] = 3221225472;
          v213[2] = sub_100280FEC;
          v213[3] = &unk_100987758;
          v213[4] = self;
          id v162 = v64;
          id v214 = v162;
          v215 = &v216;
          [(NSMutableArray *)sendingMessages enumerateObjectsUsingBlock:v213];
          if (*((void *)v217 + 3) == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v66 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v67 = [v162 sequenceNumber];
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v263 = v67;
              _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "  => Message id %d ACK'd but it already timed out...", buf, 8u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                id v152 = [v162 sequenceNumber];
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  objc_msgSend(v162, "sequenceNumber", v152);
                  _IDSLogV();
                }
              }
            }
            goto LABEL_284;
          }
          v99 = -[NSMutableArray objectAtIndex:](self->_sendingMessages, "objectAtIndex:");
          v100 = [v99 context];
          [v100 processAckForSocketPairMessage:v99];
          id v160 = v99;
          if (![v100 isDoneSending]) {
            goto LABEL_272;
          }
          [v100 timeSent];
          double v102 = v101;
          IMTimeOfDay();
          double v104 = v103 - v102;
          double rtt = self->_rtt;
          if (rtt == 0.0) {
            double v106 = v104;
          }
          else {
            double v106 = v104 * 0.1 + rtt * 0.9;
          }
          self->_double rtt = v106;
          id v107 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v108 = [v162 sequenceNumber];
            double v109 = self->_rtt;
            *(_DWORD *)buf = 67109888;
            *(_DWORD *)v263 = v108;
            *(_WORD *)&v263[4] = 2048;
            *(double *)&v263[6] = v109;
            *(_WORD *)&v263[14] = 2048;
            *(double *)&v263[16] = v104;
            *(_WORD *)&v263[24] = 2048;
            *(double *)&v263[26] = v102;
            _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "  => Message id %d ACK'd RTT: %f  [instantaneous %f]  time sent: %f", buf, 0x26u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              id v110 = [v162 sequenceNumber];
              double v155 = v104;
              double v156 = v102;
              double v154 = self->_rtt;
              id v151 = v110;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                id v111 = objc_msgSend(v162, "sequenceNumber", v151, *(void *)&v154, *(void *)&v104, *(void *)&v102);
                double v155 = v104;
                double v156 = v102;
                double v154 = self->_rtt;
                id v151 = v111;
                _IDSLogV();
              }
            }
          }
          if (-[IDSUTunConnection _shouldAWDLogMessage:](self, "_shouldAWDLogMessage:", v100, v151, *(void *)&v154, *(void *)&v155, *(void *)&v156))
          {
            id v112 = objc_alloc((Class)IDSLocalMessageRTTMetric);
            v113 = [v100 awdTopic];
            id v114 = objc_msgSend(v112, "initWithService:isToDefaultPairedDevice:messageSize:linkType:deliveryError:RTT:priority:", v113, v158, objc_msgSend(v100, "sentMessageDataSize"), -[IDSUTunConnection _currentLink](self, "_currentLink"), 0, objc_msgSend(v100, "priority"));

            v115 = +[IDSCoreAnalyticsLogger defaultLogger];
            [v115 logMetric:v114];

            id v116 = +[IDSAWDLogging sharedInstance];
            id v117 = [v100 awdTopic];
            objc_msgSend(v116, "messageDeliveredForService:isToDefaultPairedDevice:messageSize:linkType:deliveryError:RTT:priority:", v117, v158, objc_msgSend(v100, "sentMessageDataSize"), -[IDSUTunConnection _currentLink](self, "_currentLink"), 0, (unint64_t)(v104 * 1000.0), objc_msgSend(v100, "priority"));

            v99 = v160;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_232;
          }
          id v118 = v99;
          if ([v118 isDone])
          {
            [v100 setUnderlyingSocketPairMessage:0];
            [(IDSLocalDeliveryQueue *)self->_deliveryQueue dequeueMessage:v100];

LABEL_232:
            id v118 = [v100 completionBlock];
            v119 = +[IDSDevicePolicyController sharedInstance];
            unsigned __int8 v120 = [v119 shouldBlackOutDeviceWithCbuuid:self->_cbuuid];

            double v121 = self->_rtt;
            if ([v162 command] == 37)
            {
              v122 = +[IDSDaemonPriorityQueueController sharedInstance];
              id v123 = v211;
              v211[0] = _NSConcreteStackBlock;
              v211[1] = 3221225472;
              v211[2] = sub_1002810EC;
              v211[3] = &unk_100987780;
              v211[4] = v100;
              *(double *)&v211[6] = v121;
              unsigned __int8 v212 = v120;
              v211[5] = v118;
              [v122 performBlockMainQueue:v211];
            }
            else
            {
              v122 = +[IDSDaemonPriorityQueueController sharedInstance];
              id v123 = v209;
              v209[0] = _NSConcreteStackBlock;
              v209[1] = 3221225472;
              v209[2] = sub_1002811E8;
              v209[3] = &unk_100987780;
              v209[4] = v100;
              *(double *)&v209[6] = v121;
              unsigned __int8 v210 = v120;
              v209[5] = v118;
              [v122 performBlockMainQueue:v209];
            }
          }
LABEL_272:
          [v162 sequenceNumber];
          kdebug_trace();
          id v139 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v140 = [v100 messageID];
            unsigned int v141 = [v162 sequenceNumber];
            uint64_t v142 = *((void *)v217 + 3);
            id v143 = (char *)[(NSMutableArray *)self->_sendingMessages count];
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)v263 = v140;
            *(_WORD *)&v263[4] = 1024;
            *(_DWORD *)&v263[6] = v141;
            *(_WORD *)&v263[10] = 2048;
            *(void *)&v263[12] = v142;
            *(_WORD *)&v263[20] = 2112;
            *(void *)&v263[22] = v160;
            *(_WORD *)&v263[30] = 2048;
            *(void *)&v263[32] = v143 - 1;
            _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "Removing ack'd message[%u] with sequenceNumber %u (index=%lu), message %@ remaining count %lu", buf, 0x2Cu);
          }

          id v144 = v160;
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v145 = [v100 messageID];
            double v146 = COERCE_DOUBLE([v162 sequenceNumber]);
            double v147 = v217[3];
            double v156 = *(double *)&v160;
            id v157 = (char *)[(NSMutableArray *)self->_sendingMessages count] - 1;
            double v154 = v146;
            double v155 = v147;
            id v151 = v145;
            _IDSLogV();
          }
          -[IDSUTunConnection _removeMessageFromStatistics:](self, "_removeMessageFromStatistics:", v100, v151, *(void *)&v154, *(void *)&v155, *(void *)&v156, v157);
          [(NSMutableArray *)self->_sendingMessages removeObjectAtIndex:*((void *)v217 + 3)];
          if (![(NSMutableArray *)self->_sendingMessages count])
          {
            BOOL v148 = self->_sendingMessages;
            self->_sendingMessages = 0;

            id v144 = v160;
          }
          if (!self->_sendingMessages) {
            [(IDSUTunConnection *)self _clearSendingPowerAssertionWithReason:@"No in flight messages remaining"];
          }
          [(NSMutableArray *)self->_fallbackMessages removeObject:v100];
          if (![(NSMutableArray *)self->_fallbackMessages count])
          {
            fallbackMessages = self->_fallbackMessages;
            self->_fallbackMessages = 0;

            id v144 = v160;
          }
          [v144 setContext:0];
          [v144 setCancelled:1];
          [(IDSUTunConnection *)self _dequeueMessages];

LABEL_284:
          _Block_object_dispose(&v216, 8);

          goto LABEL_167;
        case 3u:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v85 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[IDSUTunConnection _socketToNiceCommand:](self, "_socketToNiceCommand:", [v4 command]));
            id v86 = v4;
            id v87 = objc_alloc((Class)IDSProtobuf);
            CFStringRef v88 = [v86 data];
            id v89 = objc_msgSend(v87, "initWithProtobufData:type:isResponse:", v88, objc_msgSend(v86, "type"), objc_msgSend(v86, "isResponse") != 0);

            v233[0] = _NSConcreteStackBlock;
            v233[1] = 3221225472;
            v233[2] = sub_1002806E4;
            v233[3] = &unk_1009876E0;
            id v234 = v86;
            id v235 = v89;
            __int16 v241 = (__int16)v159;
            v236 = self;
            id v90 = *(id *)&key;
            char v242 = v158;
            id v237 = v90;
            id v238 = v85;
            char v243 = (char)v6;
            char v244 = (char)v5;
            id v239 = *(id *)&v167;
            v240 = v168;
            unsigned __int8 v245 = v161;
            id v91 = v85;
            id v92 = v89;
            id v93 = v86;
            [(IDSUTunConnection *)self _processMessage:v93 withSequenceNumberBlock:v233];
          }
          else
          {
            unint64_t v125 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v263 = v4;
              _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_ERROR, "LocalDelivery: IDSSocketPairCommandProtobufMessage received incompatible data message of type %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              _IDSWarnV();
              _IDSLogV();
              _IDSLogTransport();
            }
          }
          goto LABEL_167;
        case 4u:
          id v94 = v4;
          unsigned int v95 = [v94 versionNumber];
          id v96 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
          {
            v97 = self->_identifier;
            if (self->_needsHandshake) {
              CFStringRef v98 = @"YES";
            }
            else {
              CFStringRef v98 = @"NO";
            }
            *(_DWORD *)buf = 138413314;
            *(void *)v263 = self;
            *(_WORD *)&v263[8] = 2112;
            *(void *)&v263[10] = v97;
            *(_WORD *)&v263[18] = 1024;
            *(_DWORD *)&v263[20] = v95;
            *(_WORD *)&v263[24] = 1024;
            *(_DWORD *)&v263[26] = 4;
            *(_WORD *)&v263[30] = 2112;
            *(void *)&v263[32] = v98;
            _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "%@ [%@] received handshake with version %u. We require %u. Needs handshake? %@", buf, 0x2Cu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport();
              if (_IDSShouldLog()) {
                _IDSLogV();
              }
            }
          }
          self->_needsHandshake = 0;

          goto LABEL_167;
        case 6u:
          goto LABEL_147;
        case 7u:
          v205[0] = _NSConcreteStackBlock;
          v205[1] = 3221225472;
          v205[2] = sub_1002812E4;
          v205[3] = &unk_1009877A8;
          v205[4] = self;
          id v206 = *(id *)&key;
          char v208 = v158;
          id v207 = *(id *)&v167;
          [(IDSUTunConnection *)self _processMessage:v4 withSequenceNumberBlock:v205];

          goto LABEL_167;
        case 8u:
        case 9u:
        case 0xAu:
        case 0xBu:
        case 0xCu:
        case 0xDu:
        case 0x29u:
          [(IDSUTunConnection *)self _sendAckForMessage:v4];
LABEL_147:
          id v54 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[IDSUTunConnection _socketToNiceCommand:](self, "_socketToNiceCommand:", [v4 command]));
          if (objc_opt_respondsToSelector())
          {
            id v55 = [v4 data];
          }
          else
          {
            id v55 = 0;
          }
          v246[0] = _NSConcreteStackBlock;
          v246[1] = 3221225472;
          v246[2] = sub_100280294;
          v246[3] = &unk_1009876E0;
          id v58 = v4;
          id v247 = v58;
          id v248 = v55;
          v249 = self;
          id v59 = *(id *)&key;
          char v255 = v158;
          __int16 v254 = (__int16)v159;
          id v250 = v59;
          id v251 = v54;
          char v256 = (char)v6;
          char v257 = (char)v5;
          id v252 = *(id *)&v167;
          v253 = v168;
          unsigned __int8 v258 = v161;
          id v60 = v54;
          id v61 = v55;
          [(IDSUTunConnection *)self _processMessage:v58 withSequenceNumberBlock:v246];

          goto LABEL_167;
        case 0xEu:
        case 0xFu:
        case 0x10u:
        case 0x11u:
        case 0x12u:
        case 0x13u:
        case 0x14u:
          [(IDSUTunConnection *)self _sendAckForMessage:v4];
LABEL_150:
          id v56 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[IDSUTunConnection _socketToNiceCommand:](self, "_socketToNiceCommand:", [v4 command]));
          if (objc_opt_respondsToSelector())
          {
            uint64_t v57 = [v4 data];
          }
          else
          {
            uint64_t v57 = 0;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0 && ![v4 compressed])
          {
            char v63 = 0;
          }
          else
          {
            uint64_t v62 = [v57 _FTOptionallyDecompressData];

            char v63 = 1;
            uint64_t v57 = (void *)v62;
          }
          v220[0] = _NSConcreteStackBlock;
          v220[1] = 3221225472;
          v220[2] = sub_100280C84;
          v220[3] = &unk_100987708;
          id v68 = v57;
          __int16 v227 = (__int16)v159;
          char v228 = v63;
          id v221 = v68;
          v222 = self;
          id v223 = *(id *)&key;
          char v229 = v158;
          id v69 = v56;
          id v224 = v69;
          char v230 = (char)v6;
          char v231 = (char)v5;
          id v225 = *(id *)&v167;
          v226 = v168;
          unsigned __int8 v232 = v161;
          [(IDSUTunConnection *)self _processMessage:v4 withSequenceNumberBlock:v220];

          goto LABEL_167;
        case 0x15u:
          id v70 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "SocketPairConnection should have consumed this and never pass it up", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
            _IDSLogV();
          }
          goto LABEL_167;
        case 0x16u:
          BYTE1(v154) = v161;
          LOBYTE(v154) = v158;
          -[IDSUTunConnection _processIncomingResourceTransferMessage:messageUUID:streamID:topic:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:isDefaultPairedDevice:didWakeHint:](self, "_processIncomingResourceTransferMessage:messageUUID:streamID:topic:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:isDefaultPairedDevice:didWakeHint:", v4, v168, v159, *(void *)&key, v6, v5, *(void *)&v167, *(void *)&v154);
          goto LABEL_167;
        case 0x19u:
          double v71 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v263 = v4;
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "GOT SOCKET PAIR COMMAND MESSAGE OUTGOING NICE PROXY %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v151 = v4;
            _IDSLogV();
          }
          long long v72 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[IDSUTunConnection _socketToNiceCommand:](self, "_socketToNiceCommand:", objc_msgSend(v4, "command", v151)));
          [(IDSUTunConnection *)self _sendAckForMessage:v4];
          if (objc_opt_respondsToSelector()) {
            unsigned int v73 = [v4 compressed];
          }
          else {
            unsigned int v73 = 1;
          }
          if (objc_opt_respondsToSelector())
          {
            id v126 = [v4 data];
          }
          else
          {
            id v126 = 0;
          }
          if (v73)
          {
            uint64_t v128 = [v126 _FTOptionallyDecompressData];

            id v126 = (void *)v128;
          }
          v193[0] = _NSConcreteStackBlock;
          v193[1] = 3221225472;
          v193[2] = sub_100281488;
          v193[3] = &unk_1009877D0;
          id v129 = v126;
          __int16 v200 = (__int16)v159;
          char v201 = v73;
          id v194 = v129;
          v195 = self;
          id v196 = *(id *)&key;
          id v130 = v72;
          id v197 = v130;
          char v202 = (char)v6;
          char v203 = (char)v5;
          id v198 = *(id *)&v167;
          v199 = v168;
          unsigned __int8 v204 = v161;
          [(IDSUTunConnection *)self _processMessage:v4 withSequenceNumberBlock:v193];

          goto LABEL_167;
        case 0x1Au:
          qos_class_t v82 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v263 = v4;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "GOT SOCKET PAIR COMMAND MESSAGE INCOMING NICE PROXY %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v151 = v4;
            _IDSLogV();
          }
          CFStringRef v83 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[IDSUTunConnection _socketToNiceCommand:](self, "_socketToNiceCommand:", objc_msgSend(v4, "command", v151)));
          [(IDSUTunConnection *)self _sendAckForMessage:v4];
          if (objc_opt_respondsToSelector()) {
            unsigned int v84 = [v4 compressed];
          }
          else {
            unsigned int v84 = 1;
          }
          if (objc_opt_respondsToSelector())
          {
            id v127 = [v4 data];
          }
          else
          {
            id v127 = 0;
          }
          if (v84)
          {
            uint64_t v131 = [v127 _FTOptionallyDecompressData];

            id v127 = (void *)v131;
          }
          v181[0] = _NSConcreteStackBlock;
          v181[1] = 3221225472;
          v181[2] = sub_100281718;
          v181[3] = &unk_1009877D0;
          id v132 = v127;
          __int16 v188 = (__int16)v159;
          char v189 = v84;
          id v182 = v132;
          v183 = self;
          id v184 = *(id *)&key;
          id v133 = v83;
          id v185 = v133;
          char v190 = (char)v6;
          char v191 = (char)v5;
          id v186 = *(id *)&v167;
          id v187 = v168;
          unsigned __int8 v192 = v161;
          [(IDSUTunConnection *)self _processMessage:v4 withSequenceNumberBlock:v181];

          goto LABEL_167;
        case 0x1Bu:
        case 0x1Cu:
        case 0x1Du:
        case 0x1Eu:
        case 0x1Fu:
        case 0x20u:
        case 0x21u:
        case 0x22u:
        case 0x23u:
        case 0x24u:
        case 0x26u:
        case 0x2Au:
        case 0x2Bu:
        case 0x2Cu:
        case 0x2Du:
        case 0x2Eu:
        case 0x2Fu:
        case 0x30u:
        case 0x31u:
        case 0x33u:
          unint64_t v47 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v263 = v4;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "GOT SOCKET PAIR COMMAND INCOMMING IMESSAGE COMMAND %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v151 = v4;
            _IDSLogV();
          }
          id v48 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[IDSUTunConnection _socketToNiceCommand:](self, "_socketToNiceCommand:", objc_msgSend(v4, "command", v151)));
          [(IDSUTunConnection *)self _sendAckForMessage:v4];
          if (objc_opt_respondsToSelector()) {
            unsigned int v49 = [v4 compressed];
          }
          else {
            unsigned int v49 = 1;
          }
          if (objc_opt_respondsToSelector())
          {
            id v50 = [v4 data];

            if (!v49) {
              goto LABEL_145;
            }
          }
          else
          {
            id v50 = 0;
            if (!v49) {
              goto LABEL_145;
            }
          }
          uint64_t v51 = [v50 _FTOptionallyDecompressData];

          id v50 = (id)v51;
LABEL_145:
          v169[0] = _NSConcreteStackBlock;
          v169[1] = 3221225472;
          v169[2] = sub_1002819B8;
          v169[3] = &unk_1009877D0;
          id v52 = v50;
          id v170 = v52;
          __int16 v176 = (__int16)v159;
          char v177 = v49;
          id v171 = v168;
          v172 = self;
          id v173 = *(id *)&key;
          id v53 = v48;
          id v174 = v53;
          char v178 = (char)v6;
          char v179 = (char)v5;
          id v175 = *(id *)&v167;
          unsigned __int8 v180 = v161;
          [(IDSUTunConnection *)self _processMessage:v4 withSequenceNumberBlock:v169];

LABEL_167:
          if (v165 && ![(IDSUTunConnection *)self _sendingMessageCountForClass:1]) {
            [(IDSUTunConnection *)self _handleBecomingEmptyForDataProtectionClass:1];
          }
          if (v164 && ![(IDSUTunConnection *)self _sendingMessageCountForClass:0]) {
            [(IDSUTunConnection *)self _handleBecomingEmptyForDataProtectionClass:0];
          }
          if (v163 && ![(IDSUTunConnection *)self _sendingMessageCountForClass:2]) {
            [(IDSUTunConnection *)self _handleBecomingEmptyForDataProtectionClass:2];
          }
          break;
        case 0x27u:
          id v74 = v4;
          LOBYTE(v216) = 0;
          long long v75 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v76 = [v74 reason];
            id v77 = [v74 serviceName];
            unsigned int v78 = [v74 mappedStreamID];
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v263 = v76;
            *(_WORD *)&v263[4] = 2112;
            *(void *)&v263[6] = v77;
            *(_WORD *)&v263[14] = 1024;
            *(_DWORD *)&v263[16] = v78;
            _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Got ServiceMapMessage reason %u serviceName %@ streamID %u", buf, 0x18u);
          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v79 = [v74 reason];
            double v154 = [v74 serviceName];
            *(void *)&double v155 = [v74 mappedStreamID];
            id v151 = v79;
            _IDSLogV();
          }
          outgoingServiceMap = self->_outgoingServiceMap;
          id v81 = objc_msgSend(v74, "serviceName", v151, *(void *)&v154, *(void *)&v155);
          -[IDSUTunPeerServiceMap associateServiceName:withStreamID:remoteInstanceID:remoteInstanceIDChanged:](outgoingServiceMap, "associateServiceName:withStreamID:remoteInstanceID:remoteInstanceIDChanged:", v81, [v74 mappedStreamID], self->_remoteInstanceID, &v216);

          goto LABEL_167;
        default:
          goto LABEL_167;
      }
LABEL_176:

      goto LABEL_177;
    }
    if (!self->_supportDynamicServicesOptimization)
    {
      uint64_t v38 = [(IDSUTunConnection *)self _UTunDeliveryController];
      double key = [v38 topicForStreamID:v159];

      id v39 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v263 = v159;
        *(_WORD *)&v263[4] = 2112;
        *(double *)&v263[6] = key;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "UTunConnection Error: missing expected message topic!! (no optimization) streamID %u  (topicForStreamID %@)", buf, 0x12u);
      }

      int v40 = (int)v159;
      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        id v150 = v159;
        double v154 = key;
        _IDSLogTransport();
        int v40 = (int)v159;
      }
      long long v41 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v263 = v40;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "*************** SERVICEMAP ERROR: FAILED TO GET TOPIC FOR streamID %u ****************", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        id v150 = v159;
        _IDSLogTransport();
      }
      [(IDSUTunPeerServiceMap *)self->_incomingServiceMap dumpServiceMap];
      [(IDSUTunPeerServiceMap *)self->_outgoingServiceMap dumpServiceMap];
      if (self->_shouldAbortOnMissingTopic)
      {
        sleep(1u);
        if (!isRunningTests()) {
          abort();
        }
        throwsIDSAbortException();
      }
      goto LABEL_176;
    }
    if (!v159)
    {
      double key = 0.0;
      goto LABEL_123;
    }
    incomingServiceMap = self->_incomingServiceMap;
    void block[5] = 0;
    unsigned __int8 v35 = -[IDSUTunPeerServiceMap translateStreamID:toServiceName:remoteInstanceID:remoteInstanceIDChanged:](incomingServiceMap, "translateStreamID:toServiceName:remoteInstanceID:remoteInstanceIDChanged:");
    double key = COERCE_DOUBLE(0);
    if (v35)
    {
      if (objc_opt_respondsToSelector())
      {
        unsigned __int8 v36 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v37 = [v4 sequenceNumber];
          *(_DWORD *)buf = 138413058;
          *(void *)v263 = v168;
          *(_WORD *)&v263[8] = 2112;
          *(double *)&v263[10] = key;
          *(_WORD *)&v263[18] = 1024;
          *(_DWORD *)&v263[20] = v159;
          *(_WORD *)&v263[24] = 1024;
          *(_DWORD *)&v263[26] = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "Incoming message %@ servicename-found %@ streamID %u sequenceNumber %u", buf, 0x22u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          double v155 = *(double *)&v159;
          double v156 = COERCE_DOUBLE([v4 sequenceNumber]);
          id v150 = v168;
          double v154 = key;
          _IDSLogV();
        }
        objc_msgSend(v4, "sequenceNumber", v150, *(void *)&v154, *(void *)&v155, *(void *)&v156, v157);
        kdebug_trace();
      }
      else
      {
        id v124 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)v263 = v168;
          *(_WORD *)&v263[8] = 2112;
          *(double *)&v263[10] = key;
          *(_WORD *)&v263[18] = 1024;
          *(_DWORD *)&v263[20] = v159;
          _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEBUG, "Incoming message %@ servicename-found %@ streamID %u", buf, 0x1Cu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          double v155 = *(double *)&v159;
          id v150 = v168;
          double v154 = key;
          _IDSLogV();
        }
      }
      goto LABEL_123;
    }
    BOOL v134 = [(IDSUTunConnection *)self _UTunDeliveryController];
    double v135 = [v134 topicForStreamID:v159];

    v136 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v263 = v159;
      *(_WORD *)&v263[4] = 2112;
      *(double *)&v263[6] = v135;
      _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_ERROR, "UTunConnection Error: missing expected message topic!! (supports optimization) streamID %u  (topicForStreamID %@)", buf, 0x12u);
    }

    int v137 = (int)v159;
    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      id v150 = v159;
      double v154 = v135;
      _IDSLogTransport();
      int v137 = (int)v159;
    }
    id v138 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v263 = v137;
      _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_ERROR, "*************** SERVICEMAP ERROR: FAILED TO GET TOPIC FOR streamID %u ****************", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      id v150 = v159;
      _IDSLogTransport();
    }
    [(IDSUTunPeerServiceMap *)self->_incomingServiceMap dumpServiceMap];
    [(IDSUTunPeerServiceMap *)self->_outgoingServiceMap dumpServiceMap];
    if (self->_shouldAbortOnMissingTopic)
    {
      sleep(1u);
      if (!isRunningTests()) {
        abort();
      }
      throwsIDSAbortException();
    }
    [(IDSUTunConnection *)self _nonThreadSafeStopConnection];
    [(IDSUTunConnection *)self _checkAndStartConnection];
  }
LABEL_177:
}

- (void)_dumpLogs
{
  if (qword_100A4C460 != -1) {
    dispatch_once(&qword_100A4C460, &stru_1009877F0);
  }
}

- (void)connectionDidClose:(id)a3
{
  id v4 = (IDSSocketPairConnectionProtocol *)a3;
  if (self->_socketConnection == v4)
  {
    id v5 = +[IDSDaemonPriorityQueueController sharedInstance];
    [v5 assertRunningWithPriority:self->_priority];

    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v10 = self;
      __int16 v11 = 2112;
      __int16 v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ informed that utun socket pair connection %@ has closed...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v7 = self;
      id v8 = v4;
      _IDSLogV();
    }
    [(IDSUTunConnection *)self _nonThreadSafeStopConnection];
    [(IDSUTunConnection *)self _checkAndStartConnection];
  }
}

- (void)connectionDidClose
{
  uint64_t v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:self->_priority];

  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ informed that IDSNWSocketPairConnection has closed.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v5 = self;
    _IDSLogV();
  }
  [(IDSUTunConnection *)self _nonThreadSafeStopConnection];
  [(IDSUTunConnection *)self _checkAndStartConnection];
}

- (void)connection:(id)a3 didReceiveDataMessage:(id)a4
{
  if (self->_socketConnection == a3)
  {
    id v6 = a4;
    id v5 = +[IDSDaemonPriorityQueueController sharedInstance];
    [v5 assertRunningWithPriority:self->_priority];

    [(IDSUTunConnection *)self _clearLastFallbackWithReason:@"message received via local link"];
    [(IDSUTunConnection *)self _processIncomingDataMessage:v6];
  }
}

- (void)didReceiveDataMessage:(id)a3
{
  id v5 = a3;
  id v4 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v4 assertRunningWithPriority:self->_priority];

  [(IDSUTunConnection *)self _clearLastFallbackWithReason:@"message received via local link"];
  [(IDSUTunConnection *)self _processIncomingDataMessage:v5];
}

- (void)connectionBecameEmpty:(id)a3
{
  id v4 = (IDSSocketPairConnectionProtocol *)a3;
  if (self->_socketConnection == v4)
  {
    id v5 = +[IDSDaemonPriorityQueueController sharedInstance];
    [v5 assertRunningWithPriority:self->_priority];

    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v10 = self;
      __int16 v11 = 2112;
      __int16 v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ connectionBecameEmpty %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v7 = self;
      id v8 = v4;
      _IDSLogV();
    }
    [(IDSUTunConnection *)self _dequeueMessages];
  }
}

- (void)retryWaitingMessages
{
  uint64_t v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:self->_priority];

  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    socketConnection = self->_socketConnection;
    *(_DWORD *)buf = 138412546;
    CFStringRef v9 = self;
    __int16 v10 = 2112;
    __int16 v11 = socketConnection;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ connectionBecameEmpty %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v6 = self;
    id v7 = self->_socketConnection;
    _IDSLogV();
  }
  [(IDSUTunConnection *)self _dequeueMessages];
}

- (void)connectionBecameEmpty
{
}

- (void)connectionDidReachInFlightMessageLowWaterMark:(id)a3
{
  id v4 = (IDSSocketPairConnectionProtocol *)a3;
  if (self->_socketConnection == v4)
  {
    id v5 = +[IDSDaemonPriorityQueueController sharedInstance];
    [v5 assertRunningWithPriority:self->_priority];

    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v10 = self;
      __int16 v11 = 2112;
      __int16 v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ connectionDidReachInFlightMessageLowWaterMark %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v7 = self;
      id v8 = v4;
      _IDSLogV();
    }
    [(IDSUTunConnection *)self _dequeueMessages];
  }
}

- (void)connectionDidReceiveBytes:(id)a3
{
  id v4 = (IDSSocketPairConnectionProtocol *)a3;
  if (self->_socketConnection == v4)
  {
    id v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v9 = self;
      __int16 v10 = 2112;
      __int16 v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ connectionDidReceiveBytes %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v6 = self;
      id v7 = v4;
      _IDSLogV();
    }
    [(IDSUTunConnection *)self _clearLastFallbackWithReason:@"local link did receive bytes", v6, v7];
    [(IDSUTunConnection *)self _dequeueMessages];
  }
}

- (void)forceOTRNegotiation:(id)a3 priority:(int64_t)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  CFStringRef v9 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v9 assertRunningWithPriority:a4];

  __int16 v10 = +[NSString stringWithFormat:@"%@-%u-%1u", v7, a4, 0];
  __int16 v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calling IDSOTRController:startOTRNegotiationWithDeviceIfNeeded to force session negotiation.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  __int16 v12 = +[IDSOTRController sharedInstance];
  [v12 setOTRTestBlockFromCompletionBlock:v8 token:v10];

  double v13 = +[IDSOTRController sharedInstance];
  [v13 startOTRNegotiationWithDeviceIfNeeded:IDSDeviceDefaultPairedDeviceUniqueID token:v10 reset:1 errorHandler:0];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)maxQueueSize
{
  return self->_maxQueueSize;
}

- (void)setMaxQueueSize:(unint64_t)a3
{
  self->_unint64_t maxQueueSize = a3;
}

- (NSString)cbuuid
{
  return self->_cbuuid;
}

- (void)setCbuuid:(id)a3
{
}

- (BOOL)isAlwaysConnected
{
  return self->_isAlwaysConnected;
}

- (void)setIsAlwaysConnected:(BOOL)a3
{
  self->_isAlwaysConnected = a3;
}

- (NSDictionary)cumulativeIncomingStatistics
{
  return &self->_cumulativeIncomingStatistics->super;
}

- (NSDictionary)cumulativeOutgoingStatistics
{
  return &self->_cumulativeOutgoingStatistics->super;
}

- (BOOL)isCloudEnabled
{
  return self->_isCloudEnabled;
}

- (void)setSupportedMessageTypes:(id)a3
{
}

- (double)rtt
{
  return self->_rtt;
}

- (int64_t)priority
{
  return self->_priority;
}

- (int64_t)idsPriority
{
  return self->_idsPriority;
}

- (void)setIdsPriority:(int64_t)a3
{
  self->_idsPriority = a3;
}

- (IDSUTunConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSUTunConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)enableOTR
{
  return self->_enableOTR;
}

- (BOOL)supportsLegacyOTRSessionToken
{
  return self->_supportsLegacyOTRSessionToken;
}

- (void)setSupportsLegacyOTRSessionToken:(BOOL)a3
{
  self->_supportsLegacyOTRSessionToken = a3;
}

- (void)setCloudConnection:(id)a3
{
}

- (unsigned)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setDataProtectionClass:(unsigned int)a3
{
  self->_dataProtectionClass = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_cloudConnection, 0);
  objc_storeStrong((id *)&self->_receivedResourceTransferUUIDs, 0);
  objc_storeStrong((id *)&self->_supportedMessageTypes, 0);
  objc_storeStrong((id *)&self->_incomingServiceMapUpdateCounter, 0);
  objc_storeStrong((id *)&self->_outgoingServiceMap, 0);
  objc_storeStrong((id *)&self->_incomingServiceMap, 0);
  objc_storeStrong((id *)&self->_admissionDeniedTopics, 0);
  objc_storeStrong((id *)&self->_resumingIncomingResourceTransfers, 0);
  objc_storeStrong((id *)&self->_resettingIncomingResourceTransfers, 0);
  objc_storeStrong((id *)&self->_incomingResourceTransfers, 0);
  objc_storeStrong((id *)&self->_lastFallback, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_cbuuid, 0);
  objc_storeStrong((id *)&self->_sendingPowerAssertion, 0);
  objc_storeStrong((id *)&self->_deliveryQueue, 0);
  objc_storeStrong((id *)&self->_otrTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dequeueTimer, 0);
  objc_storeStrong((id *)&self->_fallbackTimer, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_socketConnection, 0);
  objc_storeStrong((id *)&self->_dataProtectedIncomingMessages, 0);
  objc_storeStrong((id *)&self->_tokenToOTRError, 0);
  objc_storeStrong((id *)&self->_tokenToOTREncryptionQueue, 0);
  objc_storeStrong((id *)&self->_cumulativeIncomingStatistics, 0);
  objc_storeStrong((id *)&self->_cumulativeOutgoingStatistics, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_fallbackMessages, 0);
  objc_storeStrong((id *)&self->_sendingMessages, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end