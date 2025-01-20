@interface _IDSConnection
- (BOOL)_canServiceNameAcceptMessagesInTransientRegistrationState:(id)a3;
- (BOOL)_isAccountInValidRegistrationStateToAcceptMessages;
- (BOOL)_isDestinationSingleLocalAddress:(id)a3;
- (BOOL)_shouldAcceptIncomingType:(id)a3 forTopic:(id)a4 localURI:(id)a5 remoteURI:(id)a6 validateAliases:(BOOL)a7 guid:(id)a8;
- (BOOL)isActive;
- (BOOL)sendData:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendInvitation:(id)a3 toDestination:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendInvitationUpdate:(id)a3 toDestination:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendMessage:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendServerMessage:(id)a3 command:(id)a4;
- (IDSAccount)account;
- (IDSDirectMessageConnection)directMessageConnection;
- (NSDictionary)directMessagingMetadata;
- (_IDSConnection)initWithAccount:(id)a3 commands:(id)a4 indirectDelegateCallouts:(BOOL)a5 delegateContext:(id)a6;
- (id)_activeDevice;
- (id)_defaultPairedDevice;
- (id)_init;
- (id)_sendWithParameters:(id)a3 options:(id)a4 loggingType:(id)a5 loggingDataSize:(unint64_t)a6;
- (id)daemonController;
- (id)daemonListener;
- (unsigned)wakingDowngradeCount;
- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6;
- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6 group:(id)a7;
- (void)_callDelegatesWithBlock:(id)a3;
- (void)_callDelegatesWithBlock:(id)a3 group:(id)a4;
- (void)_connect;
- (void)_handleLastCallForPendingIdentifier:(id)a3 callbackID:(id)a4;
- (void)_replaceSentinelInSendParameters:(id)a3 withCurrentActiveDevice:(id)a4;
- (void)_resendPendingSends;
- (void)_sendMissingMessageMetric:(id)a3;
- (void)_setTemporaryMessageContext:(id)a3;
- (void)accessoryDataReceived:(id)a3 withGUID:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8;
- (void)accessoryReportMessageReceived:(id)a3 accessoryID:(id)a4 controllerID:(id)a5 withGUID:(id)a6 forTopic:(id)a7 toURI:(id)a8 fromURI:(id)a9 context:(id)a10;
- (void)account:(id)a3 connectedDevicesChanged:(id)a4;
- (void)account:(id)a3 devicesChanged:(id)a4;
- (void)account:(id)a3 isActiveChanged:(BOOL)a4;
- (void)account:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)addDelegate:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)checkTransportLogWithReason:(int64_t)a3;
- (void)connection:(id)a3 incomingAckWithIdentifier:(id)a4 forTopic:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 hasBeenDeliveredWithContext:(id)a8 isAppAck:(BOOL)a9;
- (void)connection:(id)a3 incomingDataFromDirectConnection:(id)a4 withGUID:(id)a5 forTopic:(id)a6 toIdentifier:(id)a7 fromID:(id)a8 context:(id)a9;
- (void)connection:(id)a3 incomingGUIDAckFromDirectConnection:(id)a4;
- (void)connection:(id)a3 incomingMessageFromDirectConnection:(id)a4 withGUID:(id)a5 forTopic:(id)a6 toIdentifier:(id)a7 fromID:(id)a8 context:(id)a9;
- (void)connection:(id)a3 incomingProtobufFromDirectConnection:(id)a4 withGUID:(id)a5 forTopic:(id)a6 toIdentifier:(id)a7 fromID:(id)a8 context:(id)a9;
- (void)connection:(id)a3 messageSendFailed:(id)a4 responseCode:(int64_t)a5;
- (void)createDirectMessageConnectionIfNeeded;
- (void)daemonConnected;
- (void)dataReceived:(id)a3 withGUID:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8;
- (void)dealloc;
- (void)didCancelMessageWithSuccess:(BOOL)a3 onAccount:(id)a4 error:(id)a5 identifier:(id)a6;
- (void)didFlushCacheForService:(id)a3 remoteURI:(id)a4 fromURI:(id)a5 guid:(id)a6;
- (void)didFlushCacheFromKTPeerUpdateForService:(id)a3 peerURI:(id)a4;
- (void)didSendOpportunisticDataWithIdentifier:(id)a3 onAccount:(id)a4 toIDs:(id)a5;
- (void)incomingInvitation:(id)a3 withGUID:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8;
- (void)incomingInvitationUpdate:(id)a3 withGUID:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8;
- (void)messageIdentifier:(id)a3 alternateCallbackID:(id)a4 forAccount:(id)a5 updatedWithResponseCode:(int64_t)a6 error:(id)a7 lastCall:(BOOL)a8 context:(id)a9;
- (void)messageIdentifier:(id)a3 alternateCallbackID:(id)a4 forAccount:(id)a5 willSendToDestinations:(id)a6 skippedDestinations:(id)a7 registrationPropertyToDestinations:(id)a8;
- (void)messageIdentifier:(id)a3 forTopic:(id)a4 toURI:(id)a5 fromURI:(id)a6 hasBeenDeliveredWithContext:(id)a7;
- (void)messageIdentifierInner:(id)a3 alternateCallbackID:(id)a4 forAccount:(id)a5 updatedWithResponseCode:(int64_t)a6 error:(id)a7 lastCall:(BOOL)a8 context:(id)a9 isDirectMessage:(BOOL)a10;
- (void)messageReceived:(id)a3 withGUID:(id)a4 withPayload:(id)a5 forTopic:(id)a6 toURI:(id)a7 fromURI:(id)a8 context:(id)a9;
- (void)opportunisticDataReceived:(id)a3 withIdentifier:(id)a4 fromURI:(id)a5 context:(id)a6;
- (void)pendingIncomingMessageWithGUID:(id)a3 forTopic:(id)a4 toURI:(id)a5 fromURI:(id)a6 context:(id)a7;
- (void)pendingResourceWithMetadata:(id)a3 guid:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8;
- (void)protobufReceived:(id)a3 withGUID:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8;
- (void)receivedGroupSessionParticipantDataUpdate:(id)a3 forTopic:(id)a4 toIdentifier:(id)a5 fromID:(id)a6;
- (void)receivedGroupSessionParticipantUpdate:(id)a3 forTopic:(id)a4 toIdentifier:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)receivedMetadataForDirectMessaging:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)sendAppAckForDirectMessage:(id)a3;
- (void)sessionInvitationReceivedWithPayload:(id)a3 forTopic:(id)a4 sessionID:(id)a5 toIdentifier:(id)a6 fromID:(id)a7 transportType:(id)a8;
- (void)setDelegateCapabilities:(unsigned int)a3;
- (void)setDirectMessageConnection:(id)a3;
- (void)setDirectMessagingMetadata:(id)a3;
- (void)setWakingDowngradeCount:(unsigned int)a3;
- (void)xpcObject:(id)a3 objectContext:(id)a4;
@end

@implementation _IDSConnection

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_IDSConnection;
  return [(_IDSConnection *)&v3 init];
}

- (_IDSConnection)initWithAccount:(id)a3 commands:(id)a4 indirectDelegateCallouts:(BOOL)a5 delegateContext:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (_IDSRunningInDaemon())
  {
    v14 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A2E4A8((uint64_t)self, v14);
    }

    v15 = 0;
  }
  else
  {
    v16 = +[IDSInternalQueueController sharedInstance];
    int v17 = [v16 assertQueueIsCurrent];

    if (v17)
    {
      v18 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_191A31DAC();
      }
    }
    v36.receiver = self;
    v36.super_class = (Class)_IDSConnection;
    v19 = [(_IDSConnection *)&v36 init];
    if (v19)
    {
      v20 = +[IDSLogging IDSConnection];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [v11 _internal];
        v22 = [v21 serviceName];
        *(_DWORD *)buf = 134218242;
        v38 = v19;
        __int16 v39 = 2112;
        v40 = v22;
        _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "_IDSConnection - initing {self: %p, account.serviceName: %@}", buf, 0x16u);
      }
      v19->_indirectDelegateCallouts = a5;
      uint64_t v23 = [NSString copyStringGUIDForObject:v19];
      serviceToken = v19->_serviceToken;
      v19->_serviceToken = (NSString *)v23;

      *(_WORD *)&v19->_incomingMessageLoggingSequence = 0;
      uint64_t v25 = [v12 copy];
      commands = v19->_commands;
      v19->_commands = (NSSet *)v25;

      objc_storeStrong((id *)&v19->_account, a3);
      v27 = [(IDSAccount *)v19->_account _internal];
      v28 = +[IDSInternalQueueController sharedInstance];
      v29 = [v28 queue];
      [v27 addDelegate:v19 queue:v29];

      uint64_t v30 = [MEMORY[0x1E4F59E30] weakRefWithObject:v13];
      id delegateContext = v19->_delegateContext;
      v19->_id delegateContext = (id)v30;

      v19->_wakingDowngradeCount = 0;
      v32 = [(_IDSConnection *)v19 daemonListener];
      [v32 addHandler:v19];

      [(_IDSConnection *)v19 _connect];
      directMessageConnection = v19->_directMessageConnection;
      v19->_directMessageConnection = 0;

      directMessagingMetadata = v19->_directMessagingMetadata;
      v19->_directMessagingMetadata = 0;
    }
    self = v19;
    v15 = self;
  }

  return v15;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[IDSLogging IDSConnection];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_INFO, "Account delegate has been cleaned up via weak references %p", buf, 0xCu);
  }

  v4 = [(_IDSConnection *)self daemonController];
  [v4 removeListenerID:self->_serviceToken];

  v5 = [(_IDSConnection *)self daemonListener];
  [v5 removeHandler:self];

  v6.receiver = self;
  v6.super_class = (Class)_IDSConnection;
  [(_IDSConnection *)&v6 dealloc];
}

- (void)createDirectMessageConnectionIfNeeded
{
  if (_IDSSupportsDirectMessaging())
  {
    objc_super v3 = +[IDSInternalQueueController sharedInstance];
    int v4 = [v3 assertQueueIsCurrent];

    if (v4)
    {
      v5 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_191A31E44();
      }
    }
    if (!self->_directMessageConnection)
    {
      objc_super v6 = [IDSDirectMessageConnection alloc];
      v7 = [(IDSAccount *)self->_account _internal];
      v8 = [v7 serviceName];
      uint64_t v9 = +[IDSInternalQueueController sharedInstance];
      v10 = [v9 queue];
      id v11 = [(IDSDirectMessageConnection *)v6 initWithServiceName:v8 queue:v10 delegate:self];
      directMessageConnection = self->_directMessageConnection;
      self->_directMessageConnection = v11;

      directMessagingMetadata = self->_directMessagingMetadata;
      if (!directMessagingMetadata || ![(NSDictionary *)directMessagingMetadata count])
      {
        v14 = [(_IDSConnection *)self daemonListener];
        v15 = [v14 getDirectMessagingMetadataDictionary];
        v16 = self->_directMessagingMetadata;
        self->_directMessagingMetadata = v15;
      }
      if ([(NSDictionary *)self->_directMessagingMetadata count]) {
        [(_IDSConnection *)self receivedMetadataForDirectMessaging:self->_directMessagingMetadata];
      }
      int v17 = self->_directMessageConnection;
      v18 = [(IDSAccount *)self->_account _internal];
      v19 = [v18 connectedDevices];
      [(IDSDirectMessageConnection *)v17 updateConnectedDevices:v19];
    }
  }
}

- (id)daemonController
{
  return +[IDSDaemonController sharedInstance];
}

- (id)daemonListener
{
  v2 = +[IDSDaemonController sharedInstance];
  objc_super v3 = [v2 listener];

  return v3;
}

- (IDSAccount)account
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A31EDC();
    }
  }
  account = self->_account;

  return account;
}

- (BOOL)isActive
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A31F74();
    }
  }
  objc_super v6 = [(IDSAccount *)self->_account _internal];
  char v7 = [v6 isActive];

  return v7;
}

- (id)_activeDevice
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(_IDSConnection *)self account];
  objc_super v3 = [v2 _internal];
  int v4 = [v3 devices];

  id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 isActive])
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_defaultPairedDevice
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(_IDSConnection *)self account];
  objc_super v3 = [v2 _internal];
  int v4 = [v3 devices];

  id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 isDefaultPairedDevice])
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
}

- (void)addDelegate:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = (void (**)(void))a5;
  long long v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    long long v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A3200C();
    }
  }
  if (v8 && v9)
  {
    v14 = [(NSMapTable *)self->_delegateToInfo objectForKey:v8];

    if (!v14)
    {
      if (!self->_delegateToInfo)
      {
        uint64_t v15 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
        delegateToInfo = self->_delegateToInfo;
        self->_delegateToInfo = v15;
      }
      id v17 = objc_alloc_init(MEMORY[0x1E4F6B420]);
      [v17 setQueue:v9];
      [(NSMapTable *)self->_delegateToInfo setObject:v17 forKey:v8];
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_191974FA8;
    v20[3] = &unk_1E572B308;
    v20[4] = self;
    uint64_t v18 = MEMORY[0x192FE03B0](v20);
    v19 = (void *)v18;
    if (v18)
    {
      (*(void (**)(uint64_t, void (**)(void)))(v18 + 16))(v18, v10);
    }
    else if (v10)
    {
      v10[2](v10);
    }
  }
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMapTable *)self->_delegateToInfo removeObjectForKey:v4];
    if (![(NSMapTable *)self->_delegateToInfo count])
    {
      delegateToInfo = self->_delegateToInfo;
      self->_delegateToInfo = 0;
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)_callDelegatesWithBlock:(id)a3
{
}

- (void)_callDelegatesWithBlock:(id)a3 group:(id)a4
{
}

- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6
{
}

- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6 group:(id)a7
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v49 = (void (**)(id, uint64_t))a4;
  id v12 = a5;
  v48 = (void (**)(id, uint64_t))a6;
  long long v13 = a7;
  v14 = v13;
  v50 = (void (**)(void, void))v12;
  if (v12)
  {
    group = v13;
    uint64_t v15 = +[IDSInternalQueueController sharedInstance];
    int v16 = [v15 assertQueueIsCurrent];

    if (v16)
    {
      id v17 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_191A320A4();
      }
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    context = (void *)MEMORY[0x192FE0160]();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v20 = self->_delegateToInfo;
    uint64_t v21 = [(NSMapTable *)v20 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v62 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v61 + 1) + 8 * i);
          uint64_t v26 = [(NSMapTable *)self->_delegateToInfo objectForKey:v25];
          v27 = (void *)v26;
          if (v25) {
            BOOL v28 = v26 == 0;
          }
          else {
            BOOL v28 = 1;
          }
          if (!v28 && (!a3 || (objc_opt_respondsToSelector() & 1) != 0))
          {
            [v18 addObject:v25];
            [v19 addObject:v27];
          }
        }
        uint64_t v22 = [(NSMapTable *)v20 countByEnumeratingWithState:&v61 objects:v65 count:16];
      }
      while (v22);
    }

    v14 = group;
    if ([v18 count])
    {
      char v29 = 1;
      do
      {
        uint64_t v30 = (void *)MEMORY[0x192FE0160]();
        v31 = [v18 objectAtIndex:0];
        v32 = [v19 objectAtIndex:0];
        [v18 removeObjectAtIndex:0];
        [v19 removeObjectAtIndex:0];
        uint64_t v33 = [v18 count];
        v34 = [v32 queue];
        if (v14) {
          dispatch_group_enter(v14);
        }
        v35 = +[IDSInternalQueueController sharedInstance];
        objc_super v36 = [v35 queue];

        if (v34 == v36)
        {
          if (a3)
          {
            v14 = group;
            if (v49 != 0 && (v29 & 1) != 0) {
              v49[2](v49, 1);
            }
            ((void (**)(void, void *))v50)[2](v50, v31);
            if (v48 && !v33) {
              v48[2](v48, 1);
            }
          }
          else
          {
            ((void (**)(void, void *))v50)[2](v50, v31);
            v14 = group;
          }
          id v43 = self;
          id v44 = self;
          if (!v14) {
            goto LABEL_42;
          }
        }
        else if (v34)
        {
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = sub_191975754;
          v52[3] = &unk_1E572B330;
          SEL v58 = a3;
          char v59 = v29 & 1;
          v55 = v49;
          v56 = v50;
          id v53 = v31;
          BOOL v60 = v33 == 0;
          v57 = v48;
          id v54 = v32;
          v37 = (void *)MEMORY[0x192FE03B0](v52);
          v38 = v37;
          if (v34 == MEMORY[0x1E4F14428]) {
            dispatch_block_t v39 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v37);
          }
          else {
            dispatch_block_t v39 = (dispatch_block_t)[v37 copy];
          }
          v42 = v39;

          v14 = group;
          if (group) {
            dispatch_group_async(group, v34, v42);
          }
          else {
            dispatch_async(v34, v42);
          }

          if (!group) {
            goto LABEL_42;
          }
        }
        else
        {
          id v40 = self;
          id v41 = self;
          v14 = group;
          if (!group) {
            goto LABEL_42;
          }
        }
        dispatch_group_leave(v14);
LABEL_42:

        char v29 = 0;
      }
      while ([v18 count]);
    }
    id v45 = self;
    id v46 = self;
  }
}

- (void)setDelegateCapabilities:(unsigned int)a3
{
  id v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    char v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3213C();
    }
  }
  self->_delegateCapabilities = a3;
}

- (void)sendAppAckForDirectMessage:(id)a3
{
}

