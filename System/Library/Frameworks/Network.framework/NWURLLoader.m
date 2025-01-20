@interface NWURLLoader
- (BOOL)allowsWrite;
- (BOOL)requestComplete;
- (NSString)multipartMixedReplaceBoundary;
- (OS_nw_connection)underlyingConnection;
- (OS_nw_http_fields)trailerFields;
- (OS_sec_trust)peerTrust;
- (id)initWithRequest:(void *)a3 configuration:(void *)a4 queue:(void *)a5 client:(void *)a6 protocolClass:;
- (id)takeCachedResponse;
- (void)URLProtocol:(id)a3 cachedResponseIsValid:(id)a4;
- (void)URLProtocol:(id)a3 didFailWithError:(id)a4;
- (void)URLProtocol:(id)a3 didLoadData:(id)a4;
- (void)URLProtocol:(id)a3 didReceiveAuthenticationChallenge:(id)a4;
- (void)URLProtocol:(id)a3 didReceiveResponse:(id)a4 cacheStoragePolicy:(unint64_t)a5;
- (void)URLProtocol:(id)a3 wasRedirectedToRequest:(id)a4 redirectResponse:(id)a5;
- (void)URLProtocolDidFinishLoading:(id)a3;
- (void)afterCacheLookup:(uint64_t)a1;
- (void)fulfillData:(int)a3 complete:;
- (void)fulfillError:(uint64_t)a1;
- (void)fulfillResponse:(void *)a1;
- (void)notifyRequestCompletion:(id)a3;
- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5;
- (void)readResponse:(id)a3;
- (void)start:(id)a3;
- (void)stop;
- (void)updateClient:(id)a3;
- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation NWURLLoader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_readRequest, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong(&self->_awaitingResponse, 0);
  objc_storeStrong((id *)&self->_cachedResponseInternal, 0);
  objc_storeStrong((id *)&self->_dataToCache, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_protocolClass, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)URLProtocol:(id)a3 didReceiveAuthenticationChallenge:(id)a4
{
  id v5 = a4;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke;
  v8[3] = &unk_1E524B9A0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    v2 = *(void **)(v1 + 32);
  }
  else {
    v2 = 0;
  }
  v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke_2;
  v4[3] = &unk_1E5244090;
  v4[4] = v1;
  id v5 = v3;
  [v2 loaderDidReceiveChallenge:v5 completionHandler:v4];
}

void __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    v8 = *(void **)(v7 + 32);
  }
  else {
    v8 = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke_3;
  v10[3] = &unk_1E5249FB0;
  uint64_t v13 = a2;
  id v11 = v5;
  id v12 = *(id *)(a1 + 40);
  id v9 = v6;
  [v8 loaderRunDelegateBlock:v10];
}

void __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke_3(uint64_t a1)
{
  switch(*(void *)(a1 + 48))
  {
    case 0:
      uint64_t v2 = *(void *)(a1 + 32);
      v3 = [*(id *)(a1 + 40) sender];
      id v4 = v3;
      if (v2) {
        [v3 useCredential:*(void *)(a1 + 32) forAuthenticationChallenge:*(void *)(a1 + 40)];
      }
      else {
        [v3 continueWithoutCredentialForAuthenticationChallenge:*(void *)(a1 + 40)];
      }
      goto LABEL_7;
    case 1:
      id v4 = [*(id *)(a1 + 40) sender];
      [v4 performDefaultHandlingForAuthenticationChallenge:*(void *)(a1 + 40)];
      goto LABEL_7;
    case 2:
      id v4 = [*(id *)(a1 + 40) sender];
      [v4 cancelAuthenticationChallenge:*(void *)(a1 + 40)];
      goto LABEL_7;
    case 3:
      id v4 = [*(id *)(a1 + 40) sender];
      [v4 rejectProtectionSpaceAndContinueWithChallenge:*(void *)(a1 + 40)];
LABEL_7:

      break;
    default:
      return;
  }
}

