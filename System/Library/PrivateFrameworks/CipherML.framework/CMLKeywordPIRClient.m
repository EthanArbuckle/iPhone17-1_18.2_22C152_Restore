@interface CMLKeywordPIRClient
+ (id)new;
- (CMLKeywordPIRClient)init;
- (id)asyncResponseDataByKeyword:(id)a3 error:(id *)a4;
- (id)asyncResponseDataByKeywords:(id)a3 error:(id *)a4;
- (id)constructPIRBatchRequestWithKeywords:(id)a3 error:(id *)a4;
- (id)constructPIRBatchRequestWithKeywords:(id)a3 shardIds:(id)a4 error:(id *)a5;
- (id)constructPIRRequestWithKeyword:(id)a3 error:(id *)a4;
- (id)constructPIRRequestWithKeyword:(id)a3 shardId:(id)a4 error:(id *)a5;
- (id)constructPIRRequestWithKeyword:(id)a3 withEvaluationKey:(BOOL)a4 shardId:(id)a5 error:(id *)a6;
- (id)dataByKeyword:(id)a3 error:(id *)a4;
- (id)dataByKeyword:(id)a3 shardId:(id)a4 error:(id *)a5;
- (id)dataByKeywords:(id)a3 error:(id *)a4;
- (id)dataByKeywords:(id)a3 shardIds:(id)a4 error:(id *)a5;
- (id)dataByStringKeyword:(id)a3 error:(id *)a4;
- (id)dataByStringKeyword:(id)a3 shardId:(id)a4 error:(id *)a5;
- (id)dataByStringKeywords:(id)a3 error:(id *)a4;
- (id)dataByStringKeywords:(id)a3 shardIds:(id)a4 error:(id *)a5;
- (id)decryptPIRBatchResponse:(id)a3 keywords:(id)a4 error:(id *)a5;
- (id)decryptPIRResponse:(id)a3 keyword:(id)a4 error:(id *)a5;
- (id)decryptPIRResponse:(id)a3 keyword:(id)a4 shardId:(id)a5 error:(id *)a6;
- (id)removeCachedEntriesByKeywords:(id)a3 error:(id *)a4;
- (id)removeCachedEntriesByStringKeywords:(id)a3 error:(id *)a4;
- (void)requestDataByKeyword:(id)a3 completionHandler:(id)a4;
- (void)requestDataByKeyword:(id)a3 shardId:(id)a4 completionHandler:(id)a5;
- (void)requestDataByKeywords:(id)a3 completionHandler:(id)a4;
- (void)requestDataByKeywords:(id)a3 shardIds:(id)a4 completionHandler:(id)a5;
- (void)requestDataByStringKeyword:(id)a3 completionHandler:(id)a4;
- (void)requestDataByStringKeyword:(id)a3 shardId:(id)a4 completionHandler:(id)a5;
- (void)requestDataByStringKeywords:(id)a3 completionHandler:(id)a4;
- (void)requestDataByStringKeywords:(id)a3 shardIds:(id)a4 completionHandler:(id)a5;
@end

@implementation CMLKeywordPIRClient

- (void)requestDataByStringKeyword:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dataUsingEncoding:4];
  [(CMLKeywordPIRClient *)self requestDataByKeyword:v7 completionHandler:v6];
}

- (void)requestDataByStringKeyword:(id)a3 shardId:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 dataUsingEncoding:4];
  [(CMLKeywordPIRClient *)self requestDataByKeyword:v10 shardId:v9 completionHandler:v8];
}

- (void)requestDataByStringKeywords:(id)a3 completionHandler:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFF980];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 array];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__CMLKeywordPIRClient_requestDataByStringKeywords_completionHandler___block_invoke;
  v12[3] = &unk_26527E528;
  id v13 = v9;
  id v10 = v9;
  [v8 enumerateObjectsUsingBlock:v12];

  v11 = (void *)[v10 copy];
  [(CMLKeywordPIRClient *)self requestDataByKeywords:v11 completionHandler:v7];
}

void __69__CMLKeywordPIRClient_requestDataByStringKeywords_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 dataUsingEncoding:4];
  [v2 addObject:v3];
}

