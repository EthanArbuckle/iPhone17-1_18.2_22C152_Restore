@interface NMDeviceConnection
- (BOOL)_shouldIncludeTemporaryLocationAuthorizationWithMessage:(id)a3;
- (BOOL)canSendMessageWithType:(int)a3;
- (BOOL)isConnected;
- (BOOL)isNearbyAndUsable;
- (BOOL)shouldSendMessage:(id)a3;
- (NMDeviceConnection)init;
- (id)_idsOptionsForMessage:(id)a3 withOptions:(id)a4;
- (id)_messageQueueForType:(int)a3;
- (id)_nearbyConnectedDevice;
- (id)addMessageObserverForType:(int)a3 callback:(id)a4;
- (int64_t)_priorityForMessage:(id)a3;
- (unint64_t)_determineProtocolVersion:(id)a3;
- (unint64_t)protocolVersion;
- (void)_dequeueNextMessageIfNecessaryForType:(int)a3;
- (void)_sendMessage:(id)a3 options:(id)a4 force:(BOOL)a5 timeSpentEnqueued:(double)a6 withReply:(id)a7;
- (void)_sendReply:(id)a3 forMessage:(id)a4 options:(id)a5 force:(BOOL)a6 timeSpentEnqueued:(double)a7;
- (void)_unpauseAllQueues;
- (void)_updateReceiverProcessUUID:(id)a3;
- (void)addConnectionObserver:(id)a3;
- (void)cancelAllMessagesOfType:(int)a3;
- (void)removeConnectionObserver:(id)a3;
- (void)removeMessageObserver:(id)a3 forType:(int)a4;
- (void)sendMessage:(id)a3 options:(id)a4;
- (void)sendMessage:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)sendReply:(id)a3 forMessage:(id)a4 options:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setMessageQueue:(id)a3 forType:(int)a4;
- (void)start;
- (void)suspend;
- (void)test_disconnect;
- (void)test_reconnect;
- (void)updateConnectionStatus;
@end

@implementation NMDeviceConnection

- (NMDeviceConnection)init
{
  v31.receiver = self;
  v31.super_class = (Class)NMDeviceConnection;
  v2 = [(NMDeviceConnection *)&v31 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_initially_inactive(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.maps.deviceconnection", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.maps.proxy"];
    idsService = v2->_idsService;
    v2->_idsService = v7;

    [(IDSService *)v2->_idsService addDelegate:v2 queue:v2->_queue];
    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    replyCallbackBlocks = v2->_replyCallbackBlocks;
    v2->_replyCallbackBlocks = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    replyExpectingMessageMetadata = v2->_replyExpectingMessageMetadata;
    v2->_replyExpectingMessageMetadata = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    messageObservers = v2->_messageObservers;
    v2->_messageObservers = v13;

    v15 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___NMDeviceConnectionObserver queue:0];
    observers = v2->_observers;
    v2->_observers = v15;

    v17 = (NSLock *)objc_alloc_init((Class)NSLock);
    replyCallbackBlocksLock = v2->_replyCallbackBlocksLock;
    v2->_replyCallbackBlocksLock = v17;

    v19 = (NSLock *)objc_alloc_init((Class)NSLock);
    observersLock = v2->_observersLock;
    v2->_observersLock = v19;

    v21 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    messageQueuesLock = v2->_messageQueuesLock;
    v2->_messageQueuesLock = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    messageQueues = v2->_messageQueues;
    v2->_messageQueues = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    inFlightMessageMetadata = v2->_inFlightMessageMetadata;
    v2->_inFlightMessageMetadata = v25;

    v27 = (NSLock *)objc_alloc_init((Class)NSLock);
    receiverProcessUUIDLock = v2->_receiverProcessUUIDLock;
    v2->_receiverProcessUUIDLock = v27;

    [(NMDeviceConnection *)v2 updateConnectionStatus];
    v29 = v2;
  }

  return v2;
}

- (void)start
{
}

- (void)suspend
{
  if (self->_queue)
  {
    v3 = sub_100053EFC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "SIGTERM received. Suspending device connection.", v4, 2u);
    }

    dispatch_suspend((dispatch_object_t)self->_queue);
  }
}

- (void)_updateReceiverProcessUUID:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    [(NSLock *)self->_receiverProcessUUIDLock lock];
    if ([(NSString *)self->_receiverProcessUUID isEqualToString:v5])
    {
      [(NSLock *)self->_receiverProcessUUIDLock unlock];
    }
    else
    {
      v6 = sub_100053F94();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        receiverProcessUUID = self->_receiverProcessUUID;
        int v8 = 138478083;
        v9 = receiverProcessUUID;
        __int16 v10 = 2113;
        id v11 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Receiver process UUID changed (old: %{private}@, new: %{private}@). Requesting clients re-sync state if necessary.", (uint8_t *)&v8, 0x16u);
      }

      objc_storeStrong((id *)&self->_receiverProcessUUID, a3);
      [(NSLock *)self->_receiverProcessUUIDLock unlock];
      [(GEOObserverHashTable *)self->_observers connectionNeedsStateSynchronization:self];
    }
  }
}

- (id)_nearbyConnectedDevice
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(IDSService *)self->_idsService devices];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        if ([v6 isDefaultPairedDevice]
          && ([v6 isConnected] & 1) != 0)
        {
          id v3 = v6;
          goto LABEL_12;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (id)_messageQueueForType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(NSRecursiveLock *)self->_messageQueuesLock lock];
  messageQueues = self->_messageQueues;
  v6 = +[NSNumber numberWithInt:v3];
  v7 = [(NSMutableDictionary *)messageQueues objectForKey:v6];

  if (!v7)
  {
    v7 = objc_alloc_init(NMMessageQueue);
    long long v8 = self->_messageQueues;
    long long v9 = +[NSNumber numberWithInt:v3];
    [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];
  }
  [(NSRecursiveLock *)self->_messageQueuesLock unlock];

  return v7;
}

- (void)setMessageQueue:(id)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  messageQueuesLock = self->_messageQueuesLock;
  id v7 = a3;
  [(NSRecursiveLock *)messageQueuesLock lock];
  messageQueues = self->_messageQueues;
  long long v9 = +[NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)messageQueues setObject:v7 forKey:v9];

  long long v10 = self->_messageQueuesLock;

  [(NSRecursiveLock *)v10 unlock];
}

- (id)_idsOptionsForMessage:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = IDSSendMessageOptionBypassDuetKey;
  v22[0] = IDSSendMessageOptionEnforceRemoteTimeoutsKey;
  v22[1] = IDSSendMessageOptionBypassDuetKey;
  v23[0] = &__kCFBooleanTrue;
  v23[1] = &__kCFBooleanTrue;
  long long v9 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  id v10 = [v9 mutableCopy];

  long long v11 = [v7 objectForKey:@"NMSendMessageOptionTimeout"];

  if (v11)
  {
    v12 = [v7 objectForKeyedSubscript:@"NMSendMessageOptionTimeout"];
    [v10 setObject:v12 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
  }
  v13 = [v7 objectForKey:@"NMSendMessageOptionMapTile"];
  unsigned int v14 = [v13 BOOLValue];

  if (v14) {
    [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionMapTileKey];
  }
  uint64_t v15 = [v7 objectForKey:@"NMSendMessageOptionFireAndForget"];
  if (!v15
    || (v16 = (void *)v15,
        [v7 objectForKey:@"NMSendMessageOptionFireAndForget"],
        v17 = objc_claimAutoreleasedReturnValue(),
        unsigned int v18 = [v17 BOOLValue],
        v17,
        v16,
        v18))
  {
    [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionFireAndForgetKey];
  }
  v19 = [v7 objectForKeyedSubscript:@"NMSendMessageOptionDisableIDSCompressionKey"];
  unsigned int v20 = [v19 BOOLValue];

  if (v20) {
    [v10 setObject:&__kCFBooleanFalse forKeyedSubscript:IDSSendMessageOptionCompressPayloadKey];
  }
  if ((id)[(NMDeviceConnection *)self _priorityForMessage:v6] == (id)100) {
    [v10 removeObjectForKey:v8];
  }

  return v10;
}

- (int64_t)_priorityForMessage:(id)a3
{
  id v3 = a3;
  if ([v3 hasPriority])
  {
    id v4 = [v3 IDSMessagePriority];

    return (int64_t)v4;
  }
  int v6 = [v3 type];

  int64_t result = 300;
  if (v6 > 199)
  {
    if (v6 <= 499)
    {
      if ((v6 - 200) >= 6 && v6 != 308) {
        return result;
      }
    }
    else if ((v6 - 500) >= 3 && (v6 - 1500) >= 2 && v6 != 600)
    {
      return result;
    }
    return 200;
  }
  if ((v6 - 50) <= 0x35 && ((1 << (v6 - 50)) & 0x3C00000003AFFFLL) != 0
    || (v6 - 1) < 4)
  {
    return 200;
  }
  return result;
}

- (void)_dequeueNextMessageIfNecessaryForType:(int)a3
{
  id v5 = -[NMDeviceConnection _messageQueueForType:](self, "_messageQueueForType:");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CF50;
  block[3] = &unk_100082540;
  int v11 = a3;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, block);
}

- (void)_unpauseAllQueues
{
  [(NSRecursiveLock *)self->_messageQueuesLock lock];
  messageQueues = self->_messageQueues;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003DC48;
  v4[3] = &unk_100082568;
  v4[4] = self;
  [(NSMutableDictionary *)messageQueues enumerateKeysAndObjectsUsingBlock:v4];
  [(NSRecursiveLock *)self->_messageQueuesLock unlock];
}

- (BOOL)shouldSendMessage:(id)a3
{
  return 1;
}

- (BOOL)_shouldIncludeTemporaryLocationAuthorizationWithMessage:(id)a3
{
  id v3 = a3;
  int v4 = [v3 type];
  unsigned __int8 v5 = 1;
  if (v4 > 301)
  {
    if (v4 != 302 && v4 != 304) {
      goto LABEL_7;
    }
  }
  else if (v4 != 206)
  {
    if (v4 == 300)
    {
      int v6 = [v3 argumentForTag:401];
      unsigned __int8 v5 = [v6 hasDataValue];

      goto LABEL_8;
    }
LABEL_7:
    unsigned __int8 v5 = 0;
  }
LABEL_8:

  return v5;
}

- (void)sendMessage:(id)a3 options:(id)a4
{
}

- (void)sendMessage:(id)a3 options:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003E38C;
  v15[3] = &unk_100082590;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)_sendMessage:(id)a3 options:(id)a4 force:(BOOL)a5 timeSpentEnqueued:(double)a6 withReply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = (void (**)(id, void, void *))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_connected)
  {
    uint64_t v16 = [v13 objectForKeyedSubscript:@"NMSendMessageOptionFireAndForget"];
    if (!v16
      || (id v17 = (void *)v16,
          [v13 objectForKeyedSubscript:@"NMSendMessageOptionFireAndForget"],
          id v18 = objc_claimAutoreleasedReturnValue(),
          unsigned int v19 = [v18 BOOLValue],
          v18,
          v17,
          v19))
    {
      unsigned int v20 = sub_100053F94();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = [v12 shortDebugDescription];
        *(_DWORD *)buf = 138477827;
        v94 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Not sending message because device is not connected: %{private}@", buf, 0xCu);
      }
      if (v14)
      {
        uint64_t v22 = 3;
LABEL_15:
        v25 = +[NSError errorWithDomain:@"NMDeviceConnectionErrorDomain" code:v22 userInfo:0];
        v14[2](v14, 0, v25);
LABEL_176:

        goto LABEL_177;
      }
      goto LABEL_177;
    }
  }
  if ([(NMDeviceConnection *)self shouldSendMessage:v12])
  {
    if (a5)
    {
      unsigned __int8 v15 = 1;
    }
    else
    {
      v26 = [v13 objectForKeyedSubscript:@"NMSendMessageOptionSendImmediately"];
      unsigned __int8 v15 = [v26 BOOLValue];
    }
    v25 = -[NMDeviceConnection _messageQueueForType:](self, "_messageQueueForType:", [v12 type]);
    if (!-[NMDeviceConnection canSendMessageWithType:](self, "canSendMessageWithType:", [v12 type]))
    {
      v29 = sub_100053F94();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = [v12 shortDebugDescription];
        *(_DWORD *)buf = 138477827;
        v94 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Not sending message because remote device does not support it: %{private}@", buf, 0xCu);
      }
      if (v14)
      {
        objc_super v31 = +[NSError errorWithDomain:@"NMDeviceConnectionErrorDomain" code:6 userInfo:0];
        v14[2](v14, 0, v31);
      }
      goto LABEL_176;
    }
    if (([v25 isPaused] & 1) != 0
      || (v15 & 1) == 0 && ([v25 shouldSendNewPayload] & 1) == 0)
    {
      v27 = sub_100053F94();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = [v12 shortDebugDescription];
        *(_DWORD *)buf = 138477827;
        v94 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Cannot send message now, adding to queue: %{private}@", buf, 0xCu);
      }
      [v25 enqueueMessage:v12 options:v13 reply:v14];
      goto LABEL_176;
    }
    v32 = sub_10003F5D8();
    [v12 setSenderUUID:v32];

    [v12 setSentTimestamp:CFAbsoluteTimeGetCurrent()];
    if (a6 > 0.0) {
      [v12 setEnqueuedTimeInterval:a6];
    }
    if (![(NMDeviceConnection *)self _shouldIncludeTemporaryLocationAuthorizationWithMessage:v12])goto LABEL_115; {
    id v92 = 0;
    }
    v33 = +[CLLocationManager _getClientTransientAuthorizationInfoForBundleId:@"com.apple.Maps" error:&v92];
    v34 = (char *)v92;
    v35 = sub_100053F94();
    v36 = v35;
    if (v34 || !v33)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v94 = v34;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Error getting transient location authorization: %@", buf, 0xCu);
      }
      goto LABEL_114;
    }
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
LABEL_113:

      v36 = objc_alloc_init(NMArgument);
      [v36 setTag:600];
      [v36 setDataValue:v33];
      [v12 addArgument:v36];
