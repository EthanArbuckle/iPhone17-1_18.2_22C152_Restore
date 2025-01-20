@interface CMLIndexPIRClient
+ (id)new;
- (CMLIndexPIRClient)init;
- (id)constructPIRBatchRequestWithIndices:(id)a3 error:(id *)a4;
- (id)constructPIRRequestWithIndex:(unint64_t)a3 error:(id *)a4;
- (id)dataByIndex:(unint64_t)a3 error:(id *)a4;
- (id)dataByIndices:(id)a3 error:(id *)a4;
- (id)decryptPIRBatchResponse:(id)a3 indices:(id)a4 error:(id *)a5;
- (id)decryptPIRResponse:(id)a3 index:(unint64_t)a4 error:(id *)a5;
- (void)requestDataByIndex:(unint64_t)a3 completionHandler:(id)a4;
- (void)requestDataByIndices:(id)a3 completionHandler:(id)a4;
@end

@implementation CMLIndexPIRClient

- (void)requestDataByIndex:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__CMLIndexPIRClient_requestDataByIndex_completionHandler___block_invoke;
  aBlock[3] = &unk_26527E2D0;
  id v8 = v7;
  id v23 = v8;
  v9 = _Block_copy(aBlock);
  v10 = [(CMLPIRClient *)self connection];
  v11 = [(CMLPIRClient *)self dispatchQueue];
  v12 = +[CMLXPC asyncProxyToConnection:v10 dispatchQueue:v11 callbackWasCalled:v25 + 3 errorHandler:v9];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __58__CMLIndexPIRClient_requestDataByIndex_completionHandler___block_invoke_2;
  v18[3] = &unk_26527E500;
  v20 = &v24;
  SEL v21 = a2;
  v18[4] = self;
  id v13 = v8;
  id v19 = v13;
  v14 = _Block_copy(v18);
  v15 = +[CMLLog client];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v29 = v16;
    _os_log_impl(&dword_249C3F000, v15, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  v17 = [(CMLPIRClient *)self clientConfig];
  [v12 requestDataByIndex:a3 clientConfig:v17 reply:v14];

  _Block_object_dispose(&v24, 8);
}