- (void)requestDataByStringKeywords:(id)a3 shardIds:(id)a4 completionHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x263EFF980];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 array];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__CMLKeywordPIRClient_requestDataByStringKeywords_shardIds_completionHandler___block_invoke;
  v14[3] = &unk_26527E528;
  id v15 = v12;
  id v13 = v12;
  [v11 enumerateObjectsUsingBlock:v14];

  [(CMLKeywordPIRClient *)self requestDataByKeywords:v13 shardIds:v10 completionHandler:v9];
}

void __78__CMLKeywordPIRClient_requestDataByStringKeywords_shardIds_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 dataUsingEncoding:4];
  [v2 addObject:v3];
}

- (void)requestDataByKeyword:(id)a3 completionHandler:(id)a4
{
}

- (void)requestDataByKeyword:(id)a3 shardId:(id)a4 completionHandler:(id)a5
{
  v26[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__2;
  v23[4] = __Block_byref_object_dispose__2;
  id v24 = 0;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __70__CMLKeywordPIRClient_requestDataByKeyword_shardId_completionHandler___block_invoke;
  v19 = &unk_26527E550;
  v21 = v23;
  id v12 = v11;
  id v20 = v12;
  SEL v22 = a2;
  id v13 = _Block_copy(&v16);
  if (v10)
  {
    v26[0] = v10;
    v14 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v26, 1, v16, v17, v18, v19);
  }
  else
  {
    v14 = (void *)MEMORY[0x263EFFA68];
  }
  id v25 = v9;
  id v15 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v25, 1, v16, v17, v18, v19);
  [(CMLKeywordPIRClient *)self requestDataByKeywords:v15 shardIds:v14 completionHandler:v13];

  _Block_object_dispose(v23, 8);
}

