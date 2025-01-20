@interface LPAssociatedApplicationMetadataFetcher
- (NSString)bundleIdentifier;
- (NSURL)URL;
- (void)_completedWithClipMetadata:(id)a3 iconURL:(id)a4 error:(id)a5;
- (void)_failedWithErrorCode:(int64_t)a3 underlyingError:(id)a4;
- (void)cancel;
- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)setBundleIdentifier:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation LPAssociatedApplicationMetadataFetcher

- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 rootEvent];
  v9 = [v8 childWithType:2 subtitle:0];
  [(LPFetcher *)self set_event:v9];

  URL = self->_URL;
  v11 = [(LPFetcher *)self _event];
  [v11 setURL:URL];

  v12 = _Block_copy(v7);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v12;

  v14 = (id)LPLogChannelFetching();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = [(LPFetcher *)self _loggingID];
    _os_log_impl(&dword_1A35DC000, v14, OS_LOG_TYPE_DEFAULT, "LPAssociatedApplicationMetadataFetcher<%d>: retrieving URL", buf, 8u);
  }

  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  v15 = (void *)getCPSClipURLClass_softClass;
  uint64_t v27 = getCPSClipURLClass_softClass;
  if (!getCPSClipURLClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __getCPSClipURLClass_block_invoke;
    v31 = &unk_1E5B04EB8;
    v32 = &v24;
    __getCPSClipURLClass_block_invoke((uint64_t)buf);
    v15 = (void *)v25[3];
  }
  id v16 = v15;
  _Block_object_dispose(&v24, 8);
  if ([v16 isSupported])
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v17 = (void *)getCPSClipMetadataRequestClass_softClass;
    uint64_t v27 = getCPSClipMetadataRequestClass_softClass;
    if (!getCPSClipMetadataRequestClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      v30 = __getCPSClipMetadataRequestClass_block_invoke;
      v31 = &unk_1E5B04EB8;
      v32 = &v24;
      __getCPSClipMetadataRequestClass_block_invoke((uint64_t)buf);
      v17 = (void *)v25[3];
    }
    v18 = v17;
    _Block_object_dispose(&v24, 8);
    v19 = (void *)[[v18 alloc] initWithURL:self->_URL fallbackClipBundleID:self->_bundleIdentifier];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __83__LPAssociatedApplicationMetadataFetcher_fetchWithConfiguration_completionHandler___block_invoke;
    v21[3] = &unk_1E5B054C0;
    id v22 = v19;
    v23 = self;
    id v20 = v19;
    [v20 requestMetadataWithCompletion:v21];
  }
  else
  {
    [(LPAssociatedApplicationMetadataFetcher *)self _failedWithErrorCode:2 underlyingError:0];
  }
}

void __83__LPAssociatedApplicationMetadataFetcher_fetchWithConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __83__LPAssociatedApplicationMetadataFetcher_fetchWithConfiguration_completionHandler___block_invoke_2;
    v8[3] = &unk_1E5B05498;
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 40);
    id v9 = v6;
    uint64_t v10 = v7;
    id v11 = v3;
    [v6 requestDownloadedIconWithMetadata:v11 completion:v8];
  }
  else
  {
    [*(id *)(a1 + 40) _failedWithErrorCode:2 underlyingError:0];
  }
}

void __83__LPAssociatedApplicationMetadataFetcher_fetchWithConfiguration_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__LPAssociatedApplicationMetadataFetcher_fetchWithConfiguration_completionHandler___block_invoke_3;
  v8[3] = &unk_1E5B05470;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = v3;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __83__LPAssociatedApplicationMetadataFetcher_fetchWithConfiguration_completionHandler___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = *(id *)(a1 + 32);
  [v1 _completedWithClipMetadata:v2 iconURL:v3 error:0];
}

- (void)cancel
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (self->_completionHandler)
  {
    uint64_t v3 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = [(LPFetcher *)self _loggingID];
      _os_log_impl(&dword_1A35DC000, v3, OS_LOG_TYPE_DEFAULT, "LPAssociatedApplicationMetadataFetcher<%d>: cancelling subresource load explicitly", (uint8_t *)v4, 8u);
    }

    [(LPAssociatedApplicationMetadataFetcher *)self _failedWithErrorCode:3 underlyingError:0];
  }
}

- (void)_failedWithErrorCode:(int64_t)a3 underlyingError:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_completionHandler)
  {
    if (a3 != 3)
    {
      id v7 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9[0] = 67109379;
        v9[1] = [(LPFetcher *)self _loggingID];
        __int16 v10 = 2117;
        id v11 = v6;
        _os_log_impl(&dword_1A35DC000, v7, OS_LOG_TYPE_DEFAULT, "LPAssociatedApplicationMetadataFetcher<%d>: failed to retrieve URL: %{sensitive}@", (uint8_t *)v9, 0x12u);
      }
    }
    v8 = makeLPError(a3, v6);
    [(LPAssociatedApplicationMetadataFetcher *)self _completedWithClipMetadata:0 iconURL:0 error:v8];
  }
}

- (void)_completedWithClipMetadata:(id)a3 iconURL:(id)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    uint64_t v12 = _Block_copy(completionHandler);
    id v13 = self->_completionHandler;
    self->_id completionHandler = 0;

    if (!v8) {
      goto LABEL_6;
    }
    v14 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v23 = [(LPFetcher *)self _loggingID];
      _os_log_impl(&dword_1A35DC000, v14, OS_LOG_TYPE_DEFAULT, "LPAssociatedApplicationMetadataFetcher<%d>: successfully retrieved metadata", buf, 8u);
    }

    v15 = [[LPFetcherClipMetadataResponse alloc] initWithClipMetadata:v8 iconURL:v9 fetcher:self];
    if (!v15) {
LABEL_6:
    }
      v15 = [[LPFetcherErrorResponse alloc] initWithError:v10 fetcher:self];
    id v16 = [(LPFetcher *)self _event];
    objc_msgSend(v16, "didCompleteWithErrorCode:", objc_msgSend(v10, "code"));

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __83__LPAssociatedApplicationMetadataFetcher__completedWithClipMetadata_iconURL_error___block_invoke;
    v19[3] = &unk_1E5B04F80;
    id v20 = v15;
    id v21 = v12;
    v17 = v15;
    id v18 = v12;
    dispatch_async(MEMORY[0x1E4F14428], v19);
  }
}

uint64_t __83__LPAssociatedApplicationMetadataFetcher__completedWithClipMetadata_iconURL_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end