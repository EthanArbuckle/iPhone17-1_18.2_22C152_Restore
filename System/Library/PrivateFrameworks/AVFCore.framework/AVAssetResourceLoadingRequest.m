@interface AVAssetResourceLoadingRequest
+ (SEL)_selectorForInformingDelegateOfCancellationByFig;
- (AVAssetResourceLoadingContentInformationRequest)contentInformationRequest;
- (AVAssetResourceLoadingDataRequest)dataRequest;
- (AVAssetResourceLoadingRequest)init;
- (AVAssetResourceLoadingRequest)initWithResourceLoader:(id)a3 URL:(id)a4 httpRequestHeaders:(id)a5 requestOffset:(id)a6 requestLength:(id)a7 allowedContentTypes:(id)a8 figCryptor:(OpaqueFigCPECryptor *)a9 cryptorKeyRequestID:(unint64_t)a10;
- (AVAssetResourceLoadingRequest)initWithResourceLoader:(id)a3 requestInfo:(__CFDictionary *)a4 requestID:(unint64_t)a5;
- (AVAssetResourceLoadingRequestor)requestor;
- (BOOL)_canSetOrUseCachedContentInformation;
- (BOOL)_contentKeySessionIsAttached;
- (BOOL)_isRequestForContentKey;
- (BOOL)_tryToMarkAsCancelled;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (NSData)persistentContentKeyFromKeyVendorResponse:(NSData *)keyVendorResponse options:(NSDictionary *)options error:(NSError *)outError;
- (NSData)streamingContentKeyRequestDataForApp:(NSData *)appIdentifier contentIdentifier:(NSData *)contentIdentifier options:(NSDictionary *)options error:(NSError *)outError;
- (NSString)description;
- (NSURLRequest)redirect;
- (NSURLRequest)request;
- (NSURLResponse)response;
- (OpaqueFigCustomURLHandler)_copyContentKeySessionCustomURLHandler;
- (OpaqueFigCustomURLHandler)_customURLHandler;
- (OpaqueFigCustomURLLoader)_customURLLoader;
- (__CFDictionary)_requestInfo;
- (id)_getAndClearCachedData;
- (id)_resourceLoader;
- (id)_weakReference;
- (id)keyRequestDataUsingCryptorForApp:(id)a3 contentIdentifier:(id)a4 options:(id)a5 performAsync:(BOOL)a6 error:(id *)a7;
- (id)serializableRepresentation;
- (unint64_t)_requestID;
- (void)_appendToCachedData:(id)a3;
- (void)_cacheContentInformation:(id)a3;
- (void)_ensureResponseInfoSentToCustomURLHandler;
- (void)_performCancellationByClient;
- (void)_sendDataToCustomURLHandler:(id)a3;
- (void)_sendFinishLoadingToCustomURLHandler;
- (void)_sendFinishLoadingToCustomURLHandlerWithError:(id)a3;
- (void)_sendResponseInfoToCustomURLHandler;
- (void)_setContentInformationRequest:(id)a3;
- (void)_setDataRequest:(id)a3;
- (void)dealloc;
- (void)finishLoading;
- (void)finishLoadingWithError:(NSError *)error;
- (void)finishLoadingWithResponse:(NSURLResponse *)response data:(NSData *)data redirect:(NSURLRequest *)redirect;
- (void)forwardRequestToContentKeySession;
- (void)generateStreamingContentKeyRequestDataAsynchronouslyForApp:(id)a3 contentIdentifier:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)setRedirect:(NSURLRequest *)redirect;
- (void)setResponse:(NSURLResponse *)response;
@end

@implementation AVAssetResourceLoadingRequest

- (AVAssetResourceLoadingRequest)init
{
  return [(AVAssetResourceLoadingRequest *)self initWithResourceLoader:0 URL:0 httpRequestHeaders:0 requestOffset:0 requestLength:0 allowedContentTypes:0 figCryptor:0 cryptorKeyRequestID:0];
}

- (AVAssetResourceLoadingRequest)initWithResourceLoader:(id)a3 requestInfo:(__CFDictionary *)a4 requestID:(unint64_t)a5
{
  if (!FigCustomURLRequestInfoCopyURL())
  {
    int v9 = FigCustomURLRequestInfoCopyHTTPHeaders();
    if (!v9 || v9 == -17360)
    {
      int ByteRange = FigCustomURLRequestInfoGetByteRange();
      if (ByteRange == -17360)
      {
        uint64_t v11 = 0;
        uint64_t v12 = 0;
      }
      else
      {
        if (ByteRange) {
          goto LABEL_17;
        }
        uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:0];
        uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:0];
      }
      int v13 = FigCustomURLRequestInfoCopyCryptor();
      if (!v13 || v13 == -17360)
      {
        int v14 = FigCustomURLRequestInfoCopyAllowedUniversalTypeIdentifiers();
        if (!v14 || v14 == -17360)
        {
          self = [(AVAssetResourceLoadingRequest *)self initWithResourceLoader:a3 URL:0 httpRequestHeaders:0 requestOffset:v12 requestLength:v11 allowedContentTypes:0 figCryptor:0 cryptorKeyRequestID:0];
          if (self)
          {
            if (a4) {
              v15 = (__CFDictionary *)CFRetain(a4);
            }
            else {
              v15 = 0;
            }
            self->_loadingRequest->requestInfo = v15;
            self->_loadingRequest->requestID = a5;
          }
        }
      }
    }
  }
