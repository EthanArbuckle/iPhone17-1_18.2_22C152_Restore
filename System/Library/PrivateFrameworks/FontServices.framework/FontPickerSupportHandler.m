@interface FontPickerSupportHandler
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)pathsContainsFontAsset:(id)a3;
- (FontPickerSupportHandler)init;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (NSXPCListener)listenerForFontServicesDaemon;
- (void)activateFontsForFontPickerClient:(id)a3 reply:(id)a4;
- (void)checkin:(id)a3;
- (void)ping:(id)a3 reply:(id)a4;
- (void)registeredFontsChanged:(id)a3;
- (void)setConnection:(id)a3;
- (void)setListener:(id)a3;
- (void)setListenerForFontServicesDaemon:(id)a3;
@end

@implementation FontPickerSupportHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sSharedInstance;
  return v2;
}

uint64_t __42__FontPickerSupportHandler_sharedInstance__block_invoke()
{
  sharedInstance_sSharedInstance = objc_alloc_init(FontPickerSupportHandler);
  return MEMORY[0x1F41817F8]();
}

- (FontPickerSupportHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)FontPickerSupportHandler;
  v2 = [(FontPickerSupportHandler *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_registeredFontsChanged_ name:@"CTFontManagerFontChangedNotification" object:0];

    uint64_t v4 = [MEMORY[0x1E4F29290] anonymousListener];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  listener = self->_listener;
  v9 = &protocolRef_FontServicesFontPickerSupportProtocol;
  if (listener != v6) {
    v9 = &protocolRef_FontServicesFontPickerClientSupportProtocol;
  }
  v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:*v9];
  [v7 setExportedInterface:v10];
  [v7 setExportedObject:self];
  if (listener == v6)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__FontPickerSupportHandler_listener_shouldAcceptNewConnection___block_invoke;
    v13[3] = &unk_1E60B9B08;
    v13[4] = self;
    [v7 setInvalidationHandler:v13];
    v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0DA2B10];
    [v7 setRemoteObjectInterface:v11];
    objc_storeStrong((id *)&self->_connection, a4);
  }
  [v7 resume];

  return 1;
}

uint64_t __63__FontPickerSupportHandler_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConnection:0];
}

- (void)ping:(id)a3 reply:(id)a4
{
}

- (void)activateFontsForFontPickerClient:(id)a3 reply:(id)a4
{
  uint64_t v4 = (void (**)(id, uint64_t))a4;
  GSFontProcessRegistrationInfoForFontPickerClient();
  v4[2](v4, 1);
}

- (BOOL)pathsContainsFontAsset:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if (IsPathFontAssetFontFile(*(void **)(*((void *)&v9 + 1) + 8 * i), v4))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)checkin:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, void *, BOOL, uint64_t))a3;
  uint64_t v5 = (void *)GSFontCopyLocallyActivatedFontFilePaths();
  if (v5)
  {
    BOOL v6 = [(FontPickerSupportHandler *)self pathsContainsFontAsset:v5];
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = [MEMORY[0x1E4F29268] currentConnection];
    v8 = v7;
    if (v7)
    {
      [v7 auditToken];
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
    }

    long long v9 = SandboxExtensionsForPathsAndAuditToken(v5);
    objc_msgSend(MEMORY[0x1E4F29290], "anonymousListener", v14, v15);
    long long v10 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    listenerForFontServicesDaemon = self->_listenerForFontServicesDaemon;
    self->_listenerForFontServicesDaemon = v10;

    [(NSXPCListener *)self->_listenerForFontServicesDaemon setDelegate:self];
    [(NSXPCListener *)self->_listenerForFontServicesDaemon resume];
    long long v12 = [(NSXPCListener *)self->_listenerForFontServicesDaemon endpoint];
    uint64_t ShouldBeHidden = GSFontProfileFontShouldBeHidden();
    v4[2](v4, v12, v9, v6, ShouldBeHidden);
  }
}

- (void)registeredFontsChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FontPickerSupportHandler *)self connection];

  if (v5)
  {
    BOOL v6 = [v4 userInfo];
    id v7 = [v6 objectForKey:@"CTFontManagerAvailableFontURLsAdded"];
    v8 = [v6 objectForKey:@"CTFontManagerAvailableFontURLsRemoved"];
    long long v9 = __51__FontPickerSupportHandler_registeredFontsChanged___block_invoke((uint64_t)v8, v7);
    long long v10 = __51__FontPickerSupportHandler_registeredFontsChanged___block_invoke((uint64_t)v9, v8);
    BOOL v11 = [(FontPickerSupportHandler *)self pathsContainsFontAsset:v9];
    connection = self->_connection;
    if (connection) {
      [(NSXPCConnection *)connection auditToken];
    }
    v13 = SandboxExtensionsForPathsAndAuditToken(v9);
    long long v14 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_36];
    [v14 synchronize:v13 deactivated:v10 includingFontAssets:v11];
  }
}

id __51__FontPickerSupportHandler_registeredFontsChanged___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__FontPickerSupportHandler_registeredFontsChanged___block_invoke_2;
  v6[3] = &unk_1E60B9B30;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateObjectsUsingBlock:v6];

  return v4;
}

void __51__FontPickerSupportHandler_registeredFontsChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 absoluteURL];
  id v5 = [v3 path];

  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v4 = v5;
  }
}

void __51__FontPickerSupportHandler_registeredFontsChanged___block_invoke_3(uint64_t a1, uint64_t a2)
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)listenerForFontServicesDaemon
{
  return self->_listenerForFontServicesDaemon;
}

- (void)setListenerForFontServicesDaemon:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_listenerForFontServicesDaemon, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end