- (id)_sendWithParameters:(id)a3 options:(id)a4 loggingType:(id)a5 loggingDataSize:(unint64_t)a6
{
  int v220 = a6;
  uint64_t v241 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  long long v11 = (__CFString *)a5;
  id v12 = [NSString stringGUID];
  long long v13 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v230 = v12;
    _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "!setState guid=%@", buf, 0xCu);
  }

  uint64_t v14 = [v10 objectForKey:@"IDSSendMessageOptionUUID"];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    uint64_t v16 = JWUUIDPushObjectToString();

    id v12 = (void *)v16;
  }
  else
  {
    uint64_t v15 = IDSGetUUIDData();
  }
  if (_IDSSupportsDirectMessaging()
    && +[IDSDirectMessageConnection isDirectMessagingRequested:v10]&& !self->_directMessageConnection)
  {
    [(_IDSConnection *)self createDirectMessageConnectionIfNeeded];
  }
  directMessageConnection = self->_directMessageConnection;
  if (directMessageConnection)
  {
    id v18 = [(_IDSConnection *)self _activeDevice];
    BOOL v19 = [(IDSDirectMessageConnection *)directMessageConnection isMessageEligible:v9 options:v10 destinationDevice:v18];

    if (v19)
    {
      v20 = [(IDSAccount *)self->_account _internal];
      uint64_t v21 = [v20 uniqueID];

      [v9 setAccountUUID:v21];
      uint64_t v22 = [v10 objectForKey:@"IDSSendMessageOptionWantsClientAcknowledgement"];
      objc_msgSend(v9, "setWantsAppAck:", objc_msgSend(v22, "BOOLValue"));

      uint64_t v23 = [v10 objectForKey:@"IDSSendMessageOptionExpectsPeerResponse"];
      objc_msgSend(v9, "setExpectsPeerResponse:", objc_msgSend(v23, "BOOLValue"));

      [v9 setMessageUUID:v15];
      [v9 setIdentifier:v12];
      v24 = [v10 objectForKey:@"IDSSendMessageOptionPeerResponseIdentifier"];
      [v9 setPeerResponseIdentifier:v24];

      uint64_t v25 = [v10 objectForKey:@"IDSSendMessageOptionQueueOneIdentifier"];
      [v9 setQueueOneIdentifier:v25];

      uint64_t v26 = [v10 objectForKey:@"IDSSendMessageOptionTopLevelDictionary"];
      objc_msgSend(v9, "setUseDictAsTopLevel:", objc_msgSend(v26, "BOOLValue"));

      v27 = [v10 objectForKey:@"IDSSendMessageOptionRequireBluetooth"];
      objc_msgSend(v9, "setRequireBluetooth:", objc_msgSend(v27, "BOOLValue"));

      [(IDSDirectMessageConnection *)self->_directMessageConnection sendMessageWithParameters:v9 options:v10];
      id v28 = v12;
      goto LABEL_159;
    }
  }
  v222 = v11;
  v223 = v15;
  id v29 = objc_alloc(MEMORY[0x1E4F6B5A0]);
  v225 = self;
  uint64_t v30 = [(_IDSConnection *)self account];
  v31 = [v30 _internal];
  v32 = [v31 serviceName];
  uint64_t v33 = (void *)[v29 initWithServiceIdentifier:v32];

  v34 = &off_1E5728000;
  if (CUTIsInternalInstall())
  {
    v35 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v230 = v12;
      _os_log_impl(&dword_19190B000, v35, OS_LOG_TYPE_DEFAULT, "sendMessage - Inspecting message {%@} payload for security issues", buf, 0xCu);
    }

    objc_super v36 = (void *)MEMORY[0x1E4F6B510];
    v37 = [v9 message];
    [v36 inspectPayload:v37 messageGuid:v12];
  }
  v214 = @"IDSSendMessageOptionDataToEncrypt";
  v38 = objc_msgSend(v10, "objectForKey:");
  [v9 setDataToEncrypt:v38];

  dispatch_block_t v39 = [v10 objectForKey:@"IDSSendMessageOptionWantsResponse"];
  objc_msgSend(v9, "setWantsResponse:", objc_msgSend(v39, "BOOLValue"));

  id v40 = [v10 objectForKey:@"IDSSendMessageOptionWantsProgress"];
  objc_msgSend(v9, "setWantsProgress:", objc_msgSend(v40, "BOOLValue"));

  id v41 = [v10 objectForKey:@"IDSSendMessageOptionFromID"];
  [v9 setFromID:v41];

  [v10 objectForKey:@"IDSSendMessageOptionTimeout"];
  v42 = [v10 objectForKey:@"IDSSendMessageOptionTimeout"];
  id v43 = v42;
  v224 = v12;
  if (v42) {
    [v42 doubleValue];
  }
  else {
    double v44 = 180.0;
  }
  [v9 setTimeout:v44];
  id v45 = MEMORY[0x192FDF280](@"allowlistedidsservices");
  objc_opt_class();
  v219 = v33;
  v215 = v45;
  if (objc_opt_isKindOfClass())
  {
    id v46 = [(_IDSConnection *)self account];
    v47 = [v46 _internal];
    [v47 pushTopic];
    v48 = v33;
    v50 = v49 = v43;
    char v51 = [v45 containsObject:v50];

    id v43 = v49;
    uint64_t v33 = v48;
    v34 = &off_1E5728000;

    v52 = [v10 objectForKey:@"IDSSendMessageOptionNonWaking"];
    objc_msgSend(v9, "setNonWaking:", objc_msgSend(v52, "BOOLValue"));

    if (v51) {
      goto LABEL_34;
    }
  }
  else
  {
    id v53 = [v10 objectForKey:@"IDSSendMessageOptionNonWaking"];
    objc_msgSend(v9, "setNonWaking:", objc_msgSend(v53, "BOOLValue"));
  }
  id v54 = [v9 destinations];
  BOOL v55 = [(_IDSConnection *)self _isDestinationSingleLocalAddress:v54];

  if (v55)
  {
    if ([v9 priority] == 300 && (objc_msgSend(v33, "allowUrgentMessages") & 1) == 0)
    {
      [v9 setPriority:200];
      v56 = +[IDSTransportLog IDSConnection];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        v57 = [(_IDSConnection *)self account];
        [v57 _internal];
        SEL v58 = v33;
        v60 = char v59 = v43;
        id v61 = [v60 pushTopic];
        *(_DWORD *)buf = 138412546;
        *(void *)v230 = v12;
        *(_WORD *)&v230[8] = 2112;
        *(void *)v231 = v61;
        _os_log_impl(&dword_19190B000, v56, OS_LOG_TYPE_DEFAULT, "Downgrading priority of message with GUID %@ to Default from Urgent, The client %@ is not configured to send urgent messages", buf, 0x16u);

        id v43 = v59;
        uint64_t v33 = v58;
        v34 = &off_1E5728000;
      }
    }
    if (([v33 allowWakingMessages] & 1) == 0)
    {
      [(_IDSConnection *)self setWakingDowngradeCount:[(_IDSConnection *)self wakingDowngradeCount] + 1];
      long long v62 = +[IDSTransportLog IDSConnection];
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        long long v63 = [(_IDSConnection *)self account];
        [v63 _internal];
        v65 = long long v64 = v43;
        id v66 = [v65 pushTopic];
        unsigned int v67 = [(_IDSConnection *)self wakingDowngradeCount];
        *(_DWORD *)buf = 138412802;
        *(void *)v230 = v12;
        *(_WORD *)&v230[8] = 2112;
        *(void *)v231 = v66;
        *(_WORD *)&v231[8] = 1024;
        LODWORD(v232) = v67;
        _os_log_impl(&dword_19190B000, v62, OS_LOG_TYPE_DEFAULT, "Downgrading waking status of message with GUID %@ to non-waking, the client %@ is not configured to send waking messages.  Total messages downgraded: %u", buf, 0x1Cu);

        id v43 = v64;
        uint64_t v33 = v219;
        v34 = &off_1E5728000;
      }
      [v9 setNonWaking:1];
    }
  }
LABEL_34:
  v68 = [v10 objectForKey:@"IDSSendMessageOptionEnforceRemoteTimeouts"];

  if (v68)
  {
    v68 = [v10 objectForKey:@"IDSSendMessageOptionEnforceRemoteTimeouts"];
    int v69 = [v68 BOOLValue];

    LODWORD(v68) = v69;
  }
  else
  {
    LOBYTE(v69) = 1;
  }
  v216 = v43;
  if (((v43 != 0) & ~[v33 blockRemoteTimeouts] & v69) != 0
    || v68)
  {
    [v9 setEnforceRemoteTimeouts:1];
  }
  v70 = [v10 objectForKey:@"IDSSendMessageOptionAccessToken"];

  if (v70)
  {
    v71 = [v10 objectForKey:@"IDSSendMessageOptionAccessToken"];
    [v9 setAccessToken:v71];
  }
  v72 = [v10 objectForKey:@"IDSSendMessageOptionHomeKitMessage"];
  int v73 = [v72 BOOLValue];

  if (v73) {
    [v9 setHomeKitPayload:1];
  }
  v74 = [v10 objectForKey:@"IDSSendMessageOptionSubServiceKey"];
  if ([v74 length]) {
    [v9 setSubService:v74];
  }
  v213 = v74;
  v75 = [v10 objectForKey:@"IDSSendMessageOptionFakeMessage"];
  objc_msgSend(v9, "setFakeMessage:", objc_msgSend(v75, "BOOLValue"));

  v76 = [v10 objectForKey:@"IDSSendMessageOptionDisableAliasValidation"];
  objc_msgSend(v9, "setDisableAliasValidation:", objc_msgSend(v76, "BOOLValue"));

  v77 = [v10 objectForKey:@"IDSSendMessageOptionCommand"];
  [v9 setCommand:v77];

  v78 = [v10 objectForKey:@"IDSSendMessageOptionWantsClientAcknowledgement"];
  objc_msgSend(v9, "setWantsAppAck:", objc_msgSend(v78, "BOOLValue"));

  v79 = [v10 objectForKey:@"IDSSendMessageOptionWantsDeliveryStatus"];
  objc_msgSend(v9, "setWantsDeliveryStatus:", objc_msgSend(v79, "BOOLValue"));

  v80 = [v10 objectForKey:@"IDSSendMessageOptionWantsCertifiedDelivery"];
  objc_msgSend(v9, "setWantsCertifiedDelivery:", objc_msgSend(v80, "BOOLValue"));

  v81 = [v10 objectForKey:@"IDSSendMessageOptionDeliveryStatusContext"];
  [v9 setDeliveryStatusContext:v81];

  [v9 setMessageUUID:v223];
  v82 = [v10 objectForKey:@"IDSSendMessageOptionAlternateCallbackIdentifier"];
  [v9 setAlternateCallbackID:v82];

  v83 = [v10 objectForKey:@"IDSSendMessageOptionOriginalTimestampKey"];
  [v9 setOriginalTimestamp:v83];

  v84 = [v10 objectForKey:@"IDSSendMessageOptionEncryptPayload"];
  objc_msgSend(v9, "setEncryptPayload:", objc_msgSend(v84, "BOOLValue"));

  v85 = [v10 objectForKey:@"IDSSendMessageOptionCompressPayload"];
  v212 = v85;
  if (v85) {
    uint64_t v86 = [v85 BOOLValue];
  }
  else {
    uint64_t v86 = 1;
  }
  [v9 setCompressPayload:v86];
  v87 = [v10 objectForKey:@"IDSSendMessageOptionForceLocalDelivery"];
  if ([v87 BOOLValue])
  {
    uint64_t v88 = 1;
  }
  else
  {
    v89 = [v10 objectForKey:@"IDSSendMessageOptionLocalDelivery"];
    if ([v89 BOOLValue])
    {
      uint64_t v88 = 1;
    }
    else
    {
      v90 = [v10 objectForKey:@"IDSSendMessageOptionRequireBluetooth"];
      uint64_t v88 = [v90 BOOLValue];
    }
  }

  [v9 setLocalDelivery:v88];
  v91 = [v10 objectForKey:@"IDSSendMessageOptionAllowCloudDeliveryKey"];
  objc_msgSend(v9, "setAllowCloudDelivery:", objc_msgSend(v91, "BOOLValue"));

  v92 = [v10 objectForKey:@"IDSSendMessageOptionRequireBluetooth"];
  objc_msgSend(v9, "setRequireBluetooth:", objc_msgSend(v92, "BOOLValue"));

  v93 = [v10 objectForKey:@"IDSSendMessageOptionRequireLocalWiFi"];
  objc_msgSend(v9, "setRequireLocalWiFi:", objc_msgSend(v93, "BOOLValue"));

  v94 = [v10 objectForKey:@"IDSSendMessageOptionTopLevelDictionary"];
  objc_msgSend(v9, "setUseDictAsTopLevel:", objc_msgSend(v94, "BOOLValue"));

  v95 = [v10 objectForKey:@"IDSSendMessageOptionExpectsPeerResponse"];
  objc_msgSend(v9, "setExpectsPeerResponse:", objc_msgSend(v95, "BOOLValue"));

  v96 = [v10 objectForKey:@"IDSSendMessageOptionPeerResponseIdentifier"];
  [v9 setPeerResponseIdentifier:v96];

  v97 = [v10 objectForKey:@"IDSSendMessageOptionAlwaysSkipSelfKey"];
  objc_msgSend(v9, "setAlwaysSkipSelf:", objc_msgSend(v97, "BOOLValue"));

  v98 = [v10 objectForKey:@"IDSSendMessageOptionForceQuery"];
  objc_msgSend(v9, "setForceQuery:", objc_msgSend(v98, "integerValue"));

  v99 = [v10 objectForKey:@"IDSSendMessageOptionAlwaysIncludeSelfKey"];
  objc_msgSend(v9, "setAlwaysIncludeSelf:", objc_msgSend(v99, "BOOLValue"));

  v100 = [v10 objectForKey:@"IDSSendMessageOptionWantsFirewallDonation"];
  objc_msgSend(v9, "setWantsFirewallDonation:", objc_msgSend(v100, "BOOLValue"));

  v101 = [v10 objectForKey:@"IDSSendMessageOptionPushPriority"];
  if (v101)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v101 integerValue], (_IDSIsValidPushPriority() & 1) != 0))
    {
      [v9 setPushPriority:v101];
    }
    else
    {
      v102 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v102, OS_LOG_TYPE_FAULT)) {
        sub_191A32284();
      }
    }
  }
  uint64_t v103 = [v10 objectForKey:@"IDSSendMessageOptionDeliveryMinimumTimeDelayKey"];
  v218 = (void *)v103;
  if (v103)
  {
    v104 = (void *)v103;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v104 longLongValue] < 0)
    {
      v106 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT)) {
        sub_191A32284();
      }
    }
    else
    {
      uint64_t v105 = [v104 unsignedLongLongValue];
      v106 = [NSNumber numberWithUnsignedLongLong:v105];
      [v9 setDeliveryMinimumTimeDelay:v106];
    }
  }
  uint64_t v107 = [v10 objectForKey:@"IDSSendMessageOptionDeliveryMinimumTimeKey"];
  v217 = (void *)v107;
  if (v107)
  {
    v108 = (void *)v107;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v108 longLongValue] < 0)
    {
      v110 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v110, OS_LOG_TYPE_FAULT)) {
        sub_191A32284();
      }
    }
    else
    {
      [v108 doubleValue];
      v110 = [NSNumber numberWithUnsignedLongLong:(unint64_t)(v109 * 1000.0)];
      [v9 setDeliveryMinimumTime:v110];
    }
  }
  v111 = [v10 objectForKey:@"IDSSendMessageOptionSendModeKey"];
  if (v111)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v111 integerValue], (_IDSIsValidSendMode()))
    {
      [v9 setSendMode:v111];
    }
    else
    {
      v112 = v111;
      v113 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v113, OS_LOG_TYPE_FAULT)) {
        sub_191A32284();
      }

      v111 = v112;
    }
  }
  v210 = v111;
  uint64_t v114 = [v10 objectForKey:@"IDSSendMessageOptionPublicMessageIntent"];
  if (v114) {
    [v9 setCommandContext:v114];
  }
  v115 = [v10 objectForKey:@"IDSSendMessageOptionDuet"];
  v211 = v101;
  v209 = (void *)v114;
  if ([v115 BOOLValue])
  {
    uint64_t v116 = 1;
    p_isa = (id *)&v225->super.isa;
  }
  else
  {
    v118 = [v10 objectForKey:@"IDSSendMessageOptionNSURLSession"];
    if ([v118 BOOLValue])
    {
      uint64_t v116 = 1;
    }
    else
    {
      [v10 objectForKey:@"IDSSendMessageOptionBypassDuet"];
      v120 = v119 = v34;
      uint64_t v116 = [v120 BOOLValue];

      v34 = v119;
    }
    p_isa = (id *)&v225->super.isa;
  }
  v121 = [v10 objectForKey:@"IDSSendMessageOptionSockPuppet"];
  if ([v121 BOOLValue])
  {
    uint64_t v122 = [v9 priority];

    if (v122 == 200) {
      uint64_t v116 = 1;
    }
    else {
      uint64_t v116 = v116;
    }
  }
  else
  {
  }
  v123 = [v10 objectForKey:@"IDSSendMessageOptionAllowCloudDeliveryKey"];
  if ([v123 BOOLValue])
  {
    uint64_t v124 = [v9 priority];

    if (v124 == 200) {
      uint64_t v116 = 1;
    }
    else {
      uint64_t v116 = v116;
    }
  }
  else
  {
  }
  v125 = [v10 objectForKey:@"IDSSendMessageOptionAllowCloudDeliveryKey"];
  int v126 = [v125 BOOLValue];

  if (v126)
  {
    v127 = [p_isa _activeDevice];
    v128 = v127;
    if (v127 && ([v127 isConnected] & 1) == 0 && (objc_msgSend(v128, "isCloudConnected") & 1) == 0)
    {
      id v129 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v130 = [p_isa account];
      v131 = [v130 _internal];
      v132 = [v131 pushTopic];
      v133 = objc_msgSend(v129, "initWithObjectsAndKeys:", v132, @"IDSClientBringsUpCloudMessaging", 0);

      IDSPowerLogDictionary();
      v134 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
      {
        v135 = [p_isa account];
        v136 = [v135 _internal];
        id v137 = [v136 pushTopic];
        *(_DWORD *)buf = 138412546;
        *(void *)v230 = v137;
        *(_WORD *)&v230[8] = 2112;
        *(void *)v231 = v224;
        _os_log_impl(&dword_19190B000, v134, OS_LOG_TYPE_DEFAULT, "Client %@ is forcing QR for Cloud Message with GUID %@", buf, 0x16u);
      }
      id v12 = v224;
      v34 = &off_1E5728000;
    }
  }
  [v9 setBypassDuet:v116];
  v138 = [v10 objectForKey:@"IDSSendMessageOptionNonCloudWakingKey"];
  objc_msgSend(v9, "setNonCloudWaking:", objc_msgSend(v138, "BOOLValue"));

  v139 = [v10 objectForKey:@"IDSSendMessageOptionLiveMessageDelivery"];
  objc_msgSend(v9, "setLiveMessageDelivery:", objc_msgSend(v139, "BOOLValue"));

  v140 = [v10 objectForKey:@"IDSSendMessageOptionDropMessageIndicator"];
  [v9 setDropMessageIndicatorCommand:v140];

  v141 = [v10 objectForKey:@"IDSSendMessageOptionFireAndForget"];
  uint64_t v142 = [v141 BOOLValue];

  [v9 setFireAndForget:v142];
  if ((v142 & 1) != 0
    || ([v10 objectForKey:@"IDSSendMessageOptionMapTile"],
        v143 = objc_claimAutoreleasedReturnValue(),
        int v144 = [v143 BOOLValue],
        v143,
        v144))
  {
    [v9 setBypassStorage:1];
  }
  v145 = [v10 objectForKey:@"IDSSendMessageOptionQueueOneIdentifier"];
  if (v145)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v146 = [v34[189] IDSConnection];
      if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
        sub_191A321D4();
      }

      v145 = 0;
    }
  }
  v147 = [v10 objectForKey:@"IDSSendMessageOptionActivityContinuation"];
  int v148 = [v147 BOOLValue];

  if (v148)
  {
    [v9 setActivityContinuation:1];
    if (!v145) {
      v145 = @"IDSActivityContinuationIdentifier";
    }
  }
  v149 = [v10 objectForKey:@"IDSSendMessageOptionTethering"];
  int v150 = [v149 BOOLValue];

  if (v150) {
    [v9 setLocalDelivery:1];
  }
  v151 = [v10 objectForKey:@"IDSSendMessageOptionOpportunisticDuet"];
  int v152 = [v151 BOOLValue];

  if (v152)
  {
    [v9 setNonWaking:1];
    [v9 setLocalDelivery:1];
    if (!v145) {
      v145 = @"IDSOpportunisticDuetIdentifier";
    }
    goto LABEL_127;
  }
  if (v145) {
LABEL_127:
  }
    [v9 setQueueOneIdentifier:v145];
  v153 = [v10 objectForKey:@"IDSSendMessageOptionForceEncryptionOff"];
  objc_msgSend(v9, "setForceEncryptionOff:", objc_msgSend(v153, "BOOLValue"));

  uint64_t v154 = [v10 objectForKey:@"IDSSendMessageOptionKTVerificationUUIDKey"];
  if (v154) {
    [v9 setKeyTransparencyURIVerificationMap:v154];
  }
  v208 = (void *)v154;
  v155 = [v10 objectForKey:@"IDSSendMessageOptionDuetIdentifiersOverride"];
  v156 = [v155 allObjects];
  [v9 setDuetIdentifiersOverride:v156];

  uint64_t v157 = [v10 objectForKey:@"IDSSendMessageOptionMetricReportIdentifier"];
  if (!v157)
  {
    v158 = [v155 allObjects];
    v159 = [v158 sortedArrayUsingComparator:&unk_1EE246508];

    uint64_t v157 = [v159 firstObject];
  }
  v206 = (void *)v157;
  v207 = v155;
  [v9 setMetricReportIdentifier:v157];
  v205 = [v10 objectForKey:@"IDSSendMessageOptionInterestingRegistrationProperties"];
  v160 = [v205 allObjects];
  [v9 setInterestingRegistrationProperties:v160];

  v204 = [v10 objectForKey:@"IDSSendMessageOptionRequireAllRegistrationProperties"];
  v161 = [v204 allObjects];
  [v9 setRequireAllRegistrationProperties:v161];

  v203 = [v10 objectForKey:@"IDSSendMessageOptionRequireLackOfRegistrationProperties"];
  v162 = [v203 allObjects];
  [v9 setRequireLackOfRegistrationProperties:v162];

  [v9 setIdentifier:v12];
  v163 = [p_isa[5] _internal];
  uint64_t v164 = [v163 uniqueID];

  v202 = (void *)v164;
  [v9 setAccountUUID:v164];
  v165 = [p_isa _activeDevice];
  v166 = [v9 destinations];
  v167 = [v166 destinationURIs];
  int v168 = [v167 containsObject:*MEMORY[0x1E4F6ADA8]];

  if (v168 && v165 && ([v165 relationship] & 2) == 0) {
    [p_isa _replaceSentinelInSendParameters:v9 withCurrentActiveDevice:v165];
  }
  v221 = [v9 destinations];
  v200 = objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:");
  objc_msgSend(v9, "setGroupData:");
  [v9 setDestinations:0];
  if (!p_isa[8])
  {
    id v169 = objc_alloc_init(MEMORY[0x1E4F6C3A0]);
    id v170 = p_isa[8];
    p_isa[8] = v169;
  }
  v171 = [v9 alternateCallbackID];
  v172 = v171;
  if (v171)
  {
    id v173 = v171;
  }
  else
  {
    id v173 = [v9 identifier];
  }
  if (v9)
  {
    [p_isa[8] setOrderedObject:v9 forKey:v173];
  }
  else
  {
    id v197 = v173;
    id v198 = p_isa[8];
    _IMWarn();
  }
  v199 = v173;
  v174 = objc_msgSend(v34[189], "GUIDTRACE", v197, v198);
  if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
  {
    v175 = [p_isa[5] _internal];
    id v176 = [v175 serviceName];
    *(_DWORD *)buf = 138412546;
    *(void *)v230 = v12;
    *(_WORD *)&v230[8] = 2112;
    *(void *)v231 = v176;
    _os_log_impl(&dword_19190B000, v174, OS_LOG_TYPE_DEFAULT, "OUTGOING-CLIENT_REQUEST:%@ SERVICE:%@", buf, 0x16u);
  }
  v201 = v165;

  v177 = (void *)[v10 mutableCopy];
  [v177 removeObjectForKey:@"IDSSendMessageOptionDataToEncrypt"];
  v178 = +[IDSTransportLog IDSConnection];
  if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
  {
    if (v222) {
      v179 = v222;
    }
    else {
      v179 = @"unknown type";
    }
    v180 = [(IDSAccount *)v225->_account _internal];
    id v181 = [v180 serviceName];
    v182 = [v9 deliveryMinimumTime];
    v183 = @"YES";
    if (!v182)
    {
      v214 = [v9 deliveryMinimumTimeDelay];
      if (!v214) {
        v183 = @"NO";
      }
    }
    uint64_t v184 = [(IMOrderedMutableDictionary *)v225->_pendingSends count];
    *(_DWORD *)buf = 138414082;
    *(void *)v230 = v179;
    *(_WORD *)&v230[8] = 2114;
    *(void *)v231 = v181;
    *(_WORD *)&v231[8] = 2114;
    uint64_t v232 = (uint64_t)v224;
    *(_WORD *)v233 = 2112;
    *(void *)&v233[2] = v221;
    *(_WORD *)v234 = 2112;
    *(void *)&v234[2] = v183;
    __int16 v235 = 2112;
    v236 = v177;
    __int16 v237 = 1024;
    int v238 = v220;
    __int16 v239 = 2048;
    uint64_t v240 = v184;
    _os_log_impl(&dword_19190B000, v178, OS_LOG_TYPE_DEFAULT, "Client request to send %@ on service: %{public}@   guid: %{public}@   to destinations: %@  isScheduled? : %@  options: %@    size: %d] (%lu pending)", buf, 0x4Eu);
    if (!v182) {

    }
    id v12 = v224;
  }

  v228[0] = 0xAAAAAAAAAAAAAAAALL;
  v228[1] = 0xAAAAAAAAAAAAAAAALL;
  v185 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12];
  [v185 getUUIDBytes:v228];

  v186 = [MEMORY[0x1E4F6B460] CrossLayerLogging];
  if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
  {
    v187 = [(IDSAccount *)v225->_account _internal];
    id v188 = [v187 serviceName];
    int outgoingMessageLoggingSequence = v225->_outgoingMessageLoggingSequence;
    v225->_int outgoingMessageLoggingSequence = outgoingMessageLoggingSequence + 1;
    *(_DWORD *)buf = 67110658;
    *(_DWORD *)v230 = 120;
    *(_WORD *)&v230[4] = 1024;
    *(_DWORD *)&v230[6] = 255;
    *(_WORD *)v231 = 2112;
    *(void *)&v231[2] = v188;
    uint64_t v232 = 0x832000000100412;
    *(void *)v233 = v228;
    *(_WORD *)&v233[8] = 1024;
    *(_DWORD *)v234 = (unsigned __int16)v220;
    *(_WORD *)&v234[4] = 1024;
    *(_DWORD *)&v234[6] = outgoingMessageLoggingSequence;
    _os_log_impl(&dword_19190B000, v186, OS_LOG_TYPE_DEFAULT, "5 {curProtocol: %hhu, prevProtocol: %hhu, prevBundleID: %@, curUUID: %{public,uuid_t}.16P, curPktLen: %u, logSeqn: %hhu}", buf, 0x34u);

    id v12 = v224;
  }

  v190 = [v9 dictionaryRepresentation];
  v191 = (void *)[v190 copy];

  v192 = [(_IDSConnection *)v225 daemonController];
  objc_msgSend(v192, "setCurXPCMessagePriority:", objc_msgSend(v9, "priority"));

  v193 = [(_IDSConnection *)v225 daemonController];
  v226[0] = MEMORY[0x1E4F143A8];
  v226[1] = 3221225472;
  v226[2] = sub_191977624;
  v226[3] = &unk_1E572B378;
  id v194 = v191;
  id v227 = v194;
  [v193 forwardMethodWithBoostedPriority:v226];

  id v195 = v12;
  long long v11 = v222;
  uint64_t v15 = v223;
  uint64_t v21 = v219;
