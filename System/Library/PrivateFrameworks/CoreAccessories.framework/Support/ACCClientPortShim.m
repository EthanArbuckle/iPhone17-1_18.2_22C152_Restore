@interface ACCClientPortShim
- (ACCClientPortShim)initWithUID:(id)a3 xpcConnection:(id)a4 delegate:(id)a5;
- (ACCClientPortShimDelegate)delegate;
- (NSString)portUID;
- (NSString)transportClientConnectionID;
- (NSString)transportClientEndpointID;
- (OS_xpc_object)xpcConnection;
- (id)description;
- (void)receiveData:(char *)a3 length:(unint64_t)a4;
- (void)sendData:(char *)a3 length:(unint64_t)a4;
- (void)sendData:(id)a3;
- (void)setTransportClientConnectionID:(id)a3;
- (void)setTransportClientEndpointID:(id)a3;
- (void)shutdown;
@end

@implementation ACCClientPortShim

- (ACCClientPortShim)initWithUID:(id)a3 xpcConnection:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)ACCClientPortShim;
  v12 = [(ACCClientPortShim *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_portUID, a3);
    objc_storeStrong((id *)&v13->_xpcConnection, a4);
    objc_storeStrong((id *)&v13->_delegate, a5);
    v14 = +[ACCTransportClient sharedClient];
    uint64_t v15 = [v14 createConnectionWithType:5 andIdentifier:v9];
    transportClientConnectionID = v13->_transportClientConnectionID;
    v13->_transportClientConnectionID = (NSString *)v15;

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __56__ACCClientPortShim_initWithUID_xpcConnection_delegate___block_invoke;
    v21[3] = &unk_100216668;
    v17 = v13;
    v22 = v17;
    uint64_t v18 = [v14 createEndpointWithTransportType:4 andProtocol:4 andIdentifier:v9 andDataOutHandler:v21 forConnectionWithUUID:v13->_transportClientConnectionID publishConnection:1];
    transportClientEndpointID = v17->_transportClientEndpointID;
    v17->_transportClientEndpointID = (NSString *)v18;
  }
  return v13;
}

id __56__ACCClientPortShim_initWithUID_xpcConnection_delegate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) sendData:a4];
}

- (void)shutdown
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 7;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    v5 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(ACCClientPortShim *)self description];
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ACCClientPortShims shutDown:  %@", (uint8_t *)&v10, 0xCu);
  }
  v7 = +[ACCTransportClient sharedClient];
  [v7 destroyEndpointWithUUID:self->_transportClientEndpointID];
  [v7 destroyConnectionWithUUID:self->_transportClientConnectionID];
  transportClientConnectionID = self->_transportClientConnectionID;
  self->_transportClientConnectionID = 0;

  transportClientEndpointID = self->_transportClientEndpointID;
  self->_transportClientEndpointID = 0;
}

- (id)description
{
  return +[NSString stringWithFormat:@"ACCClientPortShim<%@ connection=%@>", self->_portUID, self->_xpcConnection];
}

- (void)receiveData:(char *)a3 length:(unint64_t)a4
{
  id v8 = +[ACCTransportClient sharedClient];
  v7 = +[NSData dataWithBytes:a3 length:a4];
  [v8 processIncomingData:v7 forEndpointWithUUID:self->_transportClientEndpointID];
}

- (void)sendData:(char *)a3 length:(unint64_t)a4
{
  if (a3 && a4)
  {
    delegate = self->_delegate;
    -[ACCClientPortShimDelegate sendData:length:forConnection:portUID:](delegate, "sendData:length:forConnection:portUID:");
  }
  else
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 7;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v7 = &_os_log_default;
      id v6 = &_os_log_default;
    }
    else
    {
      v7 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ACCClientPortShim: ERROR: NULL transport data", v8, 2u);
    }
  }
}

- (void)sendData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 bytes];
    id v6 = [v4 length];

    [(ACCClientPortShim *)self sendData:v5 length:v6];
  }
}

- (NSString)portUID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (OS_xpc_object)xpcConnection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16, 1);
}

- (ACCClientPortShimDelegate)delegate
{
  return (ACCClientPortShimDelegate *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)transportClientConnectionID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTransportClientConnectionID:(id)a3
{
}

- (NSString)transportClientEndpointID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransportClientEndpointID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportClientEndpointID, 0);
  objc_storeStrong((id *)&self->_transportClientConnectionID, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_portUID, 0);
}

@end