@interface NLXPCEmbeddingServerClient
+ (id)sharedClient;
- (BOOL)isValid;
- (NLXPCEmbeddingServerClient)init;
- (id)connection;
- (void)batchDataFromTokenVectorEmbeddingForStrings:(id)a3 language:(id)a4 identifier:(id)a5 completionHandler:(id)a6;
- (void)compileModelWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)dataFromSentenceVectorEmbeddingForString:(id)a3 language:(id)a4 identifier:(id)a5 completionHandler:(id)a6;
- (void)dataFromTokenVectorEmbeddingForString:(id)a3 language:(id)a4 identifier:(id)a5 completionHandler:(id)a6;
- (void)loadModelWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)setValid:(BOOL)a3;
- (void)synchronousBatchDataFromTokenVectorEmbeddingForStrings:(id)a3 language:(id)a4 identifier:(id)a5 completionHandler:(id)a6;
- (void)synchronousDataFromTokenVectorEmbeddingForString:(id)a3 language:(id)a4 identifier:(id)a5 completionHandler:(id)a6;
- (void)synchronousLoadModelWithIdentifier:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
@end

@implementation NLXPCEmbeddingServerClient

- (NLXPCEmbeddingServerClient)init
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)NLXPCEmbeddingServerClient;
  v2 = [(NLXPCEmbeddingServerClient *)&v24 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFB42D08];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v26[2] = objc_opt_class();
    v26[3] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
    v8 = [v6 setWithArray:v7];
    [v5 setClasses:v8 forSelector:sel__xpc_dataFromTokenVectorEmbeddingForString_language_identifier_completionHandler_ argumentIndex:1 ofReply:1];

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v25[3] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
    v11 = [v9 setWithArray:v10];
    [v5 setClasses:v11 forSelector:sel__xpc_batchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler_ argumentIndex:1 ofReply:1];

    v12 = dispatch_queue_create("com.apple.nlcontextualembedding.xpc", 0);
    v13 = dispatch_get_global_queue(2, 0);
    dispatch_set_target_queue(v12, v13);

    v4->_valid = 1;
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.naturallanguaged" options:0];
    connection = v4->_connection;
    v4->_connection = (NSXPCConnection *)v14;

    [(NSXPCConnection *)v4->_connection setRemoteObjectInterface:v5];
    [(NSXPCConnection *)v4->_connection _setQueue:v12];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __34__NLXPCEmbeddingServerClient_init__block_invoke;
    v22 = &unk_1E5C53888;
    v23 = v4;
    v16 = v4->_connection;
    v17 = v4;
    [(NSXPCConnection *)v16 setInvalidationHandler:&v19];
    [(NSXPCConnection *)v4->_connection resume];
  }
  return v3;
}

uint64_t __34__NLXPCEmbeddingServerClient_init__block_invoke(uint64_t a1)
{
  NSLog(&cfstr_Nlxpcembedding.isa);
  v2 = *(void **)(a1 + 32);

  return [v2 setValid:0];
}

+ (id)sharedClient
{
  if (sharedClient_onceToken != -1) {
    dispatch_once(&sharedClient_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedClient_sharedClient;

  return v2;
}

uint64_t __42__NLXPCEmbeddingServerClient_sharedClient__block_invoke()
{
  sharedClient_sharedClient = objc_alloc_init(NLXPCEmbeddingServerClient);

  return MEMORY[0x1F41817F8]();
}

- (id)connection
{
  return self->_connection;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)dataFromTokenVectorEmbeddingForString:(id)a3 language:(id)a4 identifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  connection = self->_connection;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __106__NLXPCEmbeddingServerClient_dataFromTokenVectorEmbeddingForString_language_identifier_completionHandler___block_invoke;
  v20[3] = &unk_1E5C538B0;
  id v12 = v10;
  id v21 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __106__NLXPCEmbeddingServerClient_dataFromTokenVectorEmbeddingForString_language_identifier_completionHandler___block_invoke_2;
  v18[3] = &unk_1E5C538D8;
  id v19 = v12;
  id v17 = v12;
  objc_msgSend(v16, "_xpc_dataFromTokenVectorEmbeddingForString:language:identifier:completionHandler:", v15, v14, v13, v18);
}

void __106__NLXPCEmbeddingServerClient_dataFromTokenVectorEmbeddingForString_language_identifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_Nlxpcembedding_0.isa, v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __106__NLXPCEmbeddingServerClient_dataFromTokenVectorEmbeddingForString_language_identifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)synchronousDataFromTokenVectorEmbeddingForString:(id)a3 language:(id)a4 identifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  connection = self->_connection;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __117__NLXPCEmbeddingServerClient_synchronousDataFromTokenVectorEmbeddingForString_language_identifier_completionHandler___block_invoke;
  v20[3] = &unk_1E5C538B0;
  id v12 = v10;
  id v21 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __117__NLXPCEmbeddingServerClient_synchronousDataFromTokenVectorEmbeddingForString_language_identifier_completionHandler___block_invoke_2;
  v18[3] = &unk_1E5C538D8;
  id v19 = v12;
  id v17 = v12;
  objc_msgSend(v16, "_xpc_dataFromTokenVectorEmbeddingForString:language:identifier:completionHandler:", v15, v14, v13, v18);
}

