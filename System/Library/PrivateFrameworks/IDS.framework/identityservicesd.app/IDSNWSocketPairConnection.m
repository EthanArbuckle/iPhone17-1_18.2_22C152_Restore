@interface IDSNWSocketPairConnection
- (BOOL)hasEndedSession;
- (BOOL)sendDataMessage:(id)a3;
- (BOOL)sendDataMessage:(id)a3 canFragment:(BOOL)a4;
- (BOOL)shouldUseCrossLayerLogging;
- (IDSNWSocketPairConnection)initWithSocket:(int)a3 queue:(id)a4 delegate:(id)a5 priority:(int64_t)a6 identifier:(id)a7;
- (IDSSocketPairConnectionDelegate)delegate;
- (NSMutableDictionary)incomingDataFragments;
- (NSSet)inFlightMessages;
- (NSString)identifier;
- (OS_dispatch_queue)priorityQueue;
- (OS_nw_connection)nwConnection;
- (double)lastSocketActivityTime;
- (id)decryptionBlock;
- (id)encryptionBlock;
- (int64_t)priority;
- (unsigned)currentOutgoingFragmentedMessageID;
- (unsigned)fragmentationSize;
- (unsigned)loggingSequenceIncoming;
- (unsigned)loggingSequenceOutgoing;
- (void)_dequeueNextMessageFromOutgoingQueue;
- (void)_notifyDelegateAboutClosedConnection;
- (void)_processIncomingRawMessage:(id)a3;
- (void)_receiveFromNWConnection:(id)a3;
- (void)_sendDataViaNWConnection:(id)a3 isLargeTransfer:(BOOL)a4;
- (void)dealloc;
- (void)endSession;
- (void)setCurrentOutgoingFragmentedMessageID:(unsigned int)a3;
- (void)setDecryptionBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEncryptionBlock:(id)a3;
- (void)setFragmentationSize:(unsigned int)a3;
- (void)setHasEndedSession:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIncomingDataFragments:(id)a3;
- (void)setLoggingSequenceIncoming:(unsigned __int8)a3;
- (void)setLoggingSequenceOutgoing:(unsigned __int8)a3;
- (void)setNwConnection:(id)a3;
- (void)setOTREncryptionBlock:(id)a3 decryptionBlock:(id)a4;
- (void)setPriority:(int64_t)a3;
- (void)setPriorityQueue:(id)a3;
- (void)setShouldUseCrossLayerLogging:(BOOL)a3;
- (void)start;
@end

@implementation IDSNWSocketPairConnection

- (IDSNWSocketPairConnection)initWithSocket:(int)a3 queue:(id)a4 delegate:(id)a5 priority:(int64_t)a6 identifier:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v28.receiver = self;
  v28.super_class = (Class)IDSNWSocketPairConnection;
  v15 = [(IDSNWSocketPairConnection *)&v28 init];
  v16 = v15;
  if (v15)
  {
    nwConnection = v15->_nwConnection;
    v15->_nwConnection = 0;

    objc_storeStrong((id *)&v16->_priorityQueue, a4);
    objc_storeWeak((id *)&v16->_delegate, v13);
    v16->_priority = a6;
    *(void *)&v16->_currentOutgoingFragmentedMessageID = 0x1F4000000000;
    *(_WORD *)&v16->_loggingSequenceIncoming = 0;
    objc_storeStrong((id *)&v16->_identifier, a7);
    v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    outgoingMessageArray = v16->_outgoingMessageArray;
    v16->_outgoingMessageArray = v18;

    v16->_sendMessageCounter = 0;
    *(_WORD *)&v16->_hasEndedSession = 0;
    v20 = nw_parameters_create();
    nw_parameters_set_indefinite();
    v21 = nw_parameters_copy_default_protocol_stack(v20);
    v22 = sub_1003FE398();
    options = nw_framer_create_options(v22);
    nw_protocol_stack_prepend_application_protocol(v21, options);

    v24 = nw_tcp_create_options();
    nw_protocol_stack_set_transport_protocol(v21, v24);

    uint64_t v25 = nw_connection_create_with_connected_socket_and_parameters();
    v26 = v16->_nwConnection;
    v16->_nwConnection = (OS_nw_connection *)v25;

    nw_connection_get_uuid();
  }

  return v16;
}

