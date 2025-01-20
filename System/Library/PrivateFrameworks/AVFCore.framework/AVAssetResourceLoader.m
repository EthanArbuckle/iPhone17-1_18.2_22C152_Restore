@interface AVAssetResourceLoader
- (AVAssetResourceLoader)init;
- (AVAssetResourceLoader)initWithURLRequestHelper:(id)a3 asset:(id)a4;
- (AVAssetResourceLoader)initWithURLRequestHelper:(id)a3 asset:(id)a4 remoteCustomURLHandlerContext:(id)a5;
- (BOOL)preloadsEligibleContentKeys;
- (BOOL)sendsCommonMediaClientDataAsHTTPHeaders;
- (NSOperationQueue)URLSessionDataDelegateQueue;
- (NSURLSession)URLSession;
- (NSURLSessionDataDelegate)URLSessionDataDelegate;
- (OpaqueFigCustomURLHandler)_authHandler;
- (OpaqueFigCustomURLHandler)_copyContentKeySessionCustomURLHandler;
- (OpaqueFigCustomURLHandler)_customURLHandler;
- (OpaqueFigCustomURLLoader)_customURLLoader;
- (dispatch_queue_t)delegateQueue;
- (id)URLRequestHelper;
- (id)_getDelegateOnStateQueue;
- (id)_getDelegateQueueOnStateQueue;
- (id)asset;
- (id)cachedContentInformationForURL:(id)a3;
- (id)delegate;
- (id)remoteCustomURLHandlerContextForPID:(int)a3;
- (id)stateQueue;
- (unint64_t)allowedCommonMediaClientDataKeys;
- (void)_cancelRequest:(__CFDictionary *)a3 requestID:(unint64_t)a4;
- (void)_cancelRequestWithKey:(id)a3 fallbackHandler:(id)a4;
- (void)_handleRequest:(__CFDictionary *)a3 requestID:(unint64_t)a4 willHandleRequest:(BOOL *)a5;
- (void)_issueLoadingRequestWithKey:(id)a3 loadingRequest:(id)a4 isRenewalRequest:(BOOL)a5 fallbackHandler:(id)a6;
- (void)_noteFinishingOfRequest:(id)a3;
- (void)_performDelegateCallbackSynchronouslyIfCurrentDelegateQueueIsQueue:(id)a3 delegateCallbackBlock:(id)a4;
- (void)_performDelegateSelector:(SEL)a3 withObject:(id)a4 representingNewRequest:(BOOL)a5 key:(id)a6 fallbackHandler:(id)a7;
- (void)_poseAuthenticationChallengeWithKey:(id)a3 challenge:(id)a4 fallbackHandler:(id)a5;
- (void)_poseAuthenticationChallengeWithRequestInfo:(__CFDictionary *)a3 requestID:(unint64_t)a4 challenge:(id)a5;
- (void)_sendAuthResponseForChallenge:(id)a3 disposition:(int64_t)a4 credential:(id)a5 error:(id)a6;
- (void)_setContentKeySessionCustomURLHandler:(OpaqueFigCustomURLHandler *)a3;
- (void)_setDelegateOnStateQueue:(id)a3;
- (void)cacheContentInformation:(id)a3 forURL:(id)a4;
- (void)cancelAuthenticationChallenge:(id)a3;
- (void)cancelLoading;
- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3;
- (void)dealloc;
- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3;
- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3;
- (void)setAllowedCommonMediaClientDataKeys:(unint64_t)a3;
- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateQueue;
- (void)setPreloadsEligibleContentKeys:(BOOL)preloadsEligibleContentKeys;
- (void)setSendsCommonMediaClientDataAsHTTPHeaders:(BOOL)a3;
- (void)setURLSession:(id)a3;
- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4;
@end

@implementation AVAssetResourceLoader

- (AVAssetResourceLoader)init
{
  return [(AVAssetResourceLoader *)self initWithURLRequestHelper:0 asset:0];
}

- (AVAssetResourceLoader)initWithURLRequestHelper:(id)a3 asset:(id)a4
{
  return [(AVAssetResourceLoader *)self initWithURLRequestHelper:a3 asset:a4 remoteCustomURLHandlerContext:0];
}

