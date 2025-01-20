@interface MFMessageURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (OS_os_log)log;
+ (_MFMessageURLProtocolRegistry)registry;
+ (id)canonicalRequestForRequest:(id)a3;
+ (id)contentRepresentationForURL:(id)a3;
+ (void)initialize;
+ (void)registerContentRepresentation:(id)a3;
+ (void)setRegistry:(id)a3;
- (EFCancelable)cancelable;
- (EFPromise)promise;
- (EMContentRepresentation)contentRepresentation;
- (MFMessageURLProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5;
- (id)_cachedResponseWithData:(id)a3 mimeType:(id)a4 error:(id *)a5;
- (void)dealloc;
- (void)setCancelable:(id)a3;
- (void)setContentRepresentation:(id)a3;
- (void)setPromise:(id)a3;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation MFMessageURLProtocol

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3 = (void *)MEMORY[0x1E4F290C0];
    [v3 registerClass:a1];
  }
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__MFMessageURLProtocol_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_8 != -1) {
    dispatch_once(&log_onceToken_8, block);
  }
  v2 = (void *)log_log_8;

  return (OS_os_log *)v2;
}

void __27__MFMessageURLProtocol_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_8;
  log_log_8 = (uint64_t)v1;
}

+ (_MFMessageURLProtocolRegistry)registry
{
  v2 = (void *)sPreferredRegistry;
  if (!sPreferredRegistry)
  {
    uint64_t v3 = +[_MFMessageURLProtocolRegistry sharedRegistry];
    v4 = (void *)sPreferredRegistry;
    sPreferredRegistry = v3;

    v2 = (void *)sPreferredRegistry;
  }

  return (_MFMessageURLProtocolRegistry *)v2;
}

+ (void)setRegistry:(id)a3
{
}

+ (void)registerContentRepresentation:(id)a3
{
  id v5 = a3;
  v4 = [a1 registry];
  [v4 registerContentRepresentation:v5];
}

+ (id)contentRepresentationForURL:(id)a3
{
  id v4 = a3;
  id v5 = [a1 registry];
  v6 = [v5 contentRepresentationForURL:v4];

  return v6;
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 URL];
  id v5 = [v4 scheme];

  BOOL v6 = [(id)*MEMORY[0x1E4F77AF8] caseInsensitiveCompare:v5] == 0;
  v7 = [v3 URL];
  v8 = [v7 resourceSpecifier];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    v10 = +[MFMessageURLProtocol log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MFMessageURLProtocol canInitWithRequest:]((uint64_t)v3, v10);
    }

    BOOL v6 = 0;
  }

  return v6;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 URL];
  id v5 = [v4 query];

  if (v5)
  {
    BOOL v6 = [MEMORY[0x1E4F29088] componentsWithURL:v4 resolvingAgainstBaseURL:0];
    [v6 setQuery:0];
    v7 = (void *)[v3 mutableCopy];
    v8 = [v6 URL];
    [v7 setURL:v8];
  }
  else
  {
    v7 = v3;
  }

  return v7;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  return 0;
}

- (void)dealloc
{
  [(MFMessageURLProtocol *)self stopLoading];
  v3.receiver = self;
  v3.super_class = (Class)MFMessageURLProtocol;
  [(NSURLProtocol *)&v3 dealloc];
}

- (MFMessageURLProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)MFMessageURLProtocol;
  v11 = [(NSURLProtocol *)&v26 initWithRequest:v8 cachedResponse:v9 client:v10];
  if (v11)
  {
    v12 = (EFPromise *)objc_alloc_init(MEMORY[0x1E4F60E18]);
    promise = v11->_promise;
    v11->_promise = v12;

    v14 = objc_opt_class();
    v15 = [v8 mainDocumentURL];
    uint64_t v16 = [v14 contentRepresentationForURL:v15];
    contentRepresentation = v11->_contentRepresentation;
    v11->_contentRepresentation = (EMContentRepresentation *)v16;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v11);
    v18 = [(EFPromise *)v11->_promise future];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__MFMessageURLProtocol_initWithRequest_cachedResponse_client___block_invoke;
    v23[3] = &unk_1E5F7CCB8;
    objc_copyWeak(&v24, &location);
    [v18 addSuccessBlock:v23];

    v19 = [(EFPromise *)v11->_promise future];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __62__MFMessageURLProtocol_initWithRequest_cachedResponse_client___block_invoke_2;
    v21[3] = &unk_1E5F7C540;
    objc_copyWeak(&v22, &location);
    [v19 addFailureBlock:v21];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __62__MFMessageURLProtocol_initWithRequest_cachedResponse_client___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained client];
  id v5 = [v9 response];
  [v4 URLProtocol:WeakRetained didReceiveResponse:v5 cacheStoragePolicy:2];

  BOOL v6 = [WeakRetained client];
  v7 = [v9 data];
  [v6 URLProtocol:WeakRetained didLoadData:v7];

  id v8 = [WeakRetained client];
  [v8 URLProtocolDidFinishLoading:WeakRetained];
}