LABEL_114:

LABEL_115:
      v84 = [v12 data];
      v39 = [(NMDeviceConnection *)self _idsOptionsForMessage:v12 withOptions:v13];
      v40 = v39;
      if (v14)
      {
        if (v39)
        {
          id v41 = [v39 mutableCopy];
        }
        else
        {
          id v41 = +[NSMutableDictionary dictionary];
        }
        id v42 = v41;
        [v41 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionExpectsPeerResponseKey];

        v82 = v42;
      }
      else
      {
        v82 = v39;
      }
      int64_t v43 = [(NMDeviceConnection *)self _priorityForMessage:v12];
      v44 = [v13 objectForKeyedSubscript:@"NMSendMessageOptionUrgent"];

      if (v44)
      {
        v45 = [v13 objectForKeyedSubscript:@"NMSendMessageOptionUrgent"];
        if ([v45 BOOLValue]) {
          int64_t v43 = 300;
        }
        else {
          int64_t v43 = 200;
        }
      }
      id v46 = [v84 length];
      unint64_t v47 = (unint64_t)v46;
      if (v43 == 300 && (unint64_t)v46 > 0x100000)
      {
        v48 = sub_100053F94();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v94 = (const char *)v47;
          __int16 v95 = 2048;
          uint64_t v96 = 0x100000;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Degrading message from Urgent to Default priority due to size (%luB / %luB)", buf, 0x16u);
        }

        int64_t v43 = 200;
      }
      if (v47 > 0x500000)
      {
        v49 = sub_100053F94();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v94 = (const char *)v47;
          __int16 v95 = 2048;
          uint64_t v96 = 5242880;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Message exceeds maximum permitted and will likely fail (%luB / %luB)", buf, 0x16u);
        }
      }
      idsService = self->_idsService;
      v51 = [(IDSService *)idsService accounts];
      v52 = [v51 anyObject];
      v53 = +[NSSet setWithObject:IDSDefaultPairedDevice];
      id v90 = 0;
      id v91 = 0;
      int64_t v54 = v43;
      v55 = v82;
      LODWORD(idsService) = [(IDSService *)idsService sendData:v84 fromAccount:v52 toDestinations:v53 priority:v54 options:v82 identifier:&v91 error:&v90];
      id v83 = v91;
      id v81 = v90;

      v56 = sub_100053F94();
      v57 = v56;
      if (idsService)
      {
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          v58 = [v12 shortDebugDescription];
          id v59 = [v84 length];
          if (v13)
          {
            v60 = +[NSString stringWithFormat:@", options: %@", v13];
          }
          else
          {
            v60 = &stru_100083E20;
          }
          if (a6 <= 0.0)
          {
            v65 = &stru_100083E20;
          }
          else
          {
            v65 = +[NSString stringWithFormat:@", enqueued time: %f", *(void *)&a6];
          }
          *(_DWORD *)buf = 138478851;
          v94 = v58;
          __int16 v95 = 2048;
          uint64_t v96 = (uint64_t)v59;
          __int16 v97 = 2113;
          v98 = v60;
          __int16 v99 = 2113;
          v100 = v65;
          __int16 v101 = 2113;
          id v102 = v83;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "Sending message: %{private}@ (size = %lu%{private}@%{private}@, GUID = %{private}@)", buf, 0x34u);
          if (a6 > 0.0) {

          }
          v55 = v82;
          if (v13) {
        }
          }
        v66 = sub_100053F94();
        v64 = v83;
        v61 = v81;
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          v94 = (const char *)v12;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "Message contents to be sent: %{private}@", buf, 0xCu);
        }

        v67 = objc_alloc_init(_NMSentMessageMetadata);
        -[_NMSentMessageMetadata setType:](v67, "setType:", [v12 type]);
        [v12 sentTimestamp];
        -[_NMSentMessageMetadata setTimestamp:](v67, "setTimestamp:");
        -[_NMSentMessageMetadata setPayloadSize:](v67, "setPayloadSize:", [v84 length]);
        [(_NMSentMessageMetadata *)v67 setReply:0];
        objc_msgSend(v25, "willSendPayloadWithSize:", -[_NMSentMessageMetadata payloadSize](v67, "payloadSize"));
        if (v83)
        {
          if (v14)
          {
            [(NSLock *)self->_replyCallbackBlocksLock lock];
            replyCallbackBlocks = self->_replyCallbackBlocks;
            id v69 = [v14 copy];
            [(NSMutableDictionary *)replyCallbackBlocks setObject:v69 forKey:v83];

            v70 = [v13 objectForKey:@"NMSendMessageOptionReplyTimeout"];
            if (v70)
            {
              v71 = [v13 objectForKeyedSubscript:@"NMSendMessageOptionReplyTimeout"];
              [v71 doubleValue];
              uint64_t delta = (uint64_t)(v72 * 1000000000.0);

              v55 = v82;
            }
            else
            {
              uint64_t delta = 120000000000;
            }

            v77 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
            v64 = v83;
            if (v77)
            {
              dispatch_time_t v78 = dispatch_time(0, delta);
              dispatch_source_set_timer(v77, v78, 0xFFFFFFFFFFFFFFFFLL, 0);
              handler[0] = _NSConcreteStackBlock;
              handler[1] = 3221225472;
              handler[2] = sub_10003F62C;
              handler[3] = &unk_1000825B8;
              id v86 = v12;
              id v87 = v83;
              v88 = self;
              v79 = v67;
              v89 = v79;
              dispatch_source_set_event_handler(v77, handler);
              [(_NMSentMessageMetadata *)v79 setTimeoutTimer:v77];
              dispatch_resume(v77);
            }
            [(NSMutableDictionary *)self->_replyExpectingMessageMetadata setObject:v67 forKey:v83];
            [(NSLock *)self->_replyCallbackBlocksLock unlock];

            v61 = v81;
          }
          [(NSMutableDictionary *)self->_inFlightMessageMetadata setObject:v67 forKey:v64];
        }
        else
        {
          v73 = sub_100053F94();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "ERROR: Did not receive an identifier for sent message", buf, 2u);
          }

          v74 = sub_100053B6C();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v94 = "-[NMDeviceConnection _sendMessage:options:force:timeSpentEnqueued:withReply:]";
            __int16 v95 = 2080;
            uint64_t v96 = (uint64_t)"NMDeviceConnection.m";
            __int16 v97 = 1024;
            LODWORD(v98) = 506;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
          }

          if (sub_1000064B4())
          {
            v75 = sub_100053B6C();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
            {
              v76 = +[NSThread callStackSymbols];
              *(_DWORD *)buf = 138412290;
              v94 = v76;
              _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
            }
          }
        }
      }
      else
      {
        v61 = v81;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v62 = [v12 shortDebugDescription];
          *(_DWORD *)buf = 138478083;
          v94 = v62;
          __int16 v95 = 2113;
          uint64_t v96 = (uint64_t)v81;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Error sending message: messageType=%{private}@ -- %{private}@", buf, 0x16u);
        }
        v63 = sub_100053F94();
        v64 = v83;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          v94 = (const char *)v12;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "Message contents which failed: %{private}@", buf, 0xCu);
        }

        if (v14) {
          v14[2](v14, 0, v81);
        }
        -[NMDeviceConnection _dequeueNextMessageIfNecessaryForType:](self, "_dequeueNextMessageIfNecessaryForType:", [v12 type]);
      }

      goto LABEL_176;
    }
    id v37 = [v12 type];
    if ((int)v37 <= 199)
    {
      switch((int)v37)
      {
        case '2':
          v38 = @"START_INITIAL_SYNC";
          break;
        case '3':
          v38 = @"FETCH_CURRENT_COUNTRY_CODE";
          break;
        case '4':
          v38 = @"FETCH_EXPERIMENTS_CONFIG";
          break;
        case '5':
          v38 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
          break;
        case '6':
          v38 = @"SYNC_UP_NEXT_ITEMS";
          break;
        case '7':
          v38 = @"REQUEST_UP_NEXT_ITEMS";
          break;
        case '8':
          v38 = @"SYNC_CONFIG_STORE";
          break;
        case '9':
          v38 = @"CHECKIN_WITH_CONFIG_STORE";
          break;
        case ':':
          v38 = @"REQUEST_ANALYTIC_IDENTIFIERS";
          break;
        case ';':
          v38 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
          break;
        case '<':
          v38 = @"SYNC_SUBSCRIPTION_INFO";
          break;
        case '=':
          v38 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
          break;
        case '>':
          goto LABEL_65;
        case '?':
          v38 = @"UPDATE_SUBSCRIPTION_STATE";
          break;
        case '@':
          v38 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
          break;
        case 'A':
          v38 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
          break;
        case 'B':
          v38 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
          break;
        case 'C':
          v38 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
          break;
        default:
          if (v37 > 0xC7)
          {
            switch((int)v37)
            {
              case 'd':
                v38 = @"CHECKIN_WITH_TILE_GROUP";
                break;
              case 'e':
                v38 = @"FORCE_UPDATE_MANIFEST";
                break;
              case 'f':
                v38 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
                break;
              case 'g':
                v38 = @"FETCH_RESOURCE";
                break;
              default:
                goto LABEL_65;
            }
          }
          else
          {
            v38 = @"FETCH_TILES";
            switch((int)v37)
            {
              case 1:
                goto LABEL_112;
              case 2:
                v38 = @"CANCEL_TILES";
                break;
              case 3:
                v38 = @"REPORT_CORRUPT_TILE";
                break;
              case 4:
                v38 = @"FETCHED_TILE";
                break;
              default:
                JUMPOUT(0);
            }
          }
          return;
      }
      goto LABEL_112;
    }
    if ((int)v37 <= 400)
    {
      switch((int)v37)
      {
        case 300:
          v38 = @"UPDATE_NAV_ROUTE_DETAILS";
          break;
        case 301:
          v38 = @"UPDATE_NAV_ROUTE_STATUS";
          break;
        case 302:
          v38 = @"START_NAV";
          break;
        case 303:
          v38 = @"STOP_NAV";
          break;
        case 304:
          v38 = @"PREVIEW_NAV";
          break;
        case 305:
          v38 = @"CLEAR_NAV_PREVIEW";
          break;
        case 306:
          v38 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
          break;
        case 307:
          v38 = @"DISMISS_NAV_SAFETY_ALERT";
          break;
        case 308:
          v38 = @"AVAILABLE_ROUTE";
          break;
        case 309:
          v38 = @"SELECTED_ROUTE";
          break;
        case 310:
          v38 = @"REQUEST_NAVIGATION_UPDATE";
          break;
        case 311:
          v38 = @"UPDATE_NAV_ROUTE_UPDATE";
          break;
        case 312:
          v38 = @"AVAILABLE_ROUTE_UPDATE";
          break;
        case 313:
          v38 = @"PAUSE_NAV";
          break;
        case 314:
          v38 = @"RESUME_NAV";
          break;
        case 315:
          v38 = @"SET_DISPLAYED_STEP";
          break;
        default:
          switch((int)v37)
          {
            case 200:
              v38 = @"START_LOCATION_UPDATE";
              break;
            case 201:
              v38 = @"STOP_LOCATION_UPDATE";
              break;
            case 202:
              v38 = @"UPDATED_LOCATION";
              break;
            case 203:
              v38 = @"FAILED_TO_UPDATE_LOCATION";
              break;
            case 204:
              v38 = @"DID_PAUSE_LOCATION_UPDATES";
              break;
            case 205:
              v38 = @"DID_RESUME_LOCATION_UPDATES";
              break;
            case 206:
              v38 = @"APPLY_LOCATION_AUTHORIZATION";
              break;
            default:
              goto LABEL_65;
          }
          break;
      }
      goto LABEL_112;
    }
    if ((int)v37 > 599)
    {
      if ((int)v37 > 1499)
      {
        if (v37 == 1500)
        {
          v38 = @"DEBUG_FETCH_CONFIGURATION_INFO";
          goto LABEL_112;
        }
        if (v37 == 1501)
        {
          v38 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
          goto LABEL_112;
        }
      }
      else
      {
        if (v37 == 600)
        {
          v38 = @"FETCH_ROUTE_GENIUS";
          goto LABEL_112;
        }
        if (v37 == 1000)
        {
          v38 = @"PING";
          goto LABEL_112;
        }
      }
    }
    else if ((int)v37 > 500)
    {
      if (v37 == 501)
      {
        v38 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
        goto LABEL_112;
      }
      if (v37 == 502)
      {
        v38 = @"SERVICE_REQUEST";
        goto LABEL_112;
      }
    }
    else
    {
      if (v37 == 401)
      {
        v38 = @"OPEN_URL";
        goto LABEL_112;
      }
      if (v37 == 500)
      {
        v38 = @"PLACE_DATA_MUID_LOOKUP";
LABEL_112:
        *(_DWORD *)buf = 138412290;
        v94 = (const char *)v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Attaching transient location authorization to message %@", buf, 0xCu);

        goto LABEL_113;
      }
    }