- (AVAssetResourceLoader)initWithURLRequestHelper:(id)a3 asset:(id)a4 remoteCustomURLHandlerContext:(id)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)AVAssetResourceLoader;
  v8 = [(AVAssetResourceLoader *)&v36 init];
  if (v8)
  {
    if (!a3) {
      goto LABEL_18;
    }
    v9 = objc_alloc_init(AVAssetResourceLoaderInternal);
    v8->_resourceLoader = v9;
    if (!v9) {
      goto LABEL_18;
    }
    CFRetain(v9);
    v8->_resourceLoader->URLRequestHelper = (AVAssetClientURLRequestHelper *)a3;
    v8->_resourceLoader->weakReferenceToAsset = (AVWeakReference *)(id)[a4 _weakReference];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8->_resourceLoader->stateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avassetresourceloader.state", v10);
    v8->_resourceLoader->pendingRequests = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8->_resourceLoader->contentInformationCachingQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avassetresourceloader.contentInformationCaching");
    [(AVAssetClientURLRequestHelper *)v8->_resourceLoader->URLRequestHelper setResourceLoader:v8];
    uint64_t v11 = [(AVAssetClientURLRequestHelper *)v8->_resourceLoader->URLRequestHelper figAsset];
    if (!v11) {
      goto LABEL_18;
    }
    uint64_t v12 = v11;
    resourceLoader = v8->_resourceLoader;
    uint64_t CMBaseObject = FigAssetGetCMBaseObject();
    uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v16 = v15 ? v15 : 0;
    v17 = *(unsigned int (**)(uint64_t, void, void, OpaqueFigCustomURLLoader **))(v16 + 48);
    if (!v17
      || v17(CMBaseObject, *MEMORY[0x1E4F32208], *MEMORY[0x1E4F1CF80], &resourceLoader->customURLLoader)
      || !v8->_resourceLoader->customURLLoader)
    {
      goto LABEL_18;
    }
    if (a5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![a5 endpoint])
      {
        if (!FigSignalErrorAt()) {
          return v8;
        }
        goto LABEL_18;
      }
      if (FigCustomURLHandlerRemoteClientCreateWithXPCEndpoint()
        || avarl_createAndInstallRemoteHandler([a5 customURLHandlerObjectID], (uint64_t)v8->_resourceLoader->remoteHandlerXPCRemoteClient, (uint64_t)v8->_resourceLoader->customURLLoader, 600, &v8->_resourceLoader->customURLHandler)|| avarl_createAndInstallRemoteHandler(objc_msgSend(a5, "authHandlerObjectID"), (uint64_t)v8->_resourceLoader->remoteHandlerXPCRemoteClient, (uint64_t)v8->_resourceLoader->customURLLoader, 900, &v8->_resourceLoader->authHandler)|| avarl_createAndInstallRemoteHandler(objc_msgSend(a5, "contentKeySessionHandlerObjectID"), (uint64_t)v8->_resourceLoader->remoteHandlerXPCRemoteClient, (uint64_t)v8->_resourceLoader->customURLLoader, 400, &v8->_resourceLoader->contentKeySessionCustomURLHandler))
      {
LABEL_18:

        return 0;
      }
    }
    else
    {
      v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v20 = dispatch_queue_create("com.apple.avfoundation.avassetresourceloader.handler", v19);
      if ([a4 _clientURLLoadingRepresentsAccurateNetworkStatistics])
      {
        uint64_t v37 = *MEMORY[0x1E4F202C0];
        v38[0] = MEMORY[0x1E4F1CC38];
        uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
      }
      else
      {
        uint64_t v21 = MEMORY[0x1E4F1CC08];
      }
      v22 = v8->_resourceLoader;
      customURLLoader = v22->customURLLoader;
      uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v24) {
        uint64_t v25 = v24;
      }
      else {
        uint64_t v25 = 0;
      }
      v26 = *(uint64_t (**)(OpaqueFigCustomURLLoader *, uint64_t, const char *, AVAssetResourceLoader *, NSObject *, void *, uint64_t, OpaqueFigCustomURLHandler **))(v25 + 16);
      if (v26) {
        int v27 = v26(customURLLoader, 600, "AVAssetResourceLoader", v8, v20, &initWithURLRequestHelper_asset_remoteCustomURLHandlerContext__sHandlerCallbacks, v21, &v22->customURLHandler);
      }
      else {
        int v27 = -12782;
      }
      if (v20) {
        dispatch_release(v20);
      }
      if (v27) {
        goto LABEL_18;
      }
      v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v29 = dispatch_queue_create("com.apple.avfoundation.avassetresourceloader.authhandler", v28);
      v30 = v8->_resourceLoader;
      v31 = v30->customURLLoader;
      uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v33 = v32 ? v32 : 0;
      v34 = *(uint64_t (**)(OpaqueFigCustomURLLoader *, uint64_t, const char *, AVAssetResourceLoader *, NSObject *, void *, void, OpaqueFigCustomURLHandler **))(v33 + 16);
      int v35 = v34
          ? v34(v31, 900, "AVAssetResourceLoader-authentication", v8, v29, &initWithURLRequestHelper_asset_remoteCustomURLHandlerContext__sAuthHandlerCallbacks, 0, &v30->authHandler): -12782;
      if (v29) {
        dispatch_release(v29);
      }
      if (v35) {
        goto LABEL_18;
      }
    }
    v8->_resourceLoader->bridgeBetweenHandlerAndSession = [[AVAssetCustomURLBridgeForNSURLSession alloc] initWithFigAsset:v12];
    v8->_resourceLoader->URLSessionOperationQueue = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    [(NSOperationQueue *)v8->_resourceLoader->URLSessionOperationQueue setMaxConcurrentOperationCount:1];
  }
  return v8;
}

