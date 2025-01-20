@interface IDSBaseSocketPairConnection
- (BOOL)sendData:(id)a3;
- (IDSBaseSocketPairConnection)initWithQueue:(id)a3 delegate:(id)a4;
- (IDSBaseSocketPairConnection)initWithSocket:(int)a3 queue:(id)a4 delegate:(id)a5;
- (IDSBaseSocketPairConnection)initWithSocket:(int)a3 queue:(id)a4 delegate:(id)a5 start:(BOOL)a6;
- (int)socket;
- (void)_callDelegatesWithBlock:(id)a3;
- (void)_processBytesAvailable;
- (void)_sendToConnectedSocket;
- (void)_setupWriteSource;
- (void)dealloc;
- (void)endSession;
- (void)setDestination:(id)a3;
- (void)start;
@end

@implementation IDSBaseSocketPairConnection

- (IDSBaseSocketPairConnection)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)IDSBaseSocketPairConnection;
  v10 = [(IDSBaseSocketPairConnection *)&v36 init];
  if (v10)
  {
    uint64_t v12 = objc_msgSend_weakRefWithObject_(MEMORY[0x1E4F6C428], v9, (uint64_t)v8, v11);
    delegate = v10->_delegate;
    v10->_delegate = (IMWeakReference *)v12;

    objc_storeStrong((id *)&v10->_queue, a3);
    id v14 = [NSString alloc];
    uint64_t v18 = objc_msgSend_stringGUID(NSString, v15, v16, v17);
    v21 = objc_msgSend_initWithFormat_(v14, v19, @"com.apple.identityservices.socketConnection-%@", v20, v18);

    LOBYTE(v18) = IMGetDomainBoolForKey();
    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = v22;
    if (v18)
    {
      v24 = dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_USER_INTERACTIVE, 0);
    }
    else
    {
      v24 = v22;
    }
    v25 = v24;
    id v26 = v21;
    v30 = (const char *)objc_msgSend_UTF8String(v26, v27, v28, v29);
    dispatch_queue_t v31 = dispatch_queue_create(v30, v25);
    readQueue = v10->_readQueue;
    v10->_readQueue = (OS_dispatch_queue *)v31;

    v10->_lastDateCheck = 0.0;
    v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    outgoingDataArray = v10->_outgoingDataArray;
    v10->_outgoingDataArray = v33;
  }
  return v10;
}

- (IDSBaseSocketPairConnection)initWithSocket:(int)a3 queue:(id)a4 delegate:(id)a5 start:(BOOL)a6
{
  BOOL v7 = a6;
  v9 = (IDSBaseSocketPairConnection *)objc_msgSend_initWithQueue_delegate_(self, a2, (uint64_t)a4, v6, a5);
  v13 = v9;
  if (v9)
  {
    v9->_connectedSocket = a3;
    if (v7) {
      objc_msgSend_start(v9, v10, v11, v12);
    }
  }
  return v13;
}

- (IDSBaseSocketPairConnection)initWithSocket:(int)a3 queue:(id)a4 delegate:(id)a5
{
  return (IDSBaseSocketPairConnection *)((uint64_t (*)(IDSBaseSocketPairConnection *, char *, void))MEMORY[0x1F4181798])(self, sel_initWithSocket_queue_delegate_start_, *(void *)&a3);
}

- (void)dealloc
{
  objc_msgSend_endSession(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)IDSBaseSocketPairConnection;
  [(IDSBaseSocketPairConnection *)&v5 dealloc];
}