uint64_t __58__CMLIndexPIRClient_requestDataByIndex_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__CMLIndexPIRClient_requestDataByIndex_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[CMLLog client];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412802;
    id v19 = v8;
    __int16 v20 = 1024;
    BOOL v21 = v5 != 0;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl(&dword_249C3F000, v7, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, success(%d) error:%{public}@", buf, 0x1Cu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  if (v6)
  {
    v9 = +[CMLError errorWithCode:300 underlyingError:v6 description:@"Unable to request data by index"];
  }
  else
  {
    v9 = 0;
  }
  v10 = [*(id *)(a1 + 32) dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CMLIndexPIRClient_requestDataByIndex_completionHandler___block_invoke_60;
  block[3] = &unk_26527E2F8;
  id v11 = *(id *)(a1 + 40);
  id v16 = v9;
  id v17 = v11;
  id v15 = v5;
  id v12 = v9;
  id v13 = v5;
  dispatch_async(v10, block);
}

uint64_t __58__CMLIndexPIRClient_requestDataByIndex_completionHandler___block_invoke_60(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)requestDataByIndices:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__CMLIndexPIRClient_requestDataByIndices_completionHandler___block_invoke;
  aBlock[3] = &unk_26527E2D0;
  id v9 = v8;
  id v24 = v9;
  v10 = _Block_copy(aBlock);
  id v11 = [(CMLPIRClient *)self connection];
  id v12 = [(CMLPIRClient *)self dispatchQueue];
  id v13 = +[CMLXPC asyncProxyToConnection:v11 dispatchQueue:v12 callbackWasCalled:v26 + 3 errorHandler:v10];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __60__CMLIndexPIRClient_requestDataByIndices_completionHandler___block_invoke_2;
  v19[3] = &unk_26527E320;
  BOOL v21 = &v25;
  SEL v22 = a2;
  v19[4] = self;
  id v14 = v9;
  id v20 = v14;
  id v15 = _Block_copy(v19);
  id v16 = +[CMLLog client];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = v17;
    _os_log_impl(&dword_249C3F000, v16, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  v18 = [(CMLPIRClient *)self clientConfig];
  [v13 requestDataByIndices:v7 clientConfig:v18 reply:v15];

  _Block_object_dispose(&v25, 8);
}

uint64_t __60__CMLIndexPIRClient_requestDataByIndices_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__CMLIndexPIRClient_requestDataByIndices_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  id v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412802;
    id v20 = v9;
    __int16 v21 = 2048;
    uint64_t v22 = v7;
    __int16 v23 = 2114;
    id v24 = v6;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, results(%lu), error:%{public}@", buf, 0x20u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  if (v6)
  {
    v10 = +[CMLError errorWithCode:301 underlyingError:v6 description:@"Unable to request data by indices batch"];
  }
  else
  {
    v10 = 0;
  }
  id v11 = [*(id *)(a1 + 32) dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CMLIndexPIRClient_requestDataByIndices_completionHandler___block_invoke_65;
  block[3] = &unk_26527E2F8;
  id v12 = *(id *)(a1 + 40);
  id v17 = v10;
  id v18 = v12;
  id v16 = v5;
  id v13 = v10;
  id v14 = v5;
  dispatch_async(v11, block);
}

uint64_t __60__CMLIndexPIRClient_requestDataByIndices_completionHandler___block_invoke_65(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)dataByIndex:(unint64_t)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v30 = 0;
  id v8 = [(CMLPIRClient *)self connection];
  id v9 = +[CMLXPC syncProxyToConnection:v8 error:&v30];

  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__2;
  char v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  __int16 v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __39__CMLIndexPIRClient_dataByIndex_error___block_invoke;
  v17[3] = &unk_26527E370;
  v17[5] = &v24;
  v17[6] = a2;
  v17[4] = &v18;
  v10 = _Block_copy(v17);
  id v11 = +[CMLLog client];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v32 = v12;
    _os_log_impl(&dword_249C3F000, v11, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  id v13 = [(CMLPIRClient *)self clientConfig];
  [v9 requestDataByIndex:a3 clientConfig:v13 reply:v10];

  if (a4)
  {
    id v14 = v30;
    if (!v30) {
      id v14 = (id)v25[5];
    }
    *a4 = v14;
  }
  id v15 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __39__CMLIndexPIRClient_dataByIndex_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:300 underlyingError:v7 description:@"Unable to request data by index"];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)dataByIndices:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v30 = 0;
  id v8 = [(CMLPIRClient *)self connection];
  id v9 = +[CMLXPC syncProxyToConnection:v8 error:&v30];

  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__2;
  char v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  __int16 v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __41__CMLIndexPIRClient_dataByIndices_error___block_invoke;
  v17[3] = &unk_26527E348;
  v17[5] = &v24;
  v17[6] = a2;
  v17[4] = &v18;
  uint64_t v10 = _Block_copy(v17);
  uint64_t v11 = +[CMLLog client];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v32 = v12;
    _os_log_impl(&dword_249C3F000, v11, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  int v13 = [(CMLPIRClient *)self clientConfig];
  [v9 requestDataByIndices:v7 clientConfig:v13 reply:v10];

  if (a4)
  {
    id v14 = v30;
    if (!v30) {
      id v14 = (id)v25[5];
    }
    *a4 = v14;
  }
  id v15 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __41__CMLIndexPIRClient_dataByIndices_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v6 count];
  id v9 = +[CMLLog client];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v14 = 138412802;
    id v15 = v10;
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_249C3F000, v9, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, results(%lu) error:%{public}@", (uint8_t *)&v14, 0x20u);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v11 = +[CMLError errorWithCode:301 underlyingError:v7 description:@"Unable to request data by indices batch"];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    int v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

- (id)constructPIRRequestWithIndex:(unint64_t)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v30 = 0;
  uint64_t v8 = [(CMLPIRClient *)self connection];
  id v9 = +[CMLXPC syncProxyToConnection:v8 error:&v30];

  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__2;
  char v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  __int16 v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __56__CMLIndexPIRClient_constructPIRRequestWithIndex_error___block_invoke;
  v17[3] = &unk_26527E370;
  v17[5] = &v24;
  v17[6] = a2;
  v17[4] = &v18;
  uint64_t v10 = _Block_copy(v17);
  uint64_t v11 = +[CMLLog client];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v32 = v12;
    _os_log_impl(&dword_249C3F000, v11, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  int v13 = [(CMLPIRClient *)self clientConfig];
  [v9 constructPIRRequestWithIndex:a3 clientConfig:v13 reply:v10];

  if (a4)
  {
    id v14 = v30;
    if (!v30) {
      id v14 = (id)v25[5];
    }
    *a4 = v14;
  }
  id v15 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __56__CMLIndexPIRClient_constructPIRRequestWithIndex_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    id v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6 != 0;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:302 underlyingError:v7 description:@"Unable to create PIR request with index due to errors"];
  }
  else
  {
    if (v6) {
      goto LABEL_7;
    }
    uint64_t v10 = +[CMLError errorWithCode:303 description:@"Unable to create PIR request with index due to empty response"];
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

LABEL_7:
}