LABEL_159:

  return v12;
}

- (BOOL)_isDestinationSingleLocalAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(_IDSConnection *)self account];
  int v6 = [v5 accountType];

  if (v6 == 2
    && ([v4 destinationURIs],
        char v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8 == 1))
  {
    id v9 = [v4 destinationURIs];
    if ([v9 containsObject:*MEMORY[0x1E4F6ADA8]])
    {
      char v10 = 1;
    }
    else
    {
      long long v11 = [v4 destinationURIs];
      id v12 = [(_IDSConnection *)self _activeDevice];
      long long v13 = (void *)IDSCopyIDForDevice(v12);
      char v10 = [v11 containsObject:v13];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)_replaceSentinelInSendParameters:(id)a3 withCurrentActiveDevice:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  id v9 = [v7 destinations];
  char v10 = [v9 destinationURIs];
  id v13 = (id)[v8 initWithSet:v10];

  long long v11 = (void *)IDSCopyIDForDevice(v6);
  [v13 removeObject:*MEMORY[0x1E4F6ADA8]];
  [v13 addObject:v11];
  id v12 = [MEMORY[0x1E4F6B438] destinationWithStrings:v13];
  [v7 setDestinations:v12];
}

- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = +[IDSInternalQueueController sharedInstance];
  int v16 = [v15 assertQueueIsCurrent];

  if (v16)
  {
    id v17 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_191A322EC();
    }
  }
  char v51 = a8;
  id v18 = [v14 objectForKey:@"IDSSendMessageOptionSkipPayloadCheck"];
  unsigned __int8 v19 = [v18 BOOLValue];

  v20 = [v13 destinationURIs];
  uint64_t v21 = [v20 count];

  id v54 = v14;
  v50 = self;
  if (v21)
  {
    uint64_t v22 = [(IDSAccount *)self->_account _internal];
    int v23 = [v22 isActive];

    if (v23) {
      v24 = 0;
    }
    else {
      v24 = @"Cannot send with an inactive account";
    }
    if (v23) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = 8;
    }
    if (((v23 ^ 1 | v19) & 1) == 0)
    {
      uint64_t v26 = [v12 data];
      unint64_t v27 = [v26 length];

      if (v27 <= 0x500000) {
        v24 = 0;
      }
      else {
        v24 = @"Cannot send payload of this size";
      }
      if (v27 <= 0x500000) {
        uint64_t v25 = 0;
      }
      else {
        uint64_t v25 = 18;
      }
    }
  }
  else
  {
    v24 = @"Cannot send to empty destination set";
    uint64_t v25 = 1;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v53 = v13;
  id v28 = [v13 destinationURIs];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v56 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        if ((_IDSDestinationHasValidPrefix() & 1) == 0)
        {
          uint64_t v34 = [NSString stringWithFormat:@"Invalid address: %@", v33];

          v24 = (__CFString *)v34;
          uint64_t v25 = 21;
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v30);
  }

  if (v24)
  {
    id v35 = 0;
    v37 = a7;
    objc_super v36 = v53;
    if (!a7) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  id v43 = [(IDSAccount *)v50->_account _internal];
  double v44 = [v43 uniqueID];

  v37 = a7;
  objc_super v36 = v53;
  if (v44)
  {
    id v45 = objc_alloc_init(MEMORY[0x1E4F6B590]);
    [v45 setPriority:a5];
    [v45 setDestinations:v53];
    id v46 = [v12 dictionaryRepresentation];
    [v45 setProtobuf:v46];

    v47 = [v12 data];
    -[_IDSConnection _sendWithParameters:options:loggingType:loggingDataSize:](v50, "_sendWithParameters:options:loggingType:loggingDataSize:", v45, v54, @"protobuf", [v47 length]);
    id v35 = (id)objc_claimAutoreleasedReturnValue();

    v24 = 0;
  }
  else
  {
    id v45 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      account = v50->_account;
      *(_DWORD *)buf = 138412546;
      BOOL v60 = v50;
      __int16 v61 = 2112;
      long long v62 = account;
      _os_log_impl(&dword_19190B000, v45, OS_LOG_TYPE_DEFAULT, "sendPayload - could not find account uniqueID! self: %@ account: %@", buf, 0x16u);
    }
    id v35 = 0;
    v24 = @"Could not find account uniqueID!";
    uint64_t v25 = 7;
  }

  if (a7) {
LABEL_31:
  }
    id *v37 = v35;
LABEL_32:
  if (v24)
  {
    id v38 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    dispatch_block_t v39 = objc_msgSend(v38, "initWithObjectsAndKeys:", v24, *MEMORY[0x1E4F28568], 0);
    id v40 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:v25 userInfo:v39];
    id v41 = v40;
    if (v51) {
      *char v51 = v40;
    }
  }
  return v24 == 0;
}

- (BOOL)sendMessage:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v10 = a4;
  id v53 = a6;
  long long v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    id v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A323EC();
    }
  }
  char v51 = [v53 objectForKey:@"IDSSendMessageOptionTopLevelDictionary"];
  id v14 = [v10 destinationURIs];
  BOOL v15 = [v14 count] == 0;

  if (v15)
  {
    v20 = @"Cannot send to empty destination set";
    uint64_t v19 = 1;
  }
  else if (([v51 BOOLValue] & 1) != 0 || objc_msgSend(v52, "count"))
  {
    int v16 = [(_IDSConnection *)self account];
    id v17 = [v16 _internal];
    int v18 = [v17 isActive];

    if (v18) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = 8;
    }
    if (v18) {
      v20 = 0;
    }
    else {
      v20 = @"Cannot send with an inactive account";
    }
  }
  else
  {
    v20 = @"Cannot send empty message";
    uint64_t v19 = 5;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v21 = [v10 destinationURIs];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v55 != v23) {
          objc_enumerationMutation(v21);
        }
        uint64_t v25 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        if ((_IDSDestinationHasValidPrefix() & 1) == 0)
        {
          uint64_t v26 = [NSString stringWithFormat:@"Invalid address: %@", v25];

          uint64_t v19 = 21;
          v20 = (__CFString *)v26;
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v54 objects:v66 count:16];
    }
    while (v22);
  }

  if (v20)
  {
    id v27 = 0;
    goto LABEL_48;
  }
  id v28 = [(_IDSConnection *)self account];
  uint64_t v29 = [v28 _internal];
  uint64_t v30 = [v29 uniqueID];

  if (!v30)
  {
    uint64_t v33 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      account = self->_account;
      *(_DWORD *)buf = 138412546;
      char v59 = self;
      __int16 v60 = 2112;
      __int16 v61 = account;
      _os_log_impl(&dword_19190B000, v33, OS_LOG_TYPE_DEFAULT, "sendPayload - could not find account uniqueID! self: %@ account: %@", buf, 0x16u);
    }
    id v27 = 0;
    v20 = @"Could not find account uniqueID!";
    uint64_t v19 = 7;
    goto LABEL_47;
  }
  uint64_t v31 = [v53 objectForKey:@"IDSSendMessageOptionSkipPayloadCheck"];
  char v32 = [v31 BOOLValue];

  if ((v32 & 1) == 0)
  {
    uint64_t v33 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v52 format:200 options:0 error:0];
    if ((unint64_t)[v33 length] <= 0x500000)
    {
      if (v33) {
        goto LABEL_36;
      }
    }
    else
    {
    }
    uint64_t v33 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v33, OS_LOG_TYPE_DEFAULT, "sendPayload - could not plist serialize dictionary.", buf, 2u);
    }
    id v27 = 0;
    v20 = @"Could not plist serialize dictionary or otherwise empty payload";
    uint64_t v19 = 6;
    goto LABEL_47;
  }
  uint64_t v33 = 0;
