@interface IDSSocketPairConnection
- (BOOL)_processIncomingMessage:(id)a3;
- (BOOL)_queueNextOutgoingData;
- (BOOL)hasEndedSession;
- (BOOL)isConnected;
- (BOOL)isEmpty;
- (BOOL)sendDataMessage:(id)a3;
- (BOOL)sendDataMessage:(id)a3 canFragment:(BOOL)a4;
- (IDSSocketPairConnection)initWithSocket:(int)a3 queue:(id)a4 delegate:(id)a5 priority:(int64_t)a6 connectionID:(id)a7 linkType:(unint64_t)a8;
- (IDSStallDetector)outgoingStallDetector;
- (NSSet)inFlightMessages;
- (NSString)connectionID;
- (double)lastSocketActivityTime;
- (int64_t)_read:(char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)inFlightMessageCount;
- (unint64_t)inFlightMessageCountLowWaterMark;
- (unsigned)fragmentationSize;
- (unsigned)maxAllowedMessageSize;
- (void)_callDelegateWithBlock:(id)a3;
- (void)_endSession;
- (void)_processBytesAvailable;
- (void)_sendToConnectedSocket;
- (void)dealloc;
- (void)endSession;
- (void)processStoredIncomingMessage:(id)a3;
- (void)removePendingMessagesForProtectionClass:(unsigned int)a3;
- (void)setConnectionID:(id)a3;
- (void)setFragmentationSize:(unsigned int)a3;
- (void)setHasEndedSession:(BOOL)a3;
- (void)setInFlightMessageCountLowWaterMark:(unint64_t)a3;
- (void)setMaxAllowedMessageSize:(unsigned int)a3;
- (void)setNotifyWhenConnectionReceivesBytes:(BOOL)a3;
- (void)setOTREncryptionBlock:(id)a3 decryptionBlock:(id)a4;
- (void)setOutgoingStallDetector:(id)a3;
- (void)start;
@end

@implementation IDSSocketPairConnection

- (IDSSocketPairConnection)initWithSocket:(int)a3 queue:(id)a4 delegate:(id)a5 priority:(int64_t)a6 connectionID:(id)a7 linkType:(unint64_t)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)IDSSocketPairConnection;
  v18 = [(IDSSocketPairConnection *)&v24 init];
  if (v18)
  {
    if (IDSTransportThreadInitWithPriority())
    {
      if ((a3 & 0x80000000) == 0)
      {
        objc_storeWeak((id *)&v18->_delegate, v16);
        objc_storeStrong((id *)&v18->_delegateQueue, a4);
        v18->_lock._os_unfair_lock_opaque = 0;
        v18->_lastDateCheck = 0.0;
        v18->_int connectedSocket = a3;
        v18->_writeSocketIsResumed = 1;
        v18->_hasEndedSession = 0;
        v18->_priority = a6;
        v18->_maxAllowedMessageSize = -1;
        objc_storeStrong((id *)&v18->_connectionID, a7);
        v18->_linkType = a8;
        v19 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int connectedSocket = v18->_connectedSocket;
          *(_DWORD *)buf = 67109120;
          LODWORD(v26) = connectedSocket;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Created with {socket:%d}", buf, 8u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (MarcoShouldLog()) {
            MarcoLog();
          }
          if (IMShouldLog()) {
            IMLogString();
          }
        }
        goto LABEL_11;
      }
      v22 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v18;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ instance created with a dead file descriptor!", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog()) {
          MarcoLog();
        }
        if (IMShouldLog()) {
          IMLogString();
        }
      }
    }
    v21 = 0;
    goto LABEL_20;
  }
LABEL_11:
  v21 = v18;
LABEL_20:

  return v21;
}

- (void)start
{
}

- (void)dealloc
{
  if (![(IDSSocketPairConnection *)self hasEndedSession])
  {
    v3 = +[IDSFoundationLog socketPairConnection];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_10070B10C(v3);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)IDSSocketPairConnection;
  [(IDSSocketPairConnection *)&v4 dealloc];
}

- (void)endSession
{
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = +[NSThread callStackSymbols];
    *(_DWORD *)buf = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ endSession at %@!", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      +[NSThread callStackSymbols];
      v8 = v7 = self;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      +[NSThread callStackSymbols];
      v8 = v7 = self;
      IMLogString();
    }
  }
  IDSTransportThreadInitWithPriority();
  IDSTransportThreadAddSyncBlockWithPriority();
  if (self->_outgoingStallDetector)
  {
    v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      outgoingStallDetector = self->_outgoingStallDetector;
      *(_DWORD *)buf = 134217984;
      v10 = (IDSSocketPairConnection *)outgoingStallDetector;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%p: reset the stall detector", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      v7 = self->_outgoingStallDetector;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        v7 = self->_outgoingStallDetector;
        _IDSLogV();
      }
    }
    [(IDSStallDetector *)self->_outgoingStallDetector reset];
  }
}

