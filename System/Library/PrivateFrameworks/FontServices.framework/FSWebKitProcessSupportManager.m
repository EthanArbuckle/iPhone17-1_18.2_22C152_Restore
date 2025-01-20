@interface FSWebKitProcessSupportManager
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FSWebKitProcessSupportManager)initWithXPCEndpoint:(id)a3;
- (NSXPCConnection)hostConnection;
- (NSXPCListener)serverListener;
- (void)checkin;
- (void)ping2:(id)a3;
- (void)ping:(id)a3;
- (void)setHostConnection:(id)a3;
- (void)setServerListener:(id)a3;
- (void)userInstalledFontsInfo:(id)a3 reply:(id)a4;
@end

@implementation FSWebKitProcessSupportManager

- (FSWebKitProcessSupportManager)initWithXPCEndpoint:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FSWebKitProcessSupportManager;
  v5 = [(FSWebKitProcessSupportManager *)&v17 init];
  if (v5)
  {
    v6 = objc_opt_new();
    [v6 _setEndpoint:v4];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v6];
    hostConnection = v5->_hostConnection;
    v5->_hostConnection = (NSXPCConnection *)v7;

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__FSWebKitProcessSupportManager_initWithXPCEndpoint___block_invoke;
    v15[3] = &unk_1E60B9B08;
    v9 = v5;
    v16 = v9;
    [(NSXPCConnection *)v5->_hostConnection setInvalidationHandler:v15];
    v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0DA4190];
    [(NSXPCConnection *)v5->_hostConnection setRemoteObjectInterface:v10];
    v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0DA3098];
    [(NSXPCConnection *)v5->_hostConnection setExportedInterface:v11];
    [(NSXPCConnection *)v5->_hostConnection setExportedObject:v9];
    [(NSXPCConnection *)v5->_hostConnection resume];
    uint64_t v12 = [MEMORY[0x1E4F29290] anonymousListener];
    id v13 = v9[2];
    v9[2] = (id)v12;

    [v9[2] setDelegate:v9];
    [v9[2] resume];
  }
  return v5;
}

void __53__FSWebKitProcessSupportManager_initWithXPCEndpoint___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_Fswebkitproces.isa);
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

- (void)checkin
{
  v3 = [(FSWebKitProcessSupportManager *)self hostConnection];
  id v6 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_3];

  id v4 = [(FSWebKitProcessSupportManager *)self serverListener];
  v5 = [v4 endpoint];
  [v6 checkin:v5 reply:&__block_literal_global_17];
}

void __40__FSWebKitProcessSupportManager_checkin__block_invoke(uint64_t a1, uint64_t a2)
{
}

void __40__FSWebKitProcessSupportManager_checkin__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKey:kFSWebKitSupportParamLocallyActivatedFontsKey];
  NSLog(&cfstr_Fswebkitproces_1.isa);
  [v2 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_23];
}

void __40__FSWebKitProcessSupportManager_checkin__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = a3;
  NSLog(&cfstr_Fswebkitsuppor.isa, v6);
  MEMORY[0x1BA994BC0](v6, v4);

  v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
  if (GSFontRegisterURL()) {
    NSLog(&cfstr_FailedToUseHos.isa, v6);
  }
}

- (void)ping:(id)a3
{
  v3 = (void (**)(id, __CFString *))a3;
  GSFontInitialize();
  v3[2](v3, @"Hello!");
}

- (void)userInstalledFontsInfo:(id)a3 reply:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v5 = a3;
  NSLog(&cfstr_Fswebkitsuppor_0.isa, v5);
  GSFontSetupForUserInstalledFonts();

  v6[2]();
}

- (void)ping2:(id)a3
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  [v5 setInvalidationHandler:&__block_literal_global_41];
  id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0DA3118];
  [v5 setExportedInterface:v6];
  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

void __68__FSWebKitProcessSupportManager_listener_shouldAcceptNewConnection___block_invoke()
{
}

- (NSXPCConnection)hostConnection
{
  return self->_hostConnection;
}

- (void)setHostConnection:(id)a3
{
}

- (NSXPCListener)serverListener
{
  return self->_serverListener;
}

- (void)setServerListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverListener, 0);
  objc_storeStrong((id *)&self->_hostConnection, 0);
}

@end