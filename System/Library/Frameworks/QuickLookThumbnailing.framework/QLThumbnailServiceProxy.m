@interface QLThumbnailServiceProxy
+ (QLThumbnailServiceProxy)sharedInstance;
+ (id)interface;
+ (id)sharedInstanceWithError:(id *)a3;
- (NSXPCConnection)connection;
- (QLThumbnailServiceProxy)initWithError:(id *)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)indexProxy;
- (void)askThumbnailAdditionIndex:(id)a3;
- (void)dealloc;
- (void)touchOrAddThumbnailAddition:(id)a3 forURL:(id)a4;
- (void)updateLastHitDateOfAddition:(id)a3 onPhysicalURL:(id)a4;
@end

@implementation QLThumbnailServiceProxy

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_proxy;
}

+ (QLThumbnailServiceProxy)sharedInstance
{
  return (QLThumbnailServiceProxy *)[a1 sharedInstanceWithError:0];
}

+ (id)sharedInstanceWithError:(id *)a3
{
  v3 = (void *)sSharedProxy;
  if (!sSharedProxy)
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__2;
    v11 = __Block_byref_object_dispose__2;
    id v12 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__QLThumbnailServiceProxy_sharedInstanceWithError___block_invoke;
    v6[3] = &unk_1E6009D48;
    v6[4] = &v7;
    v6[5] = a1;
    if (sharedInstanceWithError__once == -1)
    {
      if (!a3)
      {
LABEL_5:
        _Block_object_dispose(&v7, 8);

        v3 = (void *)sSharedProxy;
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&sharedInstanceWithError__once, v6);
      if (!a3) {
        goto LABEL_5;
      }
    }
    *a3 = (id) v8[5];
    goto LABEL_5;
  }
LABEL_6:

  return v3;
}

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0AA0378];
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0AA03D8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v30 = v3;
  [v3 setClasses:v6 forSelector:sel_retrieveAllAdditions_ argumentIndex:0 ofReply:1];

  uint64_t v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0A99740];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  [v7 setClasses:v10 forSelector:sel_didGenerateThumbnailForRequestWithUUID_images_metadata_contentRect_iconFlavor_thumbnailType_clientShouldTakeOwnership_ argumentIndex:1 ofReply:0];

  [v2 setInterface:v7 forSelector:sel_generateSuccessiveThumbnailRepresentationsForRequests_generationHandler_completionHandler_ argumentIndex:1 ofReply:0];
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  [v2 setClasses:v13 forSelector:sel_generateSuccessiveThumbnailRepresentationsForRequests_generationHandler_completionHandler_ argumentIndex:0 ofReply:0];

  v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  [v2 setClasses:v16 forSelector:sel_cancelThumbnailRequests_ argumentIndex:0 ofReply:0];

  [v2 setInterface:v3 forSelector:sel_askThumbnailAdditionIndex_ argumentIndex:0 ofReply:1];
  v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  [v2 setClasses:v19 forSelector:sel_fetchAllDataSeparatedVolumesWithCompletionHandler_ argumentIndex:0 ofReply:1];

  v20 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  v28 = objc_msgSend(v20, "setWithObjects:", v21, v22, v23, v24, v25, v26, v27, objc_opt_class(), 0);
  [v2 setClasses:v28 forSelector:sel_getAllThumbnailsForIno_fsid_completionHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

void __51__QLThumbnailServiceProxy_sharedInstanceWithError___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(*(Class *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 initWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = (void *)sSharedProxy;
  sSharedProxy = v4;
}

- (QLThumbnailServiceProxy)initWithError:(id *)a3
{
  v19.receiver = self;
  v19.super_class = (Class)QLThumbnailServiceProxy;
  uint64_t v4 = [(QLThumbnailServiceProxy *)&v19 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.quicklook.ThumbnailsAgent" options:4096];
    connection = v4->_connection;
    v4->_connection = (NSXPCConnection *)v5;

    uint64_t v7 = [(id)objc_opt_class() interface];
    [(NSXPCConnection *)v4->_connection setRemoteObjectInterface:v7];

    [(NSXPCConnection *)v4->_connection resume];
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__2;
    v17 = __Block_byref_object_dispose__2;
    id v18 = 0;
    v8 = v4->_connection;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__QLThumbnailServiceProxy_initWithError___block_invoke;
    v12[3] = &unk_1E6009D70;
    v12[4] = &v13;
    uint64_t v9 = [(NSXPCConnection *)v8 remoteObjectProxyWithErrorHandler:v12];
    proxy = v4->_proxy;
    v4->_proxy = (QLThumbnailsInterface *)v9;

    if (!v4->_proxy)
    {

      uint64_t v4 = 0;
      if (a3) {
        *a3 = (id) v14[5];
      }
    }
    _Block_object_dispose(&v13, 8);
  }
  return v4;
}

void __41__QLThumbnailServiceProxy_initWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _log_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __41__QLThumbnailServiceProxy_initWithError___block_invoke_cold_1((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)QLThumbnailServiceProxy;
  [(QLThumbnailServiceProxy *)&v3 dealloc];
}

- (id)indexProxy
{
  indexProxy = self->_indexProxy;
  if (!indexProxy)
  {
    uint64_t v4 = self;
    objc_sync_enter(v4);
    if (!self->_indexProxy)
    {
      uint64_t v5 = +[QLThumbnailServiceProxy sharedInstance];
      v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_4];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __37__QLThumbnailServiceProxy_indexProxy__block_invoke_91;
      v8[3] = &unk_1E6009D98;
      v8[4] = v4;
      [v6 askThumbnailAdditionIndex:v8];
    }
    objc_sync_exit(v4);

    indexProxy = self->_indexProxy;
  }

  return indexProxy;
}

void __37__QLThumbnailServiceProxy_indexProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = _log_0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __37__QLThumbnailServiceProxy_indexProxy__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __37__QLThumbnailServiceProxy_indexProxy__block_invoke_91(uint64_t a1, void *a2)
{
}

- (void)askThumbnailAdditionIndex:(id)a3
{
}

- (void)touchOrAddThumbnailAddition:(id)a3 forURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v17 = 0;
  v8 = [getFPSandboxingURLWrapperClass() wrapperWithURL:v7 extensionClass:"com.apple.quicklook.readonly" error:&v17];
  id v9 = v17;
  if (v9)
  {
    v10 = _log_0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[QLThumbnailServiceProxy touchOrAddThumbnailAddition:forURL:]();
    }
  }
  v11 = [(QLThumbnailServiceProxy *)self indexProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__QLThumbnailServiceProxy_touchOrAddThumbnailAddition_forURL___block_invoke;
  v14[3] = &unk_1E6009DE0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v6;
  id v12 = v6;
  id v13 = v8;
  [v11 hasThumbnailForURLWrapper:v13 updateLastHitDate:1 andSize:0 completion:v14];
}