void __117__NLXPCEmbeddingServerClient_synchronousDataFromTokenVectorEmbeddingForString_language_identifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_Nlxpcembedding_0.isa, v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __117__NLXPCEmbeddingServerClient_synchronousDataFromTokenVectorEmbeddingForString_language_identifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)batchDataFromTokenVectorEmbeddingForStrings:(id)a3 language:(id)a4 identifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  connection = self->_connection;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __112__NLXPCEmbeddingServerClient_batchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler___block_invoke;
  v20[3] = &unk_1E5C538B0;
  id v12 = v10;
  id v21 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __112__NLXPCEmbeddingServerClient_batchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler___block_invoke_2;
  v18[3] = &unk_1E5C53900;
  id v19 = v12;
  id v17 = v12;
  objc_msgSend(v16, "_xpc_batchDataFromTokenVectorEmbeddingForStrings:language:identifier:completionHandler:", v15, v14, v13, v18);
}

void __112__NLXPCEmbeddingServerClient_batchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_Nlxpcembedding_0.isa, v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __112__NLXPCEmbeddingServerClient_batchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)synchronousBatchDataFromTokenVectorEmbeddingForStrings:(id)a3 language:(id)a4 identifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  connection = self->_connection;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __123__NLXPCEmbeddingServerClient_synchronousBatchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler___block_invoke;
  v20[3] = &unk_1E5C538B0;
  id v12 = v10;
  id v21 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __123__NLXPCEmbeddingServerClient_synchronousBatchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler___block_invoke_2;
  v18[3] = &unk_1E5C53900;
  id v19 = v12;
  id v17 = v12;
  objc_msgSend(v16, "_xpc_batchDataFromTokenVectorEmbeddingForStrings:language:identifier:completionHandler:", v15, v14, v13, v18);
}

void __123__NLXPCEmbeddingServerClient_synchronousBatchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_Nlxpcembedding_0.isa, v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __123__NLXPCEmbeddingServerClient_synchronousBatchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dataFromSentenceVectorEmbeddingForString:(id)a3 language:(id)a4 identifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  connection = self->_connection;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __109__NLXPCEmbeddingServerClient_dataFromSentenceVectorEmbeddingForString_language_identifier_completionHandler___block_invoke;
  v20[3] = &unk_1E5C538B0;
  id v12 = v10;
  id v21 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __109__NLXPCEmbeddingServerClient_dataFromSentenceVectorEmbeddingForString_language_identifier_completionHandler___block_invoke_2;
  v18[3] = &unk_1E5C53928;
  id v19 = v12;
  id v17 = v12;
  objc_msgSend(v16, "_xpc_dataFromSentenceVectorEmbeddingForString:language:identifier:completionHandler:", v15, v14, v13, v18);
}

void __109__NLXPCEmbeddingServerClient_dataFromSentenceVectorEmbeddingForString_language_identifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_Nlxpcembedding_0.isa, v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __109__NLXPCEmbeddingServerClient_dataFromSentenceVectorEmbeddingForString_language_identifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadModelWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__NLXPCEmbeddingServerClient_loadModelWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E5C538B0;
  id v8 = v6;
  id v15 = v8;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__NLXPCEmbeddingServerClient_loadModelWithIdentifier_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5C53950;
  id v13 = v8;
  id v11 = v8;
  objc_msgSend(v10, "_xpc_loadTokenVectorEmbeddingForIdentifier:timeout:completionHandler:", v9, v12, 0.0);
}

void __72__NLXPCEmbeddingServerClient_loadModelWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_Nlxpcembedding_0.isa, v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__NLXPCEmbeddingServerClient_loadModelWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)synchronousLoadModelWithIdentifier:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8 = a5;
  connection = self->_connection;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__NLXPCEmbeddingServerClient_synchronousLoadModelWithIdentifier_timeout_completionHandler___block_invoke;
  v16[3] = &unk_1E5C538B0;
  id v10 = v8;
  id v17 = v10;
  id v11 = a3;
  id v12 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__NLXPCEmbeddingServerClient_synchronousLoadModelWithIdentifier_timeout_completionHandler___block_invoke_2;
  v14[3] = &unk_1E5C53950;
  id v15 = v10;
  id v13 = v10;
  objc_msgSend(v12, "_xpc_loadTokenVectorEmbeddingForIdentifier:timeout:completionHandler:", v11, v14, a4);
}

void __91__NLXPCEmbeddingServerClient_synchronousLoadModelWithIdentifier_timeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_Nlxpcembedding_0.isa, v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __91__NLXPCEmbeddingServerClient_synchronousLoadModelWithIdentifier_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)compileModelWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__NLXPCEmbeddingServerClient_compileModelWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E5C538B0;
  id v8 = v6;
  id v15 = v8;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__NLXPCEmbeddingServerClient_compileModelWithIdentifier_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5C53950;
  id v13 = v8;
  id v11 = v8;
  objc_msgSend(v10, "_xpc_compileEmbeddingForIdentifier:completionHandler:", v9, v12);
}

void __75__NLXPCEmbeddingServerClient_compileModelWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_Nlxpcembedding_0.isa, v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__NLXPCEmbeddingServerClient_compileModelWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end