void __70__CMLKeywordPIRClient_requestDataByKeyword_shardId_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v22 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 underlyingErrors];
    id v8 = [v7 firstObject];
    id v9 = [v6 description];
    uint64_t v10 = +[CMLError errorWithCode:400 underlyingError:v8 description:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  if (v22 && [v22 count] == 1)
  {
    id v13 = [v22 objectAtIndexedSubscript:0];
    v14 = [MEMORY[0x263EFF9D0] null];

    if (v13 == v14)
    {
      id v15 = 0;
    }
    else
    {
      id v15 = [v22 objectAtIndexedSubscript:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v16 = NSString;
      uint64_t v17 = NSStringFromSelector(*(SEL *)(a1 + 48));
      v18 = [v16 stringWithFormat:@"%@ returned no result and no error", v17];

      uint64_t v19 = +[CMLError errorWithCode:400 underlyingError:v6 description:v18];
      uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
      v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)requestDataByKeywords:(id)a3 completionHandler:(id)a4
{
}

- (void)requestDataByKeywords:(id)a3 shardIds:(id)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__CMLKeywordPIRClient_requestDataByKeywords_shardIds_completionHandler___block_invoke;
  aBlock[3] = &unk_26527E2D0;
  id v12 = v11;
  id v27 = v12;
  id v13 = _Block_copy(aBlock);
  v14 = [(CMLPIRClient *)self connection];
  id v15 = [(CMLPIRClient *)self dispatchQueue];
  uint64_t v16 = +[CMLXPC asyncProxyToConnection:v14 dispatchQueue:v15 callbackWasCalled:v29 + 3 errorHandler:v13];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __72__CMLKeywordPIRClient_requestDataByKeywords_shardIds_completionHandler___block_invoke_2;
  v22[3] = &unk_26527E320;
  id v24 = &v28;
  SEL v25 = a2;
  v22[4] = self;
  id v17 = v12;
  id v23 = v17;
  v18 = _Block_copy(v22);
  uint64_t v19 = +[CMLLog client];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v33 = v20;
    _os_log_impl(&dword_249C3F000, v19, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  v21 = [(CMLPIRClient *)self clientConfig];
  [v16 requestDataByKeywords:v9 shardIds:v10 clientConfig:v21 reply:v18];

  _Block_object_dispose(&v28, 8);
}

uint64_t __72__CMLKeywordPIRClient_requestDataByKeywords_shardIds_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__CMLKeywordPIRClient_requestDataByKeywords_shardIds_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  id v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412802;
    id v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = v7;
    __int16 v25 = 2114;
    id v26 = v6;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, results(%lu) error:%{public}@", buf, 0x20u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  if (!v5)
  {
    if (v6) {
      goto LABEL_9;
    }
LABEL_10:
    uint64_t v12 = +[CMLError errorWithCode:401 description:@"requestDataByKeywords resulted in no results and no error"];
    goto LABEL_11;
  }
  uint64_t v10 = [v5 count];
  if (!v6 && !v10) {
    goto LABEL_10;
  }
  if (v6)
  {
LABEL_9:
    uint64_t v12 = +[CMLError errorWithCode:401 underlyingError:v6 description:@"Unable to request data by keywords batch"];
LABEL_11:
    id v11 = (void *)v12;
    goto LABEL_12;
  }
  id v11 = 0;
LABEL_12:
  id v13 = [*(id *)(a1 + 32) dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__CMLKeywordPIRClient_requestDataByKeywords_shardIds_completionHandler___block_invoke_121;
  block[3] = &unk_26527E2F8;
  id v14 = *(id *)(a1 + 40);
  id v19 = v11;
  id v20 = v14;
  id v18 = v5;
  id v15 = v11;
  id v16 = v5;
  dispatch_async(v13, block);
}

uint64_t __72__CMLKeywordPIRClient_requestDataByKeywords_shardIds_completionHandler___block_invoke_121(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)dataByStringKeyword:(id)a3 error:(id *)a4
{
  return [(CMLKeywordPIRClient *)self dataByStringKeyword:a3 shardId:0 error:a4];
}

- (id)dataByStringKeyword:(id)a3 shardId:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [a3 dataUsingEncoding:4];
  uint64_t v10 = [(CMLKeywordPIRClient *)self dataByKeyword:v9 shardId:v8 error:a5];

  return v10;
}

- (id)dataByKeyword:(id)a3 error:(id *)a4
{
  return [(CMLKeywordPIRClient *)self dataByKeyword:a3 shardId:0 error:a4];
}

- (id)dataByKeyword:(id)a3 shardId:(id)a4 error:(id *)a5
{
  v24[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v9)
  {
    v24[0] = v9;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  }
  else
  {
    id v11 = (void *)MEMORY[0x263EFFA68];
  }
  id v23 = v8;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  id v22 = 0;
  id v13 = [(CMLKeywordPIRClient *)self dataByKeywords:v12 shardIds:v11 error:&v22];
  id v14 = v22;

  if (a5 && v14)
  {
    id v15 = [v14 underlyingErrors];
    id v16 = [v15 firstObject];
    id v17 = [v14 description];
    *a5 = +[CMLError errorWithCode:400 underlyingError:v16 description:v17];
  }
  if (v13
    && [v13 count]
    && ([v13 objectAtIndexedSubscript:0],
        id v18 = objc_claimAutoreleasedReturnValue(),
        [MEMORY[0x263EFF9D0] null],
        id v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        v18 != v19))
  {
    id v20 = [v13 objectAtIndexedSubscript:0];
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)dataByStringKeywords:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x263EFF980];
  id v7 = a3;
  id v8 = [v6 array];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__CMLKeywordPIRClient_dataByStringKeywords_error___block_invoke;
  v12[3] = &unk_26527E528;
  id v13 = v8;
  id v9 = v8;
  [v7 enumerateObjectsUsingBlock:v12];

  uint64_t v10 = [(CMLKeywordPIRClient *)self dataByKeywords:v9 error:a4];

  return v10;
}

void __50__CMLKeywordPIRClient_dataByStringKeywords_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 dataUsingEncoding:4];
  [v2 addObject:v3];
}

- (id)dataByStringKeywords:(id)a3 shardIds:(id)a4 error:(id *)a5
{
  id v8 = (void *)MEMORY[0x263EFF980];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 array];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__CMLKeywordPIRClient_dataByStringKeywords_shardIds_error___block_invoke;
  v15[3] = &unk_26527E528;
  id v16 = v11;
  id v12 = v11;
  [v10 enumerateObjectsUsingBlock:v15];

  id v13 = [(CMLKeywordPIRClient *)self dataByKeywords:v12 shardIds:v9 error:a5];

  return v13;
}

void __59__CMLKeywordPIRClient_dataByStringKeywords_shardIds_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 dataUsingEncoding:4];
  [v2 addObject:v3];
}