LABEL_17:

  return self;
}

- (AVAssetResourceLoadingRequest)initWithResourceLoader:(id)a3 URL:(id)a4 httpRequestHeaders:(id)a5 requestOffset:(id)a6 requestLength:(id)a7 allowedContentTypes:(id)a8 figCryptor:(OpaqueFigCPECryptor *)a9 cryptorKeyRequestID:(unint64_t)a10
{
  v32.receiver = self;
  v32.super_class = (Class)AVAssetResourceLoadingRequest;
  v16 = [(AVAssetResourceLoadingRequest *)&v32 init];
  if (v16)
  {
    v17 = objc_alloc_init(AVAssetResourceLoadingRequestInternal);
    v16->_loadingRequest = v17;
    if (v17
      && (CFRetain(v17),
          v16->_loadingRequest->weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v16), v16->_loadingRequest->weakReferenceToResourceLoader = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3), v16->_loadingRequest->URLRequest = (NSMutableURLRequest *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:a4], v16->_loadingRequest->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avassetresourceloadingrequest.ivars"), v16->_loadingRequest->dataCachingQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avassetresourceloadingrequest.dataCaching"), loadingRequest = v16->_loadingRequest, loadingRequest->weakReference)&& a4
      && loadingRequest->weakReferenceToResourceLoader
      && loadingRequest->URLRequest
      && loadingRequest->ivarAccessQueue
      && loadingRequest->dataCachingQueue)
    {
      v16->_loadingRequest->cachedContentInformation = (NSDictionary *)(id)[a3 cachedContentInformationForURL:a4];
      if (a5) {
        [(NSMutableURLRequest *)v16->_loadingRequest->URLRequest setAllHTTPHeaderFields:a5];
      }
      if (!v16->_loadingRequest->cachedContentInformation) {
        [(AVAssetResourceLoadingRequest *)v16 _setContentInformationRequest:[[AVAssetResourceLoadingContentInformationRequest alloc] initWithLoadingRequest:v16 allowedContentTypes:a8]];
      }
      uint64_t v19 = 0;
      BOOL v20 = 1;
      uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v22 = 0;
      if (a6 && a7)
      {
        uint64_t v23 = objc_msgSend(-[NSDictionary objectForKey:](v16->_loadingRequest->cachedContentInformation, "objectForKey:", @"Content-Length"), "longLongValue");
        uint64_t v19 = [a6 longLongValue];
        uint64_t v24 = [a7 longLongValue];
        uint64_t v21 = v24;
        uint64_t v22 = 0;
        uint64_t v25 = v24 + v19;
        BOOL v26 = v23 <= 0 || v25 < v23;
        BOOL v20 = !v26;
        if (v24 >= 1 && (v19 & 0x8000000000000000) == 0) {
          uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=%lld-%lld", v19, v25 - 1);
        }
      }
      [(NSMutableURLRequest *)v16->_loadingRequest->URLRequest setValue:v22 forHTTPHeaderField:@"Range"];
      if (a9) {
        v27 = (OpaqueFigCPECryptor *)CFRetain(a9);
      }
      else {
        v27 = 0;
      }
      v16->_loadingRequest->figCryptor = v27;
      v16->_loadingRequest->cryptorKeyRequestID = a10;
      v29 = (OpaqueFigCustomURLHandler *)[a3 _customURLHandler];
      if (v29) {
        v29 = (OpaqueFigCustomURLHandler *)CFRetain(v29);
      }
      v16->_loadingRequest->customURLHandler = v29;
      v30 = (OpaqueFigCustomURLLoader *)[a3 _customURLLoader];
      if (v30) {
        v30 = (OpaqueFigCustomURLLoader *)CFRetain(v30);
      }
      v16->_loadingRequest->customURLLoader = v30;
      v31 = [[AVAssetResourceLoadingDataRequest alloc] initWithLoadingRequest:v16 requestedOffset:v19 requestedLength:v21 requestsAllDataToEndOfResource:v20 canSupplyIncrementalDataImmediately:v16->_loadingRequest->figCryptor == 0];
      [(AVAssetResourceLoadingRequest *)v16 _setDataRequest:v31];

      v16->_loadingRequest->responseInfoSentOnceToken = objc_alloc_init(AVDispatchOnce);
    }
    else
    {

      return 0;
    }
  }
  return v16;
}

