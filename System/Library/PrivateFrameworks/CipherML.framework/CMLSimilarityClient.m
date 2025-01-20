@interface CMLSimilarityClient
+ (id)calculateSimilarityScoresOf:(id)a3 toElements:(id)a4 error:(id *)a5;
+ (id)new;
- (CMLClientConfig)clientConfig;
- (CMLPECConfig)clientPecConfig;
- (CMLSimilarityClient)init;
- (CMLSimilarityClient)initWithClientConfig:(id)a3;
- (CMLSimilarityClient)initWithClientConfig:(id)a3 dispatchQueue:(id)a4;
- (CMLSimilarityClient)initWithClientConfig:(id)a3 dispatchQueue:(id)a4 connection:(id)a5;
- (NSString)useCase;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)dispatchQueue;
- (id)asyncResponseSimilarityScoresForElements:(id)a3 shardIndex:(unint64_t)a4 error:(id *)a5;
- (id)asyncResponseSimilarityScoresForElements:(id)a3 shardIndices:(id)a4 error:(id *)a5;
- (id)decryptBatchOfSimilarityScores:(id)a3 error:(id *)a4;
- (id)decryptSimilarityScores:(id)a3 error:(id *)a4;
- (id)encryptBatchOfElements:(id)a3 shardIndex:(unint64_t)a4 error:(id *)a5;
- (id)encryptBatchOfElements:(id)a3 shardIndices:(id)a4 error:(id *)a5;
- (id)encryptDifferentiallyPrivateFakes:(id)a3 shardIndex:(unint64_t)a4 shardCount:(unint64_t)a5 error:(id *)a6;
- (id)encryptElement:(id)a3 shardIndex:(unint64_t)a4 error:(id *)a5;
- (id)encryptElement:(id)a3 shardIndices:(id)a4 error:(id *)a5;
- (id)setPECConfig:(id)a3 error:(id *)a4;
- (id)similarityScoresForElement:(id)a3 shardIndex:(unint64_t)a4 error:(id *)a5;
- (id)similarityScoresForElement:(id)a3 shardIndices:(id)a4 error:(id *)a5;
- (id)similarityScoresForElements:(id)a3 shardIndex:(unint64_t)a4 error:(id *)a5;
- (id)similarityScoresForElements:(id)a3 shardIndices:(id)a4 error:(id *)a5;
- (void)dealloc;
- (void)requestSimilarityScoresForElement:(id)a3 shardIndex:(unint64_t)a4 completionHandler:(id)a5;
- (void)requestSimilarityScoresForElement:(id)a3 shardIndices:(id)a4 completionHandler:(id)a5;
- (void)requestSimilarityScoresForElements:(id)a3 shardIndex:(unint64_t)a4 completionHandler:(id)a5;
- (void)requestSimilarityScoresForElements:(id)a3 shardIndices:(id)a4 completionHandler:(id)a5;
- (void)setClientPecConfig:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation CMLSimilarityClient

- (NSString)useCase
{
  v2 = [(CMLSimilarityClient *)self clientConfig];
  v3 = [v2 useCase];

  return (NSString *)v3;
}

- (CMLSimilarityClient)initWithClientConfig:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.CipherML.CMLSimilarityClient", 0);
  v6 = [(CMLSimilarityClient *)self initWithClientConfig:v4 dispatchQueue:v5];

  return v6;
}

- (CMLSimilarityClient)initWithClientConfig:(id)a3 dispatchQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ciphermld" options:0];
  if (v8)
  {
    self = [(CMLSimilarityClient *)self initWithClientConfig:v6 dispatchQueue:v7 connection:v8];
    v9 = self;
  }
  else
  {
    v10 = +[CMLLog client];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CMLSimilarityClient initWithClientConfig:dispatchQueue:](@"com.apple.ciphermld", v10);
    }

    v9 = 0;
  }

  return v9;
}

