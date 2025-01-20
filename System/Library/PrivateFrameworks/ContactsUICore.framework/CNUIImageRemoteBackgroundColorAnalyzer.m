@interface CNUIImageRemoteBackgroundColorAnalyzer
- (NSXPCConnection)serviceConnection;
- (void)_closeConnection;
- (void)_openConnectionIfNeeded;
- (void)dealloc;
- (void)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 reply:(id)a5;
- (void)setServiceConnection:(id)a3;
@end

@implementation CNUIImageRemoteBackgroundColorAnalyzer

- (void)dealloc
{
  [(CNUIImageRemoteBackgroundColorAnalyzer *)self _closeConnection];
  v3.receiver = self;
  v3.super_class = (Class)CNUIImageRemoteBackgroundColorAnalyzer;
  [(CNUIImageRemoteBackgroundColorAnalyzer *)&v3 dealloc];
}

- (void)_openConnectionIfNeeded
{
  if (!self->_serviceConnection)
  {
    objc_super v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.ContactsBackgroundColorService"];
    serviceConnection = self->_serviceConnection;
    self->_serviceConnection = v3;

    v5 = contactsBackgroundColorServiceInterface();
    [(NSXPCConnection *)self->_serviceConnection setRemoteObjectInterface:v5];

    v6 = self->_serviceConnection;
    [(NSXPCConnection *)v6 resume];
  }
}

- (void)_closeConnection
{
  [(NSXPCConnection *)self->_serviceConnection invalidate];
  serviceConnection = self->_serviceConnection;
  self->_serviceConnection = 0;
}

- (void)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(CNUIImageRemoteBackgroundColorAnalyzer *)self _openConnectionIfNeeded];
  if (v8)
  {
    v11 = [(CNUIImageRemoteBackgroundColorAnalyzer *)self serviceConnection];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __91__CNUIImageRemoteBackgroundColorAnalyzer_getBackgroundColorOnImageData_bitmapFormat_reply___block_invoke;
    v16[3] = &unk_264019418;
    id v12 = v10;
    id v17 = v12;
    v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v16];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __91__CNUIImageRemoteBackgroundColorAnalyzer_getBackgroundColorOnImageData_bitmapFormat_reply___block_invoke_2;
    v14[3] = &unk_264019440;
    id v15 = v12;
    [v13 getBackgroundColorOnImageData:v8 bitmapFormat:v9 withReply:v14];
  }
}

uint64_t __91__CNUIImageRemoteBackgroundColorAnalyzer_getBackgroundColorOnImageData_bitmapFormat_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __91__CNUIImageRemoteBackgroundColorAnalyzer_getBackgroundColorOnImageData_bitmapFormat_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSXPCConnection)serviceConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setServiceConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end