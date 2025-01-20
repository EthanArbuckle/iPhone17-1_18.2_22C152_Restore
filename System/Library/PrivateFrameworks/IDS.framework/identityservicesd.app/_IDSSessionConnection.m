@interface _IDSSessionConnection
- (BOOL)getAudioEnabled;
- (BOOL)muted;
- (BOOL)startConnectionAsInitiator:(BOOL)a3 peerProtocolVersion:(unsigned int)a4 errorHandler:(id)a5;
- (BOOL)stopConnection:(id *)a3;
- (_IDSSessionConnection)initWithQueue:(id)a3;
- (_IDSSessionConnectionDelegate)delegate;
- (id)connectionInfoForCallID:(int64_t)a3;
- (id)connectionInfoWithState:(int64_t)a3;
- (int64_t)bestCallID;
- (int64_t)callID;
- (int64_t)connectionType;
- (int64_t)localCell;
- (int64_t)remoteCell;
- (unsigned)natType;
- (void)conference:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5;
- (void)conference:(id)a3 didStartSession:(BOOL)a4 withUserInfo:(id)a5;
- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5;
- (void)createConnectionData:(BOOL)a3 handler:(id)a4;
- (void)dealloc;
- (void)receivedRemoteConnectionData:(id)a3;
- (void)sendData:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _IDSSessionConnection

- (_IDSSessionConnection)initWithQueue:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_IDSSessionConnection;
  id v5 = [(_IDSSessionConnection *)&v13 init];
  if (v5)
  {
    if (qword_100A4C6D8 == -1)
    {
      if (v4)
      {
LABEL_4:
        id v6 = v4;
        v7 = *((void *)v5 + 3);
        *((void *)v5 + 3) = v6;
LABEL_7:

        id v10 = objc_alloc_init((Class)qword_100A4C6D0);
        v11 = (void *)*((void *)v5 + 1);
        *((void *)v5 + 1) = v10;

        [*((id *)v5 + 1) setDelegate:v5];
        *((_WORD *)v5 + 36) = 0;
        goto LABEL_8;
      }
    }
    else
    {
      dispatch_once(&qword_100A4C6D8, &stru_100988310);
      if (v4) {
        goto LABEL_4;
      }
    }
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.ids.connection.queue", v7);
    v9 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v8;

    goto LABEL_7;
  }
LABEL_8:

  return (_IDSSessionConnection *)v5;
}

- (void)dealloc
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_connectionInfos;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v7 setState:4];
        -[AVConference stopCallID:](self->_connection, "stopCallID:", [v7 callID]);
      }
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v4);
  }

  dispatch_queue_t v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cleaning up: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v10 = self;
    _IDSLogV();
  }
  -[AVConference setDelegate:](self->_connection, "setDelegate:", 0, v10);
  connectionQueue = self->_connectionQueue;
  self->_connectionQueue = 0;

  v11.receiver = self;
  v11.super_class = (Class)_IDSSessionConnection;
  [(_IDSSessionConnection *)&v11 dealloc];
}

- (id)connectionInfoWithState:(int64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_connectionInfos;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "state", (void)v12) == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)connectionInfoForCallID:(int64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_connectionInfos;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "callID", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (int64_t)bestCallID
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = self->_connectionInfos;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v3)
  {
    unsigned int v15 = 0;
    goto LABEL_22;
  }
  id v4 = v3;
  id v5 = 0;
  id v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v18;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v2);
      }
      id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      if ((objc_msgSend(v10, "isFinished", (void)v17) & 1) == 0)
      {
        objc_super v11 = v10;

        uint64_t v7 = v11;
      }
      if (([v10 isFinished] & 1) == 0
        && ([v10 isBeingHandedOff] & 1) == 0)
      {
        long long v12 = v10;

        id v5 = v12;
      }
      if ((uint64_t)[v10 state] <= 2)
      {
        long long v13 = v10;

        id v6 = v13;
      }
      unsigned int v14 = [v10 callID];
    }
    unsigned int v15 = v14;
    id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v4);

  if (v5)
  {
    unsigned int v15 = [(NSMutableArray *)v5 callID];

    v2 = v5;
LABEL_22:

    return v15;
  }
  if (v6)
  {
    unsigned int v15 = [(NSMutableArray *)v6 callID];

    v2 = v6;
    goto LABEL_22;
  }
  if (v7)
  {
    unsigned int v15 = [(NSMutableArray *)v7 callID];
    v2 = v7;
    goto LABEL_22;
  }
  return v15;
}

- (void)receivedRemoteConnectionData:(id)a3
{
  id v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002E0A88;
  v7[3] = &unk_10097E440;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);
}

- (void)createConnectionData:(BOOL)a3 handler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_retainBlock(v6);
    connectionQueue = self->_connectionQueue;
    *(_DWORD *)buf = 67109632;
    BOOL v19 = v4;
    __int16 v20 = 2048;
    id v21 = v8;
    __int16 v22 = 2048;
    v23 = connectionQueue;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "createConnectionData: requiresWifi = %d, dataReadyHandler = %p, _connectionQueue = %p", buf, 0x1Cu);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v13 = objc_retainBlock(v6);
    _IDSLogV();
  }
  if (v6)
  {
    id v10 = [v6 copy];
    objc_super v11 = self->_connectionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002E1008;
    block[3] = &unk_1009882C8;
    BOOL v17 = v4;
    block[4] = self;
    id v15 = v6;
    id v16 = v10;
    id v12 = v10;
    dispatch_async(v11, block);
  }
}

- (BOOL)startConnectionAsInitiator:(BOOL)a3 peerProtocolVersion:(unsigned int)a4 errorHandler:(id)a5
{
  id v8 = a5;
  connectionQueue = self->_connectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E1FA0;
  block[3] = &unk_1009882F0;
  unsigned int v14 = a4;
  BOOL v15 = a3;
  block[4] = self;
  id v13 = v8;
  id v10 = v8;
  dispatch_async(connectionQueue, block);

  return 1;
}

- (BOOL)stopConnection:(id *)a3
{
  connectionQueue = self->_connectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E2334;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(connectionQueue, block);
  return 1;
}

- (void)sendData:(id)a3
{
  id v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002E24EC;
  v7[3] = &unk_10097E440;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);
}

- (BOOL)getAudioEnabled
{
  return 0;
}

- (BOOL)muted
{
  return 0;
}

- (unsigned)natType
{
  return [(AVConference *)self->_connection natType];
}

- (int64_t)callID
{
  return self->_callID;
}

- (int64_t)connectionType
{
  return self->_connType;
}

- (int64_t)localCell
{
  return self->_localCell;
}

- (int64_t)remoteCell
{
  return self->_remoteCell;
}

- (_IDSSessionConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_IDSSessionConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connectionInfos, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)conference:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5
{
  id v6 = a4;
  connectionQueue = self->_connectionQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002E27FC;
  v9[3] = &unk_10097E440;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(connectionQueue, v9);
}

- (void)conference:(id)a3 didStartSession:(BOOL)a4 withUserInfo:(id)a5
{
  id v7 = a5;
  connectionQueue = self->_connectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E29CC;
  block[3] = &unk_1009802F0;
  id v11 = v7;
  id v12 = self;
  BOOL v13 = a4;
  id v9 = v7;
  dispatch_async(connectionQueue, block);
}

- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5
{
  id v7 = a5;
  connectionQueue = self->_connectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E2F84;
  block[3] = &unk_1009875C8;
  id v11 = v7;
  int64_t v12 = a4;
  void block[4] = self;
  id v9 = v7;
  dispatch_async(connectionQueue, block);
}

@end