- (void)start
{
  nwConnection = self->_nwConnection;
  v4 = +[IDSFoundationLog socketPairConnection];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (nwConnection)
  {
    if (v5)
    {
      v6 = [(IDSNWSocketPairConnection *)self identifier];
      *(_DWORD *)buf = 138412290;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "IDSNWSocketPairConnection: %@ Succesful nw_connection_create_with_connected_socket_and_parameters", buf, 0xCu);
    }
    nw_connection_set_queue((nw_connection_t)self->_nwConnection, (dispatch_queue_t)self->_priorityQueue);
    nw_connection_set_event_handler();
    nw_connection_start((nw_connection_t)self->_nwConnection);
  }
  else
  {
    if (v5)
    {
      v7 = [(IDSNWSocketPairConnection *)self identifier];
      *(_DWORD *)buf = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "IDSNWSocketPairConnection: %@ _nwConnection is nil.", buf, 0xCu);
    }
    [(IDSNWSocketPairConnection *)self _notifyDelegateAboutClosedConnection];
  }
}

- (void)dealloc
{
  if (![(IDSNWSocketPairConnection *)self hasEndedSession])
  {
    v3 = +[IDSFoundationLog socketPairConnection];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_100723CFC(v3);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)IDSNWSocketPairConnection;
  [(IDSNWSocketPairConnection *)&v4 dealloc];
}

- (void)endSession
{
  if (self->_nwConnection)
  {
    v3 = +[IDSFoundationLog socketPairConnection];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v4 = [(IDSNWSocketPairConnection *)self identifier];
      int v7 = 138412290;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "IDSNWSocketPairConnection: %@ Ending session", (uint8_t *)&v7, 0xCu);
    }
    nwConnection = self->_nwConnection;
    self->_nwConnection = 0;
    v6 = nwConnection;

    nw_connection_cancel(v6);
    [(IDSNWSocketPairConnection *)self setHasEndedSession:1];
    [(IDSNWSocketPairConnection *)self _notifyDelegateAboutClosedConnection];
  }
}

- (void)_notifyDelegateAboutClosedConnection
{
  v3 = [(IDSNWSocketPairConnection *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(IDSNWSocketPairConnection *)self delegate];
    [v5 connectionDidClose];
  }
}

- (void)setOTREncryptionBlock:(id)a3 decryptionBlock:(id)a4
{
  id v6 = a4;
  id v7 = [a3 copy];
  id encryptionBlock = self->_encryptionBlock;
  self->_id encryptionBlock = v7;

  id v9 = [v6 copy];
  id decryptionBlock = self->_decryptionBlock;
  self->_id decryptionBlock = v9;
}

- (void)_receiveFromNWConnection:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003FF080;
  v4[3] = &unk_10098C9E8;
  v4[4] = self;
  id v5 = a3;
  v3 = v5;
  nw_connection_receive_message(v3, v4);
}

