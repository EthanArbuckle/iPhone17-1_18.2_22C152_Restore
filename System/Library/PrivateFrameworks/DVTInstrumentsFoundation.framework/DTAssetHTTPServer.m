@interface DTAssetHTTPServer
- (BOOL)startListeningWithError:(id *)a3;
- (DTXChannel)channel;
- (NSSet)allowedResources;
- (OS_dispatch_queue)socketDelegateQueue;
- (_DT_GCDAsyncSocket)socket;
- (unint64_t)port;
- (void)setAllowedResources:(id)a3;
- (void)setChannel:(id)a3;
- (void)setSocket:(id)a3;
- (void)setSocketDelegateQueue:(id)a3;
- (void)socket:(id)a3 didAcceptNewSocket:(id)a4;
- (void)stopListening;
@end

@implementation DTAssetHTTPServer

- (BOOL)startListeningWithError:(id *)a3
{
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.dt.DTAssetHTTPServer", MEMORY[0x263EF83A8]);
  [(DTAssetHTTPServer *)self setSocketDelegateQueue:v5];

  v6 = [_DT_GCDAsyncSocket alloc];
  v7 = [(DTAssetHTTPServer *)self socketDelegateQueue];
  v8 = [(_DT_GCDAsyncSocket *)v6 initWithDelegate:self delegateQueue:v7];
  [(DTAssetHTTPServer *)self setSocket:v8];

  v9 = [(DTAssetHTTPServer *)self socket];
  LOBYTE(a3) = [v9 acceptOnInterface:@"localhost" port:0 error:a3];

  return (char)a3;
}

- (void)stopListening
{
  id v2 = [(DTAssetHTTPServer *)self socket];
  [v2 disconnect];
}

- (void)socket:(id)a3 didAcceptNewSocket:(id)a4
{
  id v5 = a4;
  v6 = [DTAssetHTTPRequestHandler alloc];
  v7 = [(DTAssetHTTPServer *)self channel];
  v9 = [(DTAssetHTTPRequestHandler *)v6 initWithSocket:v5 channel:v7];

  v8 = [(DTAssetHTTPServer *)self allowedResources];
  [(DTAssetHTTPRequestHandler *)v9 setAllowedResources:v8];

  [(DTAssetHTTPRequestHandler *)v9 startReading];
}

- (unint64_t)port
{
  id v2 = [(DTAssetHTTPServer *)self socket];
  unint64_t v3 = [v2 localPort];

  return v3;
}

- (DTXChannel)channel
{
  return (DTXChannel *)objc_getProperty(self, a2, 8, 1);
}

- (void)setChannel:(id)a3
{
}

- (NSSet)allowedResources
{
  return self->_allowedResources;
}

- (void)setAllowedResources:(id)a3
{
}

- (_DT_GCDAsyncSocket)socket
{
  return (_DT_GCDAsyncSocket *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSocket:(id)a3
{
}

- (OS_dispatch_queue)socketDelegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSocketDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socketDelegateQueue, 0);
  objc_storeStrong((id *)&self->_socket, 0);
  objc_storeStrong((id *)&self->_allowedResources, 0);
  objc_storeStrong((id *)&self->_channel, 0);
}

@end