- (void)dealloc
{
  loadingRequest = self->_loadingRequest;
  if (loadingRequest)
  {

    v4 = self->_loadingRequest;
    dataCachingQueue = v4->dataCachingQueue;
    if (dataCachingQueue)
    {
      dispatch_release(dataCachingQueue);
      v4 = self->_loadingRequest;
    }

    v6 = self->_loadingRequest;
    figCryptor = v6->figCryptor;
    if (figCryptor)
    {
      CFRelease(figCryptor);
      v6 = self->_loadingRequest;
    }
    customURLHandler = v6->customURLHandler;
    if (customURLHandler)
    {
      CFRelease(customURLHandler);
      v6 = self->_loadingRequest;
    }
    customURLLoader = v6->customURLLoader;
    if (customURLLoader)
    {
      CFRelease(customURLLoader);
      v6 = self->_loadingRequest;
    }
    requestInfo = v6->requestInfo;
    if (requestInfo)
    {
      CFRelease(requestInfo);
      v6 = self->_loadingRequest;
    }

    uint64_t v11 = self->_loadingRequest;
    if (v11->streamingKeyRequestCompletionHandler)
    {
      NSLog(&cfstr_Avassetresourc_1.isa, self);
      uint64_t v11 = self->_loadingRequest;
    }
    ivarAccessQueue = v11->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      uint64_t v11 = self->_loadingRequest;
    }

    CFRelease(self->_loadingRequest);
  }
  v13.receiver = self;
  v13.super_class = (Class)AVAssetResourceLoadingRequest;
  [(AVAssetResourceLoadingRequest *)&v13 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p, URL request = %@, request ID = %llu, content information request = %@, data request = %@>", NSStringFromClass(v4), self, -[AVAssetResourceLoadingRequest request](self, "request"), -[AVAssetResourceLoadingRequest _requestID](self, "_requestID"), -[AVAssetResourceLoadingRequest contentInformationRequest](self, "contentInformationRequest"), -[AVAssetResourceLoadingRequest dataRequest](self, "dataRequest")];
}

- (id)_weakReference
{
  return self->_loadingRequest->weakReference;
}

- (id)_resourceLoader
{
  return [(AVWeakReference *)self->_loadingRequest->weakReferenceToResourceLoader referencedObject];
}

- (OpaqueFigCustomURLHandler)_customURLHandler
{
  return self->_loadingRequest->customURLHandler;
}

- (OpaqueFigCustomURLLoader)_customURLLoader
{
  return self->_loadingRequest->customURLLoader;
}

- (__CFDictionary)_requestInfo
{
  return self->_loadingRequest->requestInfo;
}

- (NSURLRequest)request
{
  return &self->_loadingRequest->URLRequest->super;
}

- (unint64_t)_requestID
{
  return self->_loadingRequest->requestID;
}

- (BOOL)isFinished
{
  return self->_loadingRequest->finished != 0;
}

- (BOOL)_tryToMarkAsCancelled
{
  int v2 = 0;
  atomic_compare_exchange_strong(&self->_loadingRequest->cancelled, (unsigned int *)&v2, 1u);
  return v2 == 0;
}

- (BOOL)isCancelled
{
  return self->_loadingRequest->cancelled != 0;
}

+ (SEL)_selectorForInformingDelegateOfCancellationByFig
{
  return sel_resourceLoader_didCancelLoadingRequest_;
}

- (void)_performCancellationByClient
{
  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
  [(AVAssetResourceLoadingRequest *)self finishLoadingWithError:v3];
}

- (void)_setContentInformationRequest:(id)a3
{
  id v5 = a3;

  self->_loadingRequest->contentInformationRequest = (AVAssetResourceLoadingContentInformationRequest *)a3;
}

- (AVAssetResourceLoadingContentInformationRequest)contentInformationRequest
{
  return self->_loadingRequest->contentInformationRequest;
}

- (void)_setDataRequest:(id)a3
{
  id v5 = a3;

  self->_loadingRequest->dataRequest = (AVAssetResourceLoadingDataRequest *)a3;
}

- (AVAssetResourceLoadingDataRequest)dataRequest
{
  return self->_loadingRequest->dataRequest;
}

- (void)setResponse:(NSURLResponse *)response
{
  uint64_t v4 = [(NSURLResponse *)response copy];
  ivarAccessQueue = self->_loadingRequest->ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__AVAssetResourceLoadingRequest_setResponse___block_invoke;
  v6[3] = &unk_1E57B2098;
  v6[4] = self;
  v6[5] = v4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
}

void __45__AVAssetResourceLoadingRequest_setResponse___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 80) = *(void *)(a1 + 40);
}

- (NSURLResponse)response
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = __Block_byref_object_copy__38;
  v10 = __Block_byref_object_dispose__38;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_loadingRequest->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__AVAssetResourceLoadingRequest_response__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  uint64_t v3 = (NSURLResponse *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__AVAssetResourceLoadingRequest_response__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 80) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setRedirect:(NSURLRequest *)redirect
{
  uint64_t v4 = [(NSURLRequest *)redirect copy];
  ivarAccessQueue = self->_loadingRequest->ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__AVAssetResourceLoadingRequest_setRedirect___block_invoke;
  v6[3] = &unk_1E57B2098;
  v6[4] = self;
  v6[5] = v4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
}

void __45__AVAssetResourceLoadingRequest_setRedirect___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 88) = *(void *)(a1 + 40);
}

- (id)_getAndClearCachedData
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = __Block_byref_object_copy__38;
  v10 = __Block_byref_object_dispose__38;
  uint64_t v11 = 0;
  dataCachingQueue = self->_loadingRequest->dataCachingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__AVAssetResourceLoadingRequest__getAndClearCachedData__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_write(dataCachingQueue, v5);
  uint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __55__AVAssetResourceLoadingRequest__getAndClearCachedData__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 104);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 104) = 0;
  return result;
}