LABEL_65:
    v38 = +[NSString stringWithFormat:@"(unknown: %i)", v37];
    goto LABEL_112;
  }
  v23 = sub_100053F94();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = [v12 shortDebugDescription];
    *(_DWORD *)buf = 138477827;
    v94 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Not sending message because connection was short circuited: %{private}@", buf, 0xCu);
  }
  if (v14)
  {
    uint64_t v22 = 4;
    goto LABEL_15;
  }
LABEL_177:
}

- (void)sendReply:(id)a3 forMessage:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003F8F0;
  v15[3] = &unk_1000825B8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)_sendReply:(id)a3 forMessage:(id)a4 options:(id)a5 force:(BOOL)a6 timeSpentEnqueued:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v12 && v13)
  {
    if (self->_connected) {
      goto LABEL_4;
    }
    uint64_t v16 = [v14 objectForKeyedSubscript:@"NMSendMessageOptionFireAndForget"];
    if (!v16) {
      goto LABEL_8;
    }
    id v17 = (void *)v16;
    id v18 = [v14 objectForKeyedSubscript:@"NMSendMessageOptionFireAndForget"];
    unsigned int v19 = [v18 BOOLValue];

    if (!v19)
    {
LABEL_4:
      if (a6)
      {
        unsigned __int8 v15 = 1;
      }
      else
      {
        uint64_t v22 = [v14 objectForKeyedSubscript:@"NMSendMessageOptionSendImmediately"];
        unsigned __int8 v15 = [v22 BOOLValue];
      }
      v23 = -[NMDeviceConnection _messageQueueForType:](self, "_messageQueueForType:", [v13 type]);
      unsigned int v20 = v23;
      if (v15 & 1) != 0 || ([v23 shouldSendNewPayload])
      {
        double Current = CFAbsoluteTimeGetCurrent();
        v25 = objc_getAssociatedObject(v13, &unk_10009B828);
        if (v25)
        {
          v26 = sub_10003F5D8();
          [v12 setSenderUUID:v26];

          if (([v12 hasResponseTime] & 1) == 0)
          {
            [v25 requestReceivedTimestamp];
            [v12 setResponseTime:Current - v27];
          }
          v55 = v20;
          if (a7 > 0.0) {
            [v12 setEnqueuedTimeInterval:a7];
          }
          [v25 requestReceivedTimestamp];
          objc_msgSend(v12, "setRequestReceivedTimestamp:");
          [v12 setSentTimestamp:Current];
          uint64_t v28 = [v12 data];
          v29 = [v25 idsMessageIdentifier];
          v30 = +[NSMutableDictionary dictionaryWithObject:v29 forKey:IDSSendMessageOptionPeerResponseIdentifierKey];

          uint64_t v31 = [(NMDeviceConnection *)self _idsOptionsForMessage:v13 withOptions:v14];
          if (v31) {
            [v30 addEntriesFromDictionary:v31];
          }
          int64_t v32 = [(NMDeviceConnection *)self _priorityForReply:v13];
          v33 = [v14 objectForKeyedSubscript:@"NMSendMessageOptionUrgent"];

          v56 = v25;
          id v59 = v30;
          int64_t v54 = (void *)v31;
          if (v33)
          {
            v34 = [v14 objectForKeyedSubscript:@"NMSendMessageOptionUrgent"];
            if ([v34 BOOLValue]) {
              int64_t v32 = 300;
            }
            else {
              int64_t v32 = 200;
            }
          }
          idsService = self->_idsService;
          v36 = [(IDSService *)idsService accounts];
          id v37 = [v36 anyObject];
          v38 = +[NSSet setWithObject:IDSDefaultPairedDevice];
          id v60 = 0;
          id v61 = 0;
          LODWORD(idsService) = [(IDSService *)idsService sendData:v28 fromAccount:v37 toDestinations:v38 priority:v32 options:v59 identifier:&v61 error:&v60];
          id v57 = v61;
          id v58 = v60;

          v39 = sub_100053F94();
          v40 = v39;
          if (idsService)
          {
            id v41 = v28;
            id v42 = v54;
            unsigned int v20 = v55;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              v52 = [v13 shortDebugDescription];
              id v43 = [v41 length];
              [v12 responseTime];
              uint64_t v45 = v44;
              if (v14)
              {
                v53 = +[NSString stringWithFormat:@", options: %@", v14];
              }
              else
              {
                v53 = &stru_100083E20;
              }
              if (a7 <= 0.0)
              {
                v48 = &stru_100083E20;
              }
              else
              {
                v48 = +[NSString stringWithFormat:@", enqueued time: %f", *(void *)&a7];
              }
              *(_DWORD *)buf = 138479107;
              id v63 = v52;
              __int16 v64 = 2048;
              id v65 = v43;
              __int16 v66 = 2048;
              uint64_t v67 = v45;
              __int16 v68 = 2113;
              id v69 = v53;
              __int16 v70 = 2113;
              v71 = v48;
              __int16 v72 = 2113;
              id v73 = v57;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Sending reply for original message: %{private}@ (size = %lu, response time = %f%{private}@%{private}@, GUID = %{private}@)", buf, 0x3Eu);
              if (a7 > 0.0) {

              }
              if (v14) {
            }
              }

            v49 = sub_100053F94();
            v25 = v56;
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138478083;
              id v63 = v12;
              __int16 v64 = 2113;
              id v65 = v13;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "Reply contents to be sent: %{private}@\n Original message contents: %{private}@", buf, 0x16u);
            }

            v50 = objc_alloc_init(_NMSentMessageMetadata);
            -[_NMSentMessageMetadata setType:](v50, "setType:", [v13 type]);
            [v13 sentTimestamp];
            -[_NMSentMessageMetadata setTimestamp:](v50, "setTimestamp:");
            [(_NMSentMessageMetadata *)v50 setPayloadSize:[v41 length]];
            [(_NMSentMessageMetadata *)v50 setReply:1];
            [v55 willSendPayloadWithSize:[(_NMSentMessageMetadata *)v50 payloadSize]];
            inFlightMessageMetadata = self->_inFlightMessageMetadata;
            unint64_t v47 = v57;
            [(NSMutableDictionary *)inFlightMessageMetadata setObject:v50 forKey:v57];
          }
          else
          {
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              id v46 = [v13 shortDebugDescription];
              *(_DWORD *)buf = 138543618;
              id v63 = v46;
              __int16 v64 = 2114;
              id v65 = v58;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Error sending reply to message: messageType=%{public}@ -- %{public}@", buf, 0x16u);
            }
            -[NMDeviceConnection _dequeueNextMessageIfNecessaryForType:](self, "_dequeueNextMessageIfNecessaryForType:", [v13 type]);
            id v41 = v28;
            unsigned int v20 = v55;
            v25 = v56;
            id v42 = v54;
            unint64_t v47 = v57;
          }
        }
        else
        {
          id v41 = sub_100053F94();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v63 = v13;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Sending reply to unknown message '%{public}@'. Ignoring...", buf, 0xCu);
          }
        }
      }
      else
      {
        [v20 enqueueReply:v12 forMessage:v13 options:v14];
      }
    }
    else
    {
LABEL_8:
      unsigned int v20 = sub_100053F94();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = [v13 shortDebugDescription];
        *(_DWORD *)buf = 138477827;
        id v63 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Not sending reply because device is not connected. Original message: %{private}@", buf, 0xCu);
      }
    }
  }
}

