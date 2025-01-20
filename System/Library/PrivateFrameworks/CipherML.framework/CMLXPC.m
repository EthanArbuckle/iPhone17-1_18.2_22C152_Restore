@interface CMLXPC
+ (id)asyncProxyToConnection:(id)a3 dispatchQueue:(id)a4 callbackWasCalled:(BOOL *)a5 errorHandler:(id)a6;
+ (id)createConnection;
+ (id)interfaceDescription;
+ (id)syncProxyToConnection:(id)a3 error:(id *)a4;
@end

@implementation CMLXPC

+ (id)createConnection
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ciphermld" options:0];
  if (v2)
  {
    v3 = [(id)objc_opt_class() interfaceDescription];
    [v2 setRemoteObjectInterface:v3];

    [v2 resume];
    id v4 = v2;
  }
  else
  {
    v5 = +[CMLLog client];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CMLSimilarityClient initWithClientConfig:dispatchQueue:](@"com.apple.ciphermld", v5);
    }
  }
  return v2;
}

+ (id)interfaceDescription
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FDDC858];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_similarityScoresForElements_shardIndices_clientConfig_reply_ argumentIndex:0 ofReply:1];

  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_decryptBatchOfSimilarityScores_clientConfig_reply_ argumentIndex:0 ofReply:1];

  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  [v2 setClasses:v12 forSelector:sel_listUseCaseGroupsWithReply_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)syncProxyToConnection:(id)a3 error:(id *)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__CMLXPC_syncProxyToConnection_error___block_invoke;
  v6[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v6[4] = a4;
  uint64_t v4 = [a3 synchronousRemoteObjectProxyWithErrorHandler:v6];
  return v4;
}

void __38__CMLXPC_syncProxyToConnection_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[CMLLog client];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__CMLXPC_syncProxyToConnection_error___block_invoke_cold_1();
  }

  uint64_t v5 = +[CMLError errorWithCode:100 underlyingError:v3 description:@"XPC Connection was interrupted"];
  v6 = *(void ***)(a1 + 32);
  uint64_t v7 = *v6;
  void *v6 = (void *)v5;
}

+ (id)asyncProxyToConnection:(id)a3 dispatchQueue:(id)a4 callbackWasCalled:(BOOL *)a5 errorHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__CMLXPC_asyncProxyToConnection_dispatchQueue_callbackWasCalled_errorHandler___block_invoke;
  v15[3] = &unk_26527E4D8;
  id v17 = v10;
  v18 = a5;
  id v16 = v9;
  id v11 = v10;
  id v12 = v9;
  v13 = [a3 remoteObjectProxyWithErrorHandler:v15];

  return v13;
}

void __78__CMLXPC_asyncProxyToConnection_dispatchQueue_callbackWasCalled_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[CMLLog client];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__CMLXPC_syncProxyToConnection_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(unsigned char **)(a1 + 48);
  if (!*v5)
  {
    unsigned char *v5 = 1;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __78__CMLXPC_asyncProxyToConnection_dispatchQueue_callbackWasCalled_errorHandler___block_invoke_71;
    v7[3] = &unk_26527E4B0;
    v6 = *(NSObject **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __78__CMLXPC_asyncProxyToConnection_dispatchQueue_callbackWasCalled_errorHandler___block_invoke_71(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = +[CMLError errorWithCode:100 underlyingError:*(void *)(a1 + 32) description:@"XPC Connection was interrupted"];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __38__CMLXPC_syncProxyToConnection_error___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_249C3F000, v0, OS_LOG_TYPE_ERROR, "Connection was interrupted with %@ : error=%{public}@", v1, 0x16u);
}

@end