- (CMLSimilarityClient)initWithClientConfig:(id)a3 dispatchQueue:(id)a4 connection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CMLSimilarityClient;
  v12 = [(CMLSimilarityClient *)&v15 init];
  if (v12)
  {
    v13 = +[CMLXPC interfaceDescription];
    [v11 setRemoteObjectInterface:v13];

    [v11 activate];
    objc_storeStrong((id *)&v12->_clientConfig, a3);
    objc_storeStrong((id *)&v12->_dispatchQueue, a4);
    objc_storeStrong((id *)&v12->_connection, a5);
  }

  return v12;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CMLSimilarityClient;
  [(CMLSimilarityClient *)&v3 dealloc];
}

- (void)requestSimilarityScoresForElement:(id)a3 shardIndex:(unint64_t)a4 completionHandler:(id)a5
{
  v13[1] = *MEMORY[0x263EF8340];
  v8 = NSNumber;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 numberWithUnsignedInteger:a4];
  v13[0] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [(CMLSimilarityClient *)self requestSimilarityScoresForElement:v10 shardIndices:v12 completionHandler:v9];
}

- (void)requestSimilarityScoresForElement:(id)a3 shardIndices:(id)a4 completionHandler:(id)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v16[0] = a3;
  id v9 = (void *)MEMORY[0x263EFF8C0];
  id v10 = a4;
  id v11 = a3;
  v12 = [v9 arrayWithObjects:v16 count:1];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __88__CMLSimilarityClient_requestSimilarityScoresForElement_shardIndices_completionHandler___block_invoke;
  v14[3] = &unk_26527E2A8;
  id v15 = v8;
  id v13 = v8;
  [(CMLSimilarityClient *)self requestSimilarityScoresForElements:v12 shardIndices:v10 completionHandler:v14];
}

void __88__CMLSimilarityClient_requestSimilarityScoresForElement_shardIndices_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 objectAtIndexedSubscript:0];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)requestSimilarityScoresForElements:(id)a3 shardIndex:(unint64_t)a4 completionHandler:(id)a5
{
  v13[1] = *MEMORY[0x263EF8340];
  id v8 = NSNumber;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 numberWithUnsignedInteger:a4];
  v13[0] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [(CMLSimilarityClient *)self requestSimilarityScoresForElements:v10 shardIndices:v12 completionHandler:v9];
}

- (void)requestSimilarityScoresForElements:(id)a3 shardIndices:(id)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__CMLSimilarityClient_requestSimilarityScoresForElements_shardIndices_completionHandler___block_invoke;
  aBlock[3] = &unk_26527E2D0;
  id v12 = v11;
  id v26 = v12;
  id v13 = _Block_copy(aBlock);
  v14 = [(CMLSimilarityClient *)self connection];
  id v15 = [(CMLSimilarityClient *)self dispatchQueue];
  v16 = +[CMLXPC asyncProxyToConnection:v14 dispatchQueue:v15 callbackWasCalled:v28 + 3 errorHandler:v13];

  v17 = +[CMLLog client];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v32 = v18;
    _os_log_impl(&dword_249C3F000, v17, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  v19 = [(CMLSimilarityClient *)self clientConfig];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __89__CMLSimilarityClient_requestSimilarityScoresForElements_shardIndices_completionHandler___block_invoke_65;
  v21[3] = &unk_26527E320;
  v23 = &v27;
  SEL v24 = a2;
  v21[4] = self;
  id v20 = v12;
  id v22 = v20;
  [v16 similarityScoresForElements:v9 shardIndices:v10 clientConfig:v19 reply:v21];

  _Block_object_dispose(&v27, 8);
}