LABEL_36:
  id v35 = (void *)[v53 mutableCopy];
  [v35 removeObjectForKey:@"IDSSendMessageOptionDataToEncrypt"];
  objc_super v36 = +[IDSTransportLog IDSConnection];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = @"Sync";
    if (a5 == 200) {
      v37 = @"Default";
    }
    if (a5 == 300) {
      id v38 = @"URGENT";
    }
    else {
      id v38 = v37;
    }
    dispatch_block_t v39 = [(IDSAccount *)self->_account _internal];
    id v40 = [v39 serviceName];
    *(_DWORD *)buf = 138544130;
    char v59 = (_IDSConnection *)v38;
    __int16 v60 = 2114;
    __int16 v61 = v40;
    __int16 v62 = 2112;
    id v63 = v10;
    __int16 v64 = 2112;
    v65 = v35;
    _os_log_impl(&dword_19190B000, v36, OS_LOG_TYPE_DEFAULT, "Client request to send %{public}@ message (dictionary) service: %{public}@  to destinations: %@   options: %@]", buf, 0x2Au);
  }
  id v41 = objc_alloc_init(MEMORY[0x1E4F6B590]);
  [v41 setPriority:a5];
  [v41 setDestinations:v10];
  [v41 setMessage:v52];
  -[_IDSConnection _sendWithParameters:options:loggingType:loggingDataSize:](self, "_sendWithParameters:options:loggingType:loggingDataSize:", v41, v53, @"message (dictionary)", [v52 count]);
  id v27 = (id)objc_claimAutoreleasedReturnValue();

  v20 = 0;
LABEL_47:

LABEL_48:
  if (a7) {
    *a7 = v27;
  }
  if (v20)
  {
    id v42 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v43 = objc_msgSend(v42, "initWithObjectsAndKeys:", v20, *MEMORY[0x1E4F28568], 0);
    double v44 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:v19 userInfo:v43];
    id v45 = v44;
    if (a8) {
      *a8 = v44;
    }
  }
  return v20 == 0;
}

- (BOOL)sendData:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  BOOL v15 = +[IDSInternalQueueController sharedInstance];
  int v16 = [v15 assertQueueIsCurrent];

  if (v16)
  {
    id v17 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_191A32488();
    }
  }
  v49 = a8;
  id v52 = v14;
  int v18 = [v14 objectForKey:@"IDSSendMessageOptionSkipPayloadCheck"];
  unsigned __int8 v19 = [v18 BOOLValue];

  v20 = [v13 destinationURIs];
  uint64_t v21 = [v20 count];

  v48 = self;
  if (v21)
  {
    uint64_t v22 = [(IDSAccount *)self->_account _internal];
    int v23 = [v22 isActive];

    if (v23) {
      v24 = 0;
    }
    else {
      v24 = @"Cannot send with an inactive account";
    }
    if (v23) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = 8;
    }
    if (((v23 ^ 1 | v19) & 1) == 0)
    {
      unint64_t v26 = [v12 length];
      if (v26 <= 0x500000) {
        v24 = 0;
      }
      else {
        v24 = @"Cannot send payload of this size";
      }
      if (v26 <= 0x500000) {
        uint64_t v25 = 0;
      }
      else {
        uint64_t v25 = 18;
      }
    }
  }
  else
  {
    v24 = @"Cannot send to empty destination set";
    uint64_t v25 = 1;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v51 = v13;
  id v27 = [v13 destinationURIs];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v54 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v53 + 1) + 8 * i);
        if ((_IDSDestinationHasValidPrefix() & 1) == 0)
        {
          uint64_t v33 = [NSString stringWithFormat:@"Invalid address: %@", v32];

          v24 = (__CFString *)v33;
          uint64_t v25 = 21;
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v29);
  }

  if (v24)
  {
    id v34 = 0;
    id v35 = v51;
    objc_super v36 = v14;
    v37 = a7;
    if (!a7) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  id v43 = [(IDSAccount *)v48->_account _internal];
  double v44 = [v43 uniqueID];

  v37 = a7;
  id v35 = v51;
  if (v44)
  {
    id v45 = objc_alloc_init(MEMORY[0x1E4F6B590]);
    [v45 setPriority:a5];
    [v45 setDestinations:v51];
    [v45 setData:v12];
    -[_IDSConnection _sendWithParameters:options:loggingType:loggingDataSize:](v48, "_sendWithParameters:options:loggingType:loggingDataSize:", v45, v52, @"data", [v12 length]);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0;
  }
  else
  {
    id v45 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      account = v48->_account;
      *(_DWORD *)buf = 138412546;
      long long v58 = v48;
      __int16 v59 = 2112;
      __int16 v60 = account;
      _os_log_impl(&dword_19190B000, v45, OS_LOG_TYPE_DEFAULT, "sendPayload - could not find account uniqueID! self: %@ account: %@", buf, 0x16u);
    }
    id v34 = 0;
    v24 = @"Could not find account uniqueID!";
    uint64_t v25 = 7;
  }

  objc_super v36 = v52;
  if (a7) {
LABEL_31:
  }
    id *v37 = v34;
LABEL_32:
  if (v24)
  {
    id v38 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    dispatch_block_t v39 = objc_msgSend(v38, "initWithObjectsAndKeys:", v24, *MEMORY[0x1E4F28568], 0);
    id v40 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:v25 userInfo:v39];
    id v41 = v40;
    if (v49) {
      id *v49 = v40;
    }
  }
  return v24 == 0;
}

- (BOOL)sendInvitation:(id)a3 toDestination:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v12 = (_IDSConnection *)a3;
  id v13 = a4;
  id v61 = a6;
  id v14 = +[IDSInternalQueueController sharedInstance];
  int v15 = [v14 assertQueueIsCurrent];

  if (v15)
  {
    int v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A32520();
    }
  }
  id v17 = [v13 destinationURIs];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    unsigned __int8 v19 = [(IDSAccount *)self->_account _internal];
    int v20 = [v19 isActive];

    if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v22 = [(_IDSConnection *)v12 expirationDate];
      uint64_t v23 = [v21 compare:v22];

      if (v23 == 1) {
        uint64_t v24 = 54;
      }
      else {
        uint64_t v24 = 0;
      }
      if (v23 == 1) {
        uint64_t v25 = @"Invitation has expired";
      }
      else {
        uint64_t v25 = 0;
      }
    }
    else
    {
      uint64_t v25 = @"Cannot send with an inactive account";
      uint64_t v24 = 8;
    }
  }
  else
  {
    uint64_t v25 = @"Cannot send to empty destination set";
    uint64_t v24 = 1;
  }
  long long v58 = a8;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  __int16 v60 = v13;
  unint64_t v26 = [v13 destinationURIs];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v63 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        if ((_IDSDestinationHasValidPrefix() & 1) == 0)
        {
          uint64_t v32 = [NSString stringWithFormat:@"Invalid address: %@", v31];

          uint64_t v24 = 21;
          uint64_t v25 = (__CFString *)v32;
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v28);
  }

  uint64_t v33 = +[IDSLogging IDSConnection];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v67 = v12;
    _os_log_impl(&dword_19190B000, v33, OS_LOG_TYPE_DEFAULT, "sendInvitation - preparing to send invitation : %@", buf, 0xCu);
  }

  id v34 = (IDSAccount *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v35 = [(_IDSConnection *)v12 uniqueID];
  objc_super v36 = [v35 UUIDString];
  [(IDSAccount *)v34 setValue:v36 forKey:*MEMORY[0x1E4F6ACC0]];

  v37 = [(_IDSConnection *)v12 context];
  id v38 = [v37 payload];
  [(IDSAccount *)v34 setValue:v38 forKey:*MEMORY[0x1E4F6AC88]];

  dispatch_block_t v39 = objc_msgSend(NSNumber, "numberWithInteger:", -[_IDSConnection state](v12, "state"));
  [(IDSAccount *)v34 setValue:v39 forKey:*MEMORY[0x1E4F6ACB8]];

  id v40 = [(_IDSConnection *)v12 expirationDate];

  if (v40)
  {
    id v41 = NSNumber;
    id v42 = [(_IDSConnection *)v12 expirationDate];
    [v42 timeIntervalSince1970];
    id v43 = objc_msgSend(v41, "numberWithDouble:");
    [(IDSAccount *)v34 setValue:v43 forKey:*MEMORY[0x1E4F6ACA0]];
  }
  double v44 = +[IDSLogging IDSConnection];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    id v45 = [(_IDSConnection *)v12 uniqueID];
    id v46 = [v45 UUIDString];
    *(_DWORD *)buf = 138412546;
    uint64_t v67 = v46;
    __int16 v68 = 2112;
    int v69 = v34;
    _os_log_impl(&dword_19190B000, v44, OS_LOG_TYPE_DEFAULT, "sendInvitation - invitation payload for id {%@}: %@", buf, 0x16u);
  }
  if (v25)
  {
    id v47 = 0;
  }
  else
  {
    v48 = [(IDSAccount *)self->_account _internal];
    v49 = [v48 uniqueID];

    if (v49)
    {
      v50 = objc_alloc_init(MEMORY[0x1E4F6B590]);
      [v50 setPriority:a5];
      [v50 setDestinations:v60];
      [v50 setMessage:v34];
      id v47 = [(_IDSConnection *)self _sendWithParameters:v50 options:v61 loggingType:@"invitation (send)" loggingDataSize:[(IDSAccount *)v34 count]];
      uint64_t v25 = 0;
    }
    else
    {
      v50 = +[IDSLogging IDSConnection];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        account = self->_account;
        *(_DWORD *)buf = 138412546;
        uint64_t v67 = self;
        __int16 v68 = 2112;
        int v69 = account;
        _os_log_impl(&dword_19190B000, v50, OS_LOG_TYPE_DEFAULT, "sendInvitation - could not find account uniqueID! self: %@ account: %@", buf, 0x16u);
      }
      id v47 = 0;
      uint64_t v25 = @"Could not find account uniqueID!";
      uint64_t v24 = 7;
    }
  }
  if (a7) {
    *a7 = v47;
  }
  if (v25)
  {
    id v52 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    long long v53 = objc_msgSend(v52, "initWithObjectsAndKeys:", v25, *MEMORY[0x1E4F28568], 0);
    long long v54 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:v24 userInfo:v53];
    long long v55 = v54;
    if (v58) {
      *long long v58 = v54;
    }
  }
  return v25 == 0;
}

- (BOOL)sendInvitationUpdate:(id)a3 toDestination:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v12 = (_IDSConnection *)a3;
  id v13 = a4;
  id v61 = a6;
  id v14 = +[IDSInternalQueueController sharedInstance];
  int v15 = [v14 assertQueueIsCurrent];

  if (v15)
  {
    int v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A325B8();
    }
  }
  id v17 = [v13 destinationURIs];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    unsigned __int8 v19 = [(IDSAccount *)self->_account _internal];
    int v20 = [v19 isActive];

    if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v22 = [(_IDSConnection *)v12 expirationDate];
      uint64_t v23 = [v21 compare:v22];

      if (v23 == 1) {
        uint64_t v24 = 54;
      }
      else {
        uint64_t v24 = 0;
      }
      if (v23 == 1) {
        uint64_t v25 = @"Invitation has expired";
      }
      else {
        uint64_t v25 = 0;
      }
    }
    else
    {
      uint64_t v25 = @"Cannot send with an inactive account";
      uint64_t v24 = 8;
    }
  }
  else
  {
    uint64_t v25 = @"Cannot send to empty destination set";
    uint64_t v24 = 1;
  }
  long long v58 = a8;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  __int16 v60 = v13;
  unint64_t v26 = [v13 destinationURIs];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v63 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        if ((_IDSDestinationHasValidPrefix() & 1) == 0)
        {
          uint64_t v32 = [NSString stringWithFormat:@"Invalid address: %@", v31];

          uint64_t v24 = 21;
          uint64_t v25 = (__CFString *)v32;
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v28);
  }

  uint64_t v33 = +[IDSLogging IDSConnection];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v67 = v12;
    _os_log_impl(&dword_19190B000, v33, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - preparing to send invitation : %@", buf, 0xCu);
  }

  id v34 = (IDSAccount *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v35 = [(_IDSConnection *)v12 uniqueID];
  objc_super v36 = [v35 UUIDString];
  [(IDSAccount *)v34 setValue:v36 forKey:*MEMORY[0x1E4F6ACC0]];

  v37 = [(_IDSConnection *)v12 context];
  id v38 = [v37 payload];
  [(IDSAccount *)v34 setValue:v38 forKey:*MEMORY[0x1E4F6AC88]];

  dispatch_block_t v39 = objc_msgSend(NSNumber, "numberWithInteger:", -[_IDSConnection state](v12, "state"));
  [(IDSAccount *)v34 setValue:v39 forKey:*MEMORY[0x1E4F6ACB8]];

  id v40 = [(_IDSConnection *)v12 expirationDate];

  if (v40)
  {
    id v41 = NSNumber;
    id v42 = [(_IDSConnection *)v12 expirationDate];
    [v42 timeIntervalSince1970];
    id v43 = objc_msgSend(v41, "numberWithDouble:");
    [(IDSAccount *)v34 setValue:v43 forKey:*MEMORY[0x1E4F6ACA0]];
  }
  double v44 = +[IDSLogging IDSConnection];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    id v45 = [(_IDSConnection *)v12 uniqueID];
    id v46 = [v45 UUIDString];
    *(_DWORD *)buf = 138412546;
    uint64_t v67 = v46;
    __int16 v68 = 2112;
    int v69 = v34;
    _os_log_impl(&dword_19190B000, v44, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - invitation payload for id {%@}: %@", buf, 0x16u);
  }
  if (v25)
  {
    id v47 = 0;
  }
  else
  {
    v48 = [(IDSAccount *)self->_account _internal];
    v49 = [v48 uniqueID];

    if (v49)
    {
      v50 = objc_alloc_init(MEMORY[0x1E4F6B590]);
      [v50 setPriority:a5];
      [v50 setDestinations:v60];
      [v50 setMessage:v34];
      id v47 = [(_IDSConnection *)self _sendWithParameters:v50 options:v61 loggingType:@"invitation (update)" loggingDataSize:[(IDSAccount *)v34 count]];
      uint64_t v25 = 0;
    }
    else
    {
      v50 = +[IDSLogging IDSConnection];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        account = self->_account;
        *(_DWORD *)buf = 138412546;
        uint64_t v67 = self;
        __int16 v68 = 2112;
        int v69 = account;
        _os_log_impl(&dword_19190B000, v50, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - could not find account uniqueID! self: %@ account: %@", buf, 0x16u);
      }
      id v47 = 0;
      uint64_t v25 = @"Could not find account uniqueID!";
      uint64_t v24 = 7;
    }
  }
  if (a7) {
    *a7 = v47;
  }
  if (v25)
  {
    id v52 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    long long v53 = objc_msgSend(v52, "initWithObjectsAndKeys:", v25, *MEMORY[0x1E4F28568], 0);
    long long v54 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:v24 userInfo:v53];
    long long v55 = v54;
    if (v58) {
      *long long v58 = v54;
    }
  }
  return v25 == 0;
}

- (BOOL)sendServerMessage:(id)a3 command:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A32650();
    }
  }
  if (v7 && [v6 count])
  {
    long long v11 = [(IDSAccount *)self->_account _internal];
    id v12 = [v11 uniqueID];

    id v13 = [(_IDSConnection *)self daemonController];
    [v13 sendServerMessage:v6 command:v7 usingAccountWithUniqueID:v12];

    BOOL v14 = 1;
  }
  else
  {
    id v12 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412802;
      id v17 = self;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_error_impl(&dword_19190B000, v12, OS_LOG_TYPE_ERROR, "%@ asked to send server message %@ with command %@ - invalid value!", (uint8_t *)&v16, 0x20u);
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (void)connection:(id)a3 incomingAckWithIdentifier:(id)a4 forTopic:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 hasBeenDeliveredWithContext:(id)a8 isAppAck:(BOOL)a9
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v15 = (IDSDirectMessageConnection *)a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (self->_directMessageConnection == v15)
  {
    id v21 = +[IDSLogging IDSConnection];
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (a9)
    {
      if (v22)
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v27 = v15;
        __int16 v28 = 2112;
        id v29 = v16;
        _os_log_impl(&dword_19190B000, v21, OS_LOG_TYPE_DEFAULT, "incomingAppLevelAckFromDirectConnection: %@ guid %@", buf, 0x16u);
      }

      uint64_t v23 = [MEMORY[0x1E4F6B5C8] URIWithPrefixedURI:v18];
      uint64_t v24 = [MEMORY[0x1E4F6B5C8] URIWithPrefixedURI:v19];
      [(_IDSConnection *)self messageIdentifier:v16 forTopic:v17 toURI:v23 fromURI:v24 hasBeenDeliveredWithContext:v20];
    }
    else
    {
      if (v22)
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v27 = v15;
        __int16 v28 = 2112;
        id v29 = v16;
        _os_log_impl(&dword_19190B000, v21, OS_LOG_TYPE_DEFAULT, "incomingAckFromDirectConnection: %@ guid %@", buf, 0x16u);
      }

      uint64_t v23 = [(IDSAccount *)self->_account _internal];
      uint64_t v24 = [v23 uniqueID];
      LOBYTE(v25) = 1;
      [(_IDSConnection *)self messageIdentifierInner:v16 alternateCallbackID:0 forAccount:v24 updatedWithResponseCode:0 error:0 lastCall:1 context:v20 isDirectMessage:v25];
    }
  }
}

- (void)connection:(id)a3 incomingDataFromDirectConnection:(id)a4 withGUID:(id)a5 forTopic:(id)a6 toIdentifier:(id)a7 fromID:(id)a8 context:(id)a9
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v15 = (IDSDirectMessageConnection *)a3;
  id v16 = a5;
  if (self->_directMessageConnection == v15)
  {
    id v17 = a9;
    id v18 = a8;
    id v19 = a7;
    id v20 = a6;
    id v21 = a4;
    BOOL v22 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412546;
      unint64_t v26 = v15;
      __int16 v27 = 2112;
      id v28 = v16;
      _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "incomingDataFromDirectConnection: %@ guid %@", (uint8_t *)&v25, 0x16u);
    }

    uint64_t v23 = [MEMORY[0x1E4F6B5C8] URIWithPrefixedURI:v19];

    uint64_t v24 = [MEMORY[0x1E4F6B5C8] URIWithPrefixedURI:v18];

    [(_IDSConnection *)self dataReceived:v21 withGUID:v16 forTopic:v20 toURI:v23 fromURI:v24 context:v17];
  }
}