- (void)cancelAllMessagesOfType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v4 = -[NMDeviceConnection _messageQueueForType:](self, "_messageQueueForType:");
  id v5 = [v4 count];
  if (v5)
  {
    id v6 = v5;
    id v7 = sub_100053F94();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
LABEL_80:

      [v4 removeAllMessages];
      goto LABEL_81;
    }
    if ((int)v3 <= 199)
    {
      switch((int)v3)
      {
        case '2':
          id v8 = @"START_INITIAL_SYNC";
          break;
        case '3':
          id v8 = @"FETCH_CURRENT_COUNTRY_CODE";
          break;
        case '4':
          id v8 = @"FETCH_EXPERIMENTS_CONFIG";
          break;
        case '5':
          id v8 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
          break;
        case '6':
          id v8 = @"SYNC_UP_NEXT_ITEMS";
          break;
        case '7':
          id v8 = @"REQUEST_UP_NEXT_ITEMS";
          break;
        case '8':
          id v8 = @"SYNC_CONFIG_STORE";
          break;
        case '9':
          id v8 = @"CHECKIN_WITH_CONFIG_STORE";
          break;
        case ':':
          id v8 = @"REQUEST_ANALYTIC_IDENTIFIERS";
          break;
        case ';':
          id v8 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
          break;
        case '<':
          id v8 = @"SYNC_SUBSCRIPTION_INFO";
          break;
        case '=':
          id v8 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
          break;
        case '>':
          goto LABEL_32;
        case '?':
          id v8 = @"UPDATE_SUBSCRIPTION_STATE";
          break;
        case '@':
          id v8 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
          break;
        case 'A':
          id v8 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
          break;
        case 'B':
          id v8 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
          break;
        case 'C':
          id v8 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
          break;
        default:
          int v9 = v3 - 1;
          if (v3 > 0xC7)
          {
            switch((int)v3)
            {
              case 'd':
                id v8 = @"CHECKIN_WITH_TILE_GROUP";
                break;
              case 'e':
                id v8 = @"FORCE_UPDATE_MANIFEST";
                break;
              case 'f':
                id v8 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
                break;
              case 'g':
                id v8 = @"FETCH_RESOURCE";
                break;
              default:
                goto LABEL_32;
            }
          }
          else
          {
            id v8 = @"FETCH_TILES";
            switch(v9)
            {
              case 0:
                goto LABEL_79;
              case 1:
                id v8 = @"CANCEL_TILES";
                break;
              case 2:
                id v8 = @"REPORT_CORRUPT_TILE";
                break;
              case 3:
                id v8 = @"FETCHED_TILE";
                break;
              default:
                JUMPOUT(0);
            }
          }
          return;
      }
      goto LABEL_79;
    }
    if ((int)v3 <= 400)
    {
      switch((int)v3)
      {
        case 300:
          id v8 = @"UPDATE_NAV_ROUTE_DETAILS";
          break;
        case 301:
          id v8 = @"UPDATE_NAV_ROUTE_STATUS";
          break;
        case 302:
          id v8 = @"START_NAV";
          break;
        case 303:
          id v8 = @"STOP_NAV";
          break;
        case 304:
          id v8 = @"PREVIEW_NAV";
          break;
        case 305:
          id v8 = @"CLEAR_NAV_PREVIEW";
          break;
        case 306:
          id v8 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
          break;
        case 307:
          id v8 = @"DISMISS_NAV_SAFETY_ALERT";
          break;
        case 308:
          id v8 = @"AVAILABLE_ROUTE";
          break;
        case 309:
          id v8 = @"SELECTED_ROUTE";
          break;
        case 310:
          id v8 = @"REQUEST_NAVIGATION_UPDATE";
          break;
        case 311:
          id v8 = @"UPDATE_NAV_ROUTE_UPDATE";
          break;
        case 312:
          id v8 = @"AVAILABLE_ROUTE_UPDATE";
          break;
        case 313:
          id v8 = @"PAUSE_NAV";
          break;
        case 314:
          id v8 = @"RESUME_NAV";
          break;
        case 315:
          id v8 = @"SET_DISPLAYED_STEP";
          break;
        default:
          switch((int)v3)
          {
            case 200:
              id v8 = @"START_LOCATION_UPDATE";
              break;
            case 201:
              id v8 = @"STOP_LOCATION_UPDATE";
              break;
            case 202:
              id v8 = @"UPDATED_LOCATION";
              break;
            case 203:
              id v8 = @"FAILED_TO_UPDATE_LOCATION";
              break;
            case 204:
              id v8 = @"DID_PAUSE_LOCATION_UPDATES";
              break;
            case 205:
              id v8 = @"DID_RESUME_LOCATION_UPDATES";
              break;
            case 206:
              id v8 = @"APPLY_LOCATION_AUTHORIZATION";
              break;
            default:
              goto LABEL_32;
          }
          break;
      }
      goto LABEL_79;
    }
    if ((int)v3 > 599)
    {
      if ((int)v3 > 1499)
      {
        if (v3 == 1500)
        {
          id v8 = @"DEBUG_FETCH_CONFIGURATION_INFO";
          goto LABEL_79;
        }
        if (v3 == 1501)
        {
          id v8 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
          goto LABEL_79;
        }
      }
      else
      {
        if (v3 == 600)
        {
          id v8 = @"FETCH_ROUTE_GENIUS";
          goto LABEL_79;
        }
        if (v3 == 1000)
        {
          id v8 = @"PING";
          goto LABEL_79;
        }
      }
    }
    else if ((int)v3 > 500)
    {
      if (v3 == 501)
      {
        id v8 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
        goto LABEL_79;
      }
      if (v3 == 502)
      {
        id v8 = @"SERVICE_REQUEST";
        goto LABEL_79;
      }
    }
    else
    {
      if (v3 == 401)
      {
        id v8 = @"OPEN_URL";
        goto LABEL_79;
      }
      if (v3 == 500)
      {
        id v8 = @"PLACE_DATA_MUID_LOOKUP";
LABEL_79:
        *(_DWORD *)buf = 134218242;
        id v11 = v6;
        __int16 v12 = 2112;
        id v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Cancelling %lu %@ messages in queue", buf, 0x16u);

        goto LABEL_80;
      }
    }
LABEL_32:
    id v8 = +[NSString stringWithFormat:@"(unknown: %i)", v3];
    goto LABEL_79;
  }
LABEL_81:
}

- (BOOL)canSendMessageWithType:(int)a3
{
  return 1;
}

- (unint64_t)protocolVersion
{
  unint64_t result = self->_protocolVersion;
  if (!result)
  {
    int v4 = +[NRPairedDeviceRegistry sharedInstance];
    id v5 = [v4 getActivePairedDevice];

    if (v5)
    {
      self->_protocolVersion = [(NMDeviceConnection *)self _determineProtocolVersion:v5];

      return self->_protocolVersion;
    }
    else
    {
      return 6;
    }
  }
  return result;
}

- (unint64_t)_determineProtocolVersion:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"9FFD76FA-21FC-46AE-8AAB-14FB3F692B28"];
  unsigned __int8 v5 = [v3 supportsCapability:v4];

  if (v5)
  {
    unint64_t v6 = 6;
  }
  else
  {
    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"AC953E03-CAB8-4508-9145-EA5D629BCDAC"];
    unsigned __int8 v8 = [v3 supportsCapability:v7];

    if (v8)
    {
      unint64_t v6 = 5;
    }
    else
    {
      id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"CBAC2DE5-C7A2-4DA2-932B-E57BABEA3B97"];
      unsigned __int8 v10 = [v3 supportsCapability:v9];

      if (v10)
      {
        unint64_t v6 = 4;
      }
      else
      {
        id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"5C068089-C478-48CE-892A-13DBA45BE33A"];
        unsigned __int8 v12 = [v3 supportsCapability:v11];

        if (v12)
        {
          unint64_t v6 = 3;
        }
        else
        {
          id v13 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"AC310276-2B5D-4C25-A6AC-7D59ED5CB5D3"];
          unsigned int v14 = [v3 supportsCapability:v13];

          if (v14) {
            unint64_t v6 = 2;
          }
          else {
            unint64_t v6 = 1;
          }
        }
      }
    }
  }

  return v6;
}

- (id)addMessageObserverForType:(int)a3 callback:(id)a4
{
  if (!a4)
  {
    unsigned __int8 v8 = 0;
    goto LABEL_84;
  }
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = +[NSUUID UUID];
  unsigned __int8 v8 = [v7 UUIDString];

  [(NSLock *)self->_observersLock lock];
  messageObservers = self->_messageObservers;
  unsigned __int8 v10 = +[NSNumber numberWithInt:v4];
  id v11 = [(NSMutableDictionary *)messageObservers objectForKeyedSubscript:v10];

  if (!v11)
  {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    unsigned __int8 v12 = self->_messageObservers;
    id v13 = +[NSNumber numberWithInt:v4];
    [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];
  }
  unsigned int v14 = sub_100053F94();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    if ((int)v4 <= 199)
    {
      switch((int)v4)
      {
        case '2':
          unsigned __int8 v15 = @"START_INITIAL_SYNC";
          break;
        case '3':
          unsigned __int8 v15 = @"FETCH_CURRENT_COUNTRY_CODE";
          break;
        case '4':
          unsigned __int8 v15 = @"FETCH_EXPERIMENTS_CONFIG";
          break;
        case '5':
          unsigned __int8 v15 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
          break;
        case '6':
          unsigned __int8 v15 = @"SYNC_UP_NEXT_ITEMS";
          break;
        case '7':
          unsigned __int8 v15 = @"REQUEST_UP_NEXT_ITEMS";
          break;
        case '8':
          unsigned __int8 v15 = @"SYNC_CONFIG_STORE";
          break;
        case '9':
          unsigned __int8 v15 = @"CHECKIN_WITH_CONFIG_STORE";
          break;
        case ':':
          unsigned __int8 v15 = @"REQUEST_ANALYTIC_IDENTIFIERS";
          break;
        case ';':
          unsigned __int8 v15 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
          break;
        case '<':
          unsigned __int8 v15 = @"SYNC_SUBSCRIPTION_INFO";
          break;
        case '=':
          unsigned __int8 v15 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
          break;
        case '>':
          goto LABEL_35;
        case '?':
          unsigned __int8 v15 = @"UPDATE_SUBSCRIPTION_STATE";
          break;
        case '@':
          unsigned __int8 v15 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
          break;
        case 'A':
          unsigned __int8 v15 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
          break;
        case 'B':
          unsigned __int8 v15 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
          break;
        case 'C':
          unsigned __int8 v15 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
          break;
        default:
          int v16 = v4 - 1;
          if (v4 > 0xC7)
          {
            switch((int)v4)
            {
              case 'd':
                unsigned __int8 v15 = @"CHECKIN_WITH_TILE_GROUP";
                break;
              case 'e':
                unsigned __int8 v15 = @"FORCE_UPDATE_MANIFEST";
                break;
              case 'f':
                unsigned __int8 v15 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
                break;
              case 'g':
                unsigned __int8 v15 = @"FETCH_RESOURCE";
                break;
              default:
                goto LABEL_35;
            }
          }
          else
          {
            unsigned __int8 v15 = @"FETCH_TILES";
            switch(v16)
            {
              case 0:
                goto LABEL_82;
              case 1:
                unsigned __int8 v15 = @"CANCEL_TILES";
                break;
              case 2:
                unsigned __int8 v15 = @"REPORT_CORRUPT_TILE";
                break;
              case 3:
                unsigned __int8 v15 = @"FETCHED_TILE";
                break;
              default:
                JUMPOUT(0);
            }
          }
          return result;
      }
      goto LABEL_82;
    }
    if ((int)v4 <= 400)
    {
      switch((int)v4)
      {
        case 300:
          unsigned __int8 v15 = @"UPDATE_NAV_ROUTE_DETAILS";
          break;
        case 301:
          unsigned __int8 v15 = @"UPDATE_NAV_ROUTE_STATUS";
          break;
        case 302:
          unsigned __int8 v15 = @"START_NAV";
          break;
        case 303:
          unsigned __int8 v15 = @"STOP_NAV";
          break;
        case 304:
          unsigned __int8 v15 = @"PREVIEW_NAV";
          break;
        case 305:
          unsigned __int8 v15 = @"CLEAR_NAV_PREVIEW";
          break;
        case 306:
          unsigned __int8 v15 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
          break;
        case 307:
          unsigned __int8 v15 = @"DISMISS_NAV_SAFETY_ALERT";
          break;
        case 308:
          unsigned __int8 v15 = @"AVAILABLE_ROUTE";
          break;
        case 309:
          unsigned __int8 v15 = @"SELECTED_ROUTE";
          break;
        case 310:
          unsigned __int8 v15 = @"REQUEST_NAVIGATION_UPDATE";
          break;
        case 311:
          unsigned __int8 v15 = @"UPDATE_NAV_ROUTE_UPDATE";
          break;
        case 312:
          unsigned __int8 v15 = @"AVAILABLE_ROUTE_UPDATE";
          break;
        case 313:
          unsigned __int8 v15 = @"PAUSE_NAV";
          break;
        case 314:
          unsigned __int8 v15 = @"RESUME_NAV";
          break;
        case 315:
          unsigned __int8 v15 = @"SET_DISPLAYED_STEP";
          break;
        default:
          switch((int)v4)
          {
            case 200:
              unsigned __int8 v15 = @"START_LOCATION_UPDATE";
              break;
            case 201:
              unsigned __int8 v15 = @"STOP_LOCATION_UPDATE";
              break;
            case 202:
              unsigned __int8 v15 = @"UPDATED_LOCATION";
              break;
            case 203:
              unsigned __int8 v15 = @"FAILED_TO_UPDATE_LOCATION";
              break;
            case 204:
              unsigned __int8 v15 = @"DID_PAUSE_LOCATION_UPDATES";
              break;
            case 205:
              unsigned __int8 v15 = @"DID_RESUME_LOCATION_UPDATES";
              break;
            case 206:
              unsigned __int8 v15 = @"APPLY_LOCATION_AUTHORIZATION";
              break;
            default:
              goto LABEL_35;
          }
          break;
      }
      goto LABEL_82;
    }
    if ((int)v4 > 599)
    {
      if ((int)v4 > 1499)
      {
        if (v4 == 1500)
        {
          unsigned __int8 v15 = @"DEBUG_FETCH_CONFIGURATION_INFO";
          goto LABEL_82;
        }
        if (v4 == 1501)
        {
          unsigned __int8 v15 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
          goto LABEL_82;
        }
      }
      else
      {
        if (v4 == 600)
        {
          unsigned __int8 v15 = @"FETCH_ROUTE_GENIUS";
          goto LABEL_82;
        }
        if (v4 == 1000)
        {
          unsigned __int8 v15 = @"PING";
          goto LABEL_82;
        }
      }
    }
    else if ((int)v4 > 500)
    {
      if (v4 == 501)
      {
        unsigned __int8 v15 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
        goto LABEL_82;
      }
      if (v4 == 502)
      {
        unsigned __int8 v15 = @"SERVICE_REQUEST";
        goto LABEL_82;
      }
    }
    else
    {
      if (v4 == 401)
      {
        unsigned __int8 v15 = @"OPEN_URL";
        goto LABEL_82;
      }
      if (v4 == 500)
      {
        unsigned __int8 v15 = @"PLACE_DATA_MUID_LOOKUP";
LABEL_82:
        *(_DWORD *)buf = 138543618;
        unsigned int v20 = v8;
        __int16 v21 = 2114;
        uint64_t v22 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Adding observer %{public}@ for %{public}@", buf, 0x16u);

        goto LABEL_83;
      }
    }
LABEL_35:
    unsigned __int8 v15 = +[NSString stringWithFormat:@"(unknown: %i)", v4];
    goto LABEL_82;
  }