- (BOOL)isConnected
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isConnected;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unsigned)fragmentationSize
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_fragmentationSize;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (unint64_t)inFlightMessageCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableArray *)self->_outgoingMessageArray count];
  os_unfair_lock_unlock(p_lock);
  return (unint64_t)v4;
}

- (unint64_t)inFlightMessageCountLowWaterMark
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t inFlightMessageCountLowWaterMark = self->_inFlightMessageCountLowWaterMark;
  os_unfair_lock_unlock(p_lock);
  return inFlightMessageCountLowWaterMark;
}

- (BOOL)isEmpty
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSData *)self->_outgoingData length]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(NSMutableArray *)self->_outgoingMessageArray count] == 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)lastSocketActivityTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lastSocketActivityTime = self->_lastSocketActivityTime;
  os_unfair_lock_unlock(p_lock);
  return lastSocketActivityTime;
}

- (NSSet)inFlightMessages
{
  v3 = +[NSMutableSet set];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  outgoingMessageArray = self->_outgoingMessageArray;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100054384;
  v8[3] = &unk_10097FE80;
  id v6 = v3;
  id v9 = v6;
  [(NSMutableArray *)outgoingMessageArray enumerateObjectsUsingBlock:v8];
  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v6;
}

- (void)setFragmentationSize:(unsigned int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_fragmentationSize = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setInFlightMessageCountLowWaterMark:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t inFlightMessageCountLowWaterMark = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)_callDelegateWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      delegateQueue = self->_delegateQueue;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100054590;
      v7[3] = &unk_10097E818;
      id v9 = v4;
      id v8 = WeakRetained;
      dispatch_async(delegateQueue, v7);
    }
  }
}

- (int64_t)_read:(char *)a3 maxLength:(unint64_t)a4
{
  ssize_t v5 = recv(self->_connectedSocket, a3, a4, 0);
  int64_t v6 = v5;
  if (v5 < 0)
  {
    int v9 = *__error();
    v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int connectedSocket = self->_connectedSocket;
      *(_DWORD *)buf = 67109376;
      int v14 = v9;
      __int16 v15 = 1024;
      int v16 = connectedSocket;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Error %d received on {socket:%d}", buf, 0xEu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        goto LABEL_16;
      }
    }
  }
  else if (!v5)
  {
    v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = self->_connectedSocket;
      *(_DWORD *)buf = 67109120;
      int v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Remote side closed the connection, cleaning up {socket:%d}", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
LABEL_16:
      }
        IMLogString();
    }
  }
  return v6;
}