- (void)dealloc
{
  resourceLoader = self->_resourceLoader;
  if (resourceLoader)
  {

    v4 = self->_resourceLoader;
    stateQueue = v4->stateQueue;
    if (stateQueue)
    {
      dispatch_release(stateQueue);
      v4 = self->_resourceLoader;
    }

    v6 = self->_resourceLoader;
    delegateQueue = v6->delegateQueue;
    if (delegateQueue)
    {
      dispatch_release(delegateQueue);
      v6 = self->_resourceLoader;
    }

    v8 = self->_resourceLoader;
    contentInformationCachingQueue = v8->contentInformationCachingQueue;
    if (contentInformationCachingQueue)
    {
      dispatch_release(contentInformationCachingQueue);
      v8 = self->_resourceLoader;
    }

    v10 = self->_resourceLoader;
    authHandler = v10->authHandler;
    if (authHandler)
    {
      CFRelease(authHandler);
      v10 = self->_resourceLoader;
    }
    customURLHandler = v10->customURLHandler;
    if (customURLHandler)
    {
      CFRelease(customURLHandler);
      v10 = self->_resourceLoader;
    }
    customURLLoader = v10->customURLLoader;
    if (customURLLoader)
    {
      CFRelease(customURLLoader);
      v10 = self->_resourceLoader;
    }
    contentKeySessionCustomURLHandler = v10->contentKeySessionCustomURLHandler;
    if (contentKeySessionCustomURLHandler) {
      CFRelease(contentKeySessionCustomURLHandler);
    }
    FigXPCRemoteClientDispose();

    CFRelease(self->_resourceLoader);
  }
  v15.receiver = self;
  v15.super_class = (Class)AVAssetResourceLoader;
  [(AVAssetResourceLoader *)&v15 dealloc];
}

- (void)_setDelegateOnStateQueue:(id)a3
{
  v3 = (AVWeakReference *)a3;
  if (a3) {
    v3 = [[AVWeakReference alloc] initWithReferencedObject:a3];
  }

  self->_resourceLoader->weakReferenceToDelegate = v3;
}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateQueue
{
  if (delegate && !delegateQueue)
  {
    uint64_t v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"NULL delegateQueue passed", 0, v4, v5, v6, v7, v13), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  [(AVAssetResourceLoader *)self willChangeValueForKey:@"delegate"];
  [(AVAssetResourceLoader *)self willChangeValueForKey:@"delegateQueue"];
  stateQueue = self->_resourceLoader->stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AVAssetResourceLoader_setDelegate_queue___block_invoke;
  block[3] = &unk_1E57B2138;
  block[4] = self;
  block[5] = delegate;
  block[6] = delegateQueue;
  dispatch_sync(stateQueue, block);
  [(AVAssetResourceLoader *)self didChangeValueForKey:@"delegate"];
  [(AVAssetResourceLoader *)self didChangeValueForKey:@"delegateQueue"];
}

void __43__AVAssetResourceLoader_setDelegate_queue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setDelegateOnStateQueue:*(void *)(a1 + 40)];
  v2 = *(NSObject **)(a1 + 48);
  if (v2) {
    dispatch_retain(v2);
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(NSObject **)(v3 + 40);
  if (v4)
  {
    dispatch_release(v4);
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(void *)(v3 + 40) = *(void *)(a1 + 48);
}

- (id)stateQueue
{
  return self->_resourceLoader->stateQueue;
}

- (id)_getDelegateOnStateQueue
{
  return [(AVWeakReference *)self->_resourceLoader->weakReferenceToDelegate referencedObject];
}

- (id)delegate
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__38;
  uint64_t v11 = __Block_byref_object_dispose__38;
  uint64_t v12 = 0;
  uint64_t v3 = [(AVAssetResourceLoader *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__AVAssetResourceLoader_delegate__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __33__AVAssetResourceLoader_delegate__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) _getDelegateOnStateQueue];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_getDelegateQueueOnStateQueue
{
  return self->_resourceLoader->delegateQueue;
}

- (dispatch_queue_t)delegateQueue
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__38;
  v10 = __Block_byref_object_dispose__38;
  uint64_t v11 = 0;
  stateQueue = self->_resourceLoader->stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__AVAssetResourceLoader_delegateQueue__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  uint64_t v3 = v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__AVAssetResourceLoader_delegateQueue__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _getDelegateQueueOnStateQueue];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)URLRequestHelper
{
  return self->_resourceLoader->URLRequestHelper;
}

- (OpaqueFigCustomURLHandler)_authHandler
{
  return self->_resourceLoader->authHandler;
}

- (OpaqueFigCustomURLHandler)_customURLHandler
{
  return self->_resourceLoader->customURLHandler;
}

- (OpaqueFigCustomURLLoader)_customURLLoader
{
  return self->_resourceLoader->customURLLoader;
}

- (id)asset
{
  return [(AVWeakReference *)self->_resourceLoader->weakReferenceToAsset referencedObject];
}