- (id)dataByKeywords:(id)a3 error:(id *)a4
{
  return [(CMLKeywordPIRClient *)self dataByKeywords:a3 shardIds:MEMORY[0x263EFFA68] error:a4];
}

- (id)dataByKeywords:(id)a3 shardIds:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v33 = 0;
  id v11 = [(CMLPIRClient *)self connection];
  id v12 = +[CMLXPC syncProxyToConnection:v11 error:&v33];

  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__2;
  char v31 = __Block_byref_object_dispose__2;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__2;
  __int16 v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __53__CMLKeywordPIRClient_dataByKeywords_shardIds_error___block_invoke;
  v20[3] = &unk_26527E348;
  v20[5] = &v27;
  v20[6] = a2;
  v20[4] = &v21;
  id v13 = _Block_copy(v20);
  id v14 = +[CMLLog client];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v35 = v15;
    _os_log_impl(&dword_249C3F000, v14, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  id v16 = [(CMLPIRClient *)self clientConfig];
  [v12 requestDataByKeywords:v9 shardIds:v10 clientConfig:v16 reply:v13];

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

void __53__CMLKeywordPIRClient_dataByKeywords_shardIds_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    id v15 = v10;
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_249C3F000, v9, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, results(%lu), error:%{public}@", (uint8_t *)&v14, 0x20u);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v11 = +[CMLError errorWithCode:401 underlyingError:v7 description:@"Unable to request data by keywords batch"];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

- (id)removeCachedEntriesByStringKeywords:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x263EFF980];
  id v7 = a3;
  uint64_t v8 = [v6 array];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__CMLKeywordPIRClient_removeCachedEntriesByStringKeywords_error___block_invoke;
  v12[3] = &unk_26527E528;
  id v13 = v8;
  id v9 = v8;
  [v7 enumerateObjectsUsingBlock:v12];

  id v10 = [(CMLKeywordPIRClient *)self removeCachedEntriesByKeywords:v9 error:a4];

  return v10;
}

void __65__CMLKeywordPIRClient_removeCachedEntriesByStringKeywords_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 dataUsingEncoding:4];
  [v2 addObject:v3];
}

- (id)removeCachedEntriesByKeywords:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v30 = 0;
  uint64_t v8 = [(CMLPIRClient *)self connection];
  id v9 = +[CMLXPC syncProxyToConnection:v8 error:&v30];

  uint64_t v24 = 0;
  __int16 v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__2;
  uint64_t v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__2;
  id v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __59__CMLKeywordPIRClient_removeCachedEntriesByKeywords_error___block_invoke;
  v17[3] = &unk_26527E578;
  v17[5] = &v24;
  v17[6] = a2;
  v17[4] = &v18;
  id v10 = _Block_copy(v17);
  uint64_t v11 = +[CMLLog client];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v32 = v12;
    _os_log_impl(&dword_249C3F000, v11, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  id v13 = [(CMLPIRClient *)self clientConfig];
  [v9 removedCachedEntriesByKeywords:v7 clientConfig:v13 reply:v10];

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

void __59__CMLKeywordPIRClient_removeCachedEntriesByKeywords_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[CMLLog client];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v14 = 138412802;
    id v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = a2;
    __int16 v18 = 2114;
    id v19 = v5;
    _os_log_impl(&dword_249C3F000, v6, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, removed (%ldl) entries, error:%{public}@", (uint8_t *)&v14, 0x20u);
  }
  uint64_t v8 = [NSNumber numberWithInteger:a2];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (v5)
  {
    uint64_t v11 = +[CMLError errorWithCode:412 underlyingError:v5 description:@"Unable to remove cached entries by keywords"];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

- (CMLKeywordPIRClient)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (id)constructPIRRequestWithKeyword:(id)a3 withEvaluationKey:(BOOL)a4 shardId:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v36 = 0;
  id v13 = [(CMLPIRClient *)self connection];
  int v14 = +[CMLXPC syncProxyToConnection:v13 error:&v36];

  uint64_t v30 = 0;
  char v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__2;
  uint64_t v34 = __Block_byref_object_dispose__2;
  id v35 = 0;
  uint64_t v24 = 0;
  __int16 v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__2;
  uint64_t v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __86__CMLKeywordPIRClient_constructPIRRequestWithKeyword_withEvaluationKey_shardId_error___block_invoke;
  v23[3] = &unk_26527E370;
  void v23[5] = &v30;
  v23[6] = a2;
  v23[4] = &v24;
  id v15 = _Block_copy(v23);
  __int16 v16 = +[CMLLog client];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v38 = v17;
    _os_log_impl(&dword_249C3F000, v16, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  __int16 v18 = [(CMLPIRClient *)self pirConfig];
  id v19 = [(CMLPIRClient *)self clientConfig];
  [v14 constructPIRRequestWithKeyword:v11 withEvaluationKey:v8 shardId:v12 pirConfig:v18 clientConfig:v19 reply:v15];

  if (a6)
  {
    id v20 = v36;
    if (!v36) {
      id v20 = (id)v31[5];
    }
    *a6 = v20;
  }
  id v21 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v21;
}

void __86__CMLKeywordPIRClient_constructPIRRequestWithKeyword_withEvaluationKey_shardId_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  BOOL v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    int v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6 != 0;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d), error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:402 underlyingError:v7 description:@"Unable to create PIR request with keyword due to errors"];
  }
  else
  {
    if (v6) {
      goto LABEL_7;
    }
    uint64_t v10 = +[CMLError errorWithCode:403 description:@"Unable to create PIR request with keyword due to empty response"];
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

LABEL_7:
}

