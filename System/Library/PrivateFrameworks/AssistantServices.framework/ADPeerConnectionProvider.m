@interface ADPeerConnectionProvider
+ (void)getMetricsContext:(id)a3;
- (BOOL)isMultipath;
- (BOOL)isPeerConnectionError:(id)a3;
- (BOOL)isPeerNotNearbyError:(id)a3;
- (BOOL)shouldFallbackFromError:(id)a3;
- (BOOL)shouldFallbackQuickly;
- (BOOL)supportsInitialPayload;
- (id)_peerConnection;
- (id)analysisInfo;
- (id)connectionType;
- (id)headerDataWithForceReconnect:(BOOL)a3;
- (id)initListenerWithQueue:(id)a3;
- (void)_getNWConnectionWithInitialData:(id)a3 completion:(id)a4;
- (void)close;
- (void)peerStreamConnection:(id)a3 failedWithError:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPeerStreamConnection:(id)a3;
- (void)updateConnectionMetrics:(id)a3 completion:(id)a4;
@end

@implementation ADPeerConnectionProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)peerStreamConnection:(id)a3 failedWithError:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained connectionProvider:self receivedError:v6];
}

- (void)updateConnectionMetrics:(id)a3 completion:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001227F0;
  v10[3] = &unk_10050E1D8;
  id v11 = a3;
  v12 = self;
  id v13 = a4;
  v9.receiver = self;
  v9.super_class = (Class)ADPeerConnectionProvider;
  id v6 = v13;
  id v7 = v11;
  [(ADPeerConnectionProvider *)&v9 updateConnectionMetrics:v7 completion:v10];
  v8 = [(ADPeerConnectionProvider *)self _peerConnection];
  [v8 getLocalMetrics:&stru_100502BE8];
}

- (id)analysisInfo
{
  return 0;
}

- (id)connectionType
{
  id v2 = [objc_alloc((Class)SiriCoreConnectionType) initWithTechnology:3002];
  return v2;
}

- (void)close
{
  v3.receiver = self;
  v3.super_class = (Class)ADPeerConnectionProvider;
  [(ADPeerConnectionProvider *)&v3 close];
  [(ADPeerStreamConnection *)self->_peerConnection close];
}

- (void)_getNWConnectionWithInitialData:(id)a3 completion:(id)a4
{
  id v5 = a4;
  kdebug_trace();
  id v6 = [(ADPeerConnectionProvider *)self _peerConnection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100122BA0;
  v8[3] = &unk_100502B80;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 getSocket:v8];
}

- (BOOL)shouldFallbackFromError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  if ([v4 isEqualToString:@"ADPeerStreamConnectionErrorDomain"]
    && ![v3 code])
  {
    if (qword_100585E40 != -1) {
      dispatch_once(&qword_100585E40, &stru_1005069F0);
    }
    BOOL v5 = byte_100585E39 != 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)isMultipath
{
  return 0;
}

- (BOOL)isPeerNotNearbyError:(id)a3
{
  return _objc_msgSend(a3, "ad_isPeerNotNearbyError");
}

- (BOOL)isPeerConnectionError:(id)a3
{
  return _objc_msgSend(a3, "ad_isPeerConnectionError");
}

- (BOOL)supportsInitialPayload
{
  return 0;
}

- (BOOL)shouldFallbackQuickly
{
  return 1;
}

- (id)headerDataWithForceReconnect:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    v14 = "-[ADPeerConnectionProvider headerDataWithForceReconnect:]";
    __int16 v15 = 1024;
    BOOL v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s forceReconnect %d", (uint8_t *)&v13, 0x12u);
  }
  id v6 = [(ADPeerConnectionProvider *)self _url];
  id v7 = [v6 absoluteString];
  v8 = (const char *)[v7 UTF8String];

  if (v8)
  {
    size_t v9 = strlen(v8);
    v10 = malloc_type_malloc(v9 + 6, 0xB3FF087AuLL);
    _WORD *v10 = 17233;
    v10[1] = v3;
    v10[2] = bswap32(v9) >> 16;
    memmove(v10 + 3, v8, v9);
    dispatch_data_t v11 = dispatch_data_create(v10, v9 + 6, 0, _dispatch_data_destructor_free);
  }
  else
  {
    dispatch_data_t v11 = 0;
  }

  return v11;
}

- (void)setDelegate:(id)a3
{
}

- (id)_peerConnection
{
  peerConnection = self->_peerConnection;
  if (!peerConnection)
  {
    v4 = [[ADPeerStreamConnection alloc] initWithServiceIdentifier:@"com.apple.private.alloy.siri.proxy" delegate:self listener:self->_isListener];
    BOOL v5 = self->_peerConnection;
    self->_peerConnection = v4;

    peerConnection = self->_peerConnection;
  }
  return peerConnection;
}

- (void)setPeerStreamConnection:(id)a3
{
}

- (id)initListenerWithQueue:(id)a3
{
  id result = [(ADPeerConnectionProvider *)self initWithQueue:a3];
  if (result) {
    *((unsigned char *)result + 24) = 1;
  }
  return result;
}

+ (void)getMetricsContext:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if (AFIsNano())
  {
    BOOL v3 = +[ADSharedPeerStreamConnection sharedPeerStreamConnectionWithServiceIdentifier:@"com.apple.private.alloy.siri.proxy" listener:0];
    [v3 getMetricsContext:v4];
  }
  else
  {
    v4[2](v4, 0);
  }
}

@end