- (void)_appendToCachedData:(id)a3
{
  dataCachingQueue = self->_loadingRequest->dataCachingQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__AVAssetResourceLoadingRequest__appendToCachedData___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_write(dataCachingQueue, v4);
}

uint64_t __53__AVAssetResourceLoadingRequest__appendToCachedData___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 104);
  if (!v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 104) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "length"));
    int v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 104);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 appendData:v3];
}

- (BOOL)_canSetOrUseCachedContentInformation
{
  return [(NSArray *)[(AVAssetResourceLoadingContentInformationRequest *)self->_loadingRequest->contentInformationRequest allowedContentTypes] count] <= 1&& ![(AVAssetResourceLoadingRequest *)self _isRequestForContentKey]&& [(AVAssetResourceLoadingContentInformationRequest *)self->_loadingRequest->contentInformationRequest renewalDate] == 0;
}

- (void)_cacheContentInformation:(id)a3
{
  if (self->_loadingRequest->cachedContentInformation)
  {
    uint64_t v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Already have a cachedContentInformation", v3, v4, v5, v6, v7, v13), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  if ([(AVAssetResourceLoadingRequest *)self _canSetOrUseCachedContentInformation])
  {
    id v10 = [(AVAssetResourceLoadingRequest *)self _resourceLoader];
    uint64_t v11 = [(NSMutableURLRequest *)self->_loadingRequest->URLRequest URL];
    [v10 cacheContentInformation:a3 forURL:v11];
  }
}

- (BOOL)_isRequestForContentKey
{
  return FigCustomURLRequestInfoCopyCryptor() == 0;
}

- (NSURLRequest)redirect
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = __Block_byref_object_copy__38;
  id v10 = __Block_byref_object_dispose__38;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_loadingRequest->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__AVAssetResourceLoadingRequest_redirect__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  uint64_t v3 = (NSURLRequest *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__AVAssetResourceLoadingRequest_redirect__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 88) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)serializableRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AVAssetResourceLoadingRequest *)self _requestInfo];
  BOOL v11 = [(AVAssetResourceLoadingRequest *)self _isRequestForContentKey];
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v3];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[AVAssetResourceLoadingRequest _requestID](self, "_requestID")), @"FCUP_Response_RequestID");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSURL absoluteString](-[NSURLRequest URL](-[AVAssetResourceLoadingRequest request](self, "request"), "URL"), "absoluteString"), @"FCUP_Response_URL");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSURLRequest allHTTPHeaderFields](-[AVAssetResourceLoadingRequest request](self, "request"), "allHTTPHeaderFields"), @"FCUP_Response_Headers");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(__CFDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        [v4 objectForKey:v9];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    [v4 removeObjectForKey:v9];
                  }
                }
              }
            }
          }
        }
      }
      uint64_t v6 = [(__CFDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  objc_msgSend(v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", v11), @"FCUP_Response_IsContentKeyRequest");
  return v4;
}

- (void)_sendResponseInfoToCustomURLHandler
{
  if ([(AVAssetResourceLoadingRequest *)self isCancelled]) {
    return;
  }
  if (FigCustomURLResponseInfoCreateMutable()) {
    return;
  }
  [(AVAssetResourceLoadingRequest *)self response];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [(AVAssetResourceLoadingRequest *)self response];
    [(NSURLResponse *)v3 statusCode];
    if (FigCustomURLResponseInfoSetHTTPStatusCode()) {
      return;
    }
    [(NSURLResponse *)v3 allHeaderFields];
    if (FigCustomURLResponseInfoSetHTTPHeaders()) {
      return;
    }
  }
  if ([(AVAssetResourceLoadingRequest *)self redirect])
  {
    [(NSURLRequest *)[(AVAssetResourceLoadingRequest *)self redirect] URL];
    if (FigCustomURLResponseInfoSetRedirectLocation()) {
      return;
    }
    [(NSURLRequest *)[(AVAssetResourceLoadingRequest *)self redirect] allHTTPHeaderFields];
    if (FigCustomURLResponseInfoSetRedirectRequestHeaders()) {
      return;
    }
  }
  if ([(AVAssetResourceLoadingRequest *)self contentInformationRequest])
  {
    [(AVAssetResourceLoadingContentInformationRequest *)[(AVAssetResourceLoadingRequest *)self contentInformationRequest] contentType];
    uint64_t v4 = [(AVAssetResourceLoadingContentInformationRequest *)[(AVAssetResourceLoadingRequest *)self contentInformationRequest] contentLength];
    [(AVAssetResourceLoadingContentInformationRequest *)[(AVAssetResourceLoadingRequest *)self contentInformationRequest] renewalDate];
    [(AVAssetResourceLoadingContentInformationRequest *)[(AVAssetResourceLoadingRequest *)self contentInformationRequest] isDiskCachingPermitted];
    [(AVAssetResourceLoadingContentInformationRequest *)[(AVAssetResourceLoadingRequest *)self contentInformationRequest] isByteRangeAccessSupported];
    [(AVAssetResourceLoadingContentInformationRequest *)[(AVAssetResourceLoadingRequest *)self contentInformationRequest] isEntireLengthAvailableOnDemand];
  }
  else
  {
    cachedContentInformation = self->_loadingRequest->cachedContentInformation;
    if (!cachedContentInformation)
    {
      uint64_t v4 = 0;
      int v6 = 0;
      goto LABEL_14;
    }
    [(NSDictionary *)cachedContentInformation objectForKey:@"Content-Type"];
    uint64_t v4 = objc_msgSend(-[NSDictionary objectForKey:](self->_loadingRequest->cachedContentInformation, "objectForKey:", @"Content-Length"), "longLongValue");
    objc_msgSend(-[NSDictionary objectForKey:](self->_loadingRequest->cachedContentInformation, "objectForKey:", @"Accept-Ranges"), "BOOLValue");
  }
  int v6 = 1;
LABEL_14:
  if ([(AVAssetResourceLoadingDataRequest *)self->_loadingRequest->dataRequest requestedLength] >= 1
    && ![(AVAssetResourceLoadingDataRequest *)self->_loadingRequest->dataRequest requestsAllDataToEndOfResource])
  {
    [(AVAssetResourceLoadingDataRequest *)self->_loadingRequest->dataRequest requestedLength];
    goto LABEL_19;
  }
  if (v4)
  {
LABEL_19:
    if (FigCustomURLResponseInfoSetContentLength()) {
      return;
    }
  }
  if (!v6
    || !FigCustomURLResponseInfoSetUniversalTypeIdentifier()
    && !FigCustomURLResponseInfoSetResourceSize()
    && !FigCustomURLResponseInfoSetContentRenewalDate()
    && !FigCustomURLResponseInfoSetIsCachingDisabled()
    && !FigCustomURLResponseInfoSetIsByteRangeAccessSupported()
    && !FigCustomURLResponseInfoSetIsEntireLengthAvailableOnDemand())
  {
    uint64_t v7 = [(AVAssetResourceLoadingRequest *)self _customURLHandler];
    unint64_t requestID = self->_loadingRequest->requestID;
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    BOOL v11 = *(void (**)(OpaqueFigCustomURLHandler *, unint64_t, void))(v10 + 8);
    if (v11) {
      v11(v7, requestID, 0);
    }
  }
}

- (void)_ensureResponseInfoSentToCustomURLHandler
{
  responseInfoSentOnceToken = self->_loadingRequest->responseInfoSentOnceToken;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__AVAssetResourceLoadingRequest__ensureResponseInfoSentToCustomURLHandler__block_invoke;
  v3[3] = &unk_1E57B1E80;
  v3[4] = self;
  [(AVDispatchOnce *)responseInfoSentOnceToken runBlockOnce:v3];
}

uint64_t __74__AVAssetResourceLoadingRequest__ensureResponseInfoSentToCustomURLHandler__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendResponseInfoToCustomURLHandler];
}

