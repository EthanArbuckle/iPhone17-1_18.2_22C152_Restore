@interface BRLTSLoopbackTranslationService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
@end

@implementation BRLTSLoopbackTranslationService

- (NSXPCListener)listener
{
  listener = self->_listener;
  if (!listener)
  {
    v4 = [MEMORY[0x263F08D88] anonymousListener];
    [(NSXPCListener *)v4 setDelegate:self];
    [(NSXPCListener *)v4 resume];
    v5 = self->_listener;
    self->_listener = v4;

    listener = self->_listener;
  }
  return listener;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = BRLTLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2112;
    id v13 = v5;
    id v7 = v11;
    _os_log_impl(&dword_21C554000, v6, OS_LOG_TYPE_DEFAULT, "%@: Accepting new connection: %@", (uint8_t *)&v10, 0x16u);
  }
  v8 = [(id)objc_opt_class() exportedInterface];
  [v5 setExportedInterface:v8];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void).cxx_destruct
{
}

@end