- (void)URLProtocol:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__NWURLLoader_URLProtocol_didFailWithError___block_invoke;
  v8[3] = &unk_1E524B9A0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __44__NWURLLoader_URLProtocol_didFailWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) code];
  if (v2)
  {
    uint64_t v4 = v3;
    id v5 = [NWURLError alloc];
    v6 = [v2[4] loaderTask];
    id v7 = v2;
    id v8 = v6;
    if (v5
      && (uint64_t v9 = *MEMORY[0x1E4F289A0],
          v12.receiver = v5,
          v12.super_class = (Class)NWURLError,
          (id v10 = objc_msgSendSuper2(&v12, sel_initWithDomain_code_userInfo_, v9, v4, 0)) != 0))
    {
      id v11 = v10;
      [v10 fillErrorForLoader:v7 andTask:v8];
    }
    else
    {
      id v11 = 0;
    }

    [v11 setUnderlyingError:*(void *)(a1 + 40)];
  }
  else
  {
    id v11 = 0;
    [0 setUnderlyingError:*(void *)(a1 + 40)];
  }
  -[NWURLLoader fulfillError:](*(void *)(a1 + 32), v11);
}

- (void)fulfillError:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v8 = v4;
    if (!*(unsigned char *)(a1 + 8) && !*(void *)(a1 + 128)) {
      objc_storeStrong((id *)(a1 + 128), a2);
    }
    id v5 = *(void **)(a1 + 104);
    if (v5)
    {
      v6 = v5;
      objc_setProperty_nonatomic_copy((id)a1, v7, 0, 104);
      v6[2](v6, 0, v8);
    }
    -[NWURLSessionReadRequest putError:](*(void *)(a1 + 120), v8);
    id v4 = v8;
  }
}

- (void)URLProtocolDidFinishLoading:(id)a3
{
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__NWURLLoader_URLProtocolDidFinishLoading___block_invoke;
  block[3] = &unk_1E524BAA8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __43__NWURLLoader_URLProtocolDidFinishLoading___block_invoke(uint64_t a1)
{
}

- (void)fulfillData:(int)a3 complete:
{
  id v5 = a2;
  if (a1)
  {
    v6 = *(NSObject **)(a1 + 80);
    data2 = v5;
    if (v5)
    {
      if (v6)
      {
        SEL v7 = v6;
        dispatch_data_t concat = dispatch_data_create_concat(v7, data2);
        uint64_t v9 = *(void **)(a1 + 80);
        *(void *)(a1 + 80) = concat;

        v6 = *(NSObject **)(a1 + 80);
        if (dispatch_data_get_size(v6) > *(void *)(a1 + 96))
        {
          *(void *)(a1 + 80) = 0;

          v6 = *(NSObject **)(a1 + 80);
        }
      }
    }
    if (v6 && a3)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F18D20]);
      id v11 = *(void **)(a1 + 112);
      uint64_t v12 = *(void *)(a1 + 72);
      id v13 = *(id *)(a1 + 80);
      id v14 = v11;
      uint64_t v15 = [v10 initWithResponse:v14 data:v13 userInfo:0 storagePolicy:v12];
      v16 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v15;

      v17 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = 0;
    }
    *(unsigned char *)(a1 + 8) = a3;
    -[NWURLSessionReadRequest putData:complete:](*(void *)(a1 + 120), data2, a3);
    id v5 = data2;
  }
}

- (void)URLProtocol:(id)a3 didLoadData:(id)a4
{
  id v5 = a4;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__NWURLLoader_URLProtocol_didLoadData___block_invoke;
  v8[3] = &unk_1E524B9A0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __39__NWURLLoader_URLProtocol_didLoadData___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) _createDispatchData];
  -[NWURLLoader fulfillData:complete:](v1, v2, 0);
}