LABEL_83:

  id v17 = [v6 copy];
  [v11 setObject:v17 forKey:v8];

  [(NSLock *)self->_observersLock unlock];
LABEL_84:

  return v8;
}

- (void)removeMessageObserver:(id)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v6)
  {
    [(NSLock *)self->_observersLock lock];
    messageObservers = self->_messageObservers;
    unsigned __int8 v8 = +[NSNumber numberWithInt:v4];
    id v9 = [(NSMutableDictionary *)messageObservers objectForKeyedSubscript:v8];

    unsigned __int8 v10 = [v9 objectForKey:v6];

    id v11 = sub_100053F94();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (!v12)
      {
LABEL_111:

        [v9 removeObjectForKey:v6];
LABEL_161:
        [(NSLock *)self->_observersLock unlock];

        goto LABEL_162;
      }
      if ((int)v4 <= 199)
      {
        switch((int)v4)
        {
          case '2':
            id v13 = @"START_INITIAL_SYNC";
            break;
          case '3':
            id v13 = @"FETCH_CURRENT_COUNTRY_CODE";
            break;
          case '4':
            id v13 = @"FETCH_EXPERIMENTS_CONFIG";
            break;
          case '5':
            id v13 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
            break;
          case '6':
            id v13 = @"SYNC_UP_NEXT_ITEMS";
            break;
          case '7':
            id v13 = @"REQUEST_UP_NEXT_ITEMS";
            break;
          case '8':
            id v13 = @"SYNC_CONFIG_STORE";
            break;
          case '9':
            id v13 = @"CHECKIN_WITH_CONFIG_STORE";
            break;
          case ':':
            id v13 = @"REQUEST_ANALYTIC_IDENTIFIERS";
            break;
          case ';':
            id v13 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
            break;
          case '<':
            id v13 = @"SYNC_SUBSCRIPTION_INFO";
            break;
          case '=':
            id v13 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
            break;
          case '>':
            goto LABEL_63;
          case '?':
            id v13 = @"UPDATE_SUBSCRIPTION_STATE";
            break;
          case '@':
            id v13 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
            break;
          case 'A':
            id v13 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
            break;
          case 'B':
            id v13 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
            break;
          case 'C':
            id v13 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
            break;
          default:
            int v15 = v4 - 1;
            if (v4 <= 0xC7)
            {
              id v13 = @"FETCH_TILES";
              switch(v15)
              {
                case 0:
                  goto LABEL_110;
                case 1:
                  id v13 = @"CANCEL_TILES";
                  goto LABEL_110;
                case 2:
                  id v13 = @"REPORT_CORRUPT_TILE";
                  goto LABEL_110;
                case 3:
                  id v13 = @"FETCHED_TILE";
                  goto LABEL_110;
                default:
                  goto LABEL_163;
              }
            }
            switch((int)v4)
            {
              case 'd':
                id v13 = @"CHECKIN_WITH_TILE_GROUP";
                break;
              case 'e':
                id v13 = @"FORCE_UPDATE_MANIFEST";
                break;
              case 'f':
                id v13 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
                break;
              case 'g':
                id v13 = @"FETCH_RESOURCE";
                break;
              default:
                goto LABEL_63;
            }
            break;
        }
        goto LABEL_110;
      }
      if ((int)v4 <= 400)
      {
        switch((int)v4)
        {
          case 300:
            id v13 = @"UPDATE_NAV_ROUTE_DETAILS";
            break;
          case 301:
            id v13 = @"UPDATE_NAV_ROUTE_STATUS";
            break;
          case 302:
            id v13 = @"START_NAV";
            break;
          case 303:
            id v13 = @"STOP_NAV";
            break;
          case 304:
            id v13 = @"PREVIEW_NAV";
            break;
          case 305:
            id v13 = @"CLEAR_NAV_PREVIEW";
            break;
          case 306:
            id v13 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
            break;
          case 307:
            id v13 = @"DISMISS_NAV_SAFETY_ALERT";
            break;
          case 308:
            id v13 = @"AVAILABLE_ROUTE";
            break;
          case 309:
            id v13 = @"SELECTED_ROUTE";
            break;
          case 310:
            id v13 = @"REQUEST_NAVIGATION_UPDATE";
            break;
          case 311:
            id v13 = @"UPDATE_NAV_ROUTE_UPDATE";
            break;
          case 312:
            id v13 = @"AVAILABLE_ROUTE_UPDATE";
            break;
          case 313:
            id v13 = @"PAUSE_NAV";
            break;
          case 314:
            id v13 = @"RESUME_NAV";
            break;
          case 315:
            id v13 = @"SET_DISPLAYED_STEP";
            break;
          default:
            switch((int)v4)
            {
              case 200:
                id v13 = @"START_LOCATION_UPDATE";
                break;
              case 201:
                id v13 = @"STOP_LOCATION_UPDATE";
                break;
              case 202:
                id v13 = @"UPDATED_LOCATION";
                break;
              case 203:
                id v13 = @"FAILED_TO_UPDATE_LOCATION";
                break;
              case 204:
                id v13 = @"DID_PAUSE_LOCATION_UPDATES";
                break;
              case 205:
                id v13 = @"DID_RESUME_LOCATION_UPDATES";
                break;
              case 206:
                id v13 = @"APPLY_LOCATION_AUTHORIZATION";
                break;
              default:
                goto LABEL_63;
            }
            break;
        }
        goto LABEL_110;
      }
      if ((int)v4 > 599)
      {
        if ((int)v4 > 1499)
        {
          if (v4 == 1500)
          {
            id v13 = @"DEBUG_FETCH_CONFIGURATION_INFO";
            goto LABEL_110;
          }
          if (v4 == 1501)
          {
            id v13 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
            goto LABEL_110;
          }
        }
        else
        {
          if (v4 == 600)
          {
            id v13 = @"FETCH_ROUTE_GENIUS";
            goto LABEL_110;
          }
          if (v4 == 1000)
          {
            id v13 = @"PING";
            goto LABEL_110;
          }
        }
      }
      else if ((int)v4 > 500)
      {
        if (v4 == 501)
        {
          id v13 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
          goto LABEL_110;
        }
        if (v4 == 502)
        {
          id v13 = @"SERVICE_REQUEST";
          goto LABEL_110;
        }
      }
      else
      {
        if (v4 == 401)
        {
          id v13 = @"OPEN_URL";
          goto LABEL_110;
        }
        if (v4 == 500)
        {
          id v13 = @"PLACE_DATA_MUID_LOOKUP";
LABEL_110:
          *(_DWORD *)buf = 138543618;
          id v18 = v6;
          __int16 v19 = 2114;
          unsigned int v20 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Removing observer %{public}@ for %{public}@", buf, 0x16u);

          goto LABEL_111;
        }
      }
LABEL_63:
      id v13 = +[NSString stringWithFormat:@"(unknown: %i)", v4];
      goto LABEL_110;
    }
    if (!v12)
    {
LABEL_160:

      goto LABEL_161;
    }
    if ((int)v4 <= 199)
    {
      switch((int)v4)
      {
        case '2':
          unsigned int v14 = @"START_INITIAL_SYNC";
          break;
        case '3':
          unsigned int v14 = @"FETCH_CURRENT_COUNTRY_CODE";
          break;
        case '4':
          unsigned int v14 = @"FETCH_EXPERIMENTS_CONFIG";
          break;
        case '5':
          unsigned int v14 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
          break;
        case '6':
          unsigned int v14 = @"SYNC_UP_NEXT_ITEMS";
          break;
        case '7':
          unsigned int v14 = @"REQUEST_UP_NEXT_ITEMS";
          break;
        case '8':
          unsigned int v14 = @"SYNC_CONFIG_STORE";
          break;
        case '9':
          unsigned int v14 = @"CHECKIN_WITH_CONFIG_STORE";
          break;
        case ':':
          unsigned int v14 = @"REQUEST_ANALYTIC_IDENTIFIERS";
          break;
        case ';':
          unsigned int v14 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
          break;
        case '<':
          unsigned int v14 = @"SYNC_SUBSCRIPTION_INFO";
          break;
        case '=':
          unsigned int v14 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
          break;
        case '>':
          goto LABEL_112;
        case '?':
          unsigned int v14 = @"UPDATE_SUBSCRIPTION_STATE";
          break;
        case '@':
          unsigned int v14 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
          break;
        case 'A':
          unsigned int v14 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
          break;
        case 'B':
          unsigned int v14 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
          break;
        case 'C':
          unsigned int v14 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
          break;
        default:
          int v16 = v4 - 1;
          if (v4 > 0xC7)
          {
            switch((int)v4)
            {
              case 'd':
                unsigned int v14 = @"CHECKIN_WITH_TILE_GROUP";
                break;
              case 'e':
                unsigned int v14 = @"FORCE_UPDATE_MANIFEST";
                break;
              case 'f':
                unsigned int v14 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
                break;
              case 'g':
                unsigned int v14 = @"FETCH_RESOURCE";
                break;
              default:
                goto LABEL_112;
            }
          }
          else
          {
            unsigned int v14 = @"FETCH_TILES";
            switch(v16)
            {
              case 0:
                goto LABEL_159;
              case 1:
                unsigned int v14 = @"CANCEL_TILES";
                break;
              case 2:
                unsigned int v14 = @"REPORT_CORRUPT_TILE";
                break;
              case 3:
                unsigned int v14 = @"FETCHED_TILE";
                break;
              default:
LABEL_163:
                JUMPOUT(0);
            }
          }
          return;
      }
      goto LABEL_159;
    }
    if ((int)v4 <= 400)
    {
      switch((int)v4)
      {
        case 300:
          unsigned int v14 = @"UPDATE_NAV_ROUTE_DETAILS";
          break;
        case 301:
          unsigned int v14 = @"UPDATE_NAV_ROUTE_STATUS";
          break;
        case 302:
          unsigned int v14 = @"START_NAV";
          break;
        case 303:
          unsigned int v14 = @"STOP_NAV";
          break;
        case 304:
          unsigned int v14 = @"PREVIEW_NAV";
          break;
        case 305:
          unsigned int v14 = @"CLEAR_NAV_PREVIEW";
          break;
        case 306:
          unsigned int v14 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
          break;
        case 307:
          unsigned int v14 = @"DISMISS_NAV_SAFETY_ALERT";
          break;
        case 308:
          unsigned int v14 = @"AVAILABLE_ROUTE";
          break;
        case 309:
          unsigned int v14 = @"SELECTED_ROUTE";
          break;
        case 310:
          unsigned int v14 = @"REQUEST_NAVIGATION_UPDATE";
          break;
        case 311:
          unsigned int v14 = @"UPDATE_NAV_ROUTE_UPDATE";
          break;
        case 312:
          unsigned int v14 = @"AVAILABLE_ROUTE_UPDATE";
          break;
        case 313:
          unsigned int v14 = @"PAUSE_NAV";
          break;
        case 314:
          unsigned int v14 = @"RESUME_NAV";
          break;
        case 315:
          unsigned int v14 = @"SET_DISPLAYED_STEP";
          break;
        default:
          switch((int)v4)
          {
            case 200:
              unsigned int v14 = @"START_LOCATION_UPDATE";
              break;
            case 201:
              unsigned int v14 = @"STOP_LOCATION_UPDATE";
              break;
            case 202:
              unsigned int v14 = @"UPDATED_LOCATION";
              break;
            case 203:
              unsigned int v14 = @"FAILED_TO_UPDATE_LOCATION";
              break;
            case 204:
              unsigned int v14 = @"DID_PAUSE_LOCATION_UPDATES";
              break;
            case 205:
              unsigned int v14 = @"DID_RESUME_LOCATION_UPDATES";
              break;
            case 206:
              unsigned int v14 = @"APPLY_LOCATION_AUTHORIZATION";
              break;
            default:
              goto LABEL_112;
          }
          break;
      }
      goto LABEL_159;
    }
    if ((int)v4 > 599)
    {
      if ((int)v4 > 1499)
      {
        if (v4 == 1500)
        {
          unsigned int v14 = @"DEBUG_FETCH_CONFIGURATION_INFO";
          goto LABEL_159;
        }
        if (v4 == 1501)
        {
          unsigned int v14 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
          goto LABEL_159;
        }
      }
      else
      {
        if (v4 == 600)
        {
          unsigned int v14 = @"FETCH_ROUTE_GENIUS";
          goto LABEL_159;
        }
        if (v4 == 1000)
        {
          unsigned int v14 = @"PING";
          goto LABEL_159;
        }
      }
    }
    else if ((int)v4 > 500)
    {
      if (v4 == 501)
      {
        unsigned int v14 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
        goto LABEL_159;
      }
      if (v4 == 502)
      {
        unsigned int v14 = @"SERVICE_REQUEST";
        goto LABEL_159;
      }
    }
    else
    {
      if (v4 == 401)
      {
        unsigned int v14 = @"OPEN_URL";
        goto LABEL_159;
      }
      if (v4 == 500)
      {
        unsigned int v14 = @"PLACE_DATA_MUID_LOOKUP";
LABEL_159:
        *(_DWORD *)buf = 138543618;
        id v18 = v6;
        __int16 v19 = 2114;
        unsigned int v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Unable to remove observer %{public}@ for %{public}@, not in collection", buf, 0x16u);

        goto LABEL_160;
      }
    }
