@interface MFXPCEndpointInfo
+ (MFXPCEndpointInfo)endpointInfoWithExportedInterface:(id)a3 remoteObjectInterface:(id)a4 shouldAcceptClient:(id)a5 exportedObjectForClient:(id)a6;
- (MFXPCEndpointInfo)init;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteObjectInterface;
- (id)existingListener:(BOOL)a3;
- (id)exportedObjectForClient;
- (id)listener;
- (id)shouldAcceptClient;
@end

@implementation MFXPCEndpointInfo

+ (MFXPCEndpointInfo)endpointInfoWithExportedInterface:(id)a3 remoteObjectInterface:(id)a4 shouldAcceptClient:(id)a5 exportedObjectForClient:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (Block_layout *)a5;
  id v13 = a6;
  v14 = objc_alloc_init((Class)a1);
  v15 = v14;
  if (!v12) {
    v12 = &stru_10013DCE8;
  }
  v16 = (void *)v14[3];
  v14[3] = v10;
  id v17 = v10;

  v18 = (void *)v15[4];
  v15[4] = v11;
  id v19 = v11;

  v20 = objc_retainBlock(v12);
  v21 = (void *)v15[5];
  v15[5] = v20;

  id v22 = objc_retainBlock(v13);
  v23 = (void *)v15[6];
  v15[6] = v22;

  return (MFXPCEndpointInfo *)v15;
}

- (MFXPCEndpointInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFXPCEndpointInfo;
  v2 = [(MFXPCEndpointInfo *)&v7 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = v2;
  }

  return v2;
}

- (id)listener
{
  return [(MFXPCEndpointInfo *)self existingListener:1];
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (NSXPCInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (id)shouldAcceptClient
{
  return self->_shouldAcceptClient;
}

- (id)exportedObjectForClient
{
  return self->_exportedObjectForClient;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_exportedObjectForClient, 0);
  objc_storeStrong(&self->_shouldAcceptClient, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (id)existingListener:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSLock *)self->_lock lock];
  listener = self->_listener;
  if (listener) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v3;
  }
  if (!v6)
  {
    objc_super v7 = [[MFXPCEndpointListener alloc] initWithEndpointInfo:self];
    v8 = self->_listener;
    self->_listener = v7;

    listener = self->_listener;
  }
  v9 = listener;
  [(NSLock *)self->_lock unlock];

  return v9;
}

@end