- (void)cancelLoading
{
  int v3 = 0;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  objc_super v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__38;
  v18 = __Block_byref_object_dispose__38;
  uint64_t v19 = 0;
  atomic_compare_exchange_strong(&self->_resourceLoader->loadingCancelled, (unsigned int *)&v3, 1u);
  id v4 = [(AVAssetResourceLoader *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AVAssetResourceLoader_cancelLoading__block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync(v4, block);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v5 = (void *)v15[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v15[5], "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * i)), "referencedObject"), "_performCancellationByClient");
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(&v14, 8);
}

uint64_t __38__AVAssetResourceLoader_cancelLoading__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 96) copy];
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 96);
  return [v2 removeAllObjects];
}

- (void)_performDelegateCallbackSynchronouslyIfCurrentDelegateQueueIsQueue:(id)a3 delegateCallbackBlock:(id)a4
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000;
  uint64_t v21 = __Block_byref_object_copy__38;
  v22 = __Block_byref_object_dispose__38;
  uint64_t v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000;
  objc_super v15 = __Block_byref_object_copy__38;
  uint64_t v16 = __Block_byref_object_dispose__38;
  uint64_t v17 = 0;
  uint64_t v7 = [(AVAssetResourceLoader *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__AVAssetResourceLoader__performDelegateCallbackSynchronouslyIfCurrentDelegateQueueIsQueue_delegateCallbackBlock___block_invoke;
  block[3] = &unk_1E57B3888;
  block[4] = self;
  block[5] = &v18;
  void block[6] = &v12;
  dispatch_sync(v7, block);
  uint64_t v8 = v13[5];
  if (!v8 || v8 == a3)
  {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, v19[5]);
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __114__AVAssetResourceLoader__performDelegateCallbackSynchronouslyIfCurrentDelegateQueueIsQueue_delegateCallbackBlock___block_invoke_2;
    v10[3] = &unk_1E57B7130;
    v10[5] = a4;
    v10[6] = &v12;
    v10[4] = self;
    dispatch_async(v8, v10);
  }
  long long v9 = v13[5];
  if (v9) {
    dispatch_release(v9);
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
}

void __114__AVAssetResourceLoader__performDelegateCallbackSynchronouslyIfCurrentDelegateQueueIsQueue_delegateCallbackBlock___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _getDelegateOnStateQueue];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _getDelegateQueueOnStateQueue];
  v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    dispatch_retain(v2);
  }
}

uint64_t __114__AVAssetResourceLoader__performDelegateCallbackSynchronouslyIfCurrentDelegateQueueIsQueue_delegateCallbackBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performDelegateCallbackSynchronouslyIfCurrentDelegateQueueIsQueue:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) delegateCallbackBlock:*(void *)(a1 + 40)];
}

- (void)_performDelegateSelector:(SEL)a3 withObject:(id)a4 representingNewRequest:(BOOL)a5 key:(id)a6 fallbackHandler:(id)a7
{
  int v13 = [MEMORY[0x1E4F29060] isMainThread];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104__AVAssetResourceLoader__performDelegateSelector_withObject_representingNewRequest_key_fallbackHandler___block_invoke;
  v15[3] = &unk_1E57B7158;
  if (v13) {
    uint64_t v14 = MEMORY[0x1E4F14428];
  }
  else {
    uint64_t v14 = 0;
  }
  v15[7] = a7;
  v15[8] = a3;
  v15[4] = self;
  v15[5] = a4;
  BOOL v16 = a5;
  v15[6] = a6;
  [(AVAssetResourceLoader *)self _performDelegateCallbackSynchronouslyIfCurrentDelegateQueueIsQueue:v14 delegateCallbackBlock:v15];
}

uint64_t __104__AVAssetResourceLoader__performDelegateSelector_withObject_representingNewRequest_key_fallbackHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v12 = 0;
  if (a2 && !*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 88) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = (void *)[(id)objc_opt_class() instanceMethodSignatureForSelector:*(void *)(a1 + 64)];
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v4];
    [v5 setSelector:*(void *)(a1 + 64)];
    [v5 setTarget:a2];
    [v5 setArgument:a1 + 32 atIndex:2];
    [v5 setArgument:a1 + 40 atIndex:3];
    [v5 invoke];
    if ([v4 methodReturnLength] != 1)
    {
      unsigned __int8 v12 = 1;
      goto LABEL_12;
    }
    [v5 getReturnValue:&v12];
    BOOL v6 = v12 == 0;
  }
  else
  {
    BOOL v6 = 1;
  }
  if (*(unsigned char *)(a1 + 72)) {
    BOOL v7 = !v6;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) stateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__AVAssetResourceLoader__performDelegateSelector_withObject_representingNewRequest_key_fallbackHandler___block_invoke_2;
    block[3] = &unk_1E57B2098;
    uint64_t v9 = *(void *)(a1 + 48);
    block[4] = *(void *)(a1 + 32);
    block[5] = v9;
    dispatch_sync(v8, block);
  }
LABEL_12:
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, v12);
  }
  return result;
}