void __62__MFMessageURLProtocol_initWithRequest_cachedResponse_client___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained client];
  [v4 URLProtocol:WeakRetained didFailWithError:v5];
}

- (id)_cachedResponseWithData:(id)a3 mimeType:(id)a4 error:(id *)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = [v8 length];
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = -1;
    }
    id v12 = objc_alloc(MEMORY[0x1E4F290D8]);
    v13 = [(NSURLProtocol *)self request];
    v14 = [v13 URL];
    v15 = (void *)[v12 initWithURL:v14 MIMEType:v9 expectedContentLength:v11 textEncodingName:0];

    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B70]) initWithResponse:v15 data:v8 userInfo:0 storagePolicy:2];
    v17 = 0;
    if (!a5) {
      goto LABEL_9;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F289B0];
    v19 = [(NSURLProtocol *)self request];
    v20 = [v19 URL];
    v24[0] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v17 = [v18 errorWithDomain:*MEMORY[0x1E4F289A0] code:-1008 userInfo:v21];

    uint64_t v16 = 0;
    if (!a5) {
      goto LABEL_9;
    }
  }
  *a5 = v17;
LABEL_9:

  return v16;
}

- (void)startLoading
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(NSURLProtocol *)self request];
  id v5 = [v4 URL];

  BOOL v6 = [MEMORY[0x1E4F29088] componentsWithURL:v5 resolvingAgainstBaseURL:0];
  v7 = [v6 path];
  id v8 = [(EMContentRepresentation *)self->_contentRepresentation relatedContentItems];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __36__MFMessageURLProtocol_startLoading__block_invoke;
  v50[3] = &unk_1E5F7CCE0;
  id v9 = v7;
  id v51 = v9;
  uint64_t v10 = objc_msgSend(v8, "ef_firstObjectPassingTest:", v50);

  if (v10)
  {
    uint64_t v11 = [v10 mailDropMetadata];
    BOOL v12 = v11 == 0;

    if (v12)
    {
      id v13 = [MEMORY[0x1E4F60250] optionsWithRequestedRepresentationType:*MEMORY[0x1E4F5FCB0] networkUsage:1];
      id v14 = [MEMORY[0x1E4F60E18] promise];
      v15 = [v14 completionHandlerAdapter];
      uint64_t v16 = [v10 requestRepresentationWithOptions:v13 completionHandler:v15];
      [(MFMessageURLProtocol *)self setCancelable:v16];

      v17 = [v14 future];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __36__MFMessageURLProtocol_startLoading__block_invoke_2;
      v47[3] = &unk_1E5F7CD30;
      id v48 = v10;
      v49 = self;
      v18 = [v17 then:v47];

      v19 = [(MFMessageURLProtocol *)self promise];
      [v19 finishWithFuture:v18];

      goto LABEL_8;
    }
LABEL_7:
    uint64_t v23 = [(MFMessageURLProtocol *)self promise];
    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v52 = *MEMORY[0x1E4F289B0];
    id v14 = [(NSURLProtocol *)self request];
    v25 = [v14 URL];
    v53 = v25;
    objc_super v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    v27 = [v24 errorWithDomain:*MEMORY[0x1E4F289A0] code:-1008 userInfo:v26];
    [v23 finishWithError:v27];

    id v13 = v23;
    goto LABEL_8;
  }
  v20 = [MEMORY[0x1E4F77B78] defaultManager];
  id v13 = [v20 attachmentForContentID:v9 preferredSchemes:&unk_1F0841A28];

  if (!v13) {
    goto LABEL_7;
  }
  v21 = [v13 url];
  id v22 = [v21 scheme];
  if ([@"x-attach-compose" caseInsensitiveCompare:v22])
  {
  }
  else
  {
    char v28 = [v13 isDisplayableInline];

    if ((v28 & 1) == 0)
    {
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __36__MFMessageURLProtocol_startLoading__block_invoke_4;
      v44[3] = &unk_1E5F79038;
      id v13 = v13;
      id v45 = v13;
      v46 = self;
      v37 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
      [v37 performBlock:v44];

      id v14 = v45;
      goto LABEL_8;
    }
  }
  if ([v13 isDisplayableInline])
  {
    uint64_t v29 = [v13 mimeType];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __36__MFMessageURLProtocol_startLoading__block_invoke_5;
    v39[3] = &unk_1E5F7CD58;
    objc_copyWeak(&v42, &location);
    id v40 = v5;
    id v14 = (id)v29;
    id v41 = v14;
    [v13 setFetchCompletionBlock:v39];
    [v13 setWantsCompletionBlockOffMainThread:1];
    v30 = [(MFMessageURLProtocol *)self cancelable];
    LOBYTE(v29) = v30 == 0;

    if ((v29 & 1) == 0)
    {
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      [v38 handleFailureInMethod:a2 object:self file:@"MFMessageURLProtocol.m" lineNumber:280 description:@"should only get here once"];
    }
    v31 = [v13 fetchData];
    [(MFMessageURLProtocol *)self setCancelable:v31];

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
  else
  {
    id v14 = [(MFMessageURLProtocol *)self promise];
    v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F289B0];
    v33 = [(NSURLProtocol *)self request];
    v34 = [v33 URL];
    v55[0] = v34;
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
    v36 = [v32 errorWithDomain:*MEMORY[0x1E4F289A0] code:-1103 userInfo:v35];
    [v14 finishWithError:v36];
  }
