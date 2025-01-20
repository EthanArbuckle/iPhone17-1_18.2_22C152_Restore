@interface CTCSXPCConnection
- (BOOL)enableRemoteObjectProxy;
- (CTCSXPCConnection)initWithXpcConnection:(id)a3 uuid:(id)a4;
- (NSString)keychainAccessGroup;
- (NSUUID)uuid;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)threadSafeQueue;
- (THThreadNetworkCredentialsStoreLocalClient)keyChainStore;
- (unsigned)numberOfBlocksQueued;
- (void)dealloc;
- (void)setEnableRemoteObjectProxy:(BOOL)a3;
- (void)setKeyChainStore:(id)a3;
- (void)setKeychainAccessGroup:(id)a3;
- (void)setNumberOfBlocksQueued:(unsigned __int16)a3;
- (void)setThreadSafeQueue:(id)a3;
@end

@implementation CTCSXPCConnection

- (CTCSXPCConnection)initWithXpcConnection:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CTCSXPCConnection;
  v8 = [(CTCSXPCConnection *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_xpcConnection, v6);
    objc_storeStrong((id *)&v9->_uuid, a4);
    dispatch_queue_t v10 = dispatch_queue_create("CTCSXPCConnection Thread Safe Property Queue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    threadSafeQueue = v9->_threadSafeQueue;
    v9->_threadSafeQueue = (OS_dispatch_queue *)v10;

    v9->_enableRemoteObjectProxy = 1;
  }

  return v9;
}

- (unsigned)numberOfBlocksQueued
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  __int16 v9 = 0;
  threadSafeQueue = self->_threadSafeQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000142FC;
  v5[3] = &unk_100074C58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(threadSafeQueue, v5);
  unsigned __int16 v3 = *((_WORD *)v7 + 12);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setNumberOfBlocksQueued:(unsigned __int16)a3
{
  threadSafeQueue = self->_threadSafeQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100014388;
  v4[3] = &unk_100074C80;
  v4[4] = self;
  unsigned __int16 v5 = a3;
  dispatch_barrier_async(threadSafeQueue, v4);
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_xpcConnection, 0);
  v3.receiver = self;
  v3.super_class = (Class)CTCSXPCConnection;
  [(CTCSXPCConnection *)&v3 dealloc];
}

- (NSXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)enableRemoteObjectProxy
{
  return self->_enableRemoteObjectProxy;
}

- (void)setEnableRemoteObjectProxy:(BOOL)a3
{
  self->_enableRemoteObjectProxy = a3;
}

- (NSString)keychainAccessGroup
{
  return self->_keychainAccessGroup;
}

- (void)setKeychainAccessGroup:(id)a3
{
}

- (THThreadNetworkCredentialsStoreLocalClient)keyChainStore
{
  return (THThreadNetworkCredentialsStoreLocalClient *)objc_getProperty(self, a2, 40, 1);
}

- (void)setKeyChainStore:(id)a3
{
}

- (OS_dispatch_queue)threadSafeQueue
{
  return self->_threadSafeQueue;
}

- (void)setThreadSafeQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadSafeQueue, 0);
  objc_storeStrong((id *)&self->_keyChainStore, 0);
  objc_storeStrong((id *)&self->_keychainAccessGroup, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_destroyWeak((id *)&self->_xpcConnection);
}

@end