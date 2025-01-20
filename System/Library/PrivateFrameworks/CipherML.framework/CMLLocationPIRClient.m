@interface CMLLocationPIRClient
+ (id)new;
- (CMLLocationPIRClient)init;
- (id)constructPIRRequestWithLatitude:(double)a3 longitude:(double)a4 error:(id *)a5;
- (id)dataByLatitude:(double)a3 longitude:(double)a4 error:(id *)a5;
- (id)decryptPIRResponse:(id)a3 latitude:(double)a4 longitude:(double)a5 error:(id *)a6;
- (void)requestDataByLatitude:(double)a3 longitude:(double)a4 completionHandler:(id)a5;
@end

@implementation CMLLocationPIRClient

- (void)requestDataByLatitude:(double)a3 longitude:(double)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v9 = a5;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__CMLLocationPIRClient_requestDataByLatitude_longitude_completionHandler___block_invoke;
  aBlock[3] = &unk_26527E2D0;
  id v10 = v9;
  id v25 = v10;
  v11 = _Block_copy(aBlock);
  v12 = [(CMLPIRClient *)self connection];
  v13 = [(CMLPIRClient *)self dispatchQueue];
  v14 = +[CMLXPC asyncProxyToConnection:v12 dispatchQueue:v13 callbackWasCalled:v27 + 3 errorHandler:v11];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __74__CMLLocationPIRClient_requestDataByLatitude_longitude_completionHandler___block_invoke_2;
  v20[3] = &unk_26527E500;
  v22 = &v26;
  SEL v23 = a2;
  v20[4] = self;
  id v15 = v10;
  id v21 = v15;
  v16 = _Block_copy(v20);
  v17 = +[CMLLog client];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v31 = v18;
    _os_log_impl(&dword_249C3F000, v17, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  v19 = [(CMLPIRClient *)self clientConfig];
  [v14 requestDataByLatitude:v19 longitude:v16 clientConfig:a3 reply:a4];

  _Block_object_dispose(&v26, 8);
}

uint64_t __74__CMLLocationPIRClient_requestDataByLatitude_longitude_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__CMLLocationPIRClient_requestDataByLatitude_longitude_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = +[CMLLog client];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412802;
    v19 = v8;
    __int16 v20 = 1024;
    BOOL v21 = v5 != 0;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl(&dword_249C3F000, v7, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d) error:%{public}@", buf, 0x1Cu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  if (v6)
  {
    id v9 = +[CMLError errorWithCode:500 underlyingError:v6 description:@"Unable to request data by location"];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = [*(id *)(a1 + 32) dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__CMLLocationPIRClient_requestDataByLatitude_longitude_completionHandler___block_invoke_190;
  block[3] = &unk_26527E2F8;
  id v11 = *(id *)(a1 + 40);
  id v16 = v9;
  id v17 = v11;
  id v15 = v5;
  id v12 = v9;
  id v13 = v5;
  dispatch_async(v10, block);
}

uint64_t __74__CMLLocationPIRClient_requestDataByLatitude_longitude_completionHandler___block_invoke_190(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)dataByLatitude:(double)a3 longitude:(double)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v32 = 0;
  id v10 = [(CMLPIRClient *)self connection];
  id v11 = +[CMLXPC syncProxyToConnection:v10 error:&v32];

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  char v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  id v31 = 0;
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__2;
  uint64_t v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __55__CMLLocationPIRClient_dataByLatitude_longitude_error___block_invoke;
  v19[3] = &unk_26527E370;
  v19[5] = &v26;
  v19[6] = a2;
  v19[4] = &v20;
  id v12 = _Block_copy(v19);
  id v13 = +[CMLLog client];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v34 = v14;
    _os_log_impl(&dword_249C3F000, v13, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  id v15 = [(CMLPIRClient *)self clientConfig];
  [v11 requestDataByLatitude:v15 longitude:v12 clientConfig:a3 reply:a4];

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

void __55__CMLLocationPIRClient_dataByLatitude_longitude_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6 != 0;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:500 underlyingError:v7 description:@"Unable to request data by location"];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (CMLLocationPIRClient)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (id)constructPIRRequestWithLatitude:(double)a3 longitude:(double)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v32 = 0;
  uint64_t v10 = [(CMLPIRClient *)self connection];
  uint64_t v11 = +[CMLXPC syncProxyToConnection:v10 error:&v32];

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  char v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  id v31 = 0;
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__2;
  uint64_t v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __72__CMLLocationPIRClient_constructPIRRequestWithLatitude_longitude_error___block_invoke;
  v19[3] = &unk_26527E370;
  v19[5] = &v26;
  v19[6] = a2;
  v19[4] = &v20;
  id v12 = _Block_copy(v19);
  int v13 = +[CMLLog client];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v34 = v14;
    _os_log_impl(&dword_249C3F000, v13, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  __int16 v15 = [(CMLPIRClient *)self clientConfig];
  [v11 constructPIRRequestWithLatitude:v15 longitude:v12 clientConfig:a3 reply:a4];

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

void __72__CMLLocationPIRClient_constructPIRRequestWithLatitude_longitude_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6 != 0;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:501 underlyingError:v7 description:@"Unable to create PIR request with location due to errors"];
  }
  else
  {
    if (v6) {
      goto LABEL_7;
    }
    uint64_t v10 = +[CMLError errorWithCode:502 description:@"Unable to create PIR request with location due to empty response"];
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

LABEL_7:
}

- (id)decryptPIRResponse:(id)a3 latitude:(double)a4 longitude:(double)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v34 = 0;
  id v12 = [(CMLPIRClient *)self connection];
  int v13 = +[CMLXPC syncProxyToConnection:v12 error:&v34];

  uint64_t v28 = 0;
  char v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__2;
  id v32 = __Block_byref_object_dispose__2;
  id v33 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__2;
  uint64_t v26 = __Block_byref_object_dispose__2;
  id v27 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __68__CMLLocationPIRClient_decryptPIRResponse_latitude_longitude_error___block_invoke;
  v21[3] = &unk_26527E370;
  v21[5] = &v28;
  v21[6] = a2;
  v21[4] = &v22;
  v14 = _Block_copy(v21);
  __int16 v15 = +[CMLLog client];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v36 = v16;
    _os_log_impl(&dword_249C3F000, v15, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  __int16 v17 = [(CMLPIRClient *)self clientConfig];
  [v13 decryptPIRResponse:v11 latitude:v17 longitude:v14 clientConfig:a4 reply:a5];

  if (a6)
  {
    id v18 = v34;
    if (!v34) {
      id v18 = (id)v29[5];
    }
    *a6 = v18;
  }
  id v19 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v19;
}

void __68__CMLLocationPIRClient_decryptPIRResponse_latitude_longitude_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6 != 0;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:503 underlyingError:v7 description:@"Unable to decrypt PIR response with location due to errors"];
  }
  else
  {
    if (v6) {
      goto LABEL_7;
    }
    uint64_t v10 = +[CMLError errorWithCode:504 description:@"Unable to decrypt PIR response with location due to empty response"];
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

LABEL_7:
}

@end