- (void)removePendingMessagesForProtectionClass:(unsigned int)a3
{
  v3 = *(void **)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v6 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing pending OTR messages for protection class %u.", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v12 = v3;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v12 = v3;
        _IDSLogV();
      }
    }
  }
  id v7 = objc_alloc_init((Class)NSMutableIndexSet);
  outgoingMessageArray = self->_outgoingMessageArray;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100054BA4;
  v14[3] = &unk_10097FEA8;
  int v16 = (int)v3;
  id v9 = v7;
  id v15 = v9;
  [(NSMutableArray *)outgoingMessageArray enumerateObjectsWithOptions:2 usingBlock:v14];
  if ([v9 count])
  {
    [(NSMutableArray *)self->_outgoingMessageArray removeObjectsAtIndexes:v9];
    v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v9 count];
      *(_DWORD *)buf = 134217984;
      id v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Removed %lu pending OTR messages.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v12 = [v9 count];
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v12 = objc_msgSend(v9, "count", v12);
          _IDSLogV();
        }
      }
    }
  }
  if ((unint64_t)[(NSMutableArray *)self->_outgoingMessageArray count] <= self->_inFlightMessageCountLowWaterMark)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100054CD0;
    v13[3] = &unk_10097FED0;
    v13[4] = self;
    [(IDSSocketPairConnection *)self _callDelegateWithBlock:v13];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)processStoredIncomingMessage:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = v4;
  int64_t v6 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    unsigned int v13 = [v5 encrypted];
    __int16 v14 = 1024;
    unsigned int v15 = [v5 sequenceNumber];
    __int16 v16 = 1024;
    unsigned int v17 = [v5 streamID];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Process stored data message (Encrypted:%u, SN:%u, StreamID:%u).", buf, 0x14u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v7 = [v5 encrypted];
      id v10 = [v5 sequenceNumber];
      uint64_t v11 = [v5 streamID];
      id v9 = v7;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v8 = objc_msgSend(v5, "encrypted", v7, v10, v11);
        id v10 = [v5 sequenceNumber];
        uint64_t v11 = [v5 streamID];
        id v9 = v8;
        _IDSLogV();
      }
    }
  }
  -[IDSSocketPairConnection _processIncomingMessage:](self, "_processIncomingMessage:", v5, v9, v10, v11);
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)_processIncomingMessage:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  unsigned int v7 = [v6 command];
  id v8 = v6;
  if (v7 == 24)
  {
    [v6 sequenceNumber];
    kdebug_trace();
    decryptionBlock = (void (**)(id, id))self->_decryptionBlock;
    if (decryptionBlock
      && (decryptionBlock[2](decryptionBlock, v6), (id v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v8 = +[IDSSocketPairMessage messageWithData:v10];
    }
    else
    {
      id v8 = 0;
      id v10 = v6;
    }
  }
  if (v8)
  {
    if ([v8 command] == 21)
    {
      if (!self->_incomingDataFragments)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        incomingDataFragments = self->_incomingDataFragments;
        self->_incomingDataFragments = Mutable;
      }
      id v13 = v8;
      unsigned int v14 = [v13 fragmentIndex];
      unsigned int v15 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v13 fragmentedMessageID]);
      __int16 v16 = [(NSMutableDictionary *)self->_incomingDataFragments objectForKey:v15];
      if (!v16)
      {
        __int16 v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 totalFragmentCount]);
        [(NSMutableDictionary *)self->_incomingDataFragments setObject:v16 forKey:v15];
      }
      [v16 addObject:v13];
      id v17 = [v16 count];
      if (v17 != (id)[v13 totalFragmentCount])
      {

        goto LABEL_20;
      }
      id v8 = +[IDSSocketPairFragmentedMessage createOriginalMessageFromFragmentedMessages:v16];

      [(NSMutableDictionary *)self->_incomingDataFragments removeObjectForKey:v15];
      if (!v8)
      {
        v30 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v38) = [v13 totalFragmentCount];
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "FragmentedMessage: can't reassemble message from %u pieces", buf, 8u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            id v32 = [v13 totalFragmentCount];
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              objc_msgSend(v13, "totalFragmentCount", v32);
              _IDSLogV();
            }
          }
        }
        currentMessageData = self->_currentMessageData;
        self->_currentMessageData = 0;

        [(IDSSocketPairConnection *)self endSession];
        BOOL v28 = 0;
        v25 = v13;
        id v13 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      unsigned int v14 = 0;
    }
    id v18 = [objc_alloc((Class)NSData) initWithData:self->_currentMessageData];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10005552C;
    v33[3] = &unk_10097FEF8;
    id v13 = v8;
    id v34 = v13;
    v35 = self;
    id v36 = v18;
    [(IDSSocketPairConnection *)self _callDelegateWithBlock:v33];
  }
  else
  {
    unsigned int v14 = 0;
    id v13 = 0;
  }
LABEL_20:
  if (v7 != 24)
  {
    BOOL v28 = 1;
    goto LABEL_31;
  }
  unsigned int v19 = [v6 priority];
  unsigned int v20 = [v6 protectionClass];
  unsigned int v21 = [v6 encrypted];
  unsigned int v22 = [v6 sequenceNumber];
  id v23 = [v6 streamID];
  objc_super v24 = +[IDSUTunDeliveryController sharedInstance];
  v25 = [v24 topicForStreamID:v23];

  if (v25)
  {
    uint64_t v26 = v19;
    v27 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138414082;
      CFStringRef v38 = @"idsotr";
      __int16 v39 = 2048;
      uint64_t v40 = v26;
      __int16 v41 = 1024;
      unsigned int v42 = v20;
      __int16 v43 = 1024;
      unsigned int v44 = v21;
      __int16 v45 = 1024;
      unsigned int v46 = v22;
      __int16 v47 = 1024;
      unsigned int v48 = v14;
      __int16 v49 = 1024;
      BOOL v50 = v13 != 0;
      __int16 v51 = 2112;
      v52 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Recv OTR message for %@-%ld-%u E:%u SN:%u FI:%u D:%u T:%@", buf, 0x3Eu);
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
  BOOL v28 = 1;
LABEL_29:

LABEL_31:

  return v28;
}