uint64_t __89__CMLSimilarityClient_requestSimilarityScoresForElements_shardIndices_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89__CMLSimilarityClient_requestSimilarityScoresForElements_shardIndices_completionHandler___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v5 = a2;
  id v6 = a3;
  id v7 = +[CMLLog client];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412802;
    v19 = v8;
    __int16 v20 = 1024;
    BOOL v21 = v5 != 0;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl(&dword_249C3F000, v7, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, scores(%d) error:%{public}@", buf, 0x1Cu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  if (v6)
  {
    uint64_t v9 = +[CMLError errorWithCode:600 underlyingError:v6 description:@"Unable to calculate similarity scores for elements due to errors"];
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (!(v5 | v9))
  {
    uint64_t v9 = +[CMLError errorWithCode:601 description:@"Server returns nil instead of similarity scores with empty error"];
  }
  id v10 = [*(id *)(a1 + 32) dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__CMLSimilarityClient_requestSimilarityScoresForElements_shardIndices_completionHandler___block_invoke_73;
  block[3] = &unk_26527E2F8;
  id v11 = *(id *)(a1 + 40);
  id v16 = (id)v9;
  id v17 = v11;
  id v15 = (id)v5;
  id v12 = (id)v9;
  id v13 = (id)v5;
  dispatch_async(v10, block);
}

uint64_t __89__CMLSimilarityClient_requestSimilarityScoresForElements_shardIndices_completionHandler___block_invoke_73(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)similarityScoresForElement:(id)a3 shardIndex:(unint64_t)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x263EF8340];
  id v8 = NSNumber;
  id v9 = a3;
  id v10 = [v8 numberWithUnsignedInteger:a4];
  v14[0] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v12 = [(CMLSimilarityClient *)self similarityScoresForElement:v9 shardIndices:v11 error:a5];

  return v12;
}

- (id)similarityScoresForElement:(id)a3 shardIndices:(id)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 arrayWithObjects:&v15 count:1];

  id v12 = -[CMLSimilarityClient similarityScoresForElements:shardIndices:error:](self, "similarityScoresForElements:shardIndices:error:", v11, v9, a5, v15, v16);

  id v13 = [v12 objectAtIndexedSubscript:0];

  return v13;
}

- (id)similarityScoresForElements:(id)a3 shardIndex:(unint64_t)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x263EF8340];
  id v8 = NSNumber;
  id v9 = a3;
  id v10 = [v8 numberWithUnsignedInteger:a4];
  v14[0] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v12 = [(CMLSimilarityClient *)self similarityScoresForElements:v9 shardIndices:v11 error:a5];

  return v12;
}

- (id)similarityScoresForElements:(id)a3 shardIndices:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v38 = 0;
  id v11 = [(CMLSimilarityClient *)self connection];
  id v12 = +[CMLXPC syncProxyToConnection:v11 error:&v38];

  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__0;
  v36 = __Block_byref_object_dispose__0;
  id v37 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__0;
  char v30 = __Block_byref_object_dispose__0;
  id v31 = 0;
  id v13 = +[CMLLog client];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v40 = v14;
    _os_log_impl(&dword_249C3F000, v13, OS_LOG_TYPE_DEFAULT, "%@ Sending request", buf, 0xCu);
  }
  id v15 = [(CMLSimilarityClient *)self clientConfig];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __70__CMLSimilarityClient_similarityScoresForElements_shardIndices_error___block_invoke;
  v25[3] = &unk_26527E348;
  v25[4] = &v26;
  v25[5] = &v32;
  v25[6] = a2;
  [v12 similarityScoresForElements:v9 shardIndices:v10 clientConfig:v15 reply:v25];

  if (!v27[5] && !v33[5])
  {
    uint64_t v16 = +[CMLError errorWithCode:601 description:@"Server returns nil instead of similarity scores with empty error"];
    id v17 = (void *)v33[5];
    v33[5] = v16;
  }
  if (a5)
  {
    id v18 = v38;
    if (!v38) {
      id v18 = (id)v33[5];
    }
    *a5 = v18;
  }
  v19 = +[CMLLog client];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v20 = NSStringFromSelector(a2);
    BOOL v21 = v27[5] != 0;
    uint64_t v22 = v33[5];
    *(_DWORD *)buf = 138412802;
    v40 = v20;
    __int16 v41 = 1024;
    BOOL v42 = v21;
    __int16 v43 = 2114;
    uint64_t v44 = v22;
    _os_log_impl(&dword_249C3F000, v19, OS_LOG_TYPE_DEFAULT, "%@ Request complete, scores(%d) error:%{public}@", buf, 0x1Cu);
  }
  id v23 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v23;
}

