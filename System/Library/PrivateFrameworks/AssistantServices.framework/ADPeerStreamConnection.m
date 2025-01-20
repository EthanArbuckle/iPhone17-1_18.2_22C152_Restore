@interface ADPeerStreamConnection
- (ADPeerStreamConnection)initWithServiceIdentifier:(id)a3 delegate:(id)a4 listener:(BOOL)a5;
- (BOOL)hasNearbyPeer;
- (BOOL)peerSupportsExtendedHeader;
- (void)close;
- (void)getAWDMetrics:(id)a3 completion:(id)a4;
- (void)getLocalMetrics:(id)a3;
- (void)getRemoteMetrics:(id)a3;
- (void)getSocket:(id)a3;
@end

@implementation ADPeerStreamConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendedDeviceConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sharedConnection, 0);
}

- (BOOL)hasNearbyPeer
{
  return [(ADSharedPeerStreamConnection *)self->_sharedConnection hasNearbyPeer];
}

- (void)close
{
  [(IDSDeviceConnection *)self->_vendedDeviceConnection close];
  sharedConnection = self->_sharedConnection;
  [(ADSharedPeerStreamConnection *)sharedConnection closeForConnection:self];
}

- (BOOL)peerSupportsExtendedHeader
{
  return [(ADSharedPeerStreamConnection *)self->_sharedConnection peerSupportsExtendedHeader];
}

- (void)getAWDMetrics:(id)a3 completion:(id)a4
{
}

- (void)getRemoteMetrics:(id)a3
{
}

- (void)getLocalMetrics:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v5 = AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      v10 = "-[ADPeerStreamConnection getLocalMetrics:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
    }
    vendedDeviceConnection = self->_vendedDeviceConnection;
    if (vendedDeviceConnection)
    {
      v7 = [(IDSDeviceConnection *)vendedDeviceConnection metrics];
      v4[2](v4, v7);
    }
    else
    {
      v8 = AFSiriLogContextIDS;
      if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
      {
        int v9 = 136315138;
        v10 = "-[ADPeerStreamConnection getLocalMetrics:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s No current IDS device connection", (uint8_t *)&v9, 0xCu);
      }
      v4[2](v4, 0);
    }
  }
}

- (void)getSocket:(id)a3
{
  id v4 = a3;
  vendedDeviceConnection = self->_vendedDeviceConnection;
  self->_vendedDeviceConnection = 0;

  sharedConnection = self->_sharedConnection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007807C;
  v8[3] = &unk_1004FFC00;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(ADSharedPeerStreamConnection *)sharedConnection getSocketForConnection:self completion:v8];
}

- (ADPeerStreamConnection)initWithServiceIdentifier:(id)a3 delegate:(id)a4 listener:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ADPeerStreamConnection;
  v10 = [(ADPeerStreamConnection *)&v17 init];
  if (v10)
  {
    uint64_t v11 = +[ADSharedPeerStreamConnection sharedPeerStreamConnectionWithServiceIdentifier:v8 listener:v5];
    sharedConnection = v10->_sharedConnection;
    v10->_sharedConnection = (ADSharedPeerStreamConnection *)v11;

    id v13 = objc_storeWeak((id *)&v10->_delegate, v9);
    if (v9)
    {
      v14 = v10->_sharedConnection;
      id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
      [(ADSharedPeerStreamConnection *)v14 addDelegate:WeakRetained];
    }
  }

  return v10;
}

@end