- (id)constructPIRBatchRequestWithIndices:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v30 = 0;
  uint64_t v8 = [(CMLPIRClient *)self connection];
  id v9 = +[CMLXPC syncProxyToConnection:v8 error:&v30];

  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__2;
  char v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  __int16 v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __63__CMLIndexPIRClient_constructPIRBatchRequestWithIndices_error___block_invoke;
  v17[3] = &unk_26527E370;
  v17[5] = &v24;
  v17[6] = a2;
  v17[4] = &v18;
  uint64_t v10 = _Block_copy(v17);
  uint64_t v11 = +[CMLLog client];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v32 = v12;
    _os_log_impl(&dword_249C3F000, v11, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  int v13 = [(CMLPIRClient *)self clientConfig];
  [v9 constructPIRBatchRequestWithIndices:v7 clientConfig:v13 reply:v10];

  if (a4)
  {
    id v14 = v30;
    if (!v30) {
      id v14 = (id)v25[5];
    }
    *a4 = v14;
  }
  id v15 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __63__CMLIndexPIRClient_constructPIRBatchRequestWithIndices_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    id v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6 != 0;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:304 underlyingError:v7 description:@"Unable to create PIR request with batch of indices due to errors"];
  }
  else
  {
    if (v6) {
      goto LABEL_7;
    }
    uint64_t v10 = +[CMLError errorWithCode:305 description:@"Unable to create PIR request with batch of indices due to empty response"];
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

LABEL_7:
}

- (id)decryptPIRResponse:(id)a3 index:(unint64_t)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v32 = 0;
  uint64_t v10 = [(CMLPIRClient *)self connection];
  uint64_t v11 = +[CMLXPC syncProxyToConnection:v10 error:&v32];

  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__2;
  id v30 = __Block_byref_object_dispose__2;
  id v31 = 0;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__2;
  uint64_t v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __52__CMLIndexPIRClient_decryptPIRResponse_index_error___block_invoke;
  v19[3] = &unk_26527E370;
  void v19[5] = &v26;
  v19[6] = a2;
  v19[4] = &v20;
  uint64_t v12 = _Block_copy(v19);
  int v13 = +[CMLLog client];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v34 = v14;
    _os_log_impl(&dword_249C3F000, v13, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  __int16 v15 = [(CMLPIRClient *)self clientConfig];
  [v11 decryptPIRResponse:v9 index:a4 clientConfig:v15 reply:v12];

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

void __52__CMLIndexPIRClient_decryptPIRResponse_index_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    id v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6 != 0;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:306 underlyingError:v7 description:@"Unable to decrypt PIR response with index due to errors"];
  }
  else
  {
    if (v6) {
      goto LABEL_7;
    }
    uint64_t v10 = +[CMLError errorWithCode:307 description:@"Unable to decrypt PIR response with index due to empty response"];
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

LABEL_7:
}

- (id)decryptPIRBatchResponse:(id)a3 indices:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v33 = 0;
  uint64_t v11 = [(CMLPIRClient *)self connection];
  uint64_t v12 = +[CMLXPC syncProxyToConnection:v11 error:&v33];

  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__2;
  id v31 = __Block_byref_object_dispose__2;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__2;
  id v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __59__CMLIndexPIRClient_decryptPIRBatchResponse_indices_error___block_invoke;
  v20[3] = &unk_26527E348;
  v20[5] = &v27;
  v20[6] = a2;
  v20[4] = &v21;
  int v13 = _Block_copy(v20);
  id v14 = +[CMLLog client];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    uint64_t v35 = v15;
    _os_log_impl(&dword_249C3F000, v14, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  BOOL v16 = [(CMLPIRClient *)self clientConfig];
  [v12 decryptPIRBatchResponse:v9 indices:v10 clientConfig:v16 reply:v13];

  if (a5)
  {
    id v17 = v33;
    if (!v33) {
      id v17 = (id)v28[5];
    }
    *a5 = v17;
  }
  id v18 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v18;
}

void __59__CMLIndexPIRClient_decryptPIRBatchResponse_indices_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v6 count];
  id v9 = +[CMLLog client];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v14 = 138412802;
    __int16 v15 = v10;
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_249C3F000, v9, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, results(%lu) error:%{public}@", (uint8_t *)&v14, 0x20u);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v11 = +[CMLError errorWithCode:308 underlyingError:v7 description:@"Unable to decrypt PIR batch response with indices due to errors"];
  }
  else
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
      goto LABEL_7;
    }
    uint64_t v11 = +[CMLError errorWithCode:309 description:@"Unable to decrypt PIR batch response with indices due to empty response"];
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

LABEL_7:
}

- (CMLIndexPIRClient)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

@end