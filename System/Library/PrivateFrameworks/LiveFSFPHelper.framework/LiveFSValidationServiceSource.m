@interface LiveFSValidationServiceSource
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (LiveFSValidationServiceSource)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4;
- (NSString)serviceName;
- (id)makeListenerEndpointAndReturnError:(id *)a3;
- (void)validation_allowValidation:(id)a3;
- (void)validation_evictDocumentWithCompletionHandler:(id)a3;
- (void)validation_shareDocumentWithCompletionHandler:(id)a3;
@end

@implementation LiveFSValidationServiceSource

- (LiveFSValidationServiceSource)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LiveFSValidationServiceSource;
  v9 = [(LiveFSValidationServiceSource *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemIdentifier, a4);
    objc_storeStrong((id *)&v10->_fileProviderExtension, a3);
    uint64_t v11 = [MEMORY[0x263F088B0] hashTableWithOptions:0];
    listeners = v10->_listeners;
    v10->_listeners = (NSHashTable *)v11;
  }
  return v10;
}

- (NSString)serviceName
{
  return (NSString *)@"com.apple.FileProvider.ValidationV1";
}

- (id)makeListenerEndpointAndReturnError:(id *)a3
{
  v4 = objc_msgSend(MEMORY[0x263F08D88], "anonymousListener", a3);
  [v4 setDelegate:self];
  v5 = [v4 endpoint];
  [v4 resume];
  v6 = self;
  objc_sync_enter(v6);
  [(NSHashTable *)v6->_listeners addObject:v4];
  objc_sync_exit(v6);

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E053B88];
  [v7 setExportedInterface:v8];

  [v7 setExportedObject:self];
  v9 = self;
  objc_sync_enter(v9);
  [(NSHashTable *)v9->_listeners removeObject:v6];
  objc_sync_exit(v9);

  objc_initWeak(&location, v7);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__LiveFSValidationServiceSource_listener_shouldAcceptNewConnection___block_invoke;
  v14[3] = &unk_2649342C0;
  id v10 = v6;
  id v15 = v10;
  [v7 setInvalidationHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__LiveFSValidationServiceSource_listener_shouldAcceptNewConnection___block_invoke_2;
  v12[3] = &unk_2649342E8;
  objc_copyWeak(&v13, &location);
  [v7 setInterruptionHandler:v12];
  [v7 resume];
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return 1;
}

uint64_t __68__LiveFSValidationServiceSource_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __68__LiveFSValidationServiceSource_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

- (void)validation_evictDocumentWithCompletionHandler:(id)a3
{
  v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F07F70];
  id v6 = a3;
  id v7 = [v4 errorWithDomain:v5 code:3328 userInfo:0];
  (*((void (**)(id, id))a3 + 2))(v6, v7);
}

- (void)validation_shareDocumentWithCompletionHandler:(id)a3
{
  v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F07F70];
  id v6 = a3;
  id v7 = [v4 errorWithDomain:v5 code:3328 userInfo:0];
  (*((void (**)(id, id))a3 + 2))(v6, v7);
}

- (void)validation_allowValidation:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, uint64_t, void *))a3;
  uint64_t v5 = [(LiveFSFPExtensionHelper *)self->_fileProviderExtension mountPath];
  id v6 = [v5 URLByAppendingPathComponent:@"Validation"];

  id v7 = [MEMORY[0x263F08850] defaultManager];
  int v8 = [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:0];

  if (v8
    && ([(LiveFSFPExtensionHelper *)self->_fileProviderExtension persistentIdentifierForItemAtURL:v6], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = (void *)v9;
    v4[2](v4, 1, &unk_26E04CB78);
  }
  else
  {
    uint64_t v11 = livefs_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      id v13 = "-[LiveFSValidationServiceSource validation_allowValidation:]";
      _os_log_impl(&dword_22CE49000, v11, OS_LOG_TYPE_DEFAULT, "%s: about to return no", (uint8_t *)&v12, 0xCu);
    }

    v4[2](v4, 0, &unk_26E04CBA0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_fileProviderExtension, 0);
}

@end