LABEL_8:
}

uint64_t __36__MFMessageURLProtocol_startLoading__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 contentID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id __36__MFMessageURLProtocol_startLoading__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1E4F60D70];
  id v5 = [MEMORY[0x1E4F60F28] immediateScheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__MFMessageURLProtocol_startLoading__block_invoke_3;
  v11[3] = &unk_1E5F7CD08;
  id v6 = v3;
  id v12 = v6;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v13 = v7;
  uint64_t v14 = v8;
  id v9 = [v4 onScheduler:v5 futureWithBlock:v11];

  return v9;
}

id __36__MFMessageURLProtocol_startLoading__block_invoke_3(id *a1, uint64_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9B8];
  id v5 = [a1[4] contentURL];
  id v6 = [v4 dataWithContentsOfURL:v5 options:8 error:a2];

  if (v6)
  {
    id v7 = [a1[5] type];
    uint64_t v8 = [v7 preferredMIMEType];

    if (v8) {
      id v9 = (__CFString *)v8;
    }
    else {
      id v9 = @"application/octet-stream";
    }
    uint64_t v10 = [a1[6] _cachedResponseWithData:v6 mimeType:v9 error:a2];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void __36__MFMessageURLProtocol_startLoading__block_invoke_4(uint64_t a1)
{
  v2 = +[MFAttachmentImageGenerator pngDataForAttachment:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 40);
  id v7 = 0;
  uint64_t v4 = [v3 _cachedResponseWithData:v2 mimeType:@"image/png" error:&v7];
  id v5 = v7;
  id v6 = [*(id *)(a1 + 40) promise];
  [v6 finishWithResult:v4 error:v5];
}

void __36__MFMessageURLProtocol_startLoading__block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = WeakRetained;
  if (v6)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v19 = 0;
    uint64_t v11 = [WeakRetained _cachedResponseWithData:v6 mimeType:v10 error:&v19];
    id v12 = v19;
    id v13 = (void *)v11;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *MEMORY[0x1E4F28A50];
    v20[0] = *MEMORY[0x1E4F289B0];
    v20[1] = v16;
    v21[0] = v15;
    v21[1] = v7;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    id v12 = [v14 errorWithDomain:*MEMORY[0x1E4F289A0] code:-1008 userInfo:v17];

    id v13 = 0;
  }
  v18 = [v9 promise];
  [v18 finishWithResult:v13 error:v12];
}

- (void)stopLoading
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MFMessageURLProtocol *)self promise];
  uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F289B0];
  id v5 = [(NSURLProtocol *)self request];
  id v6 = [v5 URL];
  v11[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = [v4 errorWithDomain:*MEMORY[0x1E4F289A0] code:-999 userInfo:v7];
  [v3 finishWithError:v8];

  id v9 = [(MFMessageURLProtocol *)self cancelable];
  [v9 cancel];
}

- (EFCancelable)cancelable
{
  return self->_cancelable;
}

- (void)setCancelable:(id)a3
{
}

- (EFPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
}

- (EMContentRepresentation)contentRepresentation
{
  return self->_contentRepresentation;
}

- (void)setContentRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRepresentation, 0);
  objc_storeStrong((id *)&self->_promise, 0);

  objc_storeStrong((id *)&self->_cancelable, 0);
}

+ (void)canInitWithRequest:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF945000, a2, OS_LOG_TYPE_ERROR, "Attempting to load a request via CID without a resource specifier: %@", (uint8_t *)&v2, 0xCu);
}

@end