LABEL_112:
    unsigned int v14 = +[NSString stringWithFormat:@"(unknown: %i)", v4];
    goto LABEL_159;
  }
LABEL_162:
}

- (void)addConnectionObserver:(id)a3
{
}

- (void)removeConnectionObserver:(id)a3
{
}

- (void)updateConnectionStatus
{
  id v3 = sub_100053F94();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [(IDSService *)self->_idsService devices];
    *(_DWORD *)buf = 138477827;
    *(void *)id v65 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Updating connection status with devices: %{private}@", buf, 0xCu);
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  unsigned __int8 v5 = [(IDSService *)self->_idsService devices];
  id v6 = [v5 countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v58;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v58 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if ([v10 isDefaultPairedDevice] && objc_msgSend(v10, "isConnected"))
        {
          unint64_t v11 = (unint64_t)[v10 isNearby];
          BOOL v12 = 1;
          goto LABEL_14;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v57 objects:v66 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  unint64_t v11 = 0;
  BOOL v12 = 0;
LABEL_14:

  BOOL testSimulateNoDevices = self->_testSimulateNoDevices;
  unsigned int v14 = sub_100053F94();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (testSimulateNoDevices)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "New connection status: simulating no devices connected", buf, 2u);
    }
    unint64_t v11 = 0;
    BOOL v12 = 0;
  }
  else if (v15)
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)id v65 = v12;
    *(_WORD *)&v65[4] = 1024;
    *(_DWORD *)&v65[6] = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "New connection status: connected: %i, nearby: %i", buf, 0xEu);
  }

  int nearby = self->_nearby;
  if (nearby != v11) {
    self->_int nearby = v11;
  }
  self->_protocolVersion = 0;
  if (self->_connected != v12)
  {
    int v43 = nearby;
    unsigned int v44 = v11;
    self->_connected = v12;
    if (!v12)
    {
      id v17 = [objc_alloc((Class)NSError) initWithDomain:@"NMDeviceConnectionErrorDomain" code:0 userInfo:0];
      [(NSLock *)self->_replyCallbackBlocksLock lock];
      id v18 = [(NSMutableDictionary *)self->_replyCallbackBlocks allValues];
      id v19 = [v18 copy];

      unsigned int v20 = [(NSMutableDictionary *)self->_replyExpectingMessageMetadata allValues];
      id v21 = [v20 copy];

      [(NSMutableDictionary *)self->_replyCallbackBlocks removeAllObjects];
      [(NSMutableDictionary *)self->_replyExpectingMessageMetadata removeAllObjects];
      [(NSLock *)self->_replyCallbackBlocksLock unlock];
      if ([v19 count])
      {
        uint64_t v22 = sub_100053F94();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          id v23 = [v19 count];
          *(_DWORD *)buf = 134217984;
          *(void *)id v65 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Canceling %lu requests due to lost connection to paired device", buf, 0xCu);
        }
      }
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v24 = v21;
      id v25 = [v24 countByEnumeratingWithState:&v53 objects:v63 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v54;
        do
        {
          for (j = 0; j != v26; j = (char *)j + 1)
          {
            if (*(void *)v54 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v53 + 1) + 8 * (void)j);
            v30 = [v29 timeoutTimer];

            if (v30)
            {
              uint64_t v31 = [v29 timeoutTimer];
              dispatch_source_cancel(v31);

              [v29 setTimeoutTimer:0];
            }
          }
          id v26 = [v24 countByEnumeratingWithState:&v53 objects:v63 count:16];
        }
        while (v26);
      }

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v32 = v19;
      id v33 = [v32 countByEnumeratingWithState:&v49 objects:v62 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v50;
        do
        {
          for (k = 0; k != v34; k = (char *)k + 1)
          {
            if (*(void *)v50 != v35) {
              objc_enumerationMutation(v32);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v49 + 1) + 8 * (void)k) + 16))();
          }
          id v34 = [v32 countByEnumeratingWithState:&v49 objects:v62 count:16];
        }
        while (v34);
      }

      [(NSRecursiveLock *)self->_messageQueuesLock lock];
      [(NSMutableDictionary *)self->_messageQueues enumerateKeysAndObjectsUsingBlock:&stru_1000825F8];
      [(NSRecursiveLock *)self->_messageQueuesLock unlock];
    }
    id v37 = [(GEOObserverHashTable *)self->_observers allObservers];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v38 = [v37 countByEnumeratingWithState:&v45 objects:v61 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v46;
      do
      {
        for (m = 0; m != v39; m = (char *)m + 1)
        {
          if (*(void *)v46 != v40) {
            objc_enumerationMutation(v37);
          }
          id v42 = *(void **)(*((void *)&v45 + 1) + 8 * (void)m);
          if (objc_opt_respondsToSelector()) {
            [v42 connection:self didChangeDeviceConnectivity:v12];
          }
          if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v42 connectionNeedsStateSynchronization:self];
          }
        }
        id v39 = [v37 countByEnumeratingWithState:&v45 objects:v61 count:16];
      }
      while (v39);
    }

    int nearby = v43;
    unint64_t v11 = v44;
  }
  if (nearby != v11) {
    [(GEOObserverHashTable *)self->_observers connection:self didChangeDeviceNearby:v11];
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a5;
  id v10 = a7;
  double Current = CFAbsoluteTimeGetCurrent();
  BOOL v12 = [v10 incomingResponseIdentifier];
  id v13 = [v10 incomingResponseIdentifier];

  if (v13)
  {
    [(NSLock *)self->_replyCallbackBlocksLock lock];
    replyCallbackBlocks = self->_replyCallbackBlocks;
    BOOL v15 = [v10 incomingResponseIdentifier];
    int v16 = [(NSMutableDictionary *)replyCallbackBlocks objectForKey:v15];
    BOOL v17 = v16 != 0;

    [(NSLock *)self->_replyCallbackBlocksLock unlock];
  }
  else
  {
    BOOL v17 = 0;
  }
  id v18 = sub_100053F94();
  id v19 = v18;
  if (v9)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      __int16 v101 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Received data with incomingResponseIdentifier: %{private}@", buf, 0xCu);
    }

    if (v17)
    {
      unsigned int v20 = sub_100053F94();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "incomingResponseIdentifier matches message awaiting reply", buf, 2u);
      }

      id v21 = [[NMReply alloc] initWithData:v9];
      id v19 = v21;
      if (v21)
      {
        uint64_t v22 = [(NMReply *)v21 senderUUID];
        [(NMDeviceConnection *)self _updateReceiverProcessUUID:v22];

        [(NSLock *)self->_replyCallbackBlocksLock lock];
        id v23 = [(NSMutableDictionary *)self->_replyExpectingMessageMetadata objectForKey:v12];
        [(NSMutableDictionary *)self->_replyExpectingMessageMetadata removeObjectForKey:v12];
        [(NSLock *)self->_replyCallbackBlocksLock unlock];
        id v24 = [v23 timeoutTimer];

        if (v24)
        {
          id v25 = [v23 timeoutTimer];
          dispatch_source_cancel(v25);

          [v23 setTimeoutTimer:0];
        }
        [v23 timestamp];
        double v27 = v26;
        uint64_t v28 = sub_100053F94();
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
          goto LABEL_135;
        }
        double v29 = Current - v27;
        id v30 = [v23 type];
        v94 = v12;
        if ((int)v30 <= 199)
        {
          switch((int)v30)
          {
            case '2':
              uint64_t v31 = @"START_INITIAL_SYNC";
              break;
            case '3':
              uint64_t v31 = @"FETCH_CURRENT_COUNTRY_CODE";
              break;
            case '4':
              uint64_t v31 = @"FETCH_EXPERIMENTS_CONFIG";
              break;
            case '5':
              uint64_t v31 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
              break;
            case '6':
              uint64_t v31 = @"SYNC_UP_NEXT_ITEMS";
              break;
            case '7':
              uint64_t v31 = @"REQUEST_UP_NEXT_ITEMS";
              break;
            case '8':
              uint64_t v31 = @"SYNC_CONFIG_STORE";
              break;
            case '9':
              uint64_t v31 = @"CHECKIN_WITH_CONFIG_STORE";
              break;
            case ':':
              uint64_t v31 = @"REQUEST_ANALYTIC_IDENTIFIERS";
              break;
            case ';':
              uint64_t v31 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
              break;
            case '<':
              uint64_t v31 = @"SYNC_SUBSCRIPTION_INFO";
              break;
            case '=':
              uint64_t v31 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
              break;
            case '>':
              goto LABEL_87;
            case '?':
              uint64_t v31 = @"UPDATE_SUBSCRIPTION_STATE";
              break;
            case '@':
              uint64_t v31 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
              break;
            case 'A':
              uint64_t v31 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
              break;
            case 'B':
              uint64_t v31 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
              break;
            case 'C':
              uint64_t v31 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
              break;
            default:
              if (v30 > 0xC7)
              {
                switch((int)v30)
                {
                  case 'd':
                    uint64_t v31 = @"CHECKIN_WITH_TILE_GROUP";
                    break;
                  case 'e':
                    uint64_t v31 = @"FORCE_UPDATE_MANIFEST";
                    break;
                  case 'f':
                    uint64_t v31 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
                    break;
                  case 'g':
                    uint64_t v31 = @"FETCH_RESOURCE";
                    break;
                  default:
                    goto LABEL_87;
                }
              }
              else
              {
                uint64_t v31 = @"FETCH_TILES";
                switch((int)v30)
                {
                  case 1:
                    goto LABEL_134;
                  case 2:
                    uint64_t v31 = @"CANCEL_TILES";
                    break;
                  case 3:
                    uint64_t v31 = @"REPORT_CORRUPT_TILE";
                    break;
                  case 4:
                    uint64_t v31 = @"FETCHED_TILE";
                    break;
                  default:
                    JUMPOUT(0);
                }
              }
              return;
          }
          goto LABEL_134;
        }
        if ((int)v30 <= 400)
        {
          switch((int)v30)
          {
            case 300:
              uint64_t v31 = @"UPDATE_NAV_ROUTE_DETAILS";
              break;
            case 301:
              uint64_t v31 = @"UPDATE_NAV_ROUTE_STATUS";
              break;
            case 302:
              uint64_t v31 = @"START_NAV";
              break;
            case 303:
              uint64_t v31 = @"STOP_NAV";
              break;
            case 304:
              uint64_t v31 = @"PREVIEW_NAV";
              break;
            case 305:
              uint64_t v31 = @"CLEAR_NAV_PREVIEW";
              break;
            case 306:
              uint64_t v31 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
              break;
            case 307:
              uint64_t v31 = @"DISMISS_NAV_SAFETY_ALERT";
              break;
            case 308:
              uint64_t v31 = @"AVAILABLE_ROUTE";
              break;
            case 309:
              uint64_t v31 = @"SELECTED_ROUTE";
              break;
            case 310:
              uint64_t v31 = @"REQUEST_NAVIGATION_UPDATE";
              break;
            case 311:
              uint64_t v31 = @"UPDATE_NAV_ROUTE_UPDATE";
              break;
            case 312:
              uint64_t v31 = @"AVAILABLE_ROUTE_UPDATE";
              break;
            case 313:
              uint64_t v31 = @"PAUSE_NAV";
              break;
            case 314:
              uint64_t v31 = @"RESUME_NAV";
              break;
            case 315:
              uint64_t v31 = @"SET_DISPLAYED_STEP";
              break;
            default:
              switch((int)v30)
              {
                case 200:
                  uint64_t v31 = @"START_LOCATION_UPDATE";
                  break;
                case 201:
                  uint64_t v31 = @"STOP_LOCATION_UPDATE";
                  break;
                case 202:
                  uint64_t v31 = @"UPDATED_LOCATION";
                  break;
                case 203:
                  uint64_t v31 = @"FAILED_TO_UPDATE_LOCATION";
                  break;
                case 204:
                  uint64_t v31 = @"DID_PAUSE_LOCATION_UPDATES";
                  break;
                case 205:
                  uint64_t v31 = @"DID_RESUME_LOCATION_UPDATES";
                  break;
                case 206:
                  uint64_t v31 = @"APPLY_LOCATION_AUTHORIZATION";
                  break;
                default:
                  goto LABEL_87;
              }
              break;
          }
          goto LABEL_134;
        }
        if ((int)v30 > 599)
        {
          if ((int)v30 > 1499)
          {
            if (v30 == 1500)
            {
              uint64_t v31 = @"DEBUG_FETCH_CONFIGURATION_INFO";
              goto LABEL_134;
            }
            if (v30 == 1501)
            {
              uint64_t v31 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
              goto LABEL_134;
            }
          }
          else
          {
            if (v30 == 600)
            {
              uint64_t v31 = @"FETCH_ROUTE_GENIUS";
              goto LABEL_134;
            }
            if (v30 == 1000)
            {
              uint64_t v31 = @"PING";
              goto LABEL_134;
            }
          }
        }
        else if ((int)v30 > 500)
        {
          if (v30 == 501)
          {
            uint64_t v31 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
            goto LABEL_134;
          }
          if (v30 == 502)
          {
            uint64_t v31 = @"SERVICE_REQUEST";
            goto LABEL_134;
          }
        }
        else
        {
          if (v30 == 401)
          {
            uint64_t v31 = @"OPEN_URL";
            goto LABEL_134;
          }
          if (v30 == 500)
          {
            uint64_t v31 = @"PLACE_DATA_MUID_LOOKUP";
LABEL_134:
            v75 = (const char *)[v9 length];
            [v19 responseTime];
            uint64_t v77 = v76;
            [v19 enqueuedTimeInterval];
            uint64_t v79 = v78;
            [v19 responseTime];
            double v81 = v29 - v80;
            [v19 enqueuedTimeInterval];
            double v83 = v81 - v82;
            v84 = [v10 incomingResponseIdentifier];
            v85 = [v10 outgoingResponseIdentifier];
            *(_DWORD *)buf = 138479619;
            __int16 v101 = v31;
            __int16 v102 = 2048;
            v103 = v75;
            __int16 v104 = 2048;
            double v105 = v29;
            __int16 v106 = 2048;
            uint64_t v107 = v77;
            __int16 v108 = 2048;
            uint64_t v109 = v79;
            __int16 v110 = 2048;
            double v111 = v83;
            __int16 v112 = 2113;
            v113 = v84;
            __int16 v114 = 2113;
            v115 = v85;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Received reply for original message type: %{private}@ (size = %lu, elapsed time = %f, remote processing time = %f, enqueued time = %f, inferred transport time = %f, incoming guid = %{private}@, outgoing guid = %{private}@)", buf, 0x52u);

            BOOL v12 = v94;
LABEL_135:

            unsigned __int8 v86 = [v19 decompressArguments];
            id v87 = sub_100053F94();
            v88 = v87;
            if (v86)
            {
              if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138477827;
                __int16 v101 = v19;
                _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEBUG, "Received reply contents: %{private}@", buf, 0xCu);
              }

              [(NSLock *)self->_replyCallbackBlocksLock lock];
              v89 = [(NSMutableDictionary *)self->_replyCallbackBlocks objectForKey:v12];
              __int16 v70 = (void (**)(id, NSObject *, void))[v89 copy];

              if (v70)
              {
                [(NSMutableDictionary *)self->_replyCallbackBlocks removeObjectForKey:v12];
                [(NSLock *)self->_replyCallbackBlocksLock unlock];
                id v90 = sub_100053F94();
                if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEBUG, "Sending reply to callback block", buf, 2u);
                }

                v70[2](v70, v19, 0);
                goto LABEL_148;
              }
              goto LABEL_147;
            }
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "Failed to decompress reply arguments", buf, 2u);
            }

            [(NSLock *)self->_replyCallbackBlocksLock lock];
            id v91 = [(NSMutableDictionary *)self->_replyCallbackBlocks objectForKey:v12];
            __int16 v70 = (void (**)(id, NSObject *, void))[v91 copy];

            if (!v70)
            {
LABEL_147:
              [(NSLock *)self->_replyCallbackBlocksLock unlock];
              goto LABEL_148;
            }
            [(NSMutableDictionary *)self->_replyCallbackBlocks removeObjectForKey:v12];
            [(NSLock *)self->_replyCallbackBlocksLock unlock];
            uint64_t v67 = +[NSError errorWithDomain:@"NMDeviceConnectionErrorDomain" code:1 userInfo:0];
            ((void (**)(id, NSObject *, void *))v70)[2](v70, 0, v67);