- (void)connection:(id)a3 incomingMessageFromDirectConnection:(id)a4 withGUID:(id)a5 forTopic:(id)a6 toIdentifier:(id)a7 fromID:(id)a8 context:(id)a9
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v15 = (IDSDirectMessageConnection *)a3;
  if (self->_directMessageConnection == v15)
  {
    id v16 = a9;
    id v17 = a8;
    id v18 = a7;
    id v19 = a6;
    id v20 = a5;
    id v21 = a4;
    BOOL v22 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v26 = v15;
      _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "incomingMessageFromDirectConnection: %@", buf, 0xCu);
    }

    uint64_t v23 = [MEMORY[0x1E4F6B5C8] URIWithPrefixedURI:v18];

    uint64_t v24 = [MEMORY[0x1E4F6B5C8] URIWithPrefixedURI:v17];

    [(_IDSConnection *)self messageReceived:0 withGUID:v20 withPayload:v21 forTopic:v19 toURI:v23 fromURI:v24 context:v16];
  }
}

- (void)connection:(id)a3 incomingProtobufFromDirectConnection:(id)a4 withGUID:(id)a5 forTopic:(id)a6 toIdentifier:(id)a7 fromID:(id)a8 context:(id)a9
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v15 = (IDSDirectMessageConnection *)a3;
  if (self->_directMessageConnection == v15)
  {
    id v16 = a9;
    id v17 = a8;
    id v18 = a7;
    id v19 = a6;
    id v20 = a5;
    id v21 = a4;
    BOOL v22 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      unint64_t v26 = v15;
      _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "incomingProtobufFromDirectConnection: %@", (uint8_t *)&v25, 0xCu);
    }

    uint64_t v23 = [MEMORY[0x1E4F6B5C8] URIWithPrefixedURI:v18];

    uint64_t v24 = [MEMORY[0x1E4F6B5C8] URIWithPrefixedURI:v17];

    [(_IDSConnection *)self protobufReceived:v21 withGUID:v20 forTopic:v19 toURI:v23 fromURI:v24 context:v16];
  }
}

- (void)connection:(id)a3 incomingGUIDAckFromDirectConnection:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IDSLogging IDSConnection];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "incomingGUIDAckFromDirectConnection: %@/%@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)connection:(id)a3 messageSendFailed:(id)a4 responseCode:(int64_t)a5
{
  if (self->_directMessageConnection == a3)
  {
    account = self->_account;
    id v8 = a4;
    id v13 = [(IDSAccount *)account _internal];
    id v9 = [v13 uniqueID];
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v11 = (void *)[v10 initWithDomain:*MEMORY[0x1E4F6B2D8] code:a5 userInfo:0];
    LOBYTE(v12) = 1;
    [(_IDSConnection *)self messageIdentifierInner:v8 alternateCallbackID:0 forAccount:v9 updatedWithResponseCode:a5 error:v11 lastCall:1 context:0 isDirectMessage:v12];
  }
}

- (void)account:(id)a3 isActiveChanged:(BOOL)a4
{
  id v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A326E8();
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_191979F84;
  v9[3] = &unk_1E572B3A0;
  v9[4] = self;
  BOOL v10 = a4;
  [(_IDSConnection *)self _callDelegatesWithBlock:v9];
}

- (void)account:(id)a3 devicesChanged:(id)a4
{
  id v5 = a4;
  id v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A32780();
    }
  }
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = sub_19197A108;
  BOOL v14 = &unk_1E572B3C8;
  int v15 = self;
  id v9 = v5;
  id v16 = v9;
  [(_IDSConnection *)self _callDelegatesWithBlock:&v11];
  directMessageConnection = self->_directMessageConnection;
  if (directMessageConnection) {
    -[IDSDirectMessageConnection updateConnectedDevices:](directMessageConnection, "updateConnectedDevices:", v9, v11, v12, v13, v14, v15);
  }
}

- (void)account:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5 = a4;
  id v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A32818();
    }
  }
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = sub_19197A28C;
  BOOL v14 = &unk_1E572B3C8;
  int v15 = self;
  id v9 = v5;
  id v16 = v9;
  [(_IDSConnection *)self _callDelegatesWithBlock:&v11];
  directMessageConnection = self->_directMessageConnection;
  if (directMessageConnection) {
    -[IDSDirectMessageConnection updateConnectedDevices:](directMessageConnection, "updateConnectedDevices:", v9, v11, v12, v13, v14, v15);
  }
}

- (void)account:(id)a3 connectedDevicesChanged:(id)a4
{
  id v5 = a4;
  id v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A328B0();
    }
  }
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = sub_19197A410;
  BOOL v14 = &unk_1E572B3C8;
  int v15 = self;
  id v9 = v5;
  id v16 = v9;
  [(_IDSConnection *)self _callDelegatesWithBlock:&v11];
  directMessageConnection = self->_directMessageConnection;
  if (directMessageConnection) {
    -[IDSDirectMessageConnection updateConnectedDevices:](directMessageConnection, "updateConnectedDevices:", v9, v11, v12, v13, v14, v15);
  }
}

- (void)_connect
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A32A20();
    }
  }
  id v6 = [(IDSAccount *)self->_account _internal];
  int v7 = [v6 serviceName];

  if (!v7)
  {
    id v13 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A32948();
    }
    goto LABEL_12;
  }
  id v8 = [(_IDSConnection *)self daemonController];
  char v9 = [v8 hasListenerForID:self->_serviceToken];

  if ((v9 & 1) == 0)
  {
    BOOL v10 = [(_IDSConnection *)self daemonController];
    serviceToken = self->_serviceToken;
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
    LOBYTE(serviceToken) = [v10 addListenerID:serviceToken services:v12 commands:self->_commands];

    if ((serviceToken & 1) == 0)
    {
      id v13 = +[IDSLogging IDSConnection];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_191A329B4();
      }
LABEL_12:
    }
  }
}

- (void)_handleLastCallForPendingIdentifier:(id)a3 callbackID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8) {
    [(IMOrderedMutableDictionary *)self->_pendingSends removeOrderedObjectForKey:v8];
  }
  if (v6) {
    [(IMOrderedMutableDictionary *)self->_pendingSends removeOrderedObjectForKey:v6];
  }
  if (![(IMOrderedMutableDictionary *)self->_pendingSends count])
  {
    pendingSends = self->_pendingSends;
    self->_pendingSends = 0;
  }
}

- (void)_resendPendingSends
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A32AB8();
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = self->_pendingSends;
  uint64_t v6 = [(IMOrderedMutableDictionary *)obj countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v22;
    *(void *)&long long v7 = 138412802;
    long long v19 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "setDaemonDeathResend:", 1, v19);
        uint64_t v12 = +[IDSLogging IDSConnection];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [v11 identifier];
          BOOL v14 = [v11 alternateCallbackID];
          *(_DWORD *)buf = v19;
          unint64_t v26 = self;
          __int16 v27 = 2112;
          id v28 = v13;
          __int16 v29 = 2112;
          uint64_t v30 = v14;
          _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "%@ resending %@ alternate %@ due to daemon disconnection.", buf, 0x20u);
        }
        int v15 = [v11 dictionaryRepresentation];
        id v16 = (void *)[v15 copy];

        id v17 = [(_IDSConnection *)self daemonController];
        objc_msgSend(v17, "setCurXPCMessagePriority:", objc_msgSend(v11, "priority"));

        id v18 = [(_IDSConnection *)self daemonController];
        [v18 sendMessageWithSendParameters:v16];
      }
      uint64_t v8 = [(IMOrderedMutableDictionary *)obj countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v8);
  }
}

- (void)daemonConnected
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A32B50();
    }
  }
  [(_IDSConnection *)self _resendPendingSends];
}

- (void)messageIdentifier:(id)a3 alternateCallbackID:(id)a4 forAccount:(id)a5 updatedWithResponseCode:(int64_t)a6 error:(id)a7 lastCall:(BOOL)a8 context:(id)a9
{
  LOBYTE(v9) = 0;
  [(_IDSConnection *)self messageIdentifierInner:a3 alternateCallbackID:a4 forAccount:a5 updatedWithResponseCode:a6 error:a7 lastCall:a8 context:a9 isDirectMessage:v9];
}

- (void)messageIdentifierInner:(id)a3 alternateCallbackID:(id)a4 forAccount:(id)a5 updatedWithResponseCode:(int64_t)a6 error:(id)a7 lastCall:(BOOL)a8 context:(id)a9 isDirectMessage:(BOOL)a10
{
  BOOL v10 = a8;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v16 = (_IDSConnection *)a3;
  id v17 = (__CFString *)a4;
  id v18 = a5;
  unint64_t v62 = (unint64_t)a7;
  id v19 = a9;
  id v20 = +[IDSInternalQueueController sharedInstance];
  int v21 = [v20 assertQueueIsCurrent];

  if (v21)
  {
    long long v22 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_191A32C2C();
    }
  }
  long long v23 = [(IDSAccount *)self->_account _internal];
  long long v24 = [v23 uniqueID];
  int v25 = IMAreObjectsLogicallySame();

  if (v25)
  {
    __int16 v60 = v17;
    unint64_t v26 = &off_1E5728000;
    __int16 v27 = +[IDSLogging GUIDTRACE];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = @"NO";
      *(_DWORD *)buf = 138412802;
      v72 = v16;
      if (v10) {
        id v28 = @"YES";
      }
      __int16 v73 = 2048;
      int64_t v74 = a6;
      __int16 v75 = 2112;
      v76 = v28;
      _os_log_impl(&dword_19190B000, v27, OS_LOG_TYPE_DEFAULT, "OUTGOING-UPDATE:%@ CODE:%ld LASTCALL:%@", buf, 0x20u);
    }

    id v59 = self->_messageContext;
    id v61 = (void *)[objc_alloc(MEMORY[0x1E4F6B4F0]) initWithDictionary:v19 boostContext:v59];
    __int16 v29 = &off_1E5728000;
    uint64_t v30 = +[IDSTransportLog IDSConnection];
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (a6 == 29)
    {
      if (v31)
      {
        uint64_t v32 = [v19 objectForKey:*MEMORY[0x1E4F6B0B8]];
        uint64_t v33 = [v19 objectForKey:*MEMORY[0x1E4F6B0B0]];
        uint64_t v34 = [v19 objectForKey:*MEMORY[0x1E4F6B0C0]];
        id v35 = (void *)v34;
        *(_DWORD *)buf = 138414338;
        objc_super v36 = @"NO";
        v72 = self;
        __int16 v73 = 2114;
        if (v10) {
          objc_super v36 = @"YES";
        }
        int64_t v74 = (int64_t)v16;
        __int16 v75 = 2112;
        v76 = v60;
        __int16 v77 = 2048;
        int64_t v78 = 29;
        __int16 v79 = 2114;
        unint64_t v80 = v62;
        __int16 v81 = 2114;
        v82 = v32;
        __int16 v83 = 2114;
        uint64_t v84 = (uint64_t)v33;
        __int16 v85 = 2114;
        uint64_t v86 = v34;
        __int16 v87 = 2112;
        uint64_t v88 = v36;
        _os_log_impl(&dword_19190B000, v30, OS_LOG_TYPE_DEFAULT, "%@ outgoing message guid response: %{public}@  callbackID: %@  response code: %ld   error: %{public}@  WiProx error: Error Domain=%{public}@ Code=%{public}@ %{public}@  lastCall: %@", buf, 0x5Cu);

        __int16 v29 = &off_1E5728000;
        unint64_t v26 = &off_1E5728000;
      }
    }
    else if (v31)
    {
      if (v10) {
        v37 = @"YES";
      }
      else {
        v37 = @"NO";
      }
      uint64_t v38 = [v61 endpointState];
      *(_DWORD *)buf = 138413826;
      v72 = self;
      __int16 v73 = 2114;
      int64_t v74 = (int64_t)v16;
      __int16 v75 = 2112;
      v76 = v17;
      __int16 v77 = 2048;
      int64_t v78 = a6;
      __int16 v79 = 2114;
      unint64_t v80 = v62;
      __int16 v81 = 2112;
      v82 = v37;
      __int16 v29 = &off_1E5728000;
      __int16 v83 = 2048;
      uint64_t v84 = v38;
      _os_log_impl(&dword_19190B000, v30, OS_LOG_TYPE_DEFAULT, "%@ outgoing message guid response: %{public}@  callbackID: %@  response code: %ld   error: %{public}@   lastCall: %@  endpointState: %ld", buf, 0x48u);
    }

    if (a6 != 11 && !v10) {
      goto LABEL_25;
    }
    id v17 = v60;
    [(_IDSConnection *)self _handleLastCallForPendingIdentifier:v16 callbackID:v60];
    if (a6 == 11)
    {
LABEL_37:

      goto LABEL_38;
    }
    [v61 originalCommand];
    v40 = dispatch_block_t v39 = v29;
    int v41 = [v40 isEqualToNumber:&unk_1EE28B2C8];

    __int16 v29 = v39;
    if (v41)
    {
      -[_IDSConnection didCancelMessageWithSuccess:onAccount:error:identifier:](self, "didCancelMessageWithSuccess:onAccount:error:identifier:", (a6 | v62) == 0, v18);
    }
    else
    {
LABEL_25:
      id v42 = [v29[244] IDSConnection];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = [v61 serverReceivedTime];
        [v61 serverTimestamp];
        v45 = double v44 = v26;
        *(_DWORD *)buf = 138412546;
        v72 = v43;
        __int16 v73 = 2112;
        int64_t v74 = (int64_t)v45;
        _os_log_impl(&dword_19190B000, v42, OS_LOG_TYPE_DEFAULT, "Server Timestamp for UpdatedWithResponseCode? { serverReceivedTime: %@, serverTimestamp: %@}", buf, 0x16u);

        unint64_t v26 = v44;
      }

      BOOL v58 = a6 == 0;
      uint64_t v46 = sub_1919E2834((void *)v62);
      id v47 = (void *)v46;
      int v48 = !v10;
      if (a6 && (v48 & 1) == 0 && !v46)
      {
        v49 = [v26[189] IDSConnection];
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          sub_191A32BE8(v49);
        }

        id v50 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        id v51 = objc_msgSend(v50, "initWithObjectsAndKeys:", @"Unknown error", *MEMORY[0x1E4F28568], 0);
        id v47 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:200 userInfo:v51];
      }
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = sub_19197B0A4;
      v63[3] = &unk_1E572B3F0;
      v63[4] = self;
      id v52 = v16;
      long long v64 = v52;
      long long v53 = v60;
      long long v65 = v53;
      int64_t v68 = a6;
      id v54 = v47;
      id v66 = v54;
      BOOL v69 = v10;
      id v67 = v61;
      BOOL v70 = v58;
      [(_IDSConnection *)self _callDelegatesWithBlock:v63];
      if (((v48 | a10) & 1) == 0)
      {
        long long v55 = [(_IDSConnection *)self daemonController];
        long long v56 = [(IDSAccount *)self->_account _internal];
        long long v57 = [v56 uniqueID];
        [v55 acknowledgeOutgoingMessageWithGUID:v52 alternateCallbackID:v53 forAccountWithUniqueID:v57];
      }
    }
    id v17 = v60;
    goto LABEL_37;
  }
LABEL_38:
}

- (void)messageIdentifier:(id)a3 alternateCallbackID:(id)a4 forAccount:(id)a5 willSendToDestinations:(id)a6 skippedDestinations:(id)a7 registrationPropertyToDestinations:(id)a8
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a5;
  id v20 = +[IDSInternalQueueController sharedInstance];
  int v21 = [v20 assertQueueIsCurrent];

  if (v21)
  {
    long long v22 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_191A32CC4();
    }
  }
  long long v23 = [(IDSAccount *)self->_account _internal];
  long long v24 = [v23 uniqueID];
  int v25 = IMAreObjectsLogicallySame();

  if (v25)
  {
    unint64_t v26 = +[IDSTransportLog IDSConnection];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
      id v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
      __int16 v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
      *(_DWORD *)buf = 138413570;
      v37 = self;
      __int16 v38 = 2112;
      id v39 = v14;
      __int16 v40 = 2112;
      id v41 = v15;
      __int16 v42 = 2112;
      id v43 = v27;
      __int16 v44 = 2112;
      id v45 = v28;
      __int16 v46 = 2112;
      id v47 = v29;
      _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "%@ identifier %@ callbackID %@ willSendToDests count %@ skipped count %@  map count %@", buf, 0x3Eu);
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_19197B5AC;
    v30[3] = &unk_1E572B418;
    v30[4] = self;
    id v31 = v14;
    id v32 = v15;
    id v33 = v16;
    id v34 = v17;
    id v35 = v18;
    [(_IDSConnection *)self _callDelegatesWithBlock:v30];
  }
}

- (void)messageIdentifier:(id)a3 forTopic:(id)a4 toURI:(id)a5 fromURI:(id)a6 hasBeenDeliveredWithContext:(id)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v36 = a6;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a5) = [v16 assertQueueIsCurrent];

  if (a5)
  {
    id v17 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_191A32D5C();
    }
  }
  id v18 = self->_messageContext;
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F6B4F0]) initWithDictionary:v13 boostContext:v18];
  id v20 = [v19 outgoingResponseIdentifier];
  BOOL v21 = [(_IDSConnection *)self _shouldAcceptIncomingType:@"app-level ack" forTopic:v15 localURI:v14 remoteURI:0 validateAliases:1 guid:v20];

  if (v21)
  {
    long long v22 = +[IDSTransportLog IDSConnection];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v48 = self;
      __int16 v49 = 2112;
      id v50 = v12;
      __int16 v51 = 2112;
      id v52 = v13;
      _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "%@ received app-level ack with identifier %@ context %@", buf, 0x20u);
    }

    long long v23 = dispatch_group_create();
    dispatch_group_enter(v23);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = sub_19197BAB8;
    v43[3] = &unk_1E572B440;
    v43[4] = self;
    id v35 = v12;
    id v44 = v12;
    id v45 = v36;
    id v46 = v13;
    [(_IDSConnection *)self _callDelegatesWithBlock:v43 group:v23];
    long long v24 = [v19 storageGuid];
    int v25 = [v19 broadcastTime];

    if (v25)
    {
      unint64_t v26 = NSNumber;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v28 = v27;
      __int16 v29 = [v19 broadcastTime];
      [v29 doubleValue];
      int v25 = [v26 numberWithDouble:v28 - v30];
    }
    id v31 = +[IDSInternalQueueController sharedInstance];
    id v32 = [v31 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19197BB38;
    block[3] = &unk_1E57296D0;
    id v38 = v24;
    id v39 = v25;
    __int16 v40 = self;
    id v41 = v20;
    id v42 = v19;
    id v33 = v25;
    id v34 = v24;
    dispatch_group_notify(v23, v32, block);

    dispatch_group_leave(v23);
    id v12 = v35;
  }
}