- (void)URLProtocol:(id)a3 didReceiveResponse:(id)a4 cacheStoragePolicy:(unint64_t)a5
{
  id v7 = a4;
  if (self) {
    client = self->_client;
  }
  else {
    client = 0;
  }
  id v9 = [(NWURLLoaderClient *)client loaderDataTask];

  if (v9)
  {
    unint64_t v10 = a5;
    if (!a5) {
      goto LABEL_11;
    }
    if (a5 == 1)
    {
      if (self) {
        cache = self->_cache;
      }
      else {
        cache = 0;
      }
      uint64_t v12 = cache;
      double v13 = (double)[(NSURLCache *)v12 memoryCapacity];
      if (self) {
        id v14 = self->_cache;
      }
      else {
        id v14 = 0;
      }
      [(NSURLCache *)v14 _maxCacheableEntrySizeRatio];
      unint64_t v10 = (unint64_t)(v15 * v13);

LABEL_11:
      if (self) {
        v16 = self->_cache;
      }
      else {
        v16 = 0;
      }
      v17 = v16;
      double v18 = (double)[(NSURLCache *)v17 diskCapacity];
      if (self) {
        v19 = self->_cache;
      }
      else {
        v19 = 0;
      }
      [(NSURLCache *)v19 _maxCacheableEntrySizeRatio];
      unint64_t v21 = (unint64_t)(v20 * v18);

      if (v10 <= v21) {
        unint64_t v22 = v21;
      }
      else {
        unint64_t v22 = v10;
      }
      if (self) {
        goto LABEL_19;
      }
LABEL_22:
      queue = 0;
      goto LABEL_20;
    }
  }
  unint64_t v22 = 0;
  if (!self) {
    goto LABEL_22;
  }
LABEL_19:
  queue = self->_queue;
LABEL_20:
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __65__NWURLLoader_URLProtocol_didReceiveResponse_cacheStoragePolicy___block_invoke;
  v25[3] = &unk_1E5244068;
  id v26 = v7;
  v27 = self;
  unint64_t v28 = v22;
  unint64_t v29 = a5;
  id v24 = v7;
  dispatch_async(queue, v25);
}

void __65__NWURLLoader_URLProtocol_didReceiveResponse_cacheStoragePolicy___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    if ([*(id *)(a1 + 32) expectedContentLength] <= *(void *)(a1 + 48))
    {
      uint64_t v2 = *(void *)(a1 + 40);
      if (v2)
      {
        *(void *)(v2 + 72) = *(void *)(a1 + 56);
        uint64_t v3 = *(void *)(a1 + 40);
        if (v3)
        {
          objc_storeStrong((id *)(v3 + 80), MEMORY[0x1E4F14410]);
          uint64_t v4 = *(void *)(a1 + 40);
          if (v4) {
            *(void *)(v4 + 96) = *(void *)(a1 + 48);
          }
        }
      }
    }
  }
  v6 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);

  -[NWURLLoader fulfillResponse:](v5, v6);
}

- (void)fulfillResponse:(void *)a1
{
  id v7 = a2;
  if (a1)
  {
    uint64_t v3 = (void *)a1[13];
    if (v3)
    {
      uint64_t v4 = v3;
      objc_setProperty_nonatomic_copy(a1, v5, 0, 104);
      v4[2](v4, v7, 0);
    }
    else
    {
      id v6 = v7;
      uint64_t v4 = (void (**)(id, id, void))a1[14];
      a1[14] = v6;
    }
  }
}

- (void)URLProtocol:(id)a3 cachedResponseIsValid:(id)a4
{
  id v5 = a4;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__NWURLLoader_URLProtocol_cachedResponseIsValid___block_invoke;
  v8[3] = &unk_1E524B9A0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __49__NWURLLoader_URLProtocol_cachedResponseIsValid___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) response];
  -[NWURLLoader fulfillResponse:](v2, v3);

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 32);
  }
  else {
    id v5 = 0;
  }
  uint64_t v6 = [v5 loaderDataTask];
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = (id)v6;
  if (v6 && v7)
  {
    objc_storeStrong((id *)(v7 + 88), *(id *)(a1 + 40));
    uint64_t v7 = *(void *)(a1 + 32);
  }
  id v8 = [*(id *)(a1 + 40) data];
  id v9 = (void *)[v8 _createDispatchData];
  -[NWURLLoader fulfillData:complete:](v7, v9, 1);
}

- (void)URLProtocol:(id)a3 wasRedirectedToRequest:(id)a4 redirectResponse:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__NWURLLoader_URLProtocol_wasRedirectedToRequest_redirectResponse___block_invoke;
  block[3] = &unk_1E5249868;
  block[4] = self;
  id v14 = v8;
  id v15 = v7;
  id v11 = v7;
  id v12 = v9;
  dispatch_async(queue, block);
}

uint64_t __67__NWURLLoader_URLProtocol_wasRedirectedToRequest_redirectResponse___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  if (v1) {
    uint64_t v1 = (void *)v1[4];
  }
  return [v1 loaderWillPerformHTTPRedirection:a1[5] newRequest:a1[6]];
}