- (void)_processBytesAvailable
{
  uint64_t v2 = __chkstk_darwin(self, a2);
  memset(__b, 170, sizeof(__b));
  uint64_t v3 = (uint64_t)[(id)v2 _read:__b maxLength:0x2000];
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)unsigned int v42 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_processBytesAvailable: read %d bytes", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      uint64_t v38 = v3;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      uint64_t v38 = v3;
      IMLogString();
    }
  }
  if (v3 < 0)
  {
    id v32 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Error when receiving bytes, closing connection", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    goto LABEL_55;
  }
  if (!v3)
  {
    v33 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Remote side closed the connection, cleaning up", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
LABEL_55:
    objc_msgSend((id)v2, "_endSession", v38);
    return;
  }
  if (qword_100A4A4E8 != -1) {
    dispatch_once(&qword_100A4A4E8, &stru_10097FF18);
  }
  *(double *)(v2 + 192) = *(double *)&qword_100A4A4F0 * (double)mach_continuous_time();
  if (*(unsigned char *)(v2 + 152))
  {
    *(unsigned char *)(v2 + 152) = 0;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100055F10;
    v40[3] = &unk_10097FED0;
    v40[4] = v2;
    [(id)v2 _callDelegateWithBlock:v40];
  }
  *(void *)(v2 + 120) += v3;
  if (!*(void *)(v2 + 8))
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", +[IDSSocketPairMessage headerDataSize](IDSSocketPairMessage, "headerDataSize"));
    id v6 = *(void **)(v2 + 8);
    *(void *)(v2 + 8) = v5;
  }
  uint64_t v7 = 0;
  unsigned int v8 = 0;
  while (1)
  {
    unsigned int v9 = +[IDSSocketPairMessage headerDataSize];
    unsigned int v10 = [*(id *)(v2 + 8) length];
    uint64_t v11 = v9 - v10;
    if (v9 == v10) {
      goto LABEL_20;
    }
    id v12 = *(void **)(v2 + 8);
    id v13 = &__b[v7];
    if (v3 - v8 < v11)
    {
      objc_msgSend(v12, "appendBytes:length:", v13);
      unsigned int v8 = v3;
LABEL_20:
      unsigned int v14 = *(_DWORD *)(v2 + 112);
      goto LABEL_23;
    }
    [v12 appendBytes:v13 length:v11];
    unsigned int v14 = +[IDSSocketPairMessage dataLengthFromHeaderData:*(void *)(v2 + 8)];
    *(_DWORD *)(v2 + 112) = v14;
    if (v14 > *(_DWORD *)(v2 + 184)) {
      break;
    }
    v8 += v11;
LABEL_23:
    unsigned int v15 = *(void **)(v2 + 16);
    if (!v15)
    {
      if (v14)
      {
        id v16 = [objc_alloc((Class)NSMutableData) initWithCapacity:*(unsigned int *)(v2 + 112)];
        id v17 = *(void **)(v2 + 16);
        *(void *)(v2 + 16) = v16;

        unsigned int v14 = *(_DWORD *)(v2 + 112);
        unsigned int v15 = *(void **)(v2 + 16);
      }
      else
      {
        unsigned int v15 = 0;
      }
    }
    uint64_t v18 = v14 - [v15 length];
    if (v18)
    {
      unsigned int v19 = *(void **)(v2 + 16);
      unsigned int v20 = &__b[v8];
      if (v3 - v8 >= v18)
      {
        [v19 appendBytes:v20 length:v18];
        v8 += v18;
      }
      else
      {
        objc_msgSend(v19, "appendBytes:length:", v20);
        unsigned int v8 = v3;
      }
    }
    int v21 = *(_DWORD *)(v2 + 112);
    if (v21 == [*(id *)(v2 + 16) length])
    {
      id v22 = [*(id *)(v2 + 8) length];
      if (v22 == (id)+[IDSSocketPairMessage headerDataSize])
      {
        id v23 = +[IDSSocketPairMessage messageWithHeaderData:*(void *)(v2 + 8) data:*(void *)(v2 + 16)];
        if (([(id)v2 _processIncomingMessage:v23] & 1) == 0)
        {
          v37 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "_processIncomingMessage failed.", buf, 2u);
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

          return;
        }
        objc_super v24 = *(void **)(v2 + 16);
        *(void *)(v2 + 16) = 0;

        [*(id *)(v2 + 8) setLength:0];
        *(_DWORD *)(v2 + 112) = 0;
      }
    }
    if (*(double *)(v2 + 144) == 0.0)
    {
      IMTimeOfDay();
      *(void *)(v2 + 144) = v25;
    }
    IMTimeOfDay();
    double v27 = v26;
    double v28 = v26 - *(double *)(v2 + 144);
    if (v28 >= 1.0)
    {
      double v29 = (double)(8 * *(void *)(v2 + 120)) / v28;
      *(double *)(v2 + 128) = v29 * 0.1 + *(double *)(v2 + 128) * 0.9;
      v30 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = *(void *)(v2 + 128);
        *(_DWORD *)buf = 134218240;
        *(void *)unsigned int v42 = v31;
        *(_WORD *)&v42[8] = 2048;
        double v43 = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "BPS: avg %f instant %f", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          uint64_t v38 = *(void *)(v2 + 128);
          double v39 = v29;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          uint64_t v38 = *(void *)(v2 + 128);
          double v39 = v29;
          IMLogString();
        }
      }
      *(void *)(v2 + 120) = 0;
      *(double *)(v2 + 144) = v27;
    }
    uint64_t v7 = v8;
    if (v3 <= v8) {
      return;
    }
  }
  id v34 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    int v35 = *(_DWORD *)(v2 + 112);
    int v36 = *(_DWORD *)(v2 + 184);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)unsigned int v42 = v35;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v36;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Received message size: %u, maximum allowed size: %u", buf, 0xEu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    _IDSWarnV();
    _IDSLogV();
    uint64_t v38 = *(unsigned int *)(v2 + 112);
    *(void *)&double v39 = *(unsigned int *)(v2 + 184);
    _IDSLogTransport();
  }
  objc_msgSend((id)v2, "_endSession", v38, *(void *)&v39);
}