void __70__CMLSimilarityClient_similarityScoresForElements_shardIndices_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6 != 0;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, scores(%d), error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:600 underlyingError:v7 description:@"Unable to calculate similarity scores for element due to errors"];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)setPECConfig:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v29 = 0;
  id v8 = [(CMLSimilarityClient *)self connection];
  id v9 = +[CMLXPC syncProxyToConnection:v8 error:&v29];

  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__0;
  uint64_t v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy__0;
  BOOL v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  uint64_t v10 = +[CMLLog client];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v31 = v11;
    _os_log_impl(&dword_249C3F000, v10, OS_LOG_TYPE_DEFAULT, "%@ Sending request", buf, 0xCu);
  }
  [(CMLSimilarityClient *)self setClientPecConfig:v7];
  id v12 = [(CMLSimilarityClient *)self clientConfig];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __42__CMLSimilarityClient_setPECConfig_error___block_invoke;
  v16[3] = &unk_26527E370;
  v16[4] = &v17;
  v16[5] = &v23;
  v16[6] = a2;
  [v9 setPECConfig:v7 clientConfig:v12 reply:v16];

  if (a4)
  {
    id v13 = v29;
    if (!v29) {
      id v13 = (id)v24[5];
    }
    *a4 = v13;
  }
  id v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

void __42__CMLSimilarityClient_setPECConfig_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    id v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6 != 0;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ Received response, success(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:200 underlyingError:v7 description:@"Unable to set PEC config due to errors"];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)encryptElement:(id)a3 shardIndex:(unint64_t)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  v16[0] = a3;
  id v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a3;
  uint64_t v10 = [v8 arrayWithObjects:v16 count:1];
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:a4];
  __int16 v15 = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];

  int v13 = [(CMLSimilarityClient *)self encryptBatchOfElements:v10 shardIndices:v12 error:a5];

  return v13;
}

- (id)encryptElement:(id)a3 shardIndices:(id)a4 error:(id *)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v8 arrayWithObjects:&v14 count:1];

  id v12 = -[CMLSimilarityClient encryptBatchOfElements:shardIndices:error:](self, "encryptBatchOfElements:shardIndices:error:", v11, v9, a5, v14, v15);

  return v12;
}

- (id)decryptSimilarityScores:(id)a3 error:(id *)a4
{
  uint64_t v4 = [(CMLSimilarityClient *)self decryptBatchOfSimilarityScores:a3 error:a4];
  unint64_t v5 = [v4 objectAtIndexedSubscript:0];

  return v5;
}

+ (id)calculateSimilarityScoresOf:(id)a3 toElements:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)encryptBatchOfElements:(id)a3 shardIndex:(unint64_t)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x263EF8340];
  id v8 = NSNumber;
  id v9 = a3;
  id v10 = [v8 numberWithUnsignedInteger:a4];
  v14[0] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v12 = [(CMLSimilarityClient *)self encryptBatchOfElements:v9 shardIndices:v11 error:a5];

  return v12;
}

- (id)encryptDifferentiallyPrivateFakes:(id)a3 shardIndex:(unint64_t)a4 shardCount:(unint64_t)a5 error:(id *)a6
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v27 = a3;
  id v41 = 0;
  uint64_t v11 = [(CMLSimilarityClient *)self connection];
  id v12 = +[CMLXPC syncProxyToConnection:v11 error:&v41];

  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  uint64_t v29 = 0;
  char v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__0;
  uint64_t v33 = __Block_byref_object_dispose__0;
  id v34 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__CMLSimilarityClient_encryptDifferentiallyPrivateFakes_shardIndex_shardCount_error___block_invoke;
  aBlock[3] = &unk_26527E348;
  aBlock[5] = &v35;
  aBlock[6] = a2;
  void aBlock[4] = &v29;
  int v13 = _Block_copy(aBlock);
  id v14 = +[CMLLog client];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    __int16 v43 = v15;
    _os_log_impl(&dword_249C3F000, v14, OS_LOG_TYPE_DEFAULT, "%@ Sending request", buf, 0xCu);
  }
  BOOL v16 = [(CMLSimilarityClient *)self clientPecConfig];
  __int16 v17 = [(CMLSimilarityClient *)self clientConfig];
  [v12 encryptDifferentiallyPrivateFakes:v27 shardIndex:a4 shardCount:a5 pecConfig:v16 clientConfig:v17 reply:v13];

  if (!v30[5] && !v36[5])
  {
    uint64_t v18 = +[CMLError errorWithCode:911 description:@"Server returns nil instead of encrypted elements data with empty error"];
    uint64_t v19 = (void *)v36[5];
    v36[5] = v18;
  }
  if (a6)
  {
    id v20 = v41;
    if (!v41) {
      id v20 = (id)v36[5];
    }
    *a6 = v20;
  }
  BOOL v21 = +[CMLLog client];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = NSStringFromSelector(a2);
    BOOL v23 = v30[5] != 0;
    uint64_t v24 = v36[5];
    *(_DWORD *)buf = 138412802;
    __int16 v43 = v22;
    __int16 v44 = 1024;
    BOOL v45 = v23;
    __int16 v46 = 2114;
    uint64_t v47 = v24;
    _os_log_impl(&dword_249C3F000, v21, OS_LOG_TYPE_DEFAULT, "%@ Request complete, encryptedData(%d) error:%{public}@", buf, 0x1Cu);
  }
  id v25 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v25;
}

