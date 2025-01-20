@interface _NSCFSocksProxy
+ (id)proxyServers;
+ (void)handleIncomingConnection:(id)a3 queue:(id)a4 configuration:(id)a5;
- (uint64_t)handshakeRead;
- (uint64_t)readInbound;
- (uint64_t)readOutbound;
- (void)cleanup;
- (void)connected:(int)a3;
- (void)dealloc;
- (void)outboundConnectionCompleteWithError:(int)a3;
- (void)outboundConnectionReceivedData:(id)a3 handler:(id)a4;
@end

@implementation _NSCFSocksProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_outbound, 0);
  objc_storeStrong((id *)&self->_inbound, 0);
  objc_storeStrong((id *)&self->_socksHandshake, 0);
  objc_storeStrong((id *)&self->_outHost, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)outboundConnectionCompleteWithError:(int)a3
{
  socksHandshake = self->_socksHandshake;
  if (socksHandshake && socksHandshake->_finished) {
    [(_NSCFSocksProxy *)self cleanup];
  }
  else {
    [(_NSCFSocksProxy *)self connected:1];
  }
}

- (void)outboundConnectionReceivedData:(id)a3 handler:(id)a4
{
  id v6 = a4;
  inbound = self->_inbound;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58___NSCFSocksProxy_outboundConnectionReceivedData_handler___block_invoke;
  v9[3] = &unk_1E5256258;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(NSProxyConnection *)inbound write:a3 handler:v9];
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  v3 = (id)CFNLog::logger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = +[_NSCFSocksProxy proxyServers]();
    *(_DWORD *)buf = 134217984;
    uint64_t v7 = [v4 count];
    _os_log_impl(&dword_184085000, v3, OS_LOG_TYPE_DEFAULT, "Finished ProxyConnection %lu connection(s) left", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)_NSCFSocksProxy;
  [(_NSCFSocksProxy *)&v5 dealloc];
}

+ (id)proxyServers
{
  self;
  v0 = (void *)_proxyServers;
  if (!_proxyServers)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v2 = (void *)_proxyServers;
    _proxyServers = (uint64_t)v1;

    v0 = (void *)_proxyServers;
  }

  return v0;
}

- (void)cleanup
{
  [(NSProxyConnection *)self->_outbound cancel];
  inbound = self->_inbound;
  if (inbound && inbound->_pendingWrites)
  {
    inbound->_doCleanupWhenWritesCompleted = 1;
  }
  else
  {
    [(NSProxyConnection *)inbound cancel];
    v4 = self->_inbound;
    self->_inbound = 0;
  }
  outbound = self->_outbound;
  self->_outbound = 0;

  id v6 = (void *)_proxyServers;

  [v6 removeObject:self];
}

- (void)connected:(int)a3
{
  inbound = self->_inbound;
  id v6 = -[__CFN_SocksHandshake finish:](self->_socksHandshake, "finish:");
  [(NSProxyConnection *)inbound write:v6 handler:&__block_literal_global_8_7423];

  if (a3)
  {
    [(_NSCFSocksProxy *)self cleanup];
  }
  else
  {
    -[_NSCFSocksProxy readInbound]((uint64_t)self);
    -[_NSCFSocksProxy readOutbound]((uint64_t)self);
  }
}

- (uint64_t)readInbound
{
  if (result)
  {
    id v1 = *(void **)(result + 40);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __30___NSCFSocksProxy_readInbound__block_invoke;
    v2[3] = &unk_1E5254CE0;
    v2[4] = result;
    return [v1 read:0x40000 handler:v2];
  }
  return result;
}

- (uint64_t)readOutbound
{
  if (result)
  {
    id v1 = *(void **)(result + 48);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __31___NSCFSocksProxy_readOutbound__block_invoke;
    v2[3] = &unk_1E5254CE0;
    v2[4] = result;
    return [v1 read:0x40000 handler:v2];
  }
  return result;
}

+ (void)handleIncomingConnection:(id)a3 queue:(id)a4 configuration:(id)a5
{
  id newValue = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [_NSCFSocksProxy alloc];
  id v10 = [NSProxyConnection alloc];
  id v11 = v8;
  if (v10)
  {
    v20.receiver = v10;
    v20.super_class = (Class)NSProxyConnection;
    v12 = objc_msgSendSuper2(&v20, sel_init);
    id v10 = (NSProxyConnection *)v12;
    if (v12)
    {
      objc_storeStrong(v12 + 2, a3);
      tcp_connection_set_event_handler();
      tcp_connection_start();
    }
  }

  v13 = v10;
  id v14 = v7;
  if (v9)
  {
    v20.receiver = v9;
    v20.super_class = (Class)_NSCFSocksProxy;
    v15 = objc_msgSendSuper2(&v20, sel_init);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong(v15 + 5, v10);
      objc_storeStrong(v16 + 1, a4);
    }
  }
  else
  {
    v16 = 0;
  }

  if (v16) {
    objc_setProperty_atomic(v16, v17, newValue, 56);
  }
  v18 = +[_NSCFSocksProxy proxyServers]();
  [v18 addObject:v16];

  -[_NSCFSocksProxy handshakeRead]((uint64_t)v16);
}

- (uint64_t)handshakeRead
{
  if (result)
  {
    id v1 = *(void **)(result + 40);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __32___NSCFSocksProxy_handshakeRead__block_invoke;
    v2[3] = &unk_1E5254CE0;
    v2[4] = result;
    return [v1 read:1024 handler:v2];
  }
  return result;
}

@end