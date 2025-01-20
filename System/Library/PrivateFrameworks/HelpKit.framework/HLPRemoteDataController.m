@interface HLPRemoteDataController
- (BOOL)hasLoaded;
- (BOOL)loading;
- (HLPRemoteDataController)initWithURL:(id)a3;
- (HLPURLSessionItem)URLSessionItem;
- (NSDictionary)headerFields;
- (NSURL)URL;
- (void)cancel;
- (void)dealloc;
- (void)fetchDataWithDataType:(int64_t)a3 identifier:(id)a4 completionHandler:(id)a5;
- (void)processFileURLWithCompletionHandler:(id)a3;
- (void)setHasLoaded:(BOOL)a3;
- (void)setHeaderFields:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setURL:(id)a3;
- (void)setURLSessionItem:(id)a3;
@end

@implementation HLPRemoteDataController

- (void)dealloc
{
  v3 = +[HLPURLSessionManager defaultManager];
  [v3 cancelSessionItem:self->_URLSessionItem];

  v4.receiver = self;
  v4.super_class = (Class)HLPRemoteDataController;
  [(HLPRemoteDataController *)&v4 dealloc];
}

- (HLPRemoteDataController)initWithURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HLPRemoteDataController;
  v5 = [(HLPRemoteDataController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(HLPRemoteDataController *)v5 setURL:v4];
  }

  return v6;
}

- (void)fetchDataWithDataType:(int64_t)a3 identifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if (![(HLPRemoteDataController *)self loading])
  {
    [(HLPRemoteDataController *)self setLoading:1];
    v10 = [(HLPRemoteDataController *)self URL];
    int v11 = [v10 isFileURL];

    if (v11)
    {
      v12 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke;
      block[3] = &unk_264578C30;
      block[4] = self;
      id v33 = v9;
      dispatch_async(v12, block);

      goto LABEL_17;
    }
    v13 = [(HLPRemoteDataController *)self URL];

    if (!v13)
    {
      [(HLPRemoteDataController *)self setLoading:0];
      goto LABEL_17;
    }
    objc_initWeak(&location, self);
    v14 = (void *)MEMORY[0x263F089E0];
    v15 = [(HLPRemoteDataController *)self URL];
    v16 = [v14 requestWithURL:v15];

    if (self->_headerFields)
    {
      [v16 setCachePolicy:1];
      [v16 setAllHTTPHeaderFields:self->_headerFields];
    }
    v17 = +[HLPURLSessionManager defaultManager];
    if (a3 == 1)
    {
      v18 = off_2645786E0;
    }
    else
    {
      if (a3 != 2)
      {
LABEL_16:

        objc_destroyWeak(&location);
        goto LABEL_17;
      }
      v18 = off_264578660;
    }
    v19 = [(__objc2_class *)*v18 sharedInstance];
    if (v19)
    {
      v20 = HLPLogForCategory(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v16;
        _os_log_impl(&dword_220BD8000, v20, OS_LOG_TYPE_DEFAULT, "Fetching: %@", buf, 0xCu);
      }

      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      v26 = __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke_7;
      v27 = &unk_264578CA8;
      objc_copyWeak(&v30, &location);
      v28 = self;
      id v29 = v9;
      uint64_t v21 = [v19 formattedDataForRequest:v16 identifier:v8 completionHandler:&v24];
      URLSessionItem = self->_URLSessionItem;
      p_URLSessionItem = &self->_URLSessionItem;
      *p_URLSessionItem = (HLPURLSessionItem *)v21;

      objc_msgSend(v17, "resumeSessionItem:", *p_URLSessionItem, v24, v25, v26, v27);
      objc_destroyWeak(&v30);
    }
    goto LABEL_16;
  }
LABEL_17:
}

void __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke_2;
  v2[3] = &unk_264578C08;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 processFileURLWithCompletionHandler:v2];
}

void __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  [v6 setLoading:0];
  [*(id *)(a1 + 32) setHasLoaded:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke_7(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v13 = [WeakRetained URLSessionItem];
  v14 = [v13 sessionTask];
  v15 = [v14 response];

  if (!v9 || v11)
  {
    [WeakRetained setLoading:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [WeakRetained setURLSessionItem:0];
  }
  else
  {
    v16 = dispatch_get_global_queue(0, 0);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke_2_8;
    v20[3] = &unk_264578C80;
    v20[4] = WeakRetained;
    id v21 = v10;
    id v17 = v9;
    uint64_t v18 = *(void *)(a1 + 32);
    v19 = *(void **)(a1 + 40);
    id v22 = v17;
    uint64_t v23 = v18;
    id v25 = v19;
    id v24 = v15;
    dispatch_async(v16, v20);
  }
}

void __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke_2_8(uint64_t a1)
{
  [*(id *)(a1 + 32) processData:*(void *)(a1 + 40) formattedData:*(void *)(a1 + 48)];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke_3;
  block[3] = &unk_264578C58;
  block[4] = *(void *)(a1 + 56);
  id v4 = *(id *)(a1 + 72);
  id v3 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setLoading:0];
  [*(id *)(a1 + 32) setHasLoaded:1];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 setURLSessionItem:0];
}

- (void)processFileURLWithCompletionHandler:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HLPRemoteDataController_processFileURLWithCompletionHandler___block_invoke;
  block[3] = &unk_264578CD0;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __63__HLPRemoteDataController_processFileURLWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"Not implemented" code:1 userInfo:0];
  (*(void (**)(uint64_t, void, id, void))(v1 + 16))(v1, 0, v2, 0);
}

- (void)cancel
{
  [(HLPRemoteDataController *)self setLoading:0];
  [(HLPURLSessionItem *)self->_URLSessionItem cancel];
  URLSessionItem = self->_URLSessionItem;
  self->_URLSessionItem = 0;
}

- (BOOL)loading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (void)setHasLoaded:(BOOL)a3
{
  self->_hasLoaded = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSDictionary)headerFields
{
  return self->_headerFields;
}

- (void)setHeaderFields:(id)a3
{
}

- (HLPURLSessionItem)URLSessionItem
{
  return self->_URLSessionItem;
}

- (void)setURLSessionItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLSessionItem, 0);
  objc_storeStrong((id *)&self->_headerFields, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end