- (id)constructPIRRequestWithKeyword:(id)a3 shardId:(id)a4 error:(id *)a5
{
  return [(CMLKeywordPIRClient *)self constructPIRRequestWithKeyword:a3 withEvaluationKey:0 shardId:a4 error:a5];
}

- (id)constructPIRRequestWithKeyword:(id)a3 error:(id *)a4
{
  return [(CMLKeywordPIRClient *)self constructPIRRequestWithKeyword:a3 shardId:0 error:a4];
}

- (id)constructPIRBatchRequestWithKeywords:(id)a3 shardIds:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v33 = 0;
  uint64_t v11 = [(CMLPIRClient *)self connection];
  id v12 = +[CMLXPC syncProxyToConnection:v11 error:&v33];

  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__2;
  char v31 = __Block_byref_object_dispose__2;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__2;
  __int16 v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __75__CMLKeywordPIRClient_constructPIRBatchRequestWithKeywords_shardIds_error___block_invoke;
  v20[3] = &unk_26527E370;
  v20[5] = &v27;
  v20[6] = a2;
  v20[4] = &v21;
  int v13 = _Block_copy(v20);
  if (!v10) {
    id v10 = (id)MEMORY[0x263EFFA68];
  }
  int v14 = +[CMLLog client];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v35 = v15;
    _os_log_impl(&dword_249C3F000, v14, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  BOOL v16 = [(CMLPIRClient *)self clientConfig];
  [v12 constructPIRBatchRequestWithKeywords:v9 shardIds:v10 clientConfig:v16 reply:v13];

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

void __75__CMLKeywordPIRClient_constructPIRBatchRequestWithKeywords_shardIds_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  BOOL v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    int v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6 != 0;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d), error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:404 underlyingError:v7 description:@"Unable to create PIR request with batch of keywords due to errors"];
  }
  else
  {
    if (v6) {
      goto LABEL_7;
    }
    uint64_t v10 = +[CMLError errorWithCode:405 description:@"Unable to create PIR request with batch of keywords due to empty response"];
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

LABEL_7:
}

- (id)constructPIRBatchRequestWithKeywords:(id)a3 error:(id *)a4
{
  return [(CMLKeywordPIRClient *)self constructPIRBatchRequestWithKeywords:a3 shardIds:0 error:a4];
}