void __62__QLThumbnailServiceProxy_touchOrAddThumbnailAddition_forURL___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) indexProxy];
    objc_msgSend(v4, "addThumbnailForURLWrapper:size:completion:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "additionSize"), &__block_literal_global_95);
  }
}

- (void)updateLastHitDateOfAddition:(id)a3 onPhysicalURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v20 = 0;
  v8 = [getFPSandboxingURLWrapperClass() wrapperWithURL:v7 extensionClass:"com.apple.quicklook.readonly" error:&v20];
  id v9 = v20;
  if (v9)
  {
    v10 = _log_0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[QLThumbnailServiceProxy touchOrAddThumbnailAddition:forURL:]();
    }
  }
  v11 = [(QLThumbnailServiceProxy *)self indexProxy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__QLThumbnailServiceProxy_updateLastHitDateOfAddition_onPhysicalURL___block_invoke;
  v15[3] = &unk_1E6009E08;
  id v16 = v7;
  id v17 = self;
  id v18 = v8;
  id v19 = v6;
  id v12 = v6;
  id v13 = v8;
  id v14 = v7;
  [v11 hasThumbnailForURLWrapper:v13 updateLastHitDate:1 andSize:0 completion:v15];
}

void __69__QLThumbnailServiceProxy_updateLastHitDateOfAddition_onPhysicalURL___block_invoke(uint64_t a1, char a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    objc_super v3 = _log_0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1B281E000, v3, OS_LOG_TYPE_INFO, "GenStore has a thumbnail for %@ but it was not present in the Quick Look DB", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = [*(id *)(a1 + 40) indexProxy];
    objc_msgSend(v5, "addThumbnailForURLWrapper:size:completion:", *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "additionSize"), &__block_literal_global_98);
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexProxy, 0);
  objc_storeStrong((id *)&self->_proxy, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __41__QLThumbnailServiceProxy_initWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B281E000, a2, OS_LOG_TYPE_ERROR, "Error caught while looking for a thumbnail: %@", (uint8_t *)&v2, 0xCu);
}

void __37__QLThumbnailServiceProxy_indexProxy__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B281E000, a2, OS_LOG_TYPE_ERROR, "indexProxy received error %@", (uint8_t *)&v2, 0xCu);
}

- (void)touchOrAddThumbnailAddition:forURL:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Could not create FPSandboxingURLWrapper with url: %@, error: %@");
}

@end