uint64_t __104__AVAssetResourceLoader__performDelegateSelector_withObject_representingNewRequest_key_fallbackHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 96) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)_cancelRequestWithKey:(id)a3 fallbackHandler:(id)a4
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3052000000;
  int v13 = __Block_byref_object_copy__38;
  uint64_t v14 = __Block_byref_object_dispose__38;
  uint64_t v15 = 0;
  BOOL v7 = [(AVAssetResourceLoader *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AVAssetResourceLoader__cancelRequestWithKey_fallbackHandler___block_invoke;
  block[3] = &unk_1E57B3270;
  block[5] = a3;
  void block[6] = &v10;
  block[4] = self;
  dispatch_sync(v7, block);
  if ([(id)v11[5] _shouldInformDelegateOfFigCancellation])
  {
    uint64_t v8 = [(id)objc_opt_class() _selectorForInformingDelegateOfCancellationByFig];
    [(AVAssetResourceLoader *)self _performDelegateSelector:v8 withObject:v11[5] representingNewRequest:0 key:a3 fallbackHandler:a4];
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __63__AVAssetResourceLoader__cancelRequestWithKey_fallbackHandler___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1[4] + 8)+ 96), "objectForKey:", a1[5]), "referencedObject");
  uint64_t v2 = a1[5];
  int v3 = *(void **)(*(void *)(a1[4] + 8) + 96);
  return [v3 removeObjectForKey:v2];
}

- (void)_cancelRequest:(__CFDictionary *)a3 requestID:(unint64_t)a4
{
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a4];
  [(AVAssetResourceLoader *)self _cancelRequestWithKey:v5 fallbackHandler:0];
}

- (void)_issueLoadingRequestWithKey:(id)a3 loadingRequest:(id)a4 isRenewalRequest:(BOOL)a5 fallbackHandler:(id)a6
{
  if (a4)
  {
    uint64_t v10 = &selRef_resourceLoader_shouldWaitForRenewalOfRequestedResource_;
    if (!a5) {
      uint64_t v10 = &selRef_resourceLoader_shouldWaitForLoadingOfRequestedResource_;
    }
    long long v11 = *v10;
    uint64_t v12 = [(AVAssetResourceLoader *)self stateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__AVAssetResourceLoader__issueLoadingRequestWithKey_loadingRequest_isRenewalRequest_fallbackHandler___block_invoke;
    block[3] = &unk_1E57B2138;
    block[4] = self;
    block[5] = a4;
    void block[6] = a3;
    dispatch_sync(v12, block);
    [(AVAssetResourceLoader *)self _performDelegateSelector:v11 withObject:a4 representingNewRequest:1 key:a3 fallbackHandler:a6];
  }
}

uint64_t __101__AVAssetResourceLoader__issueLoadingRequestWithKey_loadingRequest_isRenewalRequest_fallbackHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 96);
  uint64_t v3 = [*(id *)(a1 + 40) _weakReference];
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 setObject:v3 forKey:v4];
}

- (void)_poseAuthenticationChallengeWithKey:(id)a3 challenge:(id)a4 fallbackHandler:(id)a5
{
  if (a4)
  {
    uint64_t v9 = [(AVAssetResourceLoader *)self stateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__AVAssetResourceLoader__poseAuthenticationChallengeWithKey_challenge_fallbackHandler___block_invoke;
    block[3] = &unk_1E57B2138;
    block[4] = self;
    block[5] = a4;
    void block[6] = a3;
    dispatch_sync(v9, block);
    [(AVAssetResourceLoader *)self _performDelegateSelector:sel_resourceLoader_shouldWaitForResponseToAuthenticationChallenge_ withObject:a4 representingNewRequest:1 key:a3 fallbackHandler:a5];
  }
}

uint64_t __87__AVAssetResourceLoader__poseAuthenticationChallengeWithKey_challenge_fallbackHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 96);
  uint64_t v3 = [*(id *)(a1 + 40) _weakReference];
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 setObject:v3 forKey:v4];
}

- (void)_poseAuthenticationChallengeWithRequestInfo:(__CFDictionary *)a3 requestID:(unint64_t)a4 challenge:(id)a5
{
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a4];
  if (a5) {
    uint64_t v10 = [[AVURLAuthenticationChallenge alloc] initWithAuthenticationChallenge:a5 sender:self requestInfo:a3 requestID:a4];
  }
  else {
    uint64_t v10 = 0;
  }
  -[AVAssetResourceLoader _poseAuthenticationChallengeWithKey:challenge:fallbackHandler:](self, "_poseAuthenticationChallengeWithKey:challenge:fallbackHandler:", v9, MEMORY[0x1E4F143A8], 3221225472, __89__AVAssetResourceLoader__poseAuthenticationChallengeWithRequestInfo_requestID_challenge___block_invoke, &unk_1E57B7180, self, v10);
}

uint64_t __89__AVAssetResourceLoader__poseAuthenticationChallengeWithRequestInfo_requestID_challenge___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) performDefaultHandlingForAuthenticationChallenge:*(void *)(result + 40)];
  }
  return result;
}