- (void)_sendDataToCustomURLHandler:(id)a3
{
  if (![(AVAssetResourceLoadingRequest *)self isCancelled])
  {
    [(AVAssetResourceLoadingRequest *)self _ensureResponseInfoSentToCustomURLHandler];
    if (!FigCreateBlockBufferWithCFDataNoCopy())
    {
      uint64_t v4 = [(AVAssetResourceLoadingRequest *)self _customURLHandler];
      unint64_t requestID = self->_loadingRequest->requestID;
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      uint64_t v8 = *(void (**)(OpaqueFigCustomURLHandler *, unint64_t, void))(v7 + 16);
      if (v8) {
        v8(v4, requestID, 0);
      }
    }
  }
}

- (void)_sendFinishLoadingToCustomURLHandlerWithError:(id)a3
{
  if (![(AVAssetResourceLoadingRequest *)self isCancelled])
  {
    [(AVAssetResourceLoadingRequest *)self _ensureResponseInfoSentToCustomURLHandler];
    if (!self->_loadingRequest->cachedContentInformation
      && [(AVAssetResourceLoadingRequest *)self _canSetOrUseCachedContentInformation])
    {
      [(AVAssetResourceLoadingRequest *)self _cacheContentInformation:[(AVAssetResourceLoadingContentInformationRequest *)[(AVAssetResourceLoadingRequest *)self contentInformationRequest] propertyList]];
    }
    uint64_t v5 = [(AVAssetResourceLoadingRequest *)self _customURLHandler];
    unint64_t requestID = self->_loadingRequest->requestID;
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(void (**)(OpaqueFigCustomURLHandler *, unint64_t, id, void))(v8 + 24);
    if (v9) {
      v9(v5, requestID, a3, 0);
    }
    id v10 = [(AVAssetResourceLoadingRequest *)self _resourceLoader];
    [v10 _noteFinishingOfRequest:self];
  }
}

- (void)_sendFinishLoadingToCustomURLHandler
{
}