- (void)didSendOpportunisticDataWithIdentifier:(id)a3 onAccount:(id)a4 toIDs:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    id v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A32DF4();
    }
  }
  id v14 = [(IDSAccount *)self->_account _internal];
  id v15 = [v14 uniqueID];
  int v16 = IMAreObjectsLogicallySame();

  if (v16)
  {
    id v17 = [MEMORY[0x1E4F6B460] opportunistic];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      long long v22 = self;
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v9;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "Recieved did send opportunistic data {connection: %@, identifier: %@, accountID: %@, toIDs: %@}", buf, 0x2Au);
    }

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_19197BE48;
    v18[3] = &unk_1E572B468;
    v18[4] = self;
    id v19 = v8;
    id v20 = v10;
    [(_IDSConnection *)self _callDelegatesWithBlock:v18];
  }
}

- (void)didCancelMessageWithSuccess:(BOOL)a3 onAccount:(id)a4 error:(id)a5 identifier:(id)a6
{
  BOOL v7 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    id v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A32E8C();
    }
  }
  id v14 = +[IDSLogging IDSConnection];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = @"NO";
    *(_DWORD *)buf = 138413058;
    __int16 v23 = self;
    if (v7) {
      id v15 = @"YES";
    }
    __int16 v24 = 2112;
    __int16 v25 = v15;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "%@: didCancelMessageWithSuccess: %@ error: %@ identifier %@", buf, 0x2Au);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_19197C0A4;
  v18[3] = &unk_1E572B490;
  BOOL v21 = v7;
  v18[4] = self;
  id v19 = v9;
  id v20 = v10;
  id v16 = v10;
  id v17 = v9;
  [(_IDSConnection *)self _callDelegatesWithBlock:v18];
}

- (void)_setTemporaryMessageContext:(id)a3
{
  id v5 = a3;
  id messageContext = self->_messageContext;
  p_id messageContext = &self->_messageContext;
  if (messageContext != v5)
  {
    id v8 = v5;
    objc_storeStrong(p_messageContext, a3);
    id v5 = v8;
  }
}

- (BOOL)_shouldAcceptIncomingType:(id)a3 forTopic:(id)a4 localURI:(id)a5 remoteURI:(id)a6 validateAliases:(BOOL)a7 guid:(id)a8
{
  BOOL v9 = a7;
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v14 = (_IDSConnection *)a3;
  id v15 = (__CFString *)a4;
  id v16 = (__CFString *)a5;
  id v17 = (__CFString *)a6;
  id v18 = a8;
  v98 = self;
  id v19 = [(_IDSConnection *)self account];
  id v20 = [v19 _internal];
  BOOL v21 = [v20 pushTopic];
  char v22 = [(__CFString *)v15 isEqualToIgnoringCase:v21];

  if ((v22 & 1) == 0)
  {
    __int16 v49 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      id v50 = [(IDSAccount *)v98->_account _internal];
      __int16 v51 = [v50 pushTopic];
      *(_DWORD *)buf = 134218754;
      uint64_t v114 = v98;
      __int16 v115 = 2112;
      uint64_t v116 = v14;
      __int16 v117 = 2112;
      v118 = v15;
      __int16 v119 = 2112;
      v120 = v51;
      _os_log_impl(&dword_19190B000, v49, OS_LOG_TYPE_DEFAULT, "_IDSConnection incoming topic for another connection {self: %p, type: %@, topic: %@, self.topic: %@}", buf, 0x2Au);
    }
    goto LABEL_53;
  }
  if (v9)
  {
    v93 = v14;
    id v94 = v18;
    v90 = v17;
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    __int16 v23 = [(_IDSConnection *)v98 account];
    __int16 v24 = [v23 _internal];
    __int16 v25 = [v24 handles];

    uint64_t v26 = [v25 countByEnumeratingWithState:&v108 objects:v130 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v109;
      while (2)
      {
        id v29 = v15;
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v109 != v28) {
            objc_enumerationMutation(v25);
          }
          id v31 = [*(id *)(*((void *)&v108 + 1) + 8 * i) URI];
          id v32 = [v31 unprefixedURI];
          id v33 = [(__CFString *)v16 unprefixedURI];
          char v34 = [v32 isEqualToString:v33];

          if (v34)
          {

            id v17 = v90;
            id v14 = v93;
            id v15 = v29;
            id v18 = v94;
            goto LABEL_24;
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v108 objects:v130 count:16];
        id v15 = v29;
        if (v27) {
          continue;
        }
        break;
      }
    }

    id v35 = [(__CFString *)v16 prefixedURI];
    int v36 = [v35 _appearsToBePseudonymID];

    if (v36)
    {
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      v37 = [(_IDSConnection *)v98 account];
      id v38 = [v37 _internal];
      id v39 = [v38 pseudonyms];

      uint64_t v40 = [v39 countByEnumeratingWithState:&v104 objects:v129 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        __int16 v87 = v15;
        uint64_t v42 = *(void *)v105;
        id v18 = v94;
        while (2)
        {
          for (uint64_t j = 0; j != v41; ++j)
          {
            if (*(void *)v105 != v42) {
              objc_enumerationMutation(v39);
            }
            id v44 = [*(id *)(*((void *)&v104 + 1) + 8 * j) URI];
            id v45 = [v44 prefixedURI];
            id v46 = [(__CFString *)v16 unprefixedURI];
            char v47 = [v45 isEqualToString:v46];

            if (v47)
            {
              char v48 = 1;
              goto LABEL_62;
            }
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v104 objects:v129 count:16];
          if (v41) {
            continue;
          }
          break;
        }
        char v48 = 0;
LABEL_62:
        id v15 = v87;
      }
      else
      {
        char v48 = 0;
        id v18 = v94;
      }

      id v17 = v90;
      id v14 = v93;
    }
    else
    {
      char v48 = 0;
      id v17 = v90;
      id v14 = v93;
      id v18 = v94;
    }
    if (v16 && (v48 & 1) == 0)
    {
      __int16 v49 = +[IDSLogging IDSConnection_oversize];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v97 = [(IDSAccount *)v98->_account _internal];
        __int16 v75 = [v97 handles];
        v76 = [(IDSAccount *)v98->_account uniqueID];
        __int16 v77 = [(IDSAccount *)v98->_account _internal];
        int64_t v78 = [v77 pseudonyms];
        *(_DWORD *)buf = 134219266;
        uint64_t v114 = v98;
        __int16 v115 = 2112;
        uint64_t v116 = v93;
        __int16 v117 = 2112;
        v118 = v16;
        __int16 v119 = 2112;
        v120 = v75;
        __int16 v121 = 2112;
        uint64_t v122 = v76;
        __int16 v123 = 2112;
        uint64_t v124 = v78;
        _os_log_impl(&dword_19190B000, v49, OS_LOG_TYPE_DEFAULT, "_IDSConnection incoming handle for another connection {self: %p, type: %@, localURI: %@, self.aliases: %@, account.uuid: %@, self.pseudonyms: %@}", buf, 0x3Eu);

        id v14 = v93;
      }
LABEL_53:
      BOOL v62 = 0;
      goto LABEL_54;
    }
  }
LABEL_24:
  if (![(_IDSConnection *)v98 _isAccountInValidRegistrationStateToAcceptMessages])
  {
    long long v63 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      v92 = [(IDSAccount *)v98->_account _internal];
      __int16 v81 = [v92 uniqueID];
      uint64_t v86 = [(IDSAccount *)v98->_account _internal];
      if ([v86 isActive]) {
        long long v64 = @"YES";
      }
      else {
        long long v64 = @"NO";
      }
      v82 = v64;
      __int16 v85 = [(IDSAccount *)v98->_account _internal];
      if ([v85 registrationStatus] == 5) {
        long long v65 = @"YES";
      }
      else {
        long long v65 = @"NO";
      }
      __int16 v79 = v65;
      uint64_t v84 = [(IDSAccount *)v98->_account _internal];
      uint64_t v89 = v15;
      if ([v84 accountType] == 2) {
        id v66 = @"YES";
      }
      else {
        id v66 = @"NO";
      }
      __int16 v83 = [(IDSAccount *)v98->_account _internal];
      id v67 = [v83 primaryServiceName];
      unint64_t v80 = [(IDSAccount *)v98->_account _internal];
      uint64_t v68 = (int)[v80 registrationStatus];
      [(IDSAccount *)v98->_account _internal];
      id v96 = v18;
      v70 = BOOL v69 = v17;
      uint64_t v71 = [v70 registrationCertificate];
      *(_DWORD *)buf = 138414082;
      if (v71) {
        v72 = @"YES";
      }
      else {
        v72 = @"NO";
      }
      uint64_t v114 = v14;
      __int16 v115 = 2112;
      uint64_t v116 = v81;
      __int16 v117 = 2112;
      v118 = v82;
      __int16 v119 = 2112;
      v120 = v79;
      __int16 v121 = 2112;
      uint64_t v122 = v66;
      id v15 = v89;
      __int16 v123 = 2112;
      uint64_t v124 = v67;
      __int16 v125 = 2048;
      uint64_t v126 = v68;
      __int16 v127 = 2112;
      v128 = v72;
      _os_log_impl(&dword_19190B000, v63, OS_LOG_TYPE_DEFAULT, "Ignoring %@, account is not configured: %@    isActive: %@  isRegistered: %@  isLocal: %@  serviceIdentifier: %@  registrationStatus: %ld  registrationCert: %@", buf, 0x52u);

      id v17 = v69;
      id v18 = v96;
    }
    __int16 v49 = [objc_alloc(MEMORY[0x1E4F6B500]) initWithReason:703 guid:v18 service:v15 additionalInformation:0];
    [(_IDSConnection *)v98 _sendMissingMessageMetric:v49];
    goto LABEL_53;
  }
  if (!v17)
  {
    BOOL v62 = 1;
    goto LABEL_55;
  }
  id v52 = [(__CFString *)v17 unprefixedURI];
  id v103 = 0;
  uint64_t v53 = [v52 _stripPotentialTokenURIWithToken:&v103];
  __int16 v49 = v103;

  if (v49 && v53)
  {
    id v95 = v18;
    uint64_t v88 = v15;
    v91 = v17;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v54 = [(IDSAccount *)v98->_account _internal];
    long long v55 = [v54 suppressedDevices];

    uint64_t v56 = [v55 countByEnumeratingWithState:&v99 objects:v112 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v100;
      while (2)
      {
        for (uint64_t k = 0; k != v57; ++k)
        {
          if (*(void *)v100 != v58) {
            objc_enumerationMutation(v55);
          }
          __int16 v60 = [*(id *)(*((void *)&v99 + 1) + 8 * k) _internal];
          id v61 = [v60 pushToken];

          if ([v61 isEqualToData:v49])
          {
            int64_t v74 = +[IDSTransportLog IDSConnection];
            id v15 = v88;
            id v17 = v91;
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v114 = v14;
              __int16 v115 = 2112;
              uint64_t v116 = (_IDSConnection *)v88;
              __int16 v117 = 2112;
              v118 = v91;
              _os_log_impl(&dword_19190B000, v74, OS_LOG_TYPE_DEFAULT, "Ignoring %@ for topic %@ because fromID %@ is a suppressed IDSDevice.", buf, 0x20u);
            }

            BOOL v62 = 0;
            id v18 = v95;
            goto LABEL_54;
          }
        }
        uint64_t v57 = [v55 countByEnumeratingWithState:&v99 objects:v112 count:16];
        if (v57) {
          continue;
        }
        break;
      }
    }

    id v15 = v88;
    id v17 = v91;
    id v18 = v95;
  }

  BOOL v62 = 1;
LABEL_54:

LABEL_55:
  return v62;
}

- (BOOL)_isAccountInValidRegistrationStateToAcceptMessages
{
  objc_super v3 = [(_IDSConnection *)self account];
  int v4 = [v3 _internal];

  char v5 = [v4 isActive];
  if ([v4 isInTransientRegistrationState])
  {
    uint64_t v6 = [v4 registrationCertificate];
    if (v6)
    {
      BOOL v7 = [v4 primaryServiceName];
      BOOL v8 = [(_IDSConnection *)self _canServiceNameAcceptMessagesInTransientRegistrationState:v7];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8 | v5;
}

- (BOOL)_canServiceNameAcceptMessagesInTransientRegistrationState:(id)a3
{
  return [a3 isEqualToIgnoringCase:@"com.apple.madrid"];
}

- (void)opportunisticDataReceived:(id)a3 withIdentifier:(id)a4 fromURI:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (objc_class *)MEMORY[0x1E4F6B4F0];
  id v14 = self->_messageContext;
  id v15 = a6;
  id v16 = (void *)[[v13 alloc] initWithDictionary:v15 boostContext:v14];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_19197CCA8;
  v21[3] = &unk_1E572B4B8;
  v21[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v25 = v16;
  id v17 = v16;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  [(_IDSConnection *)self _callDelegatesWithBlock:v21];
}

- (void)messageReceived:(id)a3 withGUID:(id)a4 withPayload:(id)a5 forTopic:(id)a6 toURI:(id)a7 fromURI:(id)a8 context:(id)a9
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v52 = a4;
  id v55 = a5;
  id v57 = a6;
  id v56 = a7;
  id v58 = a8;
  id v53 = a9;
  id v15 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a7) = [v15 assertQueueIsCurrent];

  if (a7)
  {
    id v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A32F24();
    }
  }
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v80 = _os_activity_create(&dword_19190B000, "Connection recieved message", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v80, &state);
  id v54 = self->_messageContext;
  id v59 = (void *)[objc_alloc(MEMORY[0x1E4F6B4F0]) initWithDictionary:v53 boostContext:v54];
  id v17 = [v59 outgoingResponseIdentifier];
  BOOL v18 = [(_IDSConnection *)self _shouldAcceptIncomingType:@"message" forTopic:v57 localURI:v56 remoteURI:v58 validateAliases:1 guid:v17];

  if (v18)
  {
    id v19 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = [v55 count];
      *(_DWORD *)buf = 138413570;
      *(void *)__int16 v83 = self;
      *(_WORD *)&v83[8] = 2112;
      uint64_t v84 = (uint64_t)v52;
      *(_WORD *)__int16 v85 = 2112;
      *(void *)&v85[2] = v57;
      *(_WORD *)uint64_t v86 = 2112;
      *(void *)&v86[2] = v58;
      __int16 v87 = 2112;
      id v88 = v56;
      __int16 v89 = 1024;
      int v90 = v20;
      _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "%@ received message: %@  topic %@  from: %@  to: %@  payload items: %d", buf, 0x3Au);
    }

    id v50 = v52;
    if ([v50 length])
    {
      __int16 v49 = v50;
      if ([v50 length])
      {
LABEL_13:
        BOOL v21 = +[IDSLogging GUIDTRACE];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)__int16 v83 = v49;
          *(_WORD *)&v83[8] = 2112;
          uint64_t v84 = (uint64_t)v57;
          _os_log_impl(&dword_19190B000, v21, OS_LOG_TYPE_DEFAULT, "INCOMING-CLIENT_MESSAGE:%@ SERVICE:%@", buf, 0x16u);
        }

        unint64_t v22 = [v55 count];
        int v23 = v22;
        if (v22 > 0x7FFE)
        {
          uint64_t v27 = +[IDSLogging IDSConnection];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)__int16 v83 = v50;
            _os_log_impl(&dword_19190B000, v27, OS_LOG_TYPE_DEFAULT, "Warning! Message with guid %@ exceeds size limitations of MPKL_UUID_NEXT macro.", buf, 0xCu);
          }
        }
        else
        {
          v81[0] = 0xAAAAAAAAAAAAAAAALL;
          v81[1] = 0xAAAAAAAAAAAAAAAALL;
          id v24 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v50];
          [v24 getUUIDBytes:v81];

          id v25 = [MEMORY[0x1E4F6B460] CrossLayerLogging];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            int incomingMessageLoggingSequence = self->_incomingMessageLoggingSequence;
            self->_int incomingMessageLoggingSequence = incomingMessageLoggingSequence + 1;
            *(_DWORD *)buf = 67110402;
            *(_DWORD *)__int16 v83 = 120;
            *(_WORD *)&v83[4] = 1024;
            *(_DWORD *)&v83[6] = 255;
            uint64_t v84 = 0x832000000100412;
            *(void *)__int16 v85 = v81;
            *(_WORD *)&v85[8] = 1024;
            *(_DWORD *)uint64_t v86 = v23;
            *(_WORD *)&v86[4] = 1024;
            *(_DWORD *)&v86[6] = incomingMessageLoggingSequence;
            _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "9 {curProtocol: %hhu, nextProtocol: %hhu, curUUID: %{public,uuid_t}.16P, curPktLen: %u, logSeqn: %hhu}", buf, 0x2Au);
          }
        }
        if (self->_indirectDelegateCallouts)
        {
          uint64_t v28 = 0;
        }
        else
        {
          uint64_t v28 = dispatch_group_create();
          dispatch_group_enter(v28);
        }
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = sub_19197D590;
        v76[3] = &unk_1E572B468;
        v76[4] = self;
        id v29 = v55;
        id v77 = v29;
        id v30 = v58;
        id v78 = v30;
        [(_IDSConnection *)self _callDelegatesWithBlock:v76 group:v28];
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = sub_19197D60C;
        v72[3] = &unk_1E572B440;
        v72[4] = self;
        id v73 = v29;
        id v31 = v30;
        id v74 = v31;
        id v32 = v59;
        id v75 = v32;
        [(_IDSConnection *)self _callDelegatesWithBlock:v72 group:v28];
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = sub_19197D68C;
        v68[3] = &unk_1E572B440;
        v68[4] = self;
        id v69 = v51;
        id v33 = v31;
        id v70 = v33;
        id v34 = v32;
        id v71 = v34;
        [(_IDSConnection *)self _callDelegatesWithBlock:v68 group:v28];
        if (v28)
        {
          char v35 = [v34 wantsAppAck];
          char v48 = [v34 isDirectMessage];
          int v36 = [v34 outgoingResponseIdentifier];
          v37 = [v34 broadcastTime];

          if (v37)
          {
            id v38 = NSNumber;
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            double v40 = v39;
            uint64_t v41 = [v34 broadcastTime];
            [v41 doubleValue];
            id v43 = [v38 numberWithDouble:v40 - v42];
          }
          else
          {
            id v43 = 0;
          }
          id v44 = +[IDSInternalQueueController sharedInstance];
          id v45 = [v44 queue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_19197D70C;
          block[3] = &unk_1E572B4E0;
          char v66 = v35;
          char v67 = v48;
          void block[4] = self;
          id v61 = v36;
          id v62 = v34;
          id v63 = v33;
          id v64 = v50;
          id v65 = v43;
          id v46 = v43;
          id v47 = v36;
          dispatch_group_notify(v28, v45, block);

          dispatch_group_leave(v28);
        }

        goto LABEL_31;
      }
      __int16 v49 = [v59 incomingResponseIdentifier];
    }
    else
    {
      __int16 v49 = [v59 outgoingResponseIdentifier];
    }

    goto LABEL_13;
  }