- (void)endSession
{
  readQueue = self->_readQueue;
  if (readQueue)
  {
    self->_readQueue = 0;
  }
  readSource = self->_readSource;
  if (readSource)
  {
    dispatch_source_cancel(readSource);
    objc_super v5 = self->_readSource;
    self->_readSource = 0;
  }
  writeSource = self->_writeSource;
  if (writeSource)
  {
    dispatch_source_cancel(writeSource);
    if (!self->_writeSourceIsResumed) {
      dispatch_resume((dispatch_object_t)self->_writeSource);
    }
    BOOL v7 = self->_writeSource;
    self->_writeSource = 0;
  }
  self->_writeSourceIsResumed = 0;
  int connectedSocket = self->_connectedSocket;
  if ((connectedSocket & 0x80000000) == 0)
  {
    close(connectedSocket);
    self->_int connectedSocket = -1;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_19DA30944;
    v10[3] = &unk_1E5973E80;
    v10[4] = self;
    objc_msgSend__callDelegatesWithBlock_(self, v9, (uint64_t)v10, COERCE_DOUBLE(3221225472));
  }
}

- (void)setDestination:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int connectedSocket = self->_connectedSocket;
    if ((connectedSocket & 0x80000000) == 0)
    {
      id v14 = v4;
      v9 = (const sockaddr *)objc_msgSend_sa(v4, v5, v6, v7);
      v13 = (unsigned __int8 *)objc_msgSend_sa(v14, v10, v11, v12);
      connect(connectedSocket, v9, *v13);
      id v4 = v14;
    }
  }
}

- (void)_callDelegatesWithBlock:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v8 = objc_msgSend_object(self->_delegate, v4, v5, v7);
    v9 = (void *)v8;
    queue = self->_queue;
    if (queue) {
      BOOL v11 = v8 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = sub_19DA30AE8;
      v12[3] = &unk_1E5970A78;
      id v14 = v6;
      id v13 = v9;
      dispatch_async(queue, v12);
    }
  }
}

- (void)_processBytesAvailable
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  ssize_t v3 = recv(self->_connectedSocket, __b, 0x2710uLL, 0);
  ssize_t v4 = v3;
  if (v3 < 0)
  {
    if (*__error() == 35)
    {
      v33 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v33, OS_LOG_TYPE_DEFAULT, "resource temporarily unavailable, trying again later...", buf, 2u);
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
      v38 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = *__error();
        v40 = __error();
        v41 = strerror(*v40);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v54 = v39;
        *(_WORD *)&v54[4] = 2080;
        *(void *)&v54[6] = v41;
        _os_log_impl(&dword_19D9BE000, v38, OS_LOG_TYPE_DEFAULT, "Error %d (%s) when receiving bytes, closing connection", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          uint64_t v45 = *__error();
          v46 = __error();
          uint64_t v49 = v45;
          v50 = strerror(*v46);
          MarcoLog();
        }
        if (IMShouldLog())
        {
          uint64_t v47 = *__error();
          v48 = __error();
          uint64_t v49 = v47;
          v50 = strerror(*v48);
          IMLogString();
        }
      }
      objc_msgSend_endSession(self, v42, v43, v44, v49, v50);
    }
  }
  else if (v3)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v8 = objc_msgSend_initWithBytes_length_(v5, v6, (uint64_t)__b, v7, v4);
    v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v54 = objc_msgSend_hash(v8, v10, v11, v12);
      _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "Processing incoming bytes %lu", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        objc_msgSend_hash(v8, v13, v14, v15);
        MarcoLog();
      }
      if (IMShouldLog())
      {
        objc_msgSend_hash(v8, v16, v17, v18);
        IMLogString();
      }
    }
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = sub_19DA311AC;
    v51[3] = &unk_1E5973EA8;
    v51[4] = self;
    id v52 = v8;
    id v19 = v8;
    objc_msgSend__callDelegatesWithBlock_(self, v20, (uint64_t)v51, v21);
    uint64_t v25 = objc_msgSend_length(v19, v22, v23, v24);

    self->_bytesReceived += v25;
    if (self->_lastDateCheck == 0.0)
    {
      IMTimeOfDay();
      self->_lastDateCheck = v26;
    }
    IMTimeOfDay();
    double v28 = v27;
    double v29 = v27 - self->_lastDateCheck;
    if (v29 >= 1.0)
    {
      double v30 = (double)(8 * self->_bytesReceived) / v29;
      self->_double prevBPS = v30 * 0.1 + self->_prevBPS * 0.9;
      dispatch_queue_t v31 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        double prevBPS = self->_prevBPS;
        *(_DWORD *)buf = 134218240;
        *(double *)v54 = prevBPS;
        *(_WORD *)&v54[8] = 2048;
        *(double *)&v54[10] = v30;
        _os_log_impl(&dword_19D9BE000, v31, OS_LOG_TYPE_DEFAULT, "Socekt Pair BPS: avg %f instant %f", buf, 0x16u);
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
      self->_bytesReceived = 0;
      self->_lastDateCheck = v28;
    }
  }
  else
  {
    v34 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v34, OS_LOG_TYPE_DEFAULT, "Remote side closed the connection, cleaning up", buf, 2u);
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
    objc_msgSend_endSession(self, v35, v36, v37);
  }
}