void __85__CMLSimilarityClient_encryptDifferentiallyPrivateFakes_shardIndex_shardCount_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    id v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6 != 0;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ Received response, encrypted(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:910 underlyingError:v7 description:@"Unable to encrypt batch of elements"];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)encryptBatchOfElements:(id)a3 shardIndices:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v38 = 0;
  uint64_t v11 = [(CMLSimilarityClient *)self connection];
  id v12 = +[CMLXPC syncProxyToConnection:v11 error:&v38];

  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__0;
  v36 = __Block_byref_object_dispose__0;
  id v37 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__0;
  char v30 = __Block_byref_object_dispose__0;
  id v31 = 0;
  int v13 = +[CMLLog client];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v40 = v14;
    _os_log_impl(&dword_249C3F000, v13, OS_LOG_TYPE_DEFAULT, "%@ Sending request", buf, 0xCu);
  }
  __int16 v15 = [(CMLSimilarityClient *)self clientConfig];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __65__CMLSimilarityClient_encryptBatchOfElements_shardIndices_error___block_invoke;
  v25[3] = &unk_26527E370;
  v25[4] = &v26;
  v25[5] = &v32;
  v25[6] = a2;
  [v12 encryptBatchOfElements:v9 shardIndices:v10 clientConfig:v15 reply:v25];

  if (!v27[5] && !v33[5])
  {
    uint64_t v16 = +[CMLError errorWithCode:901 description:@"Server returns nil instead of encrypted elements data with empty error"];
    __int16 v17 = (void *)v33[5];
    v33[5] = v16;
  }
  if (a5)
  {
    id v18 = v38;
    if (!v38) {
      id v18 = (id)v33[5];
    }
    *a5 = v18;
  }
  uint64_t v19 = +[CMLLog client];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = NSStringFromSelector(a2);
    BOOL v21 = v27[5] != 0;
    uint64_t v22 = v33[5];
    *(_DWORD *)buf = 138412802;
    id v40 = v20;
    __int16 v41 = 1024;
    BOOL v42 = v21;
    __int16 v43 = 2114;
    uint64_t v44 = v22;
    _os_log_impl(&dword_249C3F000, v19, OS_LOG_TYPE_DEFAULT, "%@ Request complete, encryptedData(%d) error:%{public}@", buf, 0x1Cu);
  }
  id v23 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v23;
}