- (void)_noteFinishingOfRequest:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(a3, "_requestID"));
  if (v4)
  {
    uint64_t v5 = v4;
    BOOL v6 = [(AVAssetResourceLoader *)self stateQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__AVAssetResourceLoader__noteFinishingOfRequest___block_invoke;
    v7[3] = &unk_1E57B2098;
    v7[4] = self;
    v7[5] = v5;
    dispatch_sync(v6, v7);
  }
}

uint64_t __49__AVAssetResourceLoader__noteFinishingOfRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 96) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)_handleRequest:(__CFDictionary *)a3 requestID:(unint64_t)a4 willHandleRequest:(BOOL *)a5
{
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  char v14 = 0;
  uint64_t v9 = dispatch_semaphore_create(0);
  FigCustomURLRequestInfoGetIsRenewalRequest();
  uint64_t v10 = [[AVAssetResourceLoadingRequest alloc] initWithResourceLoader:self requestInfo:a3 requestID:a4];
  uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a4];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__AVAssetResourceLoader__handleRequest_requestID_willHandleRequest___block_invoke;
  v13[3] = &unk_1E57B71A8;
  v13[4] = v9;
  v13[5] = &v15;
  [(AVAssetResourceLoader *)self _issueLoadingRequestWithKey:v11 loadingRequest:v10 isRenewalRequest:0 fallbackHandler:v13];
  if (dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL)) {
    char v12 = 0;
  }
  else {
    char v12 = *((unsigned char *)v16 + 24);
  }
  *a5 = v12;
  dispatch_release(v9);
  _Block_object_dispose(&v15, 8);
}

intptr_t __68__AVAssetResourceLoader__handleRequest_requestID_willHandleRequest___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_setContentKeySessionCustomURLHandler:(OpaqueFigCustomURLHandler *)a3
{
  stateQueue = self->_resourceLoader->stateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__AVAssetResourceLoader__setContentKeySessionCustomURLHandler___block_invoke;
  v4[3] = &unk_1E57B2228;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(stateQueue, v4);
}

void __63__AVAssetResourceLoader__setContentKeySessionCustomURLHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(const void **)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 8);
  uint64_t v4 = *(const void **)(v3 + 72);
  *(void *)(v3 + 72) = v1;
  if (v1) {
    CFRetain(v1);
  }
  if (v4)
  {
    CFRelease(v4);
  }
}

- (OpaqueFigCustomURLHandler)_copyContentKeySessionCustomURLHandler
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_resourceLoader->stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__AVAssetResourceLoader__copyContentKeySessionCustomURLHandler__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  uint64_t v3 = (OpaqueFigCustomURLHandler *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFTypeRef __63__AVAssetResourceLoader__copyContentKeySessionCustomURLHandler__block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 72);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)preloadsEligibleContentKeys
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(AVAssetResourceLoader *)self stateQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__AVAssetResourceLoader_AVAssetResourceLoaderContentKeySupport__preloadsEligibleContentKeys__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __92__AVAssetResourceLoader_AVAssetResourceLoaderContentKeySupport__preloadsEligibleContentKeys__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 120);
  return result;
}

- (void)setPreloadsEligibleContentKeys:(BOOL)preloadsEligibleContentKeys
{
  uint64_t v5 = [(AVAssetResourceLoader *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__AVAssetResourceLoader_AVAssetResourceLoaderContentKeySupport__setPreloadsEligibleContentKeys___block_invoke;
  v6[3] = &unk_1E57B20E8;
  BOOL v7 = preloadsEligibleContentKeys;
  v6[4] = self;
  dispatch_sync(v5, v6);
}

void *__96__AVAssetResourceLoader_AVAssetResourceLoaderContentKeySupport__setPreloadsEligibleContentKeys___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  CFTypeRef result = *(void **)(a1 + 32);
  if (v2 != *(unsigned __int8 *)(result[1] + 120))
  {
    objc_msgSend((id)objc_msgSend(result, "URLRequestHelper"), "figAsset");
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v4 = (void *)MEMORY[0x1E4F1CFD0];
    }
    else {
      uint64_t v4 = (void *)MEMORY[0x1E4F1CFC8];
    }
    uint64_t CMBaseObject = FigAssetGetCMBaseObject();
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v8 = *(void *)(VTable + 8);
    CFTypeRef result = (void *)(VTable + 8);
    uint64_t v7 = v8;
    if (v8) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(uint64_t (**)(uint64_t, void, void))(v9 + 56);
    if (v10) {
      CFTypeRef result = (void *)v10(CMBaseObject, *MEMORY[0x1E4F32300], *v4);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 120) = *(unsigned char *)(a1 + 40);
  }
  return result;
}

- (void)_sendAuthResponseForChallenge:(id)a3 disposition:(int64_t)a4 credential:(id)a5 error:(id)a6
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    int v13 = (objc_class *)objc_opt_class();
    uint64_t v19 = @"The specified challenge must be an instance of NSURLAuthenticationChallenge previously provided by AVAssetResourceLoader";
    goto LABEL_9;
  }
  if (a5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3C8];
      int v13 = (objc_class *)objc_opt_class();
      uint64_t v19 = @"The specified credential must be an instance of NSURLCredential";