- (void)start
{
  readQueue = self->_readQueue;
  if (readQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19DA31284;
    block[3] = &unk_1E5973BA8;
    block[4] = self;
    dispatch_async(readQueue, block);
  }
}

- (void)_sendToConnectedSocket
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  if (self->_connectedSocket < 0)
  {
    double v21 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v21, OS_LOG_TYPE_DEFAULT, "Connected socket closed, cannot send data, cleaning up...", buf, 2u);
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
    objc_msgSend_endSession(self, v22, v23, v24);
  }
  else if (objc_msgSend_count(self->_outgoingDataArray, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_firstObject(self->_outgoingDataArray, v5, v6, v7);
    int connectedSocket = self->_connectedSocket;
    id v10 = v8;
    uint64_t v14 = (const void *)objc_msgSend_bytes(v10, v11, v12, v13);
    size_t v18 = objc_msgSend_length(v10, v15, v16, v17);
    if (send(connectedSocket, v14, v18, 0) < 0)
    {
      if (*__error() == 35)
      {
        double v27 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v27, OS_LOG_TYPE_DEFAULT, "socket timeout, ignoring...", buf, 2u);
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
      else if (*__error() == 55)
      {
        socklen_t v84 = 4;
        unsigned int v85 = -1431655766;
        if (getsockopt(self->_connectedSocket, 0xFFFF, 4098, &v85, &v84) < 0)
        {
          double v28 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            int v29 = *__error();
            double v30 = __error();
            dispatch_queue_t v31 = strerror(*v30);
            *(_DWORD *)buf = 67109378;
            unsigned int v87 = v29;
            __int16 v88 = 2080;
            v89 = v31;
            _os_log_impl(&dword_19D9BE000, v28, OS_LOG_TYPE_DEFAULT, "error %d (%s) trying to get SO_RCVBUF size, cleaning up...", buf, 0x12u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              uint64_t v35 = *__error();
              uint64_t v36 = __error();
              uint64_t v81 = v35;
              v82 = strerror(*v36);
              MarcoLog();
            }
            if (IMShouldLog())
            {
              uint64_t v37 = *__error();
              v38 = __error();
              uint64_t v81 = v37;
              v82 = strerror(*v38);
              IMLogString();
            }
          }
          objc_msgSend_endSession(self, v32, v33, v34, v81, v82);
        }
        int v39 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v87 = v85;
          _os_log_impl(&dword_19D9BE000, v39, OS_LOG_TYPE_DEFAULT, "no buffer space available socket is full with %d bytes, waiting...", buf, 8u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (MarcoShouldLog())
          {
            uint64_t v81 = v85;
            MarcoLog();
          }
          if (IMShouldLog())
          {
            uint64_t v81 = v85;
            IMLogString();
          }
        }
        objc_msgSend_removeObjectAtIndex_(self->_outgoingDataArray, v40, 0, v41, v81);
      }
      else if (*__error() == 40)
      {
        v42 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          int v43 = *__error();
          double v44 = __error();
          uint64_t v45 = strerror(*v44);
          *(_DWORD *)buf = 67109634;
          unsigned int v87 = v43;
          __int16 v88 = 2080;
          v89 = v45;
          __int16 v90 = 2048;
          uint64_t v91 = objc_msgSend_length(v10, v46, v47, v48);
          _os_log_impl(&dword_19D9BE000, v42, OS_LOG_TYPE_DEFAULT, "send error %d (%s) trying to send data of size %lu, dropping packets to send...", buf, 0x1Cu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (MarcoShouldLog())
          {
            uint64_t v51 = *__error();
            id v52 = __error();
            v82 = strerror(*v52);
            uint64_t v83 = objc_msgSend_length(v10, v53, v54, v55);
            uint64_t v81 = v51;
            MarcoLog();
          }
          if (IMShouldLog())
          {
            uint64_t v56 = *__error();
            v57 = __error();
            v82 = strerror(*v57);
            uint64_t v83 = objc_msgSend_length(v10, v58, v59, v60);
            uint64_t v81 = v56;
            IMLogString();
          }
        }
        objc_msgSend_removeObjectAtIndex_(self->_outgoingDataArray, v49, 0, v50, v81, v82, v83);
      }
      else
      {
        v61 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          int v62 = *__error();
          v63 = __error();
          v64 = strerror(*v63);
          *(_DWORD *)buf = 67109634;
          unsigned int v87 = v62;
          __int16 v88 = 2080;
          v89 = v64;
          __int16 v90 = 2048;
          uint64_t v91 = objc_msgSend_length(v10, v65, v66, v67);
          _os_log_impl(&dword_19D9BE000, v61, OS_LOG_TYPE_DEFAULT, "send error %d (%s) trying to send data of size %lu, cleaning up...", buf, 0x1Cu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (MarcoShouldLog())
          {
            uint64_t v71 = *__error();
            v72 = __error();
            v82 = strerror(*v72);
            uint64_t v83 = objc_msgSend_length(v10, v73, v74, v75);
            uint64_t v81 = v71;
            MarcoLog();
          }
          if (IMShouldLog())
          {
            uint64_t v76 = *__error();
            v77 = __error();
            v82 = strerror(*v77);
            uint64_t v83 = objc_msgSend_length(v10, v78, v79, v80);
            uint64_t v81 = v76;
            IMLogString();
          }
        }
        objc_msgSend_endSession(self, v68, v69, v70, v81, v82, v83);
      }
    }
    else
    {
      objc_msgSend_removeObjectAtIndex_(self->_outgoingDataArray, v19, 0, v20);
    }
  }
  else
  {
    uint64_t v25 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v25, OS_LOG_TYPE_DEFAULT, "No data to send on socket, suspending write source", buf, 2u);
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
    writeSource = self->_writeSource;
    if (writeSource)
    {
      self->_writeSourceIsResumed = 0;
      dispatch_suspend(writeSource);
    }
  }
}

- (void)_setupWriteSource
{
  readQueue = self->_readQueue;
  if (readQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19DA31CBC;
    block[3] = &unk_1E5973BA8;
    block[4] = self;
    dispatch_async(readQueue, block);
  }
}

- (BOOL)sendData:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  BOOL v6 = 1;
  if (v4)
  {
    uint64_t v12 = 0;
    double v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 1;
    readQueue = self->_readQueue;
    if (readQueue)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_19DA31F64;
      block[3] = &unk_1E5973ED0;
      block[4] = self;
      id v10 = v4;
      uint64_t v11 = &v12;
      dispatch_sync(readQueue, block);

      BOOL v6 = *((unsigned char *)v13 + 24) != 0;
    }
    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

- (int)socket
{
  return self->_connectedSocket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeSource, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_outgoingDataArray, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end