- (BOOL)_queueNextOutgoingData
{
  uint64_t v3 = [(NSMutableArray *)self->_outgoingMessageArray firstObject];
  if (!v3) {
    goto LABEL_18;
  }
  [(NSMutableArray *)self->_outgoingMessageArray removeObjectAtIndex:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v3;
      unsigned int v9 = [v8 objectForKey:@"remainingFragments"];
      id v34 = [v9 firstObject];
      [v9 removeObjectAtIndex:0];
      if (v34)
      {
        unsigned int v37 = [v34 fragmentIndex];
        unsigned int v10 = (id)CFDictionaryGetValue((CFDictionaryRef)v8, @"originalMessage");
        if ([v10 command] == 24)
        {
          id v5 = v10;
          unsigned int v36 = [v5 protectionClass];
          unsigned int v35 = [v5 priority];
          unsigned int v33 = [v5 streamID];
          unsigned int v39 = [v5 sequenceNumber];
          id v6 = [v5 topic];
          connectionID = self->_connectionID;
          if (connectionID) {
            sub_10028BE5C(v35, v36, (uint64_t)connectionID);
          }
          else {
          unsigned int v14 = sub_10028BE18(v35, v36);
          }
          if ([v5 shouldEncrypt])
          {
            encryptionBlock = (void (**)(void, void, void))self->_encryptionBlock;
            if (encryptionBlock)
            {
              objc_super v24 = [v34 underlyingData];
              ((void (**)(void, void *, void *))encryptionBlock)[2](encryptionBlock, v24, v14);
              encryptionBlock = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
            }
            uint64_t v38 = 1;
          }
          else
          {
            encryptionBlock = [v34 underlyingData];
            uint64_t v38 = 0;
          }
        }
        else
        {
          id v22 = [v34 underlyingData];
          outgoingData = self->_outgoingData;
          self->_outgoingData = v22;

          encryptionBlock = 0;
          id v5 = 0;
          unsigned int v33 = 0;
          uint64_t v38 = 0;
          unsigned int v39 = 0;
          unsigned int v14 = 0;
          id v6 = 0;
          unsigned int v35 = 0;
          unsigned int v36 = 3;
        }

        int v20 = 1;
      }
      else
      {
        unsigned int v37 = 0;
        uint64_t v38 = 0;
        encryptionBlock = 0;
        id v5 = 0;
        unsigned int v33 = 0;
        unsigned int v39 = 0;
        unsigned int v14 = 0;
        id v6 = 0;
        int v20 = 0;
        unsigned int v35 = 0;
        unsigned int v36 = 3;
      }
      if ([v9 count])
      {
        [(NSMutableArray *)self->_outgoingMessageArray addObject:v8];
        id v4 = 0;
      }
      else
      {
        id v4 = [v8 objectForKey:@"originalMessage"];
      }

      goto LABEL_40;
    }
    id v16 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "unknown object in _outgoingMessageArray", buf, 2u);
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
LABEL_18:
    encryptionBlock = 0;
    id v5 = 0;
    unsigned int v14 = 0;
    id v6 = 0;
    id v4 = 0;
    BOOL v18 = 0;
    goto LABEL_53;
  }
  id v4 = v3;
  if ([v4 command] != 24)
  {
    id v12 = [v4 underlyingData];
    id v5 = 0;
    unsigned int v13 = 0;
    unsigned int v14 = 0;
    id v6 = 0;
    unsigned int v15 = self->_outgoingData;
    self->_outgoingData = v12;
LABEL_24:

    LODWORD(v38) = 0;
    goto LABEL_25;
  }
  id v5 = v4;
  unsigned int v36 = [v5 protectionClass];
  unsigned int v35 = [v5 priority];
  unsigned int v33 = [v5 streamID];
  unsigned int v39 = [v5 sequenceNumber];
  id v6 = [v5 topic];
  uint64_t v7 = self->_connectionID;
  if (v7) {
    sub_10028BE5C(v35, v36, (uint64_t)v7);
  }
  else {
  unsigned int v14 = sub_10028BE18(v35, v36);
  }
  if (![v5 shouldEncrypt])
  {
    int v21 = [v5 underlyingData];
    unsigned int v15 = self->_outgoingData;
    self->_outgoingData = v21;
    unsigned int v13 = v39;
    goto LABEL_24;
  }
  unsigned int v19 = (void (**)(id, id, void *))self->_encryptionBlock;
  if (v19)
  {
    id v8 = [v5 data];
    v19[2](v19, v8, v14);
    encryptionBlock = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    unsigned int v37 = 0;
    uint64_t v38 = 1;
    id v4 = v5;
    int v20 = 1;
LABEL_40:

    kdebug_trace();
    if (encryptionBlock)
    {
      LODWORD(v32) = v39;
      id v25 = [objc_alloc((Class)IDSSocketPairOTRMessage) initWithVersion:1 encrypted:v38 shouldEncrypt:v38 protectionClass:v36 streamID:v33 priority:v35 sequenceNumber:v32 data:encryptionBlock];
      double v26 = [v5 topic];
      [v25 setTopic:v26];

      double v27 = [v5 context];
      [v25 setContext:v27];

      double v28 = [v25 underlyingData];
      double v29 = self->_outgoingData;
      self->_outgoingData = v28;
    }
    goto LABEL_42;
  }
  LODWORD(v38) = 1;
  unsigned int v13 = v39;
