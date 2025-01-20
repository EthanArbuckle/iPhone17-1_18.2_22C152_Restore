@interface HFCameraClipVideoAssetContextProvider
+ (HFCameraClipVideoAssetContextProvider)defaultProvider;
- (HFCameraClipVideoAssetContextProvider)init;
- (HFCameraClipVideoAssetContextProvider)initWithDelegate:(id)a3;
- (HFCameraClipVideoAssetContextProviderDelegate)delegate;
- (HMFUnfairLock)lock;
- (NSMutableDictionary)videoContextFuturesByClipID;
- (NSOperationQueue)operationQueue;
- (id)cachedVideoAssetContextForClip:(id)a3 clipManager:(id)a4;
- (id)fetchVideoAssetContextForClip:(id)a3 clipManager:(id)a4;
- (id)newFetchVideoAssetContextOperationForClip:(id)a3 clipManager:(id)a4;
@end

@implementation HFCameraClipVideoAssetContextProvider

+ (HFCameraClipVideoAssetContextProvider)defaultProvider
{
  if (_MergedGlobals_303 != -1) {
    dispatch_once(&_MergedGlobals_303, &__block_literal_global_3_29);
  }
  v2 = (void *)qword_26AB2FBA8;
  return (HFCameraClipVideoAssetContextProvider *)v2;
}

uint64_t __56__HFCameraClipVideoAssetContextProvider_defaultProvider__block_invoke_2()
{
  v0 = [[HFCameraClipVideoAssetContextProvider alloc] init];
  uint64_t v1 = qword_26AB2FBA8;
  qword_26AB2FBA8 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFCameraClipVideoAssetContextProvider)init
{
  return [(HFCameraClipVideoAssetContextProvider *)self initWithDelegate:self];
}

- (HFCameraClipVideoAssetContextProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HFCameraClipVideoAssetContextProvider;
  v5 = [(HFCameraClipVideoAssetContextProvider *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x263F08A48]) init];
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = (NSOperationQueue *)v7;

    [(NSOperationQueue *)v6->_operationQueue setQualityOfService:25];
    uint64_t v9 = objc_opt_new();
    videoContextFuturesByClipID = v6->_videoContextFuturesByClipID;
    v6->_videoContextFuturesByClipID = (NSMutableDictionary *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x263F42668]) init];
    lock = v6->_lock;
    v6->_lock = (HMFUnfairLock *)v11;
  }
  return v6;
}

- (id)fetchVideoAssetContextForClip:(id)a3 clipManager:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HFCameraClipVideoAssetContextProvider *)self delegate];
  uint64_t v9 = [v8 cachedVideoAssetContextForClip:v6 clipManager:v7];

  if (v9)
  {
    v10 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Using cached video context for clip %@", (uint8_t *)&buf, 0xCu);
    }

    id v11 = [MEMORY[0x263F58190] futureWithResult:v9];
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__24;
    v21 = __Block_byref_object_dispose__24;
    id v22 = 0;
    v12 = [(HFCameraClipVideoAssetContextProvider *)self lock];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __83__HFCameraClipVideoAssetContextProvider_fetchVideoAssetContextForClip_clipManager___block_invoke;
    v14[3] = &unk_26409A150;
    p_long long buf = &buf;
    v14[4] = self;
    id v15 = v6;
    id v16 = v7;
    [v12 performBlock:v14];

    id v11 = *(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);
  }
  return v11;
}

void __83__HFCameraClipVideoAssetContextProvider_fetchVideoAssetContextForClip_clipManager___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) videoContextFuturesByClipID];
  v3 = [*(id *)(a1 + 40) uniqueIdentifier];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v8 = HFLogForCategory(0x17uLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v28 = v10;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Reusing in-flight video context future for clip %@", buf, 0xCu);
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v28 = v11;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Initiating video context fetch operation for clip %@", buf, 0xCu);
    }

    v12 = [*(id *)(a1 + 32) delegate];
    v8 = [v12 newFetchVideoAssetContextOperationForClip:*(void *)(a1 + 40) clipManager:*(void *)(a1 + 48)];

    uint64_t v13 = [objc_alloc(MEMORY[0x263F58190]) init];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v17 = [*(id *)(a1 + 32) videoContextFuturesByClipID];
    v18 = [*(id *)(a1 + 40) uniqueIdentifier];
    [v17 setObject:v16 forKeyedSubscript:v18];

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __83__HFCameraClipVideoAssetContextProvider_fetchVideoAssetContextForClip_clipManager___block_invoke_8;
    v23[3] = &unk_26409A128;
    id v19 = *(id *)(a1 + 40);
    uint64_t v20 = *(void *)(a1 + 56);
    uint64_t v21 = *(void *)(a1 + 32);
    id v24 = v19;
    uint64_t v25 = v21;
    uint64_t v26 = v20;
    [v8 setFetchVideoAssetContextCompletionBlock:v23];
    id v22 = [*(id *)(a1 + 32) operationQueue];
    [v22 addOperation:v8];
  }
}

void __83__HFCameraClipVideoAssetContextProvider_fetchVideoAssetContextForClip_clipManager___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    v8 = [*(id *)(a1 + 40) videoContextFuturesByClipID];
    BOOL v9 = [*(id *)(a1 + 32) uniqueIdentifier];
    [v8 setObject:0 forKeyedSubscript:v9];

    uint64_t v10 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void **)(a1 + 32);
      int v16 = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Successfully fetched video context %@ for clip %@", (uint8_t *)&v16, 0x16u);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) finishWithResult:v5];
  }
  else
  {
    if (v6)
    {
      id v12 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 42);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v13 = v12;
    uint64_t v14 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = *(void **)(a1 + 32);
      int v16 = 138412546;
      id v17 = v15;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_error_impl(&dword_20B986000, v14, OS_LOG_TYPE_ERROR, "Failed to fetch video context for clip %@: %@", (uint8_t *)&v16, 0x16u);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) finishWithError:v13];
  }
}

- (id)newFetchVideoAssetContextOperationForClip:(id)a3 clipManager:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F0E1B0];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithClipManager:v6 clip:v7];

  return v8;
}

- (id)cachedVideoAssetContextForClip:(id)a3 clipManager:(id)a4
{
  return (id)[a4 videoSegmentsAssetContextForClip:a3];
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSMutableDictionary)videoContextFuturesByClipID
{
  return self->_videoContextFuturesByClipID;
}

- (HMFUnfairLock)lock
{
  return self->_lock;
}

- (HFCameraClipVideoAssetContextProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HFCameraClipVideoAssetContextProviderDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_videoContextFuturesByClipID, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end