void __65__CMLSimilarityClient_encryptBatchOfElements_shardIndices_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    id v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6 != 0;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ Received response, encrypted(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:900 underlyingError:v7 description:@"Unable to encrypt batch of elements"];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)decryptBatchOfSimilarityScores:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v35 = 0;
  id v8 = [(CMLSimilarityClient *)self connection];
  id v9 = +[CMLXPC syncProxyToConnection:v8 error:&v35];

  uint64_t v29 = 0;
  char v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__0;
  uint64_t v33 = __Block_byref_object_dispose__0;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__0;
  id v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  uint64_t v10 = +[CMLLog client];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v37 = v11;
    _os_log_impl(&dword_249C3F000, v10, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  id v12 = [(CMLSimilarityClient *)self clientConfig];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __60__CMLSimilarityClient_decryptBatchOfSimilarityScores_error___block_invoke;
  v22[3] = &unk_26527E348;
  v22[4] = &v23;
  v22[5] = &v29;
  v22[6] = a2;
  [v9 decryptBatchOfSimilarityScores:v7 clientConfig:v12 reply:v22];

  if (!v24[5] && !v30[5])
  {
    uint64_t v13 = +[CMLError errorWithCode:1001 description:@"Server returns nil instead of batch of decrypted scores with empty error"];
    id v14 = (void *)v30[5];
    v30[5] = v13;
  }
  if (a4)
  {
    id v15 = v35;
    if (!v35) {
      id v15 = (id)v30[5];
    }
    *a4 = v15;
  }
  BOOL v16 = +[CMLLog client];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = NSStringFromSelector(a2);
    BOOL v18 = v24[5] != 0;
    uint64_t v19 = v30[5];
    *(_DWORD *)buf = 138412802;
    id v37 = v17;
    __int16 v38 = 1024;
    BOOL v39 = v18;
    __int16 v40 = 2114;
    uint64_t v41 = v19;
    _os_log_impl(&dword_249C3F000, v16, OS_LOG_TYPE_DEFAULT, "%@ Request complete, scores(%d) error:%{public}@", buf, 0x1Cu);
  }
  id v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v20;
}

void __60__CMLSimilarityClient_decryptBatchOfSimilarityScores_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    id v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6 != 0;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, scores(%d), error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:1000 underlyingError:v7 description:@"Unable to decrypt batch of similarity scores"];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)asyncResponseSimilarityScoresForElements:(id)a3 shardIndex:(unint64_t)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x263EF8340];
  id v8 = NSNumber;
  id v9 = a3;
  uint64_t v10 = [v8 numberWithUnsignedInteger:a4];
  v14[0] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v12 = [(CMLSimilarityClient *)self asyncResponseSimilarityScoresForElements:v9 shardIndices:v11 error:a5];

  return v12;
}

- (id)asyncResponseSimilarityScoresForElements:(id)a3 shardIndices:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v32 = 0;
  uint64_t v11 = [(CMLSimilarityClient *)self connection];
  id v12 = +[CMLXPC syncProxyToConnection:v11 error:&v32];

  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__0;
  char v30 = __Block_byref_object_dispose__0;
  id v31 = 0;
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__0;
  uint64_t v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  int v13 = +[CMLLog client];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v34 = v14;
    _os_log_impl(&dword_249C3F000, v13, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  __int16 v15 = [(CMLSimilarityClient *)self clientConfig];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __83__CMLSimilarityClient_asyncResponseSimilarityScoresForElements_shardIndices_error___block_invoke;
  v19[3] = &unk_26527E398;
  v19[4] = &v20;
  v19[5] = &v26;
  v19[6] = a2;
  [v12 asyncResponseSimilarityScoresForElements:v9 shardIndices:v10 clientConfig:v15 reply:v19];

  if (a5)
  {
    id v16 = v32;
    if (!v32) {
      id v16 = (id)v27[5];
    }
    *a5 = v16;
  }
  id v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v17;
}

void __83__CMLSimilarityClient_asyncResponseSimilarityScoresForElements_shardIndices_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, asyncResponseId(%@) error:%{public}@", (uint8_t *)&v13, 0x20u);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:602 underlyingError:v7 description:@"Unable to calculate similarity scores for element with async response due to errors"];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (CMLSimilarityClient)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (CMLClientConfig)clientConfig
{
  return self->_clientConfig;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (CMLPECConfig)clientPecConfig
{
  return self->_clientPecConfig;
}

- (void)setClientPecConfig:(id)a3
{
  self->_clientPecConfig = (CMLPECConfig *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientConfig, 0);
}

- (void)initWithClientConfig:(uint64_t)a1 dispatchQueue:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_249C3F000, a2, OS_LOG_TYPE_ERROR, "could not create connection to %@", (uint8_t *)&v2, 0xCu);
}

@end