LABEL_146:

LABEL_148:
            goto LABEL_149;
          }
        }
LABEL_87:
        uint64_t v31 = +[NSString stringWithFormat:@"(unknown: %i)", v30];
        goto LABEL_134;
      }
      id v23 = sub_100053F94();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        long long v46 = "Invalid reply data";
LABEL_35:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v46, buf, 2u);
        goto LABEL_149;
      }
      goto LABEL_149;
    }
    id v19 = [[NMMessage alloc] initWithData:v9];
    id v33 = sub_100053F94();
    id v23 = v33;
    if (!v19)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        long long v46 = "Invalid message data";
        goto LABEL_35;
      }
LABEL_149:

      goto LABEL_150;
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      id v34 = [v19 shortDebugDescription];
      uint64_t v35 = (const char *)[v9 length];
      [v19 sentTimestamp];
      double v37 = Current - v36;
      [v19 enqueuedTimeInterval];
      *(_DWORD *)buf = 138478595;
      __int16 v101 = v34;
      __int16 v102 = 2048;
      v103 = v35;
      __int16 v104 = 2048;
      double v105 = v37;
      __int16 v106 = 2048;
      uint64_t v107 = v38;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Received message type: %{private}@ (size = %lu, sent %f seconds ago, enqueued time = %f)", buf, 0x2Au);
    }
    id v39 = [v19 senderUUID];
    [(NMDeviceConnection *)self _updateReceiverProcessUUID:v39];

    unsigned __int8 v40 = [v19 decompressArguments];
    id v41 = sub_100053F94();
    id v42 = v41;
    if (v40)
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138477827;
        __int16 v101 = v19;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "Received message contents: %{private}@", buf, 0xCu);
      }

      if ([v10 expectsPeerResponse])
      {
        int v43 = [v10 outgoingResponseIdentifier];

        if (v43)
        {
          unsigned int v44 = objc_alloc_init(_NMReplyInfo);
          long long v45 = [v10 outgoingResponseIdentifier];
          [(_NMReplyInfo *)v44 setIdsMessageIdentifier:v45];

          [(_NMReplyInfo *)v44 setRequestReceivedTimestamp:Current];
          objc_setAssociatedObject(v19, &unk_10009B828, v44, (void *)0x301);
        }
        else
        {
          sub_100053F94();
          unsigned int v44 = (_NMReplyInfo *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v44->super, OS_LOG_TYPE_ERROR))
          {
            long long v59 = [v19 shortDebugDescription];
            *(_DWORD *)buf = 138543362;
            __int16 v101 = v59;
            _os_log_impl((void *)&_mh_execute_header, &v44->super, OS_LOG_TYPE_ERROR, "Message wants reply, but didn't receive a message identifier! Message: %{public}@", buf, 0xCu);
          }
        }
      }
      [(NSLock *)self->_observersLock lock];
      messageObservers = self->_messageObservers;
      id v61 = +[NSNumber numberWithInt:[v19 type]];
      id v23 = [(NSMutableDictionary *)messageObservers objectForKeyedSubscript:v61];

      v62 = [v23 allValues];
      id v63 = [v62 copy];

      [(NSLock *)self->_observersLock unlock];
      if (![v63 count])
      {
        __int16 v64 = sub_100053F94();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          id v65 = [v19 shortDebugDescription];
          *(_DWORD *)buf = 138543362;
          __int16 v101 = v65;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "No handler registered for incoming message type %{public}@", buf, 0xCu);
        }
      }
      __int16 v66 = [v19 argumentForTag:600];
      uint64_t v67 = [v66 dataValue];

      if (v67)
      {
        __int16 v68 = sub_100053F94();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "Applying transient location authorization", buf, 2u);
        }

        id v69 = +[CLLocationManager _setClientTransientAuthorizationInfoForBundleId:@"com.apple.Maps" data:v67];
      }
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      __int16 v70 = (void (**)(id, NSObject *, void))v63;
      id v71 = [v70 countByEnumeratingWithState:&v95 objects:v99 count:16];
      if (v71)
      {
        id v72 = v71;
        uint64_t v73 = *(void *)v96;
        do
        {
          for (i = 0; i != v72; i = (char *)i + 1)
          {
            if (*(void *)v96 != v73) {
              objc_enumerationMutation(v70);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v95 + 1) + 8 * i) + 16))();
          }
          id v72 = [v70 countByEnumeratingWithState:&v95 objects:v99 count:16];
        }
        while (v72);
      }

      goto LABEL_146;
    }
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Failed to decompress message arguments", buf, 2u);
    }

    if ([v10 expectsPeerResponse])
    {
      long long v47 = [v10 outgoingResponseIdentifier];

      if (v47)
      {
        id v23 = objc_alloc_init(NMReply);
        long long v48 = sub_10003F5D8();
        [v23 setSenderUUID:v48];

        long long v49 = [NMArgument alloc];
        long long v50 = +[NSError errorWithDomain:@"NMDeviceConnectionErrorDomain" code:1 userInfo:0];
        id v51 = [(NMArgument *)v49 _nm_initWithErrorValue:v50 tag:3];

        v93 = v51;
        [v23 addArgument:v51];
        long long v52 = [(NMDeviceConnection *)self _idsOptionsForMessage:v19 withOptions:0];
        id v53 = [v52 mutableCopy];

        if (!v53)
        {
          id v53 = +[NSMutableDictionary dictionary];
        }
        long long v54 = [v10 outgoingResponseIdentifier];
        [v53 setObject:v54 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];

        idsService = self->_idsService;
        long long v55 = [v23 data];
        long long v56 = [(IDSService *)self->_idsService accounts];
        long long v57 = [v56 anyObject];
        long long v58 = +[NSSet setWithObject:IDSDefaultPairedDevice];
        [(IDSService *)idsService sendData:v55 fromAccount:v57 toDestinations:v58 priority:200 options:v53 identifier:0 error:0];

        goto LABEL_149;
      }
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v32 = "NO";
    if (v17) {
      id v32 = "YES";
    }
    *(_DWORD *)buf = 138478083;
    __int16 v101 = v12;
    __int16 v102 = 2080;
    v103 = v32;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Missing data with incomingResponseIdentifier: %{private}@ (Reply: %s) ", buf, 0x16u);
  }