- (void)_processIncomingRawMessage:(id)a3
{
  id v4 = a3;
  ids_monotonic_time();
  self->_lastSocketActivityTime = v6;
  if (self->_decryptionBlock && [v4 command] == 24)
  {
    id v7 = (*((void (**)(void))self->_decryptionBlock + 2))();
    uint64_t v8 = +[IDSSocketPairMessage messageWithData:v7];

    id v4 = (id)v8;
  }
  if (v4)
  {
    if ([v4 command] == 21)
    {
      if (!self->_incomingDataFragments)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        incomingDataFragments = self->_incomingDataFragments;
        self->_incomingDataFragments = Mutable;
      }
      id v4 = v4;
      unsigned int v11 = [v4 fragmentIndex];
      id v12 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 fragmentedMessageID]);
      id v13 = [(NSMutableDictionary *)self->_incomingDataFragments objectForKey:v12];
      if (!v13)
      {
        id v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 totalFragmentCount]);
        [(NSMutableDictionary *)self->_incomingDataFragments setObject:v13 forKey:v12];
      }
      [v13 addObject:v4];
      id v14 = [v13 count];
      if (v14 != (id)[v4 totalFragmentCount])
      {

        goto LABEL_29;
      }
      id v15 = +[IDSSocketPairFragmentedMessage createOriginalMessageFromFragmentedMessages:v13];

      [(NSMutableDictionary *)self->_incomingDataFragments removeObjectForKey:v12];
      id v4 = v15;
    }
    else
    {
      unsigned int v11 = 0;
    }
    if ([v4 command] == 24)
    {
      unsigned int v16 = [v4 priority];
      unsigned int v17 = [v4 protectionClass];
      unsigned int v18 = [v4 encrypted];
      unsigned int v19 = [v4 sequenceNumber];
      id v20 = [v4 streamID];
      v21 = +[IDSUTunDeliveryController sharedInstance];
      v22 = [v21 topicForStreamID:v20];

      if (v22)
      {
        v23 = +[IDSFoundationLog socketPairConnection];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138414082;
          *(void *)v34 = @"idsotr";
          *(_WORD *)&v34[8] = 2048;
          uint64_t v35 = v16;
          LOWORD(v36) = 1024;
          *(_DWORD *)((char *)&v36 + 2) = v17;
          HIWORD(v36) = 1024;
          *(_DWORD *)v37 = v18;
          *(_WORD *)&v37[4] = 1024;
          *(_DWORD *)v38 = v19;
          *(_WORD *)&v38[4] = 1024;
          *(_DWORD *)&v38[6] = v11;
          __int16 v39 = 1024;
          BOOL v40 = v4 != 0;
          __int16 v41 = 2112;
          v42 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "IDSNWSocketPairConnection: Recv OTR message for %@-%ld-%u E:%u SN:%u FI:%u D:%u T:%@", buf, 0x3Eu);
        }
      }
    }
    v24 = [(IDSNWSocketPairConnection *)self delegate];
    char v25 = objc_opt_respondsToSelector();

    if (v25)
    {
      if (objc_opt_respondsToSelector())
      {
        v26 = [v4 messageUUID];
        if (v26 && [(IDSNWSocketPairConnection *)self shouldUseCrossLayerLogging])
        {
          id v27 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v26, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL);
          [v27 getUUIDBytes:&v32];

          objc_super v28 = +[IDSFoundationLog CrossLayerLogging];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v29 = [v4 underlyingDataLength];
            unsigned int v30 = [(IDSNWSocketPairConnection *)self loggingSequenceIncoming];
            [(IDSNWSocketPairConnection *)self setLoggingSequenceIncoming:(v30 + 1)];
            *(_DWORD *)buf = 67110914;
            *(_DWORD *)v34 = 120;
            *(_WORD *)&v34[4] = 1024;
            *(_DWORD *)&v34[6] = 140;
            uint64_t v35 = 0x832000000100412;
            v36 = &v32;
            *(_WORD *)v37 = 1042;
            *(_DWORD *)&v37[2] = 16;
            *(_WORD *)v38 = 2098;
            *(void *)&v38[2] = self->_connectionID;
            __int16 v39 = 1024;
            BOOL v40 = v29;
            __int16 v41 = 1024;
            LODWORD(v42) = v30;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "31 {curProtocol: %hhu, prevProtocol: %hhu, curUUID: %{public}.16P, conUUID: %{public}.16P, curPktLen: %u, logSeqn: %hhu}", buf, 0x3Au);
          }
        }
      }
      else
      {
        v26 = 0;
      }
      v31 = [(IDSNWSocketPairConnection *)self delegate];
      [v31 didReceiveDataMessage:v4];
    }
  }
LABEL_29:
}

- (BOOL)sendDataMessage:(id)a3
{
  return [(IDSNWSocketPairConnection *)self sendDataMessage:a3 canFragment:0];
}