LABEL_31:

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)dataReceived:(id)a3 withGUID:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  int v20 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a6) = [v20 assertQueueIsCurrent];

  if (a6)
  {
    BOOL v21 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_191A32FC0();
    }
  }
  id v22 = self->_messageContext;
  int v23 = (void *)[objc_alloc(MEMORY[0x1E4F6B4F0]) initWithDictionary:v19 boostContext:v22];

  id v24 = [v23 outgoingResponseIdentifier];
  if ([(_IDSConnection *)self _shouldAcceptIncomingType:@"data" forTopic:v16 localURI:v17 remoteURI:v18 validateAliases:1 guid:v24])
  {
    id v57 = v24;
    id v54 = v22;
    id v25 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      *(void *)id v74 = self;
      *(_WORD *)&v74[8] = 2112;
      uint64_t v75 = (uint64_t)v15;
      *(_WORD *)v76 = 2112;
      *(void *)&v76[2] = v16;
      *(_WORD *)id v77 = 2112;
      *(void *)&v77[2] = v18;
      __int16 v78 = 2112;
      id v79 = v17;
      _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "%@ received data: %@ topic %@  from: %@  to: %@", buf, 0x34u);
    }

    id v26 = v15;
    if ([v26 length])
    {
      id v58 = v26;
      if ([v26 length])
      {
LABEL_13:
        id v53 = v26;
        uint64_t v28 = +[IDSLogging GUIDTRACE];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)id v74 = v58;
          *(_WORD *)&v74[8] = 2112;
          uint64_t v75 = (uint64_t)v16;
          _os_log_impl(&dword_19190B000, v28, OS_LOG_TYPE_DEFAULT, "INCOMING-CLIENT_DATA:%@ SERVICE:%@", buf, 0x16u);
        }

        unint64_t v29 = [v14 length];
        if (v29 <= 0x7FFE)
        {
          int v30 = v29;
          v72[0] = 0xAAAAAAAAAAAAAAAALL;
          v72[1] = 0xAAAAAAAAAAAAAAAALL;
          id v31 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v58];
          [v31 getUUIDBytes:v72];

          id v32 = [MEMORY[0x1E4F6B460] CrossLayerLogging];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            int incomingMessageLoggingSequence = self->_incomingMessageLoggingSequence;
            self->_int incomingMessageLoggingSequence = incomingMessageLoggingSequence + 1;
            *(_DWORD *)buf = 67110402;
            *(_DWORD *)id v74 = 120;
            *(_WORD *)&v74[4] = 1024;
            *(_DWORD *)&v74[6] = 255;
            uint64_t v75 = 0x832000000100412;
            *(void *)v76 = v72;
            *(_WORD *)&v76[8] = 1024;
            *(_DWORD *)id v77 = v30;
            *(_WORD *)&v77[4] = 1024;
            *(_DWORD *)&v77[6] = incomingMessageLoggingSequence;
            _os_log_impl(&dword_19190B000, v32, OS_LOG_TYPE_DEFAULT, "9 {curProtocol: %hhu, nextProtocol: %hhu, curUUID: %{public,uuid_t}.16P, curPktLen: %u, logSeqn: %hhu}", buf, 0x2Au);
          }
        }
        id v56 = v17;
        if (self->_indirectDelegateCallouts)
        {
          id v34 = 0;
        }
        else
        {
          id v34 = dispatch_group_create();
          dispatch_group_enter(v34);
        }
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = sub_19197DEFC;
        v68[3] = &unk_1E572B440;
        v68[4] = self;
        id v35 = v14;
        id v69 = v35;
        id v55 = v18;
        id v36 = v18;
        id v70 = v36;
        id v37 = v23;
        id v71 = v37;
        [(_IDSConnection *)self _callDelegatesWithBlock:v68 group:v34];
        if (v34)
        {
          id v50 = v16;
          id v51 = v15;
          id v52 = v14;
          char v49 = [v37 wantsAppAck];
          char v38 = [v37 isDirectMessage];
          double v39 = [v37 broadcastTime];

          if (v39)
          {
            double v40 = NSNumber;
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            double v42 = v41;
            id v43 = [v37 broadcastTime];
            [v43 doubleValue];
            id v45 = [v40 numberWithDouble:v42 - v44];
          }
          else
          {
            id v45 = 0;
          }
          id v46 = +[IDSInternalQueueController sharedInstance];
          id v47 = [v46 queue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_19197DF7C;
          block[3] = &unk_1E572B508;
          char v66 = v49;
          char v67 = v38;
          void block[4] = self;
          id v60 = v57;
          id v61 = v37;
          id v62 = v36;
          id v63 = v53;
          id v64 = v45;
          id v65 = v35;
          id v48 = v45;
          dispatch_group_notify(v34, v47, block);

          dispatch_group_leave(v34);
          id v15 = v51;
          id v14 = v52;
          id v16 = v50;
        }

        id v18 = v55;
        id v17 = v56;
        id v22 = v54;
        id v24 = v57;
        goto LABEL_28;
      }
      uint64_t v27 = [v23 incomingResponseIdentifier];
    }
    else
    {
      uint64_t v27 = [v23 outgoingResponseIdentifier];
    }
    id v58 = (void *)v27;

    goto LABEL_13;
  }
LABEL_28:
}

- (void)accessoryDataReceived:(id)a3 withGUID:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v47 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = +[IDSInternalQueueController sharedInstance];
  int v20 = [v19 assertQueueIsCurrent];

  if (v20)
  {
    BOOL v21 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_191A33058();
    }
  }
  id v22 = self->_messageContext;
  int v23 = (void *)[objc_alloc(MEMORY[0x1E4F6B4F0]) initWithDictionary:v18 boostContext:v22];

  id v24 = [v23 outgoingResponseIdentifier];
  if ([(_IDSConnection *)self _shouldAcceptIncomingType:@"data" forTopic:v15 localURI:v16 remoteURI:v17 validateAliases:0 guid:v24])
  {
    id v44 = v15;
    id v46 = v14;
    id v25 = [(_IDSConnection *)self account];
    id v26 = [v25 _internal];
    int v27 = [v26 accountType];

    uint64_t v28 = +[IDSLogging IDSConnection];
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (v27 == 1)
    {
      id v15 = v44;
      if (v29)
      {
        *(_DWORD *)buf = 138413314;
        id v62 = self;
        __int16 v63 = 2112;
        id v64 = v47;
        __int16 v65 = 2112;
        id v66 = v44;
        __int16 v67 = 2112;
        id v68 = v17;
        __int16 v69 = 2112;
        id v70 = v16;
        _os_log_impl(&dword_19190B000, v28, OS_LOG_TYPE_DEFAULT, "%@ received Accessory data: %@ topic %@  from: %@  to: %@", buf, 0x34u);
      }

      if (self->_indirectDelegateCallouts)
      {
        uint64_t v28 = 0;
      }
      else
      {
        uint64_t v28 = dispatch_group_create();
        dispatch_group_enter(v28);
      }
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = sub_19197E650;
      v57[3] = &unk_1E572B440;
      v57[4] = self;
      id v30 = v46;
      id v58 = v30;
      id v43 = v17;
      id v59 = v43;
      id v31 = v23;
      id v60 = v31;
      [(_IDSConnection *)self _callDelegatesWithBlock:v57 group:v28];
      if (v28)
      {
        double v42 = v30;
        char v41 = [v31 wantsAppAck];
        id v32 = [v31 broadcastTime];

        if (v32)
        {
          id v33 = NSNumber;
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          double v35 = v34;
          id v36 = [v31 broadcastTime];
          [v36 doubleValue];
          double v40 = [v33 numberWithDouble:v35 - v37];

          id v15 = v44;
        }
        else
        {
          double v40 = 0;
        }
        id v45 = +[IDSInternalQueueController sharedInstance];
        char v38 = [v45 queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_19197E6D0;
        block[3] = &unk_1E572B530;
        char v56 = v41;
        id v49 = v31;
        id v50 = self;
        id v51 = v24;
        id v52 = v43;
        id v53 = v47;
        id v54 = v40;
        id v55 = v42;
        id v39 = v40;
        dispatch_group_notify(v28, v38, block);

        dispatch_group_leave(v28);
      }
    }
    else
    {
      if (v29)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19190B000, v28, OS_LOG_TYPE_DEFAULT, "Accessory data commands are only supported on AppleID accounts, This one is not for me.", buf, 2u);
      }
      id v15 = v44;
    }

    id v14 = v46;
  }
}

- (void)accessoryReportMessageReceived:(id)a3 accessoryID:(id)a4 controllerID:(id)a5 withGUID:(id)a6 forTopic:(id)a7 toURI:(id)a8 fromURI:(id)a9 context:(id)a10
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v16 = a4;
  id v17 = a5;
  id v43 = a6;
  id v41 = a7;
  id v44 = a8;
  id v18 = a9;
  id v19 = a10;
  int v20 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a6) = [v20 assertQueueIsCurrent];

  if (a6)
  {
    BOOL v21 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_191A330F0();
    }
  }
  id v22 = self->_messageContext;
  int v23 = (void *)[objc_alloc(MEMORY[0x1E4F6B4F0]) initWithDictionary:v19 boostContext:v22];

  id v24 = [v23 outgoingResponseIdentifier];
  id v25 = v41;
  if ([(_IDSConnection *)self _shouldAcceptIncomingType:@"accessoryReportMessage" forTopic:v41 localURI:v44 remoteURI:v18 validateAliases:0 guid:v24])
  {
    id v26 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      id v59 = self;
      __int16 v60 = 2112;
      id v61 = v43;
      __int16 v62 = 2112;
      id v63 = v41;
      __int16 v64 = 2112;
      id v65 = v18;
      __int16 v66 = 2112;
      id v67 = v44;
      _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "%@ received Accessory Report Message: %@ topic %@  from: %@  to: %@", buf, 0x34u);
    }

    if (self->_indirectDelegateCallouts)
    {
      int v27 = 0;
    }
    else
    {
      int v27 = dispatch_group_create();
      dispatch_group_enter(v27);
    }
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = sub_19197ED0C;
    v53[3] = &unk_1E572B4B8;
    v53[4] = self;
    id v54 = v42;
    id v55 = v16;
    id v56 = v17;
    id v28 = v23;
    id v57 = v28;
    [(_IDSConnection *)self _callDelegatesWithBlock:v53 group:v27];
    if (v27)
    {
      id v39 = v17;
      id v40 = v16;
      char v38 = [v28 wantsAppAck];
      BOOL v29 = [v28 broadcastTime];

      if (v29)
      {
        id v30 = NSNumber;
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v32 = v31;
        id v33 = [v28 broadcastTime];
        [v33 doubleValue];
        BOOL v29 = [v30 numberWithDouble:v32 - v34];
      }
      double v35 = +[IDSInternalQueueController sharedInstance];
      id v36 = [v35 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_19197ED8C;
      block[3] = &unk_1E572B558;
      char v52 = v38;
      id v46 = v28;
      id v47 = self;
      id v48 = v24;
      id v49 = v18;
      id v50 = v43;
      id v51 = v29;
      id v37 = v29;
      dispatch_group_notify(v27, v36, block);

      dispatch_group_leave(v27);
      id v17 = v39;
      id v16 = v40;
    }

    id v25 = v41;
  }
}

- (void)incomingInvitation:(id)a3 withGUID:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a7;
  id v15 = self->_messageContext;
  id v16 = (objc_class *)MEMORY[0x1E4F6B4F0];
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  int v20 = (void *)[[v16 alloc] initWithDictionary:v17 boostContext:v15];

  BOOL v21 = [v20 outgoingResponseIdentifier];
  LODWORD(v17) = [(_IDSConnection *)self _shouldAcceptIncomingType:@"message" forTopic:v19 localURI:v18 remoteURI:v14 validateAliases:1 guid:v21];

  if (v17)
  {
    id v22 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v13;
      _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "incomingInvitation - received incoming invitation message : %@", buf, 0xCu);
    }

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_19197F148;
    v23[3] = &unk_1E572B440;
    v23[4] = self;
    id v24 = v13;
    id v25 = v14;
    id v26 = v20;
    [(_IDSConnection *)self _callDelegatesWithBlock:v23];
  }
}

- (void)incomingInvitationUpdate:(id)a3 withGUID:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a7;
  id v15 = self->_messageContext;
  id v16 = (objc_class *)MEMORY[0x1E4F6B4F0];
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  int v20 = (void *)[[v16 alloc] initWithDictionary:v17 boostContext:v15];

  BOOL v21 = [v20 outgoingResponseIdentifier];
  LODWORD(v17) = [(_IDSConnection *)self _shouldAcceptIncomingType:@"message" forTopic:v19 localURI:v18 remoteURI:v14 validateAliases:1 guid:v21];

  if (v17)
  {
    id v22 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v13;
      _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "incomingInvitationUpdate - received incoming invitation message : %@", buf, 0xCu);
    }

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_19197F3D8;
    v23[3] = &unk_1E572B440;
    v23[4] = self;
    id v24 = v13;
    id v25 = v14;
    id v26 = v20;
    [(_IDSConnection *)self _callDelegatesWithBlock:v23];
  }
}

- (void)protobufReceived:(id)a3 withGUID:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8
{
  void v81[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a6;
  int v20 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a5) = [v20 assertQueueIsCurrent];

  if (a5)
  {
    BOOL v21 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_191A33188();
    }
  }
  id v22 = self->_messageContext;
  int v23 = (void *)[objc_alloc(MEMORY[0x1E4F6B4F0]) initWithDictionary:v18 boostContext:v22];
  id v24 = [v18 objectForKey:@"IDSMessageContextSequenceNumberKey"];

  [v24 unsignedIntegerValue];
  kdebug_trace();

  id v25 = [v23 outgoingResponseIdentifier];
  BOOL v26 = [(_IDSConnection *)self _shouldAcceptIncomingType:@"protobuf" forTopic:v16 localURI:v19 remoteURI:v17 validateAliases:1 guid:v25];

  if (v14 && v26)
  {
    id v60 = v14;
    int v27 = (void *)[objc_alloc(MEMORY[0x1E4F6B528]) initWithDictionary:v14];
    [v27 setContext:v23];
    id v28 = v15;
    if ([v28 length])
    {
      id v29 = v28;
      if ([v28 length])
      {
LABEL_12:
        id v61 = v28;
        id v57 = v22;
        double v31 = +[IDSLogging GUIDTRACE];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)id v77 = v29;
          *(_WORD *)&v77[8] = 2112;
          uint64_t v78 = (uint64_t)v16;
          _os_log_impl(&dword_19190B000, v31, OS_LOG_TYPE_DEFAULT, "INCOMING-CLIENT_PROTOBUF:%@ SERVICE:%@", buf, 0x16u);
        }
        __int16 v62 = v29;

        double v32 = [v23 totalBytes];
        unint64_t v33 = [v32 longValue];

        if (v33 <= 0x7FFE)
        {
          v81[0] = 0xAAAAAAAAAAAAAAAALL;
          v81[1] = 0xAAAAAAAAAAAAAAAALL;
          double v34 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v62];
          [v34 getUUIDBytes:v81];

          double v35 = [MEMORY[0x1E4F6B460] CrossLayerLogging];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            int incomingMessageLoggingSequence = self->_incomingMessageLoggingSequence;
            self->_int incomingMessageLoggingSequence = incomingMessageLoggingSequence + 1;
            *(_DWORD *)buf = 67110402;
            *(_DWORD *)id v77 = 120;
            *(_WORD *)&v77[4] = 1024;
            *(_DWORD *)&v77[6] = 255;
            uint64_t v78 = 0x832000000100412;
            *(void *)id v79 = v81;
            *(_WORD *)&v79[8] = 1024;
            *(_DWORD *)uint64_t v80 = v33;
            *(_WORD *)&v80[4] = 1024;
            *(_DWORD *)&v80[6] = incomingMessageLoggingSequence;
            _os_log_impl(&dword_19190B000, v35, OS_LOG_TYPE_DEFAULT, "9 {curProtocol: %hhu, nextProtocol: %hhu, curUUID: %{public,uuid_t}.16P, curPktLen: %u, logSeqn: %hhu}", buf, 0x2Au);
          }
        }
        id v37 = +[IDSLogging IDSConnection];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          *(void *)id v77 = v61;
          *(_WORD *)&v77[8] = 2112;
          uint64_t v78 = (uint64_t)v16;
          *(_WORD *)id v79 = 2112;
          *(void *)&v79[2] = @"(unknown)";
          *(_WORD *)uint64_t v80 = 2112;
          *(void *)&v80[2] = v17;
          _os_log_impl(&dword_19190B000, v37, OS_LOG_TYPE_DEFAULT, "Client received protobuf from daemon %@ for topic: %@  messageID: %@  fromID: %@", buf, 0x2Au);
        }
        id v59 = v15;

        id v58 = v16;
        if (self->_indirectDelegateCallouts)
        {
          char v38 = 0;
        }
        else
        {
          char v38 = dispatch_group_create();
          dispatch_group_enter(v38);
        }
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        void v72[2] = sub_19197FB44;
        v72[3] = &unk_1E572B440;
        v72[4] = self;
        id v39 = v27;
        id v73 = v39;
        id v40 = v17;
        id v74 = v40;
        id v41 = v23;
        id v75 = v41;
        [(_IDSConnection *)self _callDelegatesWithBlock:v72 group:v38];
        if (v38)
        {
          id v42 = +[IDSLogging IDSConnection];
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)id v77 = v61;
            _os_log_impl(&dword_19190B000, v42, OS_LOG_TYPE_DEFAULT, "Ack'ing message %@ to daemon that client got it", buf, 0xCu);
          }

          char v55 = [v41 wantsAppAck];
          char v54 = [v41 isDirectMessage];
          id v43 = [v41 outgoingResponseIdentifier];
          id v44 = [v41 broadcastTime];

          id v56 = v17;
          if (v44)
          {
            id v45 = NSNumber;
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            double v47 = v46;
            id v48 = [v41 broadcastTime];
            [v48 doubleValue];
            id v44 = [v45 numberWithDouble:v47 - v49];
          }
          id v50 = +[IDSInternalQueueController sharedInstance];
          id v51 = [v50 queue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_19197FC70;
          block[3] = &unk_1E572B508;
          char v70 = v55;
          char v71 = v54;
          void block[4] = self;
          id v64 = v43;
          id v65 = v41;
          id v66 = v40;
          id v67 = v61;
          id v68 = v44;
          id v69 = v39;
          id v52 = v44;
          id v53 = v43;
          dispatch_group_notify(v38, v51, block);

          dispatch_group_leave(v38);
          id v17 = v56;
        }

        id v15 = v59;
        id v14 = v60;
        id v22 = v57;
        id v16 = v58;
        goto LABEL_30;
      }
      uint64_t v30 = [v23 incomingResponseIdentifier];
    }
    else
    {
      uint64_t v30 = [v23 outgoingResponseIdentifier];
    }
    id v29 = (id)v30;

    goto LABEL_12;
  }
