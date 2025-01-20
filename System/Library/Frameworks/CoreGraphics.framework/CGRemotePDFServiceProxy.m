@interface CGRemotePDFServiceProxy
+ (id)interface;
+ (id)sharedInstance;
- (CGRemotePDFServiceProxy)init;
- (CGRemotePDFServiceProxy)initWithCGPDFServiceConnection:(id *)a3;
- (CGRemotePDFServiceProxy)initWithConnection:(id)a3 error:(id *)a4;
- (CGRemotePDFServiceProxy)initWithLoopbackListener:(id)a3 error:(id *)a4;
- (id)newRemotePDFDocumentWithData:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)newRemotePDFDocumentProxyWithData:(id)a3 withReply:(id)a4;
- (void)newRemotePDFDocumentWithData:(id)a3 completion:(id)a4;
@end

@implementation CGRemotePDFServiceProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)newRemotePDFDocumentWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__18874;
  v23 = __Block_byref_object_dispose__18875;
  id v24 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__18874;
  v17 = __Block_byref_object_dispose__18875;
  id v18 = 0;
  proxy = self->_proxy;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__CGRemotePDFServiceProxy_newRemotePDFDocumentWithData_error___block_invoke;
  v12[3] = &unk_1E52CD7A0;
  v12[4] = &v13;
  v8 = [(CGRemotePDFServiceProtocol *)proxy synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__CGRemotePDFServiceProxy_newRemotePDFDocumentWithData_error___block_invoke_2;
  v11[3] = &unk_1E52CD860;
  v11[4] = &v19;
  [v8 newPDFDocumentWithData:v6 withReply:v11];

  if (a4) {
    *a4 = (id) v14[5];
  }
  id v9 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __62__CGRemotePDFServiceProxy_newRemotePDFDocumentWithData_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v3 = a2;
  NSLog(&cfstr_SError.isa, "-[CGRemotePDFServiceProxy newRemotePDFDocumentWithData:error:]_block_invoke", v3);
}

void __62__CGRemotePDFServiceProxy_newRemotePDFDocumentWithData_error___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    v4 = [[CGRemotePDFDocumentProxy alloc] initWithRemoteDocument:v3];

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (void)newRemotePDFDocumentWithData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  proxy = self->_proxy;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__CGRemotePDFServiceProxy_newRemotePDFDocumentWithData_completion___block_invoke;
  v14[3] = &unk_1E52CDE30;
  id v8 = v6;
  id v15 = v8;
  id v9 = a3;
  v10 = [(CGRemotePDFServiceProtocol *)proxy remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__CGRemotePDFServiceProxy_newRemotePDFDocumentWithData_completion___block_invoke_2;
  v12[3] = &unk_1E52CD838;
  id v13 = v8;
  id v11 = v8;
  [v10 newPDFDocumentWithData:v9 withReply:v12];
}

uint64_t __67__CGRemotePDFServiceProxy_newRemotePDFDocumentWithData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__CGRemotePDFServiceProxy_newRemotePDFDocumentWithData_completion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    v4 = [[CGRemotePDFDocumentProxy alloc] initWithRemoteDocument:v3];
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)newRemotePDFDocumentProxyWithData:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__CGRemotePDFServiceProxy_newRemotePDFDocumentProxyWithData_withReply___block_invoke;
  v8[3] = &unk_1E52CD810;
  id v9 = v6;
  id v7 = v6;
  [(CGRemotePDFServiceProxy *)self newRemotePDFDocumentWithData:a3 completion:v8];
}

uint64_t __71__CGRemotePDFServiceProxy_newRemotePDFDocumentProxyWithData_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CGRemotePDFServiceProxy;
  [(CGRemotePDFServiceProxy *)&v3 dealloc];
}

- (CGRemotePDFServiceProxy)initWithLoopbackListener:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F29060];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__CGRemotePDFServiceProxy_initWithLoopbackListener_error___block_invoke;
  v14[3] = &unk_1E52CD7E8;
  id v15 = v6;
  id v8 = v6;
  [v7 detachNewThreadWithBlock:v14];
  id v9 = [v8 listener];
  v10 = [v9 endpoint];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v10];
  v12 = [(CGRemotePDFServiceProxy *)self initWithConnection:v11 error:a4];

  return v12;
}

void __58__CGRemotePDFServiceProxy_initWithLoopbackListener_error___block_invoke(uint64_t a1)
{
  id v2 = (id)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:1 repeats:&__block_literal_global_92_18884 block:1000000.0];
  [*(id *)(a1 + 32) run];
  abort();
}

- (CGRemotePDFServiceProxy)initWithCGPDFServiceConnection:(id *)a3
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.CoreGraphics.CGPDFService"];
  id v6 = [(CGRemotePDFServiceProxy *)self initWithConnection:v5 error:a3];

  return v6;
}

- (CGRemotePDFServiceProxy)initWithConnection:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CGRemotePDFServiceProxy;
  id v8 = [(CGRemotePDFServiceProxy *)&v22 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a3);
    v10 = [(id)objc_opt_class() interface];
    [(NSXPCConnection *)v9->_connection setRemoteObjectInterface:v10];

    [(NSXPCConnection *)v9->_connection resume];
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__18874;
    v20 = __Block_byref_object_dispose__18875;
    id v21 = 0;
    connection = v9->_connection;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__CGRemotePDFServiceProxy_initWithConnection_error___block_invoke;
    v15[3] = &unk_1E52CD7A0;
    v15[4] = &v16;
    uint64_t v12 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v15];
    proxy = v9->_proxy;
    v9->_proxy = (CGRemotePDFServiceProtocol *)v12;

    if (!v9->_proxy)
    {

      id v9 = 0;
      if (a4) {
        *a4 = (id) v17[5];
      }
    }
    _Block_object_dispose(&v16, 8);
  }
  return v9;
}

void __52__CGRemotePDFServiceProxy_initWithConnection_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 description];
  pdf_error("Error connecting to PDFService: %s", (const char *)[v4 UTF8String]);

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (CGRemotePDFServiceProxy)init
{
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_18893);
  }
  id v2 = (void *)sharedInstance_singleton;

  return v2;
}

uint64_t __41__CGRemotePDFServiceProxy_sharedInstance__block_invoke()
{
  sharedInstance_singleton = [[CGRemotePDFServiceProxy alloc] initWithCGPDFServiceConnection:0];

  return MEMORY[0x1F41817F8]();
}

+ (id)interface
{
  objc_super v22 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED0B6F98];
  id v21 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED0B6FF8];
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED0B7058];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  [v2 setClasses:v10 forSelector:sel_drawWithBox_size_colorSpace_options_completion_ argumentIndex:2 ofReply:0];

  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, v17, v18, objc_opt_class(), 0);
  [v2 setClasses:v19 forSelector:sel_drawWithBox_size_colorSpace_options_completion_ argumentIndex:3 ofReply:0];

  [v21 setInterface:v2 forSelector:sel_getPageAtIndex_completion_ argumentIndex:0 ofReply:1];
  [v22 setInterface:v21 forSelector:sel_newPDFDocumentWithData_withReply_ argumentIndex:0 ofReply:1];

  return v22;
}

@end