LABEL_150:
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = (__CFString *)a5;
  unint64_t v11 = (__CFString *)a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v10)
  {
    unsigned int v14 = 0;
    if (a6) {
      goto LABEL_108;
    }
    goto LABEL_90;
  }
  BOOL v12 = [(NSMutableDictionary *)self->_inFlightMessageMetadata objectForKey:v10];
  [(NSMutableDictionary *)self->_inFlightMessageMetadata removeObjectForKey:v10];
  if (v12)
  {
    id v13 = [v12 type];
    if ((int)v13 <= 199)
    {
      switch((int)v13)
      {
        case '2':
          unsigned int v14 = @"START_INITIAL_SYNC";
          break;
        case '3':
          unsigned int v14 = @"FETCH_CURRENT_COUNTRY_CODE";
          break;
        case '4':
          unsigned int v14 = @"FETCH_EXPERIMENTS_CONFIG";
          break;
        case '5':
          unsigned int v14 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
          break;
        case '6':
          unsigned int v14 = @"SYNC_UP_NEXT_ITEMS";
          break;
        case '7':
          unsigned int v14 = @"REQUEST_UP_NEXT_ITEMS";
          break;
        case '8':
          unsigned int v14 = @"SYNC_CONFIG_STORE";
          break;
        case '9':
          unsigned int v14 = @"CHECKIN_WITH_CONFIG_STORE";
          break;
        case ':':
          unsigned int v14 = @"REQUEST_ANALYTIC_IDENTIFIERS";
          break;
        case ';':
          unsigned int v14 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
          break;
        case '<':
          unsigned int v14 = @"SYNC_SUBSCRIPTION_INFO";
          break;
        case '=':
          unsigned int v14 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
          break;
        case '>':
          goto LABEL_37;
        case '?':
          unsigned int v14 = @"UPDATE_SUBSCRIPTION_STATE";
          break;
        case '@':
          unsigned int v14 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
          break;
        case 'A':
          unsigned int v14 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
          break;
        case 'B':
          unsigned int v14 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
          break;
        case 'C':
          unsigned int v14 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
          break;
        default:
          if (v13 > 0xC7)
          {
            switch((int)v13)
            {
              case 'd':
                unsigned int v14 = @"CHECKIN_WITH_TILE_GROUP";
                break;
              case 'e':
                unsigned int v14 = @"FORCE_UPDATE_MANIFEST";
                break;
              case 'f':
                unsigned int v14 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
                break;
              case 'g':
                unsigned int v14 = @"FETCH_RESOURCE";
                break;
              default:
                goto LABEL_37;
            }
          }
          else
          {
            unsigned int v14 = @"FETCH_TILES";
            switch((int)v13)
            {
              case 1:
                goto LABEL_84;
              case 2:
                unsigned int v14 = @"CANCEL_TILES";
                break;
              case 3:
                unsigned int v14 = @"REPORT_CORRUPT_TILE";
                break;
              case 4:
                unsigned int v14 = @"FETCHED_TILE";
                break;
              default:
                JUMPOUT(0);
            }
          }
          return;
      }
      goto LABEL_84;
    }
    if ((int)v13 <= 400)
    {
      switch((int)v13)
      {
        case 300:
          unsigned int v14 = @"UPDATE_NAV_ROUTE_DETAILS";
          break;
        case 301:
          unsigned int v14 = @"UPDATE_NAV_ROUTE_STATUS";
          break;
        case 302:
          unsigned int v14 = @"START_NAV";
          break;
        case 303:
          unsigned int v14 = @"STOP_NAV";
          break;
        case 304:
          unsigned int v14 = @"PREVIEW_NAV";
          break;
        case 305:
          unsigned int v14 = @"CLEAR_NAV_PREVIEW";
          break;
        case 306:
          unsigned int v14 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
          break;
        case 307:
          unsigned int v14 = @"DISMISS_NAV_SAFETY_ALERT";
          break;
        case 308:
          unsigned int v14 = @"AVAILABLE_ROUTE";
          break;
        case 309:
          unsigned int v14 = @"SELECTED_ROUTE";
          break;
        case 310:
          unsigned int v14 = @"REQUEST_NAVIGATION_UPDATE";
          break;
        case 311:
          unsigned int v14 = @"UPDATE_NAV_ROUTE_UPDATE";
          break;
        case 312:
          unsigned int v14 = @"AVAILABLE_ROUTE_UPDATE";
          break;
        case 313:
          unsigned int v14 = @"PAUSE_NAV";
          break;
        case 314:
          unsigned int v14 = @"RESUME_NAV";
          break;
        case 315:
          unsigned int v14 = @"SET_DISPLAYED_STEP";
          break;
        default:
          switch((int)v13)
          {
            case 200:
              unsigned int v14 = @"START_LOCATION_UPDATE";
              break;
            case 201:
              unsigned int v14 = @"STOP_LOCATION_UPDATE";
              break;
            case 202:
              unsigned int v14 = @"UPDATED_LOCATION";
              break;
            case 203:
              unsigned int v14 = @"FAILED_TO_UPDATE_LOCATION";
              break;
            case 204:
              unsigned int v14 = @"DID_PAUSE_LOCATION_UPDATES";
              break;
            case 205:
              unsigned int v14 = @"DID_RESUME_LOCATION_UPDATES";
              break;
            case 206:
              unsigned int v14 = @"APPLY_LOCATION_AUTHORIZATION";
              break;
            default:
              goto LABEL_37;
          }
          break;
      }
      goto LABEL_84;
    }
    if ((int)v13 > 599)
    {
      if ((int)v13 > 1499)
      {
        if (v13 == 1500)
        {
          unsigned int v14 = @"DEBUG_FETCH_CONFIGURATION_INFO";
          goto LABEL_84;
        }
        if (v13 == 1501)
        {
          unsigned int v14 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
          goto LABEL_84;
        }
      }
      else
      {
        if (v13 == 600)
        {
          unsigned int v14 = @"FETCH_ROUTE_GENIUS";
          goto LABEL_84;
        }
        if (v13 == 1000)
        {
          unsigned int v14 = @"PING";
          goto LABEL_84;
        }
      }
    }
    else if ((int)v13 > 500)
    {
      if (v13 == 501)
      {
        unsigned int v14 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
        goto LABEL_84;
      }
      if (v13 == 502)
      {
        unsigned int v14 = @"SERVICE_REQUEST";
        goto LABEL_84;
      }
    }
    else
    {
      if (v13 == 401)
      {
        unsigned int v14 = @"OPEN_URL";
        goto LABEL_84;
      }
      if (v13 == 500)
      {
        unsigned int v14 = @"PLACE_DATA_MUID_LOOKUP";
LABEL_84:
        int v16 = sub_100053F94();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v17 = [v12 isReply];
          CFStringRef v18 = @"message";
          *(_DWORD *)buf = 138543875;
          if (v17) {
            CFStringRef v18 = @"reply";
          }
          CFStringRef v34 = v18;
          __int16 v35 = 2113;
          double v36 = v14;
          __int16 v37 = 2113;
          uint64_t v38 = v10;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Finished sending %{public}@ for type: %{private}@ (GUID = %{private}@)", buf, 0x20u);
        }

        BOOL v15 = -[NMDeviceConnection _messageQueueForType:](self, "_messageQueueForType:", [v12 type]);
        -[NSObject didSendPayloadWithSize:](v15, "didSendPayloadWithSize:", [v12 payloadSize]);
        -[NMDeviceConnection _dequeueNextMessageIfNecessaryForType:](self, "_dequeueNextMessageIfNecessaryForType:", [v12 type]);
        goto LABEL_89;
      }
    }
LABEL_37:
    unsigned int v14 = +[NSString stringWithFormat:@"(unknown: %i)", v13];
    goto LABEL_84;
  }
  BOOL v15 = sub_100053F94();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v34 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Unable to find metadata for message GUID = %{public}@. This could throw off the in-flight message counters.", buf, 0xCu);
  }
  unsigned int v14 = 0;
LABEL_89:

  if (a6) {
    goto LABEL_108;
  }
LABEL_90:
  id v19 = [(__CFString *)v14 length];
  unsigned int v20 = sub_100053F94();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
  if (v19)
  {
    if (!v21) {
      goto LABEL_96;
    }
    *(_DWORD *)buf = 138478339;
    CFStringRef v34 = v14;
    __int16 v35 = 2114;
    double v36 = v11;
    __int16 v37 = 2114;
    uint64_t v38 = v10;
    uint64_t v22 = "Error sending message: messageType=%{private}@ -- %{public}@ (GUID = %{public}@)";
    id v23 = v20;
    uint32_t v24 = 32;
  }
  else
  {
    if (!v21) {
      goto LABEL_96;
    }
    *(_DWORD *)buf = 138543618;
    CFStringRef v34 = v11;
    __int16 v35 = 2114;
    double v36 = v10;
    uint64_t v22 = "Error sending message: %{public}@ (GUID = %{public}@)";
    id v23 = v20;
    uint32_t v24 = 22;
  }
  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
LABEL_96:

  if (v10)
  {
    [(NSLock *)self->_replyCallbackBlocksLock lock];
    id v25 = [(NSMutableDictionary *)self->_replyCallbackBlocks objectForKey:v10];
    double v26 = (void (**)(id, void, uint64_t))[v25 copy];

    if (v26)
    {
      [(NSMutableDictionary *)self->_replyCallbackBlocks removeObjectForKey:v10];
      double v27 = [(NSMutableDictionary *)self->_replyExpectingMessageMetadata objectForKey:v10];
      [(NSMutableDictionary *)self->_replyExpectingMessageMetadata removeObjectForKey:v10];
      [(NSLock *)self->_replyCallbackBlocksLock unlock];
      uint64_t v28 = [v27 timeoutTimer];

      if (v28)
      {
        double v29 = [v27 timeoutTimer];
        dispatch_source_cancel(v29);

        [v27 setTimeoutTimer:0];
      }
      id v30 = sub_100053F94();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Sending reply to callback block", buf, 2u);
      }

      if (v11)
      {
        uint64_t v31 = +[NSDictionary dictionaryWithObject:v11 forKey:NSUnderlyingErrorKey];
      }
      else
      {
        uint64_t v31 = 0;
      }
      uint64_t v32 = +[NSError errorWithDomain:@"NMDeviceConnectionErrorDomain" code:5 userInfo:v31];

      v26[2](v26, 0, v32);
      unint64_t v11 = (__CFString *)v32;
    }
    else
    {
      [(NSLock *)self->_replyCallbackBlocksLock unlock];
    }
  }
LABEL_108:
}

- (BOOL)isNearbyAndUsable
{
  return self->_nearby;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiverProcessUUIDLock, 0);
  objc_storeStrong((id *)&self->_receiverProcessUUID, 0);
  objc_storeStrong((id *)&self->_inFlightMessageMetadata, 0);
  objc_storeStrong((id *)&self->_messageQueues, 0);
  objc_storeStrong((id *)&self->_messageQueuesLock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observersLock, 0);
  objc_storeStrong((id *)&self->_replyCallbackBlocksLock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_messageObservers, 0);
  objc_storeStrong((id *)&self->_replyExpectingMessageMetadata, 0);
  objc_storeStrong((id *)&self->_replyCallbackBlocks, 0);

  objc_storeStrong((id *)&self->_idsService, 0);
}

- (void)test_disconnect
{
  if (!self->_testSimulateNoDevices)
  {
    id v3 = sub_100053F94();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Will simulate no devices connected and update connection status", v4, 2u);
    }

    self->_BOOL testSimulateNoDevices = 1;
    [(IDSService *)self->_idsService removeDelegate:self];
    [(NMDeviceConnection *)self updateConnectionStatus];
  }
}

- (void)test_reconnect
{
  if (self->_testSimulateNoDevices)
  {
    id v3 = sub_100053F94();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Will remove simulation of no devices connected and update connection status", v4, 2u);
    }

    self->_BOOL testSimulateNoDevices = 0;
    [(IDSService *)self->_idsService addDelegate:self queue:self->_queue];
    [(NMDeviceConnection *)self updateConnectionStatus];
  }
}

@end