- (void)forwardRequestToContentKeySession
{
  uint64_t v4 = [(AVAssetResourceLoadingRequest *)self _customURLLoader];
  uint64_t v5 = [(AVAssetResourceLoadingRequest *)self _customURLHandler];
  uint64_t v6 = [(AVAssetResourceLoadingRequest *)self _copyContentKeySessionCustomURLHandler];
  unint64_t requestID = self->_loadingRequest->requestID;
  if (![(AVAssetResourceLoadingRequest *)self _contentKeySessionIsAttached])
  {
    uint64_t v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"no contentKeySession", v8, v9, v10, v11, v12, v18), 0 reason userInfo];
    objc_exception_throw(v17);
  }
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  long long v15 = *(uint64_t (**)(OpaqueFigCustomURLLoader *, OpaqueFigCustomURLHandler *, OpaqueFigCustomURLHandler *, unint64_t))(v14 + 48);
  if (!v15)
  {
    signed int v16 = -12782;
LABEL_12:
    [(AVAssetResourceLoadingRequest *)self _sendFinishLoadingToCustomURLHandlerWithError:AVLocalizedErrorWithUnderlyingOSStatus(v16, 0)];
    if (!v6) {
      return;
    }
    goto LABEL_8;
  }
  signed int v16 = v15(v4, v5, v6, requestID);
  if (v16) {
    goto LABEL_12;
  }
  if (!v6) {
    return;
  }
LABEL_8:
  CFRelease(v6);
}

- (void)finishLoading
{
  int v2 = 0;
  atomic_compare_exchange_strong(&self->_loadingRequest->finished, (unsigned int *)&v2, 1u);
  if (v2)
  {
    NSLog(&cfstr_Avassetresourc_2.isa, a2);
  }
  else
  {
    uint64_t v5 = [(AVAssetResourceLoadingContentInformationRequest *)[(AVAssetResourceLoadingRequest *)self contentInformationRequest] contentType];
    uint64_t v6 = [(AVAssetResourceLoadingContentInformationRequest *)[(AVAssetResourceLoadingRequest *)self contentInformationRequest] allowedContentTypes];
    if (dyld_program_sdk_at_least() && v6 && v5 && ![(NSArray *)v6 containsObject:v5])
    {
      uint64_t v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Must respond with a contentType contained in AVAssetResourceLoadingContentInformationRequest.allowedContentTypes.", v7, v8, v9, v10, v11, v14), 0 reason userInfo];
      objc_exception_throw(v13);
    }
    if ([(AVAssetResourceLoadingRequest *)self _contentKeySessionIsAttached]
      && ([(NSString *)v5 isEqualToString:@"com.apple.streamingkeydelivery.contentkey"]
       || [(NSString *)v5 isEqualToString:@"com.apple.streamingkeydelivery.persistentcontentkey"]))
    {
      [(AVAssetResourceLoadingRequest *)self forwardRequestToContentKeySession];
    }
    else
    {
      id v12 = [(AVAssetResourceLoadingRequest *)self _getAndClearCachedData];
      if (v12) {
        [(AVAssetResourceLoadingRequest *)self _sendDataToCustomURLHandler:v12];
      }
      [(AVAssetResourceLoadingRequest *)self _sendFinishLoadingToCustomURLHandler];
    }
  }
}

- (void)finishLoadingWithError:(NSError *)error
{
  int v3 = 0;
  atomic_compare_exchange_strong(&self->_loadingRequest->finished, (unsigned int *)&v3, 1u);
  if (v3)
  {
    NSLog(&cfstr_Avassetresourc_3.isa, a2, error);
  }
  else
  {
    uint64_t v4 = (uint64_t)error;
    uint64_t v6 = [(NSError *)error userInfo];
    uint64_t v7 = *MEMORY[0x1E4F28A50];
    id v8 = [(NSDictionary *)v6 objectForKey:*MEMORY[0x1E4F28A50]];
    if (v8)
    {
      do
      {
        uint64_t v4 = (uint64_t)v8;
        id v8 = (id)objc_msgSend((id)objc_msgSend(v8, "userInfo"), "objectForKey:", v7);
      }
      while (v8);
    }
    else if (!v4)
    {
      uint64_t v4 = AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
    }
    [(AVAssetResourceLoadingRequest *)self _sendFinishLoadingToCustomURLHandlerWithError:v4];
  }
}

- (void)finishLoadingWithResponse:(NSURLResponse *)response data:(NSData *)data redirect:(NSURLRequest *)redirect
{
  [(AVAssetResourceLoadingRequest *)self setResponse:response];
  [(AVAssetResourceLoadingRequest *)self _appendToCachedData:data];
  [(AVAssetResourceLoadingRequest *)self setRedirect:redirect];
  [(AVAssetResourceLoadingRequest *)self finishLoading];
}