LABEL_25:
  unsigned int v39 = v13;
  kdebug_trace();
  encryptionBlock = 0;
  unsigned int v37 = 0;
  int v20 = 1;
LABEL_42:
  if (v5 && v6)
  {
    v30 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      unsigned int v42 = v14;
      __int16 v43 = 1024;
      int v44 = v38;
      __int16 v45 = 1024;
      unsigned int v46 = v39;
      __int16 v47 = 1024;
      unsigned int v48 = v37;
      __int16 v49 = 2114;
      BOOL v50 = v6;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Send OTR message for %@ E:%u SN:%u FI:%u T:%{public}@.", buf, 0x28u);
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
  BOOL v18 = v20 != 0;
  if (v4
    && (unint64_t)[(NSMutableArray *)self->_outgoingMessageArray count] <= self->_inFlightMessageCountLowWaterMark)
  {
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100056700;
    v40[3] = &unk_10097FED0;
    v40[4] = self;
    [(IDSSocketPairConnection *)self _callDelegateWithBlock:v40];
  }
LABEL_53:

  return v18;
}

- (void)_sendToConnectedSocket
{
  self->_isConnected = 1;
  if (self->_connectedSocket < 0)
  {
    unsigned int v15 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Connected socket closed, cannot send data, cleaning up...", v34, 2u);
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
    goto LABEL_21;
  }
  if ([(NSData *)self->_outgoingData length]) {
    goto LABEL_3;
  }
  if ([(NSMutableArray *)self->_outgoingMessageArray count])
  {
    if ([(IDSSocketPairConnection *)self _queueNextOutgoingData])
    {
LABEL_3:
      uint64_t v3 = [(NSData *)self->_outgoingData bytes];
      NSUInteger v4 = [(NSData *)self->_outgoingData length];
      ssize_t v5 = send(self->_connectedSocket, &v3[self->_currentOutgoingDataIndex], v4 - self->_currentOutgoingDataIndex, 0);
      if (v5 < 0)
      {
        if (*__error() == 35)
        {
          id v17 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            int connectedSocket = self->_connectedSocket;
            *(_DWORD *)id v34 = 67109120;
            *(_DWORD *)&v34[4] = connectedSocket;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{socket:%d} timeout, ignoring ...", v34, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog()) {
              MarcoLog();
            }
            if (IMShouldLog()) {
              IMLogString();
            }
          }
        }
        else
        {
          uint64_t v21 = *__error();
          id v22 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            int v23 = self->_connectedSocket;
            *(_DWORD *)id v34 = 67109376;
            *(_DWORD *)&v34[4] = v21;
            *(_WORD *)&v34[8] = 1024;
            *(_DWORD *)&v34[10] = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "got send error %d, cleaning up {socket:%d} ...", v34, 0xEu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              uint64_t v24 = v21;
              uint64_t v25 = self->_connectedSocket;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                uint64_t v24 = v21;
                uint64_t v25 = self->_connectedSocket;
                _IDSLogV();
              }
            }
          }
          [(IDSSocketPairConnection *)self _endSession];
        }
      }
      else
      {
        ssize_t v6 = v5;
        unint64_t v59 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v57 = v7;
        long long v58 = v7;
        long long v55 = v7;
        long long v56 = v7;
        long long v53 = v7;
        long long v54 = v7;
        long long v51 = v7;
        long long v52 = v7;
        long long v49 = v7;
        long long v50 = v7;
        long long v47 = v7;
        long long v48 = v7;
        long long v45 = v7;
        long long v46 = v7;
        long long v43 = v7;
        long long v44 = v7;
        long long v41 = v7;
        long long v42 = v7;
        long long v39 = v7;
        long long v40 = v7;
        long long v38 = v7;
        long long v36 = v7;
        long long v37 = v7;
        *(_OWORD *)id v34 = v7;
        long long v35 = v7;
        socklen_t v26 = 408;
        if (!getsockopt(self->_connectedSocket, 6, 512, v34, &v26))
        {
          id v8 = +[IDSAWDLogging sharedInstance];
          [v8 IDSSocketPairConnectionTCPInfoLinkType:self->_linkType currentRTT:DWORD1(v35) bandwidth:*(void *)((char *)&v42 + 4)];
        }
        unsigned int v9 = +[IDSFoundationLog socketPairConnection];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          NSUInteger v10 = [(NSData *)self->_outgoingData length];
          int v11 = self->_connectedSocket;
          *(_DWORD *)buf = 134218496;
          ssize_t v29 = v6;
          __int16 v30 = 2048;
          NSUInteger v31 = v10;
          __int16 v32 = 1024;
          int v33 = v11;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sent %ld bytes. Remaining outgoingData %lu {socket:%d}", buf, 0x1Cu);
        }

        if (qword_100A4A4E8 != -1) {
          dispatch_once(&qword_100A4A4E8, &stru_10097FF18);
        }
        self->_double lastSocketActivityTime = *(double *)&qword_100A4A4F0 * (double)mach_continuous_time();
        unint64_t v12 = self->_currentOutgoingDataIndex + v6;
        self->_currentOutgoingDataIndex = v12;
        if (v12 == v4)
        {
          outgoingData = self->_outgoingData;
          self->_outgoingData = 0;

          self->_currentOutgoingDataIndex = 0;
        }
        if (v6)
        {
          outgoingStallDetector = self->_outgoingStallDetector;
          if (outgoingStallDetector) {
            [(IDSStallDetector *)outgoingStallDetector produceBytes:v6];
          }
        }
      }
      return;
    }
    id v16 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to queue outgoing data - possible message fragmentation issue", v34, 2u);
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
LABEL_21:
    [(IDSSocketPairConnection *)self _endSession];
    return;
  }
  unsigned int v19 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = self->_connectedSocket;
    *(_DWORD *)id v34 = 67109120;
    *(_DWORD *)&v34[4] = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No data to send on socket, suspending {socket:%d}", v34, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if (IMShouldLog()) {
      IMLogString();
    }
  }
  self->_writeSocketIsResumed = 0;
  IDSTransportThreadInitWithPriority();
  IDSTransportThreadSuspendSocketWithPriority();
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100056EC4;
  v27[3] = &unk_10097FED0;
  v27[4] = self;
  [(IDSSocketPairConnection *)self _callDelegateWithBlock:v27];
}