LABEL_9:
      uint64_t v20 = objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithClassAndSelector(v13, a2, (uint64_t)v19, v14, v15, v16, v17, v18, v21), 0);
      objc_exception_throw(v20);
    }
  }
  +[AVAssetCustomURLAuthentication sendAuthResponse:requestID:disposition:credential:authHandler:](AVAssetCustomURLAuthentication, "sendAuthResponse:requestID:disposition:credential:authHandler:", [a3 _requestInfo], objc_msgSend(a3, "_requestID"), a4, a5, -[AVAssetResourceLoader _authHandler](self, "_authHandler"));
  [(AVAssetResourceLoader *)self _noteFinishingOfRequest:a3];
}

- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4
{
}

- (void)cancelAuthenticationChallenge:(id)a3
{
  uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-1012 userInfo:0];
  [(AVAssetResourceLoader *)self _sendAuthResponseForChallenge:a3 disposition:2 credential:0 error:v5];
}

- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3
{
}

- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3
{
}

- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([a3 _requestInfo], !FigCustomURLRequestInfoCopyURL())
    && (id v5 = +[AVAssetCustomURLAuthentication copyKeychainCredentialForUrl:0]) != 0)
  {
    uint64_t v6 = v5;
    [(AVAssetResourceLoader *)self _sendAuthResponseForChallenge:a3 disposition:0 credential:v5 error:0];
  }
  else
  {
    [(AVAssetResourceLoader *)self _sendAuthResponseForChallenge:a3 disposition:3 credential:0 error:0];
    uint64_t v6 = 0;
  }
}

- (void)cacheContentInformation:(id)a3 forURL:(id)a4
{
  contentInformationCachingQueue = self->_resourceLoader->contentInformationCachingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__AVAssetResourceLoader_AVAssetResourceLoaderContentInformationCache__cacheContentInformation_forURL___block_invoke;
  block[3] = &unk_1E57B2138;
  block[4] = self;
  block[5] = a3;
  void block[6] = a4;
  av_readwrite_dispatch_queue_write(contentInformationCachingQueue, block);
}

uint64_t __102__AVAssetResourceLoader_AVAssetResourceLoaderContentInformationCache__cacheContentInformation_forURL___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 112);
  if (!v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 112) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 112);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) absoluteString];
  return [v2 setValue:v3 forKey:v4];
}

- (id)cachedContentInformationForURL:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__38;
  uint64_t v11 = __Block_byref_object_dispose__38;
  uint64_t v12 = 0;
  contentInformationCachingQueue = self->_resourceLoader->contentInformationCachingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__AVAssetResourceLoader_AVAssetResourceLoaderContentInformationCache__cachedContentInformationForURL___block_invoke;
  block[3] = &unk_1E57B3270;
  block[5] = a3;
  void block[6] = &v7;
  block[4] = self;
  av_readwrite_dispatch_queue_read(contentInformationCachingQueue, block);
  uint64_t v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __102__AVAssetResourceLoader_AVAssetResourceLoaderContentInformationCache__cachedContentInformationForURL___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 112), "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "absoluteString"));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (NSURLSessionDataDelegate)URLSessionDataDelegate
{
  return (NSURLSessionDataDelegate *)self->_resourceLoader->bridgeBetweenHandlerAndSession;
}

- (NSOperationQueue)URLSessionDataDelegateQueue
{
  return self->_resourceLoader->URLSessionOperationQueue;
}

- (NSURLSession)URLSession
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__38;
  uint64_t v10 = __Block_byref_object_dispose__38;
  uint64_t v11 = 0;
  stateQueue = self->_resourceLoader->stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__AVAssetResourceLoader_AVAssetResourceLoaderURLSessionSupport__URLSession__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  uint64_t v3 = (NSURLSession *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __75__AVAssetResourceLoader_AVAssetResourceLoaderURLSessionSupport__URLSession__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 144);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setURLSession:(id)a3
{
  stateQueue = self->_resourceLoader->stateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__AVAssetResourceLoader_AVAssetResourceLoaderURLSessionSupport__setURLSession___block_invoke;
  v6[3] = &unk_1E57B2098;
  v6[4] = a3;
  void v6[5] = self;
  dispatch_sync(stateQueue, v6);
  if (objc_msgSend(-[AVAssetResourceLoader asset](self, "asset"), "_figAsset")) {
    [(AVAssetCustomURLBridgeForNSURLSession *)self->_resourceLoader->bridgeBetweenHandlerAndSession setSession:a3];
  }
}

void __79__AVAssetResourceLoader_AVAssetResourceLoaderURLSessionSupport__setURLSession___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 144) = *(void *)(a1 + 32);
}