- (id)decryptPIRResponse:(id)a3 keyword:(id)a4 shardId:(id)a5 error:(id *)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v36 = 0;
  int v14 = [(CMLPIRClient *)self connection];
  __int16 v15 = +[CMLXPC syncProxyToConnection:v14 error:&v36];

  uint64_t v30 = 0;
  char v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__2;
  uint64_t v34 = __Block_byref_object_dispose__2;
  id v35 = 0;
  uint64_t v24 = 0;
  __int16 v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__2;
  uint64_t v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __64__CMLKeywordPIRClient_decryptPIRResponse_keyword_shardId_error___block_invoke;
  v23[3] = &unk_26527E370;
  void v23[5] = &v30;
  v23[6] = a2;
  v23[4] = &v24;
  BOOL v16 = _Block_copy(v23);
  __int16 v17 = +[CMLLog client];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v38 = v18;
    _os_log_impl(&dword_249C3F000, v17, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  uint64_t v19 = [(CMLPIRClient *)self clientConfig];
  [v15 decryptPIRResponse:v11 keyword:v12 shardId:v13 clientConfig:v19 reply:v16];

  if (a6)
  {
    id v20 = v36;
    if (!v36) {
      id v20 = (id)v31[5];
    }
    *a6 = v20;
  }
  id v21 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v21;
}

void __64__CMLKeywordPIRClient_decryptPIRResponse_keyword_shardId_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  BOOL v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    int v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6 != 0;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d), error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:406 underlyingError:v7 description:@"Unable to decrypt PIR response with keyword and shardId due to errors"];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)decryptPIRResponse:(id)a3 keyword:(id)a4 error:(id *)a5
{
  return [(CMLKeywordPIRClient *)self decryptPIRResponse:a3 keyword:a4 shardId:0 error:a5];
}

- (id)decryptPIRBatchResponse:(id)a3 keywords:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v33 = 0;
  uint64_t v11 = [(CMLPIRClient *)self connection];
  id v12 = +[CMLXPC syncProxyToConnection:v11 error:&v33];

  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__2;
  char v31 = __Block_byref_object_dispose__2;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__2;
  __int16 v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __62__CMLKeywordPIRClient_decryptPIRBatchResponse_keywords_error___block_invoke;
  v20[3] = &unk_26527E348;
  v20[5] = &v27;
  v20[6] = a2;
  v20[4] = &v21;
  int v13 = _Block_copy(v20);
  int v14 = +[CMLLog client];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v35 = v15;
    _os_log_impl(&dword_249C3F000, v14, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  BOOL v16 = [(CMLPIRClient *)self clientConfig];
  [v12 decryptPIRBatchResponse:v9 keywords:v10 clientConfig:v16 reply:v13];

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

void __62__CMLKeywordPIRClient_decryptPIRBatchResponse_keywords_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    uint64_t v11 = +[CMLError errorWithCode:408 underlyingError:v7 description:@"Unable to decrypt PIR response with batch of keywords due to errors"];
  }
  else
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
      goto LABEL_7;
    }
    uint64_t v11 = +[CMLError errorWithCode:409 description:@"Unable to decrypt PIR response with batch of keywords due to empty response"];
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

LABEL_7:
}

- (id)asyncResponseDataByKeyword:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v15[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v14 = 0;
  uint64_t v8 = [(CMLKeywordPIRClient *)self asyncResponseDataByKeywords:v7 error:&v14];
  id v9 = v14;

  if (a4 && v9)
  {
    id v10 = [v9 underlyingErrors];
    uint64_t v11 = [v10 firstObject];
    uint64_t v12 = [v9 description];
    *a4 = +[CMLError errorWithCode:410 underlyingError:v11 description:v12];
  }
  return v8;
}

- (id)asyncResponseDataByKeywords:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v30 = 0;
  uint64_t v8 = [(CMLPIRClient *)self connection];
  id v9 = +[CMLXPC syncProxyToConnection:v8 error:&v30];

  uint64_t v24 = 0;
  __int16 v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__2;
  uint64_t v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__2;
  id v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __57__CMLKeywordPIRClient_asyncResponseDataByKeywords_error___block_invoke;
  v17[3] = &unk_26527E398;
  v17[5] = &v24;
  v17[6] = a2;
  v17[4] = &v18;
  id v10 = _Block_copy(v17);
  uint64_t v11 = +[CMLLog client];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v32 = v12;
    _os_log_impl(&dword_249C3F000, v11, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  int v13 = [(CMLPIRClient *)self clientConfig];
  [v9 asyncResponseDataByKeywords:v7 clientConfig:v13 reply:v10];

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

void __57__CMLKeywordPIRClient_asyncResponseDataByKeywords_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, asyncResponseId(%@) error:%{public}@", (uint8_t *)&v13, 0x20u);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:411 underlyingError:v7 description:@"Unable to request data by keywords batch with async response"];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

@end