- (BOOL)sendDataMessage:(id)a3 canFragment:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(IDSNWSocketPairConnection *)self nwConnection];

  if (v7)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [v6 messageUUID];
      if (v8 && [(IDSNWSocketPairConnection *)self shouldUseCrossLayerLogging])
      {
        v42[0] = 0xAAAAAAAAAAAAAAAALL;
        v42[1] = 0xAAAAAAAAAAAAAAAALL;
        id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:v8];
        [v9 getUUIDBytes:v42];

        v10 = +[IDSFoundationLog CrossLayerLogging];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v11 = [v6 underlyingDataLength];
          unsigned int v12 = [(IDSNWSocketPairConnection *)self loggingSequenceOutgoing];
          [(IDSNWSocketPairConnection *)self setLoggingSequenceOutgoing:(v12 + 1)];
          *(_DWORD *)buf = 67110914;
          int v27 = 120;
          __int16 v28 = 1024;
          int v29 = 140;
          __int16 v30 = 1042;
          int v31 = 16;
          __int16 v32 = 2098;
          v33 = v42;
          __int16 v34 = 1042;
          int v35 = 16;
          __int16 v36 = 2098;
          connectionID = self->_connectionID;
          __int16 v38 = 1024;
          unsigned int v39 = v11;
          __int16 v40 = 1024;
          unsigned int v41 = v12;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "30 {curProtocol: %hhu, nextProtocol: %hhu, curUUID: %{public}.16P, conUUID: %{public}.16P, curPktLen: %u, logSeqn: %hhu}", buf, 0x3Au);
        }
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    if ([v6 command] == 24) {
      [v6 data];
    }
    else {
    id v13 = [v6 underlyingData];
    }
    id v14 = v13;
    if (v4 && self->_fragmentationSize && (unint64_t)[v13 length] > self->_fragmentationSize)
    {
      id v15 = +[IDSSocketPairFragmentedMessage createMessageFragmentsFromOriginalMessage:withFragmentedMessageID:fragmentSize:](IDSSocketPairFragmentedMessage, "createMessageFragmentsFromOriginalMessage:withFragmentedMessageID:fragmentSize:", v14, self->_currentOutgoingFragmentedMessageID);
      v24[0] = @"originalMessage";
      v24[1] = @"remainingFragments";
      v25[0] = v6;
      v25[1] = v15;
      v24[2] = @"totalFragmentCount";
      unsigned int v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v15 count]);
      v25[2] = v16;
      v24[3] = @"fragmentedMessageID";
      unsigned int v17 = +[NSNumber numberWithUnsignedInt:self->_currentOutgoingFragmentedMessageID];
      v25[3] = v17;
      unsigned int v18 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];

      os_unfair_lock_lock(&self->_outgoingMessageArrayLock);
      [(NSMutableArray *)self->_outgoingMessageArray addObject:v18];
      if (v8)
      {
        unsigned int v19 = +[IDSFoundationLog socketPairConnection];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_100723DB8();
        }
      }
      os_unfair_lock_unlock(&self->_outgoingMessageArrayLock);
      ++self->_currentOutgoingFragmentedMessageID;
    }
    else
    {
      os_unfair_lock_lock(&self->_outgoingMessageArrayLock);
      [(NSMutableArray *)self->_outgoingMessageArray addObject:v6];
      if (v8)
      {
        id v20 = +[IDSFoundationLog socketPairConnection];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          sub_100723D40((uint64_t)v8, v20);
        }
      }
      os_unfair_lock_unlock(&self->_outgoingMessageArrayLock);
    }
    v21 = +[IDSDaemonPriorityQueueController sharedInstance];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1003FFCF4;
    v23[3] = &unk_10097E4D0;
    v23[4] = self;
    [v21 performBlockWithPriority:v23 priority:self->_priority];
  }
  return v7 != 0;
}

- (double)lastSocketActivityTime
{
  return self->_lastSocketActivityTime;
}

- (void)_dequeueNextMessageFromOutgoingQueue
{
  p_outgoingMessageArrayLock = &self->_outgoingMessageArrayLock;
  os_unfair_lock_lock(&self->_outgoingMessageArrayLock);
  if ([(NSMutableArray *)self->_outgoingMessageArray count])
  {
    BOOL v4 = [(NSMutableArray *)self->_outgoingMessageArray firstObject];
    [(NSMutableArray *)self->_outgoingMessageArray removeObjectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v6 = [v5 messageUUID];
        if (v6)
        {
          id v7 = (void *)v6;
          uint64_t v8 = +[IDSFoundationLog socketPairConnection];
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
            sub_100723E34((uint64_t)v7, v8);
          }
        }
      }
      if ([v5 command] == 24) {
        [v5 data];
      }
      else {
      unsigned int v11 = [v5 underlyingData];
      }
      BOOL v12 = [v5 command] == 24;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = v4;
        id v9 = [v5 objectForKey:@"remainingFragments"];
        v10 = [v9 firstObject];
        [v9 removeObjectAtIndex:0];
        if ([v9 count])
        {
          [(NSMutableArray *)self->_outgoingMessageArray addObject:v5];
        }
        else
        {
          id v13 = [v5 objectForKey:@"fragmentedMessageID"];
          int v14 = [v13 unsignedIntValue];

          id v15 = +[IDSFoundationLog socketPairConnection];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            sub_100723EAC(v14, v15);
          }
        }
        unsigned int v11 = [v10 underlyingData];

        BOOL v12 = 1;
      }
      else
      {
        id v5 = +[IDSFoundationLog socketPairConnection];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IDSNWSocketPairConnection: unknown object in _outgoingMessageArray", buf, 2u);
        }
        unsigned int v11 = 0;
        BOOL v12 = 0;
      }
    }

    os_unfair_lock_unlock(p_outgoingMessageArrayLock);
    if (v11)
    {
      [(IDSNWSocketPairConnection *)self _sendDataViaNWConnection:v11 isLargeTransfer:v12];
    }
  }
  else
  {
    os_unfair_lock_unlock(p_outgoingMessageArrayLock);
    id v16 = [(IDSNWSocketPairConnection *)self delegate];
    [v16 connectionBecameEmpty];
  }
}