- (OS_nw_connection)underlyingConnection
{
  result = (OS_nw_connection *)_os_crash();
  __break(1u);
  return result;
}

- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  _os_crash();
  __break(1u);
}

- (BOOL)allowsWrite
{
  return 0;
}

- (OS_nw_http_fields)trailerFields
{
  return 0;
}

- (id)takeCachedResponse
{
  if (self)
  {
    uint64_t v3 = self->_cachedResponseInternal;
    cachedResponseInternal = self->_cachedResponseInternal;
    self->_cachedResponseInternal = 0;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)notifyRequestCompletion:(id)a3
{
}

- (BOOL)requestComplete
{
  return 1;
}

- (OS_sec_trust)peerTrust
{
  return 0;
}

- (NSString)multipartMixedReplaceBoundary
{
  return 0;
}

- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  if (self)
  {
    readRequest = self->_readRequest;
    if (readRequest)
    {
      readRequest->_minimumLength = a3;
      readRequest->_maximumLength = a4;
      objc_setProperty_nonatomic_copy(readRequest, a2, a5, 32);
      -[NWURLSessionReadRequest tryFulfillRequest]((uint64_t)readRequest);
    }
  }
}

- (void)readResponse:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (self)
  {
    if (self->_error)
    {
      v4[2](v4, 0);
    }
    else
    {
      response = self->_response;
      if (response) {
        ((void (*)(void (**)(id, void), NSURLResponse *, void))v4[2])(v4, response, 0);
      }
      else {
        objc_setProperty_nonatomic_copy(self, 0, v4, 104);
      }
    }
  }

  MEMORY[0x1F4181870]();
}

- (void)updateClient:(id)a3
{
  id v5 = a3;
  if (self) {
    objc_storeStrong((id *)&self->_client, a3);
  }
}

- (void)stop
{
  if (self)
  {
    uint64_t v3 = [NWURLError alloc];
    uint64_t v4 = [(NWURLLoaderClient *)self->_client loaderTask];
    id v5 = self;
    id v6 = v4;
    if (v3)
    {
      uint64_t v7 = *MEMORY[0x1E4F289A0];
      v12.receiver = v3;
      v12.super_class = (Class)NWURLError;
      id v8 = [(NWURLLoader *)&v12 initWithDomain:v7 code:-999 userInfo:0];
      uint64_t v3 = (NWURLError *)v8;
      if (v8) {
        [(NWURLLoader *)v8 fillErrorForLoader:v5 andTask:v6];
      }
    }

    -[NWURLLoader fulfillError:]((uint64_t)v5, v3);
    client = self->_client;
  }
  else
  {
    client = 0;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __19__NWURLLoader_stop__block_invoke;
  v11[3] = &unk_1E524BAA8;
  v11[4] = self;
  [(NWURLLoaderClient *)client loaderRunDelegateBlock:v11];
  if (self)
  {
    id v10 = self->_client;
    self->_client = 0;
  }
}

void __19__NWURLLoader_stop__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 64);
  }
  else {
    uint64_t v3 = 0;
  }
  [v3 stopLoading];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = 0;
  }
}

- (void)start:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  id v5 = objc_alloc_init(NWURLSessionReadRequest);
  if (self)
  {
    readRequest = self->_readRequest;
    self->_readRequest = v5;

    uint64_t v7 = self->_configuration;
    id v8 = v7;
    if (v7)
    {
      uint64_t v7 = [(NSURLSessionConfiguration *)v7->_configuration URLCache];
    }
    cache = self->_cache;
    self->_cache = (NSURLCache *)v7;

    client = self->_client;
  }
  else
  {

    client = 0;
  }
  id v11 = client;
  objc_super v12 = [(NWURLLoaderClient *)v11 loaderDataTask];

  if (self && self->_cache && v12)
  {
    double v13 = self->_client;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __21__NWURLLoader_start___block_invoke;
    v14[3] = &unk_1E524B9A0;
    v14[4] = self;
    id v15 = v12;
    [(NWURLLoaderClient *)v13 loaderRunDelegateBlock:v14];
  }
  else
  {
    -[NWURLLoader afterCacheLookup:]((uint64_t)self, 0);
  }
  v4[2](v4);
}