- (BOOL)sendDataMessage:(id)a3
{
  return [(IDSSocketPairConnection *)self sendDataMessage:a3 canFragment:0];
}

- (BOOL)sendDataMessage:(id)a3 canFragment:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 command] == 24) {
    [v6 data];
  }
  else {
  long long v7 = [v6 underlyingData];
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_outgoingMessageArray)
  {
    if (!v4) {
      goto LABEL_11;
    }
  }
  else
  {
    id v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    outgoingMessageArray = self->_outgoingMessageArray;
    self->_outgoingMessageArray = v8;

    if (!v4) {
      goto LABEL_11;
    }
  }
  if (self->_fragmentationSize && (unint64_t)[v7 length] > self->_fragmentationSize)
  {
    id v10 = +[IDSSocketPairFragmentedMessage createMessageFragmentsFromOriginalMessage:withFragmentedMessageID:fragmentSize:](IDSSocketPairFragmentedMessage, "createMessageFragmentsFromOriginalMessage:withFragmentedMessageID:fragmentSize:", v7, self->_currentOutgoingFragmentedMessageID);
    v15[0] = @"originalMessage";
    v15[1] = @"remainingFragments";
    v16[0] = v6;
    v16[1] = v10;
    v15[2] = @"totalFragmentCount";
    int v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 count]);
    v16[2] = v11;
    v15[3] = @"fragmentedMessageID";
    unint64_t v12 = +[NSNumber numberWithUnsignedInt:self->_currentOutgoingFragmentedMessageID];
    v16[3] = v12;
    unsigned int v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];

    [(NSMutableArray *)self->_outgoingMessageArray addObject:v13];
    ++self->_currentOutgoingFragmentedMessageID;

    goto LABEL_12;
  }