- (id)remoteCustomURLHandlerContextForPID:(int)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  CFTypeRef cf = 0;
  int v4 = FigCustomURLHandlerServerEnsure();
  if (!v4)
  {
    int v4 = FigCustomURLHandlerServerCopyXPCEndpoint();
    if (!v4)
    {
      objc_msgSend(-[AVAssetResourceLoader URLRequestHelper](self, "URLRequestHelper"), "figAsset");
      uint64_t CMBaseObject = FigAssetGetCMBaseObject();
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      uint64_t v8 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v7 + 48);
      if (!v8)
      {
        uint64_t v11 = 0;
        int v12 = -12782;
        goto LABEL_18;
      }
      int v4 = v8(CMBaseObject, *MEMORY[0x1E4F32210], *MEMORY[0x1E4F1CF80], &cf);
      if (!v4)
      {
        resourceLoader = self->_resourceLoader;
        if (resourceLoader->customURLHandler)
        {
          int v4 = FigCustomURLHandlerServerAssociateObjectAndContentKeySessionByPID();
          if (v4) {
            goto LABEL_23;
          }
          resourceLoader = self->_resourceLoader;
        }
        if (!resourceLoader->authHandler)
        {
LABEL_14:
          if (!resourceLoader->contentKeySessionCustomURLHandler
            || (int v4 = FigCustomURLHandlerServerAssociateObjectAndContentKeySessionByPID()) == 0)
          {
            uint64_t v10 = [AVAssetResourceLoaderRemoteHandlerContext alloc];
            uint64_t v11 = [(AVAssetResourceLoaderRemoteHandlerContext *)v10 initWithEndpoint:v18 customURLHandlerObjectID:v17 authHandlerObjectID:v16 contentKeySessionHandlerObjectID:v15];
            int v12 = 0;
            goto LABEL_18;
          }
          goto LABEL_23;
        }
        int v4 = FigCustomURLHandlerServerAssociateObjectAndContentKeySessionByPID();
        if (!v4)
        {
          resourceLoader = self->_resourceLoader;
          goto LABEL_14;
        }
      }
    }
  }
LABEL_23:
  int v12 = v4;
  uint64_t v11 = 0;
LABEL_18:
  FigXPCRelease();
  if (cf) {
    CFRelease(cf);
  }
  if (v12) {
    return 0;
  }
  else {
    return v11;
  }
}

- (BOOL)sendsCommonMediaClientDataAsHTTPHeaders
{
  id v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(AVAssetResourceLoader *)self stateQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __115__AVAssetResourceLoader_AVAssetResourceLoaderCommonMediaClientDataSupport__sendsCommonMediaClientDataAsHTTPHeaders__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __115__AVAssetResourceLoader_AVAssetResourceLoaderCommonMediaClientDataSupport__sendsCommonMediaClientDataAsHTTPHeaders__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 136);
  return result;
}

- (void)setSendsCommonMediaClientDataAsHTTPHeaders:(BOOL)a3
{
  uint64_t v3 = a3;
  id v5 = [(AVAssetResourceLoader *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __119__AVAssetResourceLoader_AVAssetResourceLoaderCommonMediaClientDataSupport__setSendsCommonMediaClientDataAsHTTPHeaders___block_invoke;
  v6[3] = &unk_1E57B20E8;
  v6[4] = self;
  char v7 = v3;
  dispatch_sync(v5, v6);
  [(AVAssetResourceLoader *)self setAllowedCommonMediaClientDataKeys:v3 << 63 >> 63];
}

uint64_t __119__AVAssetResourceLoader_AVAssetResourceLoaderCommonMediaClientDataSupport__setSendsCommonMediaClientDataAsHTTPHeaders___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 136) = *(unsigned char *)(result + 40);
  return result;
}

- (unint64_t)allowedCommonMediaClientDataKeys
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(AVAssetResourceLoader *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __116__AVAssetResourceLoader_AVAssetResourceLoaderCommonMediaClientDataSupport_Private__allowedCommonMediaClientDataKeys__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __116__AVAssetResourceLoader_AVAssetResourceLoaderCommonMediaClientDataSupport_Private__allowedCommonMediaClientDataKeys__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 128);
  return result;
}

- (void)setAllowedCommonMediaClientDataKeys:(unint64_t)a3
{
  id v5 = [(AVAssetResourceLoader *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __120__AVAssetResourceLoader_AVAssetResourceLoaderCommonMediaClientDataSupport_Private__setAllowedCommonMediaClientDataKeys___block_invoke;
  v6[3] = &unk_1E57B2228;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_sync(v5, v6);
}

void *__120__AVAssetResourceLoader_AVAssetResourceLoaderCommonMediaClientDataSupport_Private__setAllowedCommonMediaClientDataKeys___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  id result = *(void **)(a1 + 32);
  if (*(void *)(v3 + 8) != *(void *)(result[1] + 128))
  {
    uint64_t v4 = [result _customURLLoader];
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(a1 + 40)];
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v8 = *(void *)(VTable + 8);
    id result = (void *)(VTable + 8);
    uint64_t v7 = v8;
    if (v8) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(uint64_t (**)(uint64_t, void, uint64_t))(v9 + 56);
    if (v10) {
      id result = (void *)v10(v4, *MEMORY[0x1E4F202D8], v5);
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 128) = *(void *)(a1 + 40);
  }
  return result;
}

@end