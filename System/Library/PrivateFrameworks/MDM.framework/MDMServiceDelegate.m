@interface MDMServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MDMServerCore)server;
- (MDMServiceDelegate)initWithServer:(id)a3;
- (void)setServer:(id)a3;
@end

@implementation MDMServiceDelegate

- (MDMServiceDelegate)initWithServer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MDMServiceDelegate;
  v6 = [(MDMServiceDelegate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_server, a3);
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [(MDMServiceDelegate *)self server];
  uint64_t v7 = [v6 channelType];

  if (v7 == 1)
  {
    v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E560310];
    MDMUserXPCProtocolInitialize();
  }
  else if (v7)
  {
    v8 = 0;
  }
  else
  {
    v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E5601E8];
    MDMXPCProtocolInitialize();
  }
  [v5 setExportedInterface:v8];
  objc_super v9 = [MDMServicerCore alloc];
  v10 = [(MDMServiceDelegate *)self server];
  v11 = [(MDMServicerCore *)v9 initWithXPCConnection:v5 server:v10];
  [v5 setExportedObject:v11];

  [v5 resume];
  v12 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_230A49000, v12, OS_LOG_TYPE_DEFAULT, "Accepted new connection.", v14, 2u);
  }

  return 1;
}

- (MDMServerCore)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end