LABEL_11:
  [(NSMutableArray *)self->_outgoingMessageArray addObject:v6];
LABEL_12:
  if (![(NSData *)self->_outgoingData length]) {
    [(IDSSocketPairConnection *)self _queueNextOutgoingData];
  }
  os_unfair_lock_unlock(&self->_lock);
  IDSTransportThreadInitWithPriority();
  IDSTransportThreadAddBlockWithPriority();

  return 1;
}

- (void)_endSession
{
  if ((self->_connectedSocket & 0x80000000) == 0)
  {
    uint64_t v3 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int connectedSocket = self->_connectedSocket;
      *(_DWORD *)buf = 138412546;
      unsigned int v9 = self;
      __int16 v10 = 1024;
      int v11 = connectedSocket;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ removing {socket:%d} from transport thread!", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        ssize_t v5 = self;
        uint64_t v6 = self->_connectedSocket;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          ssize_t v5 = self;
          uint64_t v6 = self->_connectedSocket;
          _IDSLogV();
        }
      }
    }
    IDSTransportThreadInitWithPriority();
    IDSTransportThreadRemoveSocketWithPriority();
    self->_writeSocketIsResumed = 0;
    shutdown(self->_connectedSocket, 2);
    close(self->_connectedSocket);
    self->_int connectedSocket = -1;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000573E8;
    v7[3] = &unk_10097FED0;
    void v7[4] = self;
    [(IDSSocketPairConnection *)self _callDelegateWithBlock:v7];
  }
  -[IDSSocketPairConnection setHasEndedSession:](self, "setHasEndedSession:", 1, v5, v6);
}

- (void)setNotifyWhenConnectionReceivesBytes:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_notifyWhenConnectionReceivesBytes = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setOTREncryptionBlock:(id)a3 decryptionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v8 = [v6 copy];
  id encryptionBlock = self->_encryptionBlock;
  self->_id encryptionBlock = v8;

  id v10 = [v7 copy];
  id decryptionBlock = self->_decryptionBlock;
  self->_id decryptionBlock = v10;

  unint64_t v12 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = objc_retainBlock(v6);
    id v14 = objc_retainBlock(v7);
    *(_DWORD *)buf = 134218496;
    int v20 = self;
    __int16 v21 = 2048;
    id v22 = v13;
    __int16 v23 = 2048;
    id v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SocketPairConnection (%p) add OTR blocks (enc:%p dec:%p).", buf, 0x20u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v15 = objc_retainBlock(v6);
      id v17 = objc_retainBlock(v7);
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v16 = objc_retainBlock(v6);
        id v18 = objc_retainBlock(v7);
        _IDSLogV();
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (unsigned)maxAllowedMessageSize
{
  return self->_maxAllowedMessageSize;
}

- (void)setMaxAllowedMessageSize:(unsigned int)a3
{
  self->_maxAllowedMessageSize = a3;
}

- (NSString)connectionID
{
  return self->_connectionID;
}

- (void)setConnectionID:(id)a3
{
}

- (IDSStallDetector)outgoingStallDetector
{
  return self->_outgoingStallDetector;
}

- (void)setOutgoingStallDetector:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingStallDetector, 0);
  objc_storeStrong(&self->_decryptionBlock, 0);
  objc_storeStrong(&self->_encryptionBlock, 0);
  objc_storeStrong((id *)&self->_connectionID, 0);
  objc_storeStrong((id *)&self->_incomingDataFragments, 0);
  objc_storeStrong((id *)&self->_outgoingMessageArray, 0);
  objc_storeStrong((id *)&self->_outgoingData, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentMessageData, 0);

  objc_storeStrong((id *)&self->_headerData, 0);
}

@end