- (NSSet)inFlightMessages
{
  v3 = +[NSMutableSet set];
  p_outgoingMessageArrayLock = &self->_outgoingMessageArrayLock;
  os_unfair_lock_lock(&self->_outgoingMessageArrayLock);
  outgoingMessageArray = self->_outgoingMessageArray;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1004000C4;
  v8[3] = &unk_10097FE80;
  id v6 = v3;
  id v9 = v6;
  [(NSMutableArray *)outgoingMessageArray enumerateObjectsUsingBlock:v8];
  os_unfair_lock_unlock(p_outgoingMessageArrayLock);

  return (NSSet *)v6;
}

- (void)_sendDataViaNWConnection:(id)a3 isLargeTransfer:(BOOL)a4
{
  id v5 = a3;
  unsigned int v6 = [v5 length];
  ids_monotonic_time();
  self->_lastSocketActivityTime = v7;
  ++self->_sendMessageCounter;
  nwConnection = self->_nwConnection;
  id v9 = [v5 _createDispatchData];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10040024C;
  v10[3] = &unk_10098CA10;
  v10[4] = self;
  unsigned int v11 = v6;
  nw_connection_send(nwConnection, v9, _nw_content_context_default_message, 1, v10);
}

- (OS_dispatch_queue)priorityQueue
{
  return self->_priorityQueue;
}

- (void)setPriorityQueue:(id)a3
{
}

- (IDSSocketPairConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSSocketPairConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (OS_nw_connection)nwConnection
{
  return self->_nwConnection;
}

- (void)setNwConnection:(id)a3
{
}

- (unsigned)currentOutgoingFragmentedMessageID
{
  return self->_currentOutgoingFragmentedMessageID;
}

- (void)setCurrentOutgoingFragmentedMessageID:(unsigned int)a3
{
  self->_currentOutgoingFragmentedMessageID = a3;
}

- (unsigned)fragmentationSize
{
  return self->_fragmentationSize;
}

- (void)setFragmentationSize:(unsigned int)a3
{
  self->_fragmentationSize = a3;
}

- (unsigned)loggingSequenceIncoming
{
  return self->_loggingSequenceIncoming;
}

- (void)setLoggingSequenceIncoming:(unsigned __int8)a3
{
  self->_loggingSequenceIncoming = a3;
}

- (unsigned)loggingSequenceOutgoing
{
  return self->_loggingSequenceOutgoing;
}

- (void)setLoggingSequenceOutgoing:(unsigned __int8)a3
{
  self->_loggingSequenceOutgoing = a3;
}

- (NSMutableDictionary)incomingDataFragments
{
  return self->_incomingDataFragments;
}

- (void)setIncomingDataFragments:(id)a3
{
}

- (id)encryptionBlock
{
  return self->_encryptionBlock;
}

- (void)setEncryptionBlock:(id)a3
{
}

- (id)decryptionBlock
{
  return self->_decryptionBlock;
}

- (void)setDecryptionBlock:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)hasEndedSession
{
  return self->_hasEndedSession;
}

- (void)setHasEndedSession:(BOOL)a3
{
  self->_hasEndedSession = a3;
}

- (BOOL)shouldUseCrossLayerLogging
{
  return self->_shouldUseCrossLayerLogging;
}

- (void)setShouldUseCrossLayerLogging:(BOOL)a3
{
  self->_shouldUseCrossLayerLogging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_decryptionBlock, 0);
  objc_storeStrong(&self->_encryptionBlock, 0);
  objc_storeStrong((id *)&self->_incomingDataFragments, 0);
  objc_storeStrong((id *)&self->_nwConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_priorityQueue, 0);

  objc_storeStrong((id *)&self->_outgoingMessageArray, 0);
}

@end