LABEL_30:
}

- (void)receivedMetadataForDirectMessaging:(id)a3
{
  id v5 = a3;
  if (_IDSSupportsDirectMessaging())
  {
    uint64_t v6 = +[IDSInternalQueueController sharedInstance];
    int v7 = [v6 assertQueueIsCurrent];

    if (v7)
    {
      BOOL v8 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_191A33220();
      }
    }
    directMessageConnection = self->_directMessageConnection;
    if (directMessageConnection) {
      [(IDSDirectMessageConnection *)directMessageConnection updateMetadata:v5];
    }
    objc_storeStrong((id *)&self->_directMessagingMetadata, a3);
  }
}

- (void)xpcObject:(id)a3 objectContext:(id)a4
{
  id v6 = a3;
  CFDictionaryRef v7 = (const __CFDictionary *)a4;
  if (v6)
  {
    BOOL v8 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_191A333C4();
    }

    if (v7) {
      Value = (void *)CFDictionaryGetValue(v7, @"object-type");
    }
    else {
      Value = 0;
    }
    if ([Value isEqualToIgnoringCase:@"direct-messaging-socket-received"])
    {
      if (self->_directMessageConnection
        || ([(_IDSConnection *)self createDirectMessageConnectionIfNeeded],
            self->_directMessageConnection))
      {
        string_ptr = xpc_string_get_string_ptr(v6);
        if (string_ptr)
        {
          id v11 = [NSString stringWithUTF8String:string_ptr];
          if (v7)
          {
            id v12 = (id)CFDictionaryGetValue(v7, @"object-flags");
            id v13 = (void *)CFDictionaryGetValue(v7, @"object-recipient");
          }
          else
          {
            id v12 = 0;
            id v13 = 0;
          }
          id v14 = v13;
          id v15 = +[IDSLogging IDSConnection];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            sub_191A33350();
          }

          if (v14
            && ([(IDSAccount *)self->_account serviceName],
                id v16 = objc_claimAutoreleasedReturnValue(),
                char v17 = [v14 isEqualToString:v16],
                v16,
                (v17 & 1) != 0))
          {
            id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            [v18 setObject:v11 forKeyedSubscript:@"streamName"];
            if (v12) {
              [v18 setObject:v12 forKeyedSubscript:@"streamFlags"];
            }
            [(IDSDirectMessageConnection *)self->_directMessageConnection receivedDirectMessagingSocketWithContext:v18];
          }
          else
          {
            id v18 = +[IDSLogging IDSConnection];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
              sub_191A332B8((uint64_t)self, v18);
            }
          }
        }
      }
    }
  }
}

- (void)didFlushCacheForService:(id)a3 remoteURI:(id)a4 fromURI:(id)a5 guid:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[IDSInternalQueueController sharedInstance];
  int v15 = [v14 assertQueueIsCurrent];

  if (v15)
  {
    id v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A33438();
    }
  }
  char v17 = [MEMORY[0x1E4F6B5C8] URIWithPrefixedURI:v12];
  BOOL v18 = [(_IDSConnection *)self _shouldAcceptIncomingType:@"flush cache notification" forTopic:v10 localURI:v17 remoteURI:0 validateAliases:1 guid:v13];

  if (v18)
  {
    id v19 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v25 = v10;
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = v12;
      __int16 v30 = 2112;
      id v31 = v13;
      _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "Client received notification that cache was flushed { service: %@, remoteURI: %@, fromURI: %@, guid: %@ }", buf, 0x2Au);
    }

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1919803A0;
    v20[3] = &unk_1E572B440;
    v20[4] = self;
    id v21 = v11;
    id v22 = v12;
    id v23 = v13;
    [(_IDSConnection *)self _callDelegatesWithBlock:v20];
  }
}

- (void)didFlushCacheFromKTPeerUpdateForService:(id)a3 peerURI:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A334D0();
    }
  }
  id v11 = +[IDSLogging IDSConnection];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Client received notification that cache was flushed from KT peer update { service: %@, peerURI: %@ }", buf, 0x16u);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1919805BC;
  v13[3] = &unk_1E572B3C8;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [(_IDSConnection *)self _callDelegatesWithBlock:v13];
}

- (void)pendingIncomingMessageWithGUID:(id)a3 forTopic:(id)a4 toURI:(id)a5 fromURI:(id)a6 context:(id)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = a5;
  __int16 v17 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a5) = [v17 assertQueueIsCurrent];

  if (a5)
  {
    id v18 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_191A33568();
    }
  }
  id v19 = self->_messageContext;
  int v20 = (void *)[objc_alloc(MEMORY[0x1E4F6B4F0]) initWithDictionary:v15 boostContext:v19];

  BOOL v21 = [(_IDSConnection *)self _shouldAcceptIncomingType:@"pending" forTopic:v13 localURI:v16 remoteURI:v14 validateAliases:1 guid:v12];
  if (v21)
  {
    [v20 setOriginalGUID:v12];
    id v22 = v12;
    if ([v22 length])
    {
      id v23 = v22;
      if ([v22 length])
      {
LABEL_11:
        id v25 = +[IDSLogging GUIDTRACE];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v31 = v23;
          __int16 v32 = 2112;
          id v33 = v13;
          _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "INCOMING-CLIENT_PENDING:%@ SERVICE:%@", buf, 0x16u);
        }

        __int16 v26 = +[IDSLogging IDSConnection];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          id v31 = v22;
          __int16 v32 = 2112;
          id v33 = v13;
          __int16 v34 = 2112;
          double v35 = @"(unknown)";
          __int16 v36 = 2112;
          id v37 = v14;
          _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "Client received pending incoming message from daemon %@ for topic: %@  messageID: %@  fromID: %@", buf, 0x2Au);
        }

        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = sub_191980950;
        v27[3] = &unk_1E572B468;
        v27[4] = self;
        id v28 = v14;
        id v29 = v20;
        [(_IDSConnection *)self _callDelegatesWithBlock:v27];

        goto LABEL_16;
      }
      uint64_t v24 = [v20 incomingResponseIdentifier];
    }
    else
    {
      uint64_t v24 = [v20 outgoingResponseIdentifier];
    }
    id v23 = (void *)v24;

    goto LABEL_11;
  }
LABEL_16:
}

- (void)pendingResourceWithMetadata:(id)a3 guid:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a6;
  int v20 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a6) = [v20 assertQueueIsCurrent];

  if (a6)
  {
    BOOL v21 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_191A33600();
    }
  }
  id v22 = self->_messageContext;
  id v23 = (void *)[objc_alloc(MEMORY[0x1E4F6B4F0]) initWithDictionary:v18 boostContext:v22];

  BOOL v24 = [(_IDSConnection *)self _shouldAcceptIncomingType:@"pending" forTopic:v16 localURI:v19 remoteURI:v17 validateAliases:1 guid:v15];
  if (v24)
  {
    [v23 setOriginalGUID:v15];
    id v25 = v15;
    if ([v25 length])
    {
      id v29 = v25;
      if ([v25 length])
      {
LABEL_11:
        id v27 = +[IDSLogging GUIDTRACE];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v37 = v30;
          __int16 v38 = 2112;
          id v39 = v16;
          _os_log_impl(&dword_19190B000, v27, OS_LOG_TYPE_DEFAULT, "INCOMING-CLIENT_RESOURCE_PENDING:%@ SERVICE:%@", buf, 0x16u);
        }

        id v28 = +[IDSLogging IDSConnection];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          id v37 = v25;
          __int16 v38 = 2112;
          id v39 = v16;
          __int16 v40 = 2112;
          id v41 = @"(unknown)";
          __int16 v42 = 2112;
          id v43 = v17;
          _os_log_impl(&dword_19190B000, v28, OS_LOG_TYPE_DEFAULT, "Client received pending resource message from daemon %@ for topic: %@  messageID: %@  fromID: %@", buf, 0x2Au);
        }

        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = sub_191980D24;
        v31[3] = &unk_1E572B4B8;
        v31[4] = self;
        id v32 = v14;
        id v33 = v25;
        id v34 = v17;
        id v35 = v23;
        [(_IDSConnection *)self _callDelegatesWithBlock:v31];

        goto LABEL_16;
      }
      uint64_t v26 = [v23 incomingResponseIdentifier];
    }
    else
    {
      uint64_t v26 = [v23 outgoingResponseIdentifier];
    }
    id v29 = (id)v26;

    goto LABEL_11;
  }
LABEL_16:
}

- (void)sessionInvitationReceivedWithPayload:(id)a3 forTopic:(id)a4 sessionID:(id)a5 toIdentifier:(id)a6 fromID:(id)a7 transportType:(id)a8
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v47 = a8;
  id v19 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a5) = [v19 assertQueueIsCurrent];

  if (a5)
  {
    int v20 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_191A33700();
    }
  }
  BOOL v21 = [MEMORY[0x1E4F6B5C8] URIWithPrefixedURI:v17];
  id v22 = [MEMORY[0x1E4F6B5C8] URIWithPrefixedURI:v18];
  BOOL v23 = [(_IDSConnection *)self _shouldAcceptIncomingType:@"session invitation" forTopic:v15 localURI:v21 remoteURI:v22 validateAliases:1 guid:0];

  if (v23)
  {
    BOOL v24 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413570;
      id v56 = v14;
      __int16 v57 = 2112;
      id v58 = v15;
      __int16 v59 = 2112;
      id v60 = v16;
      __int16 v61 = 2112;
      id v62 = v17;
      __int16 v63 = 2112;
      id v64 = v18;
      __int16 v65 = 2112;
      id v66 = v47;
      _os_log_impl(&dword_19190B000, v24, OS_LOG_TYPE_DEFAULT, "Received incoming invitation %@ forTopic %@ sessionID %@ toIdentifier %@ fromID %@ transportType %@", buf, 0x3Eu);
    }
    id v25 = v16;
    id v46 = v15;

    uint64_t v26 = *MEMORY[0x1E4F6ACE0];
    id v27 = [v14 objectForKey:*MEMORY[0x1E4F6ACE0]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v28 = (void *)MEMORY[0x1E4F1C9B8];
      id v29 = [v14 objectForKey:v26];
      uint64_t v30 = [v28 _IDSDataFromBase64String:v29];
    }
    else
    {
      id v29 = [v14 objectForKey:v26];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v31 = 0;
        goto LABEL_14;
      }
      uint64_t v30 = [v14 objectForKey:v26];
    }
    id v31 = (void *)v30;
LABEL_14:

    objc_opt_class();
    id v32 = (id)*MEMORY[0x1E4F6ACE8];
    id v33 = [v14 objectForKey:v32];
    id v45 = v17;
    if (objc_opt_isKindOfClass())
    {
      id v34 = v33;
    }
    else
    {
      if (v33)
      {
        id v35 = [MEMORY[0x1E4F6C3B8] registration];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
          sub_191A33698();
        }
      }
      id v34 = 0;
    }

    id v36 = self->_messageContext;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = sub_191981248;
    v48[3] = &unk_1E572B580;
    v48[4] = self;
    id v37 = v25;
    id v38 = v25;
    id v49 = v38;
    id v50 = v18;
    id v51 = v47;
    id v52 = v34;
    id v53 = v31;
    id v54 = v36;
    id v39 = v36;
    id v40 = v31;
    id v41 = v34;
    [(_IDSConnection *)self _callDelegatesWithBlock:v48];
    __int16 v42 = [(_IDSConnection *)self daemonController];
    id v43 = [(_IDSConnection *)self daemonController];
    uint64_t v44 = [v43 listenerID];
    [v42 acknowledgeSessionID:v38 clientID:v44];

    id v16 = v37;
    id v17 = v45;
    id v15 = v46;
  }
}

- (void)receivedGroupSessionParticipantUpdate:(id)a3 forTopic:(id)a4 toIdentifier:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a6;
  id v17 = +[IDSInternalQueueController sharedInstance];
  int v18 = [v17 assertQueueIsCurrent];

  if (v18)
  {
    id v19 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_191A33798();
    }
  }
  int v20 = [MEMORY[0x1E4F6B5C8] URIWithPrefixedURI:v14];
  BOOL v21 = [MEMORY[0x1E4F6B5C8] URIWithPrefixedURI:v16];

  BOOL v22 = [(_IDSConnection *)self _shouldAcceptIncomingType:@"group session participant update" forTopic:v13 localURI:v20 remoteURI:v21 validateAliases:1 guid:0];
  if (v22)
  {
    id v23 = self->_messageContext;
    BOOL v24 = (void *)[objc_alloc(MEMORY[0x1E4F6B4F0]) initWithDictionary:v15 boostContext:v23];
    id v25 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v13;
      _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "Received incoming group session participant update forTopic %@", buf, 0xCu);
    }

    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F6B490]) initWithDictionaryRepresentation:v12];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_191981564;
    v29[3] = &unk_1E572B468;
    v29[4] = self;
    id v30 = v26;
    id v31 = v24;
    id v27 = v24;
    id v28 = v26;
    [(_IDSConnection *)self _callDelegatesWithBlock:v29];
  }
}

- (void)receivedGroupSessionParticipantDataUpdate:(id)a3 forTopic:(id)a4 toIdentifier:(id)a5 fromID:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[IDSInternalQueueController sharedInstance];
  int v15 = [v14 assertQueueIsCurrent];

  if (v15)
  {
    id v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A33830();
    }
  }
  id v17 = [MEMORY[0x1E4F6B5C8] URIWithPrefixedURI:v12];
  int v18 = [MEMORY[0x1E4F6B5C8] URIWithPrefixedURI:v13];

  BOOL v19 = [(_IDSConnection *)self _shouldAcceptIncomingType:@"group session participant data update" forTopic:v11 localURI:v17 remoteURI:v18 validateAliases:1 guid:0];
  if (v19)
  {
    int v20 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v11;
      _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "Received incoming group session participant data update forTopic %@", buf, 0xCu);
    }

    BOOL v21 = (void *)[objc_alloc(MEMORY[0x1E4F6B490]) initWithDictionaryRepresentation:v10];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_19198181C;
    v23[3] = &unk_1E572B3C8;
    v23[4] = self;
    id v24 = v21;
    id v22 = v21;
    [(_IDSConnection *)self _callDelegatesWithBlock:v23];
  }
}

- (void)checkTransportLogWithReason:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A338C8();
    }
  }
  BOOL v8 = +[IDSLogging IDSConnection];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v11 = a3;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "checkTransportLog {reason: %ld}", buf, 0xCu);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1919819FC;
  v9[3] = &unk_1E572B5A8;
  v9[4] = self;
  void v9[5] = a3;
  [(_IDSConnection *)self _callDelegatesWithBlock:v9];
}

- (void)_sendMissingMessageMetric:(id)a3
{
  id v6 = a3;
  if ([v6 shouldReportMetric])
  {
    int v4 = [v6 payload];
    id v5 = [v6 command];
    [(_IDSConnection *)self sendServerMessage:v4 command:v5];
  }
}

- (unsigned)wakingDowngradeCount
{
  return self->_wakingDowngradeCount;
}

- (void)setWakingDowngradeCount:(unsigned int)a3
{
  self->_wakingDowngradeCount = a3;
}

- (IDSDirectMessageConnection)directMessageConnection
{
  return self->_directMessageConnection;
}

- (void)setDirectMessageConnection:(id)a3
{
}

- (NSDictionary)directMessagingMetadata
{
  return self->_directMessagingMetadata;
}

- (void)setDirectMessagingMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directMessagingMetadata, 0);
  objc_storeStrong((id *)&self->_directMessageConnection, 0);
  objc_storeStrong((id *)&self->_pendingSends, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_delegateToInfo, 0);
  objc_storeStrong(&self->_delegateContext, 0);

  objc_storeStrong(&self->_messageContext, 0);
}

@end