uint64_t __21__NWURLLoader_start___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 56);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __21__NWURLLoader_start___block_invoke_2;
  v6[3] = &unk_1E52489D0;
  v6[4] = v2;
  return [v3 getCachedResponseForDataTask:v4 completionHandler:v6];
}

- (void)afterCacheLookup:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 && !*(void *)(a1 + 128))
  {
    id v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __32__NWURLLoader_afterCacheLookup___block_invoke;
    v6[3] = &unk_1E524B9A0;
    v6[4] = a1;
    id v7 = v3;
    [v5 loaderRunDelegateBlock:v6];
  }
}

void __32__NWURLLoader_afterCacheLookup___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(objc_class **)(v2 + 48);
  }
  else {
    id v3 = 0;
  }
  id v4 = [v3 alloc];
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    id v5 = (void *)v5[4];
  }
  id v6 = v5;
  id v7 = [v6 loaderTask];
  id v8 = (void *)[v4 initWithTask:v7 cachedResponse:*(void *)(a1 + 40) client:*(void *)(a1 + 32)];
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    objc_storeStrong((id *)(v9 + 64), v8);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    id v11 = *(void **)(v10 + 64);
  }
  else {
    id v11 = 0;
  }
  [v11 startLoading];
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    if (*(void *)(v12 + 64)) {
      return;
    }
    double v13 = *(NSObject **)(v12 + 40);
  }
  else
  {
    double v13 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__NWURLLoader_afterCacheLookup___block_invoke_2;
  block[3] = &unk_1E524BAA8;
  block[4] = v12;
  dispatch_async(v13, block);
}

void __32__NWURLLoader_afterCacheLookup___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(id **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = [NWURLError alloc];
    id v3 = [v1[4] loaderTask];
    id v4 = v1;
    id v5 = v3;
    if (v2
      && (uint64_t v6 = *MEMORY[0x1E4F289A0],
          v8.receiver = v2,
          v8.super_class = (Class)NWURLError,
          (id v7 = objc_msgSendSuper2(&v8, sel_initWithDomain_code_userInfo_, v6, -999, 0)) != 0))
    {
      [v7 fillErrorForLoader:v4 andTask:v5];
    }
    else
    {
      id v7 = 0;
    }

    -[NWURLLoader fulfillError:]((uint64_t)v4, v7);
  }
  else
  {
    id v7 = 0;
  }
}

void __21__NWURLLoader_start___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(NSObject **)(v4 + 40);
  }
  else {
    id v5 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __21__NWURLLoader_start___block_invoke_3;
  v7[3] = &unk_1E524B9A0;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __21__NWURLLoader_start___block_invoke_3(uint64_t a1)
{
}

- (id)initWithRequest:(void *)a3 configuration:(void *)a4 queue:(void *)a5 client:(void *)a6 protocolClass:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)NWURLLoader;
    a1 = (id *)objc_msgSendSuper2(&v18, sel_init);
    if (a1)
    {
      uint64_t v15 = [a6 canonicalRequestForRequest:v11];
      id v16 = a1[2];
      a1[2] = (id)v15;

      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a5);
      objc_storeStrong(a1 + 5, a4);
      objc_storeStrong(a1 + 6, a6);
    }
  }

  return a1;
}

void __111__NWURLLoader_makeLoaderForRequest_bodyKnownSize_configuration_queue_client_protocolClasses_completionHandler___block_invoke(id *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)a1[4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = a1[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v9 = [a1[6] loaderTask];
        int v10 = [v8 canInitWithTask:v9];

        if (v10)
        {
          id v11 = -[NWURLLoader initWithRequest:configuration:queue:client:protocolClass:]((id *)[NWURLLoader alloc], a1[7], a1[8], a1[9], a1[6], v8);

          uint64_t v2 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __111__NWURLLoader_makeLoaderForRequest_bodyKnownSize_configuration_queue_client_protocolClasses_completionHandler___block_invoke_2;
  v15[3] = &unk_1E524B950;
  id v12 = a1[9];
  id v13 = a1[10];
  id v16 = v2;
  id v17 = v13;
  id v14 = v2;
  dispatch_async(v12, v15);
}

uint64_t __111__NWURLLoader_makeLoaderForRequest_bodyKnownSize_configuration_queue_client_protocolClasses_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end