- (id)keyRequestDataUsingCryptorForApp:(id)a3 contentIdentifier:(id)a4 options:(id)a5 performAsync:(BOOL)a6 error:(id *)a7
{
  BOOL v7 = a6;
  v42[4] = *MEMORY[0x1E4F143B8];
  id v40 = 0;
  int v12 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"StreamingContentKeyIsForAirPlayKey"), "BOOLValue");
  uint64_t v13 = [a5 objectForKey:@"CSKRO_RemoteContext"];
  uint64_t v14 = *MEMORY[0x1E4F218E0];
  uint64_t v15 = [a5 objectForKey:*MEMORY[0x1E4F218E0]];
  figCryptor = self->_loadingRequest->figCryptor;
  if (!figCryptor)
  {
    signed int v35 = FigSignalErrorAt();
    goto LABEL_27;
  }
  uint64_t v17 = v15;
  BOOL v38 = v7;
  int v18 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"StreamingContentKeyRequestRequiresPersistentKey"), "BOOLValue");
  int v19 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"StreamingContentKeyRequiresiTunesProvisioningKey"), "BOOLValue");
  uint64_t v20 = *MEMORY[0x1E4F218F8];
  v41[0] = *MEMORY[0x1E4F218F0];
  v41[1] = v20;
  v42[0] = a3;
  v42[1] = a4;
  v41[2] = *MEMORY[0x1E4F21900];
  v42[2] = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_loadingRequest->requestID];
  v41[3] = *MEMORY[0x1E4F21910];
  v42[3] = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_loadingRequest->cryptorKeyRequestID];
  id v21 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v42, v41, 4), "mutableCopy");
  uint64_t v22 = v21;
  if (v13) {
    [v21 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F21938]];
  }
  if (v19)
  {
    uint64_t v25 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v22 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F21940]];
    if (!v12)
    {
LABEL_6:
      if (!v17) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if (!v12)
  {
    goto LABEL_6;
  }
  uint64_t v26 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
  [v22 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F21908]];
  if (v17) {
LABEL_7:
  }
    [v22 setObject:v17 forKeyedSubscript:v14];
LABEL_8:
  if (v18)
  {
    uint64_t v23 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v23) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = 0;
    }
    v27 = *(uint64_t (**)(OpaqueFigCPECryptor *, void, void))(v24 + 56);
    if (!v27)
    {
LABEL_26:
      figCryptor = 0;
      signed int v35 = -12782;
      goto LABEL_27;
    }
    signed int v28 = v27(figCryptor, *MEMORY[0x1E4F1FE18], *MEMORY[0x1E4F1CFD0]);
    if (v28)
    {
      signed int v35 = v28;
      goto LABEL_33;
    }
  }
  if (v38)
  {
    v29 = self;
    id v30 = v22;
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__AVAssetResourceLoadingRequest_keyRequestDataUsingCryptorForApp_contentIdentifier_options_performAsync_error___block_invoke;
    block[3] = &unk_1E57B2270;
    block[5] = self;
    block[6] = figCryptor;
    block[4] = v22;
    dispatch_async(global_queue, block);
    return 0;
  }
  objc_super v32 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v32) {
    v33 = v32;
  }
  else {
    v33 = 0;
  }
  if (*v33 < 4uLL) {
    goto LABEL_26;
  }
  v34 = (uint64_t (*)(OpaqueFigCPECryptor *, void *, void, id *))v33[11];
  if (!v34) {
    goto LABEL_26;
  }
  signed int v35 = v34(figCryptor, v22, *MEMORY[0x1E4F1CF80], &v40);
  if (!v40)
  {
LABEL_33:
    figCryptor = 0;
    goto LABEL_27;
  }
  figCryptor = (OpaqueFigCPECryptor *)v40;
LABEL_27:
  if (a7 && v35) {
    *a7 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v35, 0);
  }
  return figCryptor;
}

void __111__AVAssetResourceLoadingRequest_keyRequestDataUsingCryptorForApp_contentIdentifier_options_performAsync_error___block_invoke(uint64_t a1)
{
  id v10 = 0;
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (*v5 >= 4uLL && (uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, void, id *))v5[11]) != 0) {
    signed int v7 = v6(v2, v3, *MEMORY[0x1E4F1CF80], &v10);
  }
  else {
    signed int v7 = -12782;
  }
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 152);
  if (v8)
  {
    if (v7)
    {
      uint64_t v9 = AVLocalizedErrorWithUnderlyingOSStatus(v7, 0);
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 152);
    }
    else
    {
      uint64_t v9 = 0;
    }
    (*(void (**)(uint64_t, id, uint64_t))(v8 + 16))(v8, v10, v9);

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 152) = 0;
  }
}

- (BOOL)_contentKeySessionIsAttached
{
  uint64_t v2 = objc_msgSend(-[AVAssetResourceLoadingRequest _resourceLoader](self, "_resourceLoader"), "asset");
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 && [v2 contentKeySession] != 0;
}

- (OpaqueFigCustomURLHandler)_copyContentKeySessionCustomURLHandler
{
  id v2 = [(AVAssetResourceLoadingRequest *)self _resourceLoader];
  return (OpaqueFigCustomURLHandler *)[v2 _copyContentKeySessionCustomURLHandler];
}

- (NSData)streamingContentKeyRequestDataForApp:(NSData *)appIdentifier contentIdentifier:(NSData *)contentIdentifier options:(NSDictionary *)options error:(NSError *)outError
{
  if ([(AVAssetResourceLoadingRequest *)self _contentKeySessionIsAttached])
  {
    int v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    uint64_t v20 = @"Cannot generate content key request when AVAsset is attached to AVContentKeySession";
    goto LABEL_11;
  }
  uint64_t v24 = 0;
  if (!appIdentifier)
  {
    id v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3C8];
    uint64_t v23 = "appIdentifier != nil";
LABEL_10:
    uint64_t v20 = (__CFString *)AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v12, v13, v14, v15, v16, (uint64_t)v23);
    int v18 = v21;
    uint64_t v19 = v22;
LABEL_11:
    objc_exception_throw((id)[v18 exceptionWithName:v19 reason:v20 userInfo:0]);
  }
  if (!contentIdentifier)
  {
    id v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3C8];
    uint64_t v23 = "contentIdentifier != nil";
    goto LABEL_10;
  }
  uint64_t result = [(AVAssetResourceLoadingRequest *)self keyRequestDataUsingCryptorForApp:appIdentifier contentIdentifier:contentIdentifier options:options performAsync:0 error:&v24];
  if (outError) {
    *outError = v24;
  }
  return result;
}

- (void)generateStreamingContentKeyRequestDataAsynchronouslyForApp:(id)a3 contentIdentifier:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  if ([(AVAssetResourceLoadingRequest *)self _contentKeySessionIsAttached])
  {
    int v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    uint64_t v20 = @"Cannot generate content key request when AVAsset is attached to AVContentKeySession";
    goto LABEL_16;
  }
  uint64_t v24 = 0;
  if (!a3)
  {
    id v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3C8];
    uint64_t v23 = "appIdentifier != nil";
LABEL_14:
    uint64_t v20 = (__CFString *)AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v12, v13, v14, v15, v16, (uint64_t)v23);
    int v18 = v21;
    uint64_t v19 = v22;
    goto LABEL_16;
  }
  if (!a4)
  {
    id v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3C8];
    uint64_t v23 = "contentIdentifier != nil";
    goto LABEL_14;
  }
  if (!a6)
  {
    id v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3C8];
    uint64_t v23 = "handler != nil";
    goto LABEL_14;
  }
  if (self->_loadingRequest->streamingKeyRequestCompletionHandler)
  {
    int v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    uint64_t v20 = @"A streaming content key request is already being generated on this AVAssetResourceLoadingRequest.";
LABEL_16:
    objc_exception_throw((id)[v18 exceptionWithName:v19 reason:v20 userInfo:0]);
  }
  self->_loadingRequest->streamingKeyRequestCompletionHandler = (id)[a6 copy];
  [(AVAssetResourceLoadingRequest *)self keyRequestDataUsingCryptorForApp:a3 contentIdentifier:a4 options:a5 performAsync:1 error:&v24];
  if (v24)
  {
    streamingKeyRequestCompletionHandler = (void (**)(id, void))self->_loadingRequest->streamingKeyRequestCompletionHandler;
    if (streamingKeyRequestCompletionHandler)
    {
      streamingKeyRequestCompletionHandler[2](streamingKeyRequestCompletionHandler, 0);

      self->_loadingRequest->streamingKeyRequestCompletionHandler = 0;
    }
  }
}

- (NSData)persistentContentKeyFromKeyVendorResponse:(NSData *)keyVendorResponse options:(NSDictionary *)options error:(NSError *)outError
{
  id v21 = 0;
  if (!keyVendorResponse)
  {
    uint64_t v20 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)options, (uint64_t)outError, v5, v6, v7, (uint64_t)"keyVendorResponse != NULL"), 0 reason userInfo];
    objc_exception_throw(v20);
  }
  figCryptor = self->_loadingRequest->figCryptor;
  if (figCryptor)
  {
    uint64_t v11 = *(void **)(CMBaseObjectGetVTable() + 16);
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    if (*v12 < 4uLL) {
      goto LABEL_15;
    }
    uint64_t v13 = (uint64_t (*)(OpaqueFigCPECryptor *, NSData *, void))v12[12];
    if (!v13) {
      goto LABEL_15;
    }
    signed int v14 = v13(figCryptor, keyVendorResponse, 0);
    if (v14) {
      goto LABEL_16;
    }
    uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v16 = v15 ? v15 : 0;
    uint64_t v17 = *(uint64_t (**)(OpaqueFigCPECryptor *, void, void, id *))(v16 + 48);
    if (v17)
    {
      signed int v14 = v17(figCryptor, *MEMORY[0x1E4F1FDD0], *MEMORY[0x1E4F1CF80], &v21);
      if (!v14) {
        return (NSData *)v21;
      }
    }
    else
    {
LABEL_15:
      signed int v14 = -12782;
    }
  }
  else
  {
    signed int v14 = FigSignalErrorAt();
    if (!v14) {
      return (NSData *)v21;
    }
  }
LABEL_16:
  if (!outError) {
    return 0;
  }
  uint64_t v19 = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus(v14, 0);
  uint64_t result = 0;
  *outError = v19;
  return result;
}

- (AVAssetResourceLoadingRequestor)requestor
{
  uint64_t result = self->_loadingRequest->requestor;
  if (!result)
  {
    self->_loadingRequest->requestor = [[AVAssetResourceLoadingRequestor alloc] initWithRequestInfo:self->_loadingRequest->requestInfo];
    return self->_loadingRequest->requestor;
  }
  return result;
}

@end