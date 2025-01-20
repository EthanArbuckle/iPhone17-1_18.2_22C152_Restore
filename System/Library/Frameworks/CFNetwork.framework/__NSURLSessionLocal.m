@interface __NSURLSessionLocal
- (_BYTE)taskForClassInfo:(unsigned char *)result;
- (__NSURLSessionLocal)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 delegateDispatchQueue:(id)a6;
- (id).cxx_construct;
- (id)AVAggregateAssetDownloadTaskForURLAsset:(id)a3 mediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7;
- (id)AVAssetDownloadTaskForURLAsset:(id)a3 assetTitle:(id)a4 assetArtworkData:(id)a5 options:(id)a6 downloadConfiguration:(id)a7;
- (id)AVAssetDownloadTaskForURLAsset:(id)a3 destinationURL:(id)a4 options:(id)a5;
- (id)_AVAssetDownloadTaskForURL:(id)a3 destinationURL:(id)a4 options:(id)a5;
- (id)_createCanonicalRequestForTask:(id)result;
- (id)_dataTaskWithTaskForClass:(id)a3;
- (id)_downloadTaskWithTaskForClass:(id)a3;
- (id)_protocolClassesForTask:(uint64_t)a1;
- (id)_uploadTaskWithTaskForClass:(id)a3;
- (id)_withXURLCache:(id *)result;
- (id)copyWithZone:(_NSZone *)a3;
- (id)replaceTask:(void *)a3 withTask:;
- (id)webSocketTaskForRequest:(id)a3;
- (id)webSocketTaskForURL:(id)a3 protocols:(id)a4;
- (uint64_t)_cfurlRequest:(CFTypeRef)cf2 isCacheEquivalentTo:;
- (uint64_t)_createXCookieStorage;
- (uint64_t)_createXCredentialStorage;
- (uint64_t)_getCookieHeadersForTask:(uint64_t)a3 completionHandler:;
- (uint64_t)_newURLProtocolForTask:(uint64_t)a1 client:(uint64_t)a2 protocolClass:(void *)a3;
- (uint64_t)_onqueue_configureAndCreateConnection:(void *)a3 task:;
- (uint64_t)_request:(uint64_t)a3 isCacheEquivalentTo:;
- (uint64_t)_withConnectionCache_setCurrentSSLMethod:(uint64_t)a3 forKey:(const void *)a4 scheduling:;
- (unint64_t)nextSeed;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)_flushOrResetStorage:(uint64_t)a3 reset:;
- (void)_onqueue_canonicalizeTaskAndCreateConnection:(uint64_t)a1;
- (void)_onqueue_checkForCompletion;
- (void)_onqueue_completeInvalidation:(BOOL)a3;
- (void)_onqueue_connectUploadTask:(void *)a3 strippedRequest:(uint64_t)a4 bodyStream:(const __CFArray *)a5 bodyParts:;
- (void)_onqueue_flushWithCompletionHandler:(id)a3;
- (void)_onqueue_getTasksWithCompletionHandler:(id)a3;
- (void)_onqueue_handleConnectionsAtAPSleep;
- (void)_onqueue_markConnectionsReusedAfterAPSleepWake;
- (void)_onqueue_resetStorageWithCompletionHandler:(id)a3;
- (void)_protocolClassForRequest:(uint64_t)a1;
- (void)_protocolClassForTask:(int)a3 skipAppSSO:;
- (void)_useTLSSessionCacheFromSession:(id)a3;
- (void)addConnectionlessTask:(uint64_t)a1;
- (void)addUnresumedTask:(uint64_t)a1;
- (void)dealloc;
- (void)removeConnectionlessTask:(uint64_t)a1;
- (void)removeUnresumedTask:(uint64_t)a1;
- (void)task:(uint64_t)a1 terminatedConnection:(uint64_t)a2;
@end

@implementation __NSURLSessionLocal

- (void)_onqueue_connectUploadTask:(void *)a3 strippedRequest:(uint64_t)a4 bodyStream:(const __CFArray *)a5 bodyParts:
{
  if (!a1) {
    return;
  }
  uint64_t v10 = [a2 resumableUploadState];
  if (v10 && *(_DWORD *)(v10 + 16) == 2) {
    a4 = objc_msgSend(MEMORY[0x1E4F1CA10], "inputStreamWithData:", objc_msgSend(MEMORY[0x1E4F1C9B8], "data"));
  }
  if ((unint64_t)a5 | a4)
  {
    if (a4)
    {
      uint64_t v12 = [a2 resumableUploadState];
      if (v12) {
        *(_DWORD *)(v12 + 16) = 2;
      }
      CFURLRequestSetHTTPRequestBodyStream(a3, (CFTypeRef)a4);
    }
    else if (a5 && FormContentLengthWithArray(a5) >= 1)
    {
      URLRequest::_setHTTPBodyParts((URLRequest *)[a3 _inner], a5, 0);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (a2)
      {
        uint64_t v11 = a2[88];
        if (!v11) {
          uint64_t v11 = a2[87];
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __87____NSURLSessionLocal__onqueue_connectUploadTask_strippedRequest_bodyStream_bodyParts___block_invoke;
      v14[3] = &unk_1E5252498;
      v14[4] = a2;
      v14[5] = a1;
      v14[6] = a3;
      -[__NSCFURLSessionDelegateWrapper task:needNewBodyStream:](v11, a2, v14);
      return;
    }
  }
  id v13 = [[NSURLRequest alloc] _initWithCFURLRequest:a3];
  [a2 updateCurrentRequest:v13];

  -[__NSURLSessionLocal _onqueue_canonicalizeTaskAndCreateConnection:](a1, a2);
}

- (void)_onqueue_canonicalizeTaskAndCreateConnection:(uint64_t)a1
{
  if (a1)
  {
    id v4 = -[__NSURLSessionLocal _createCanonicalRequestForTask:]((id)[a2 session], a2);
    v5 = objc_msgSend((id)objc_msgSend(a2, "currentRequest"), "URL");
    if objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "URL"), "scheme"), "isEqualToString:", @"https")&& (objc_msgSend((id)objc_msgSend(v5, "scheme"), "isEqualToString:", @"http"))
    {
      if (a2)
      {
        uint64_t v6 = a2[88];
        if (!v6) {
          uint64_t v6 = a2[87];
        }
      }
      else
      {
        uint64_t v6 = 0;
      }
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __68____NSURLSessionLocal__onqueue_canonicalizeTaskAndCreateConnection___block_invoke;
      v7[3] = &unk_1E52524C0;
      v7[4] = a1;
      v7[5] = a2;
      -[__NSCFURLSessionDelegateWrapper task:_schemeUpgraded:completionHandler:](v6, a2, v4, v7);
    }
    else
    {
      -[__NSURLSessionLocal _onqueue_configureAndCreateConnection:task:](a1, (uint64_t)v4, a2);
    }
  }
}

- (id)_protocolClassesForTask:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(unsigned char *)(a1 + 68))
    {
      os_unfair_lock_lock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
      if (_localProtocolClassesForDefaultSession)
      {
        id v4 = (id)objc_msgSend((id)_localProtocolClassesForDefaultSession, "arrayByAddingObjectsFromArray:", +[NSURLSessionConfiguration _defaultProtocolClasses](NSURLSessionConfiguration, "_defaultProtocolClasses"));
        os_unfair_lock_unlock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
        return v4;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
    }
    if (!a2)
    {
      v5 = *(void **)(a1 + 112);
      goto LABEL_9;
    }
  }
  else if (!a2)
  {
    v5 = 0;
    goto LABEL_9;
  }
  v5 = (void *)[a2 _effectiveConfiguration];
LABEL_9:
  uint64_t v6 = (void *)[v5 protocolClasses];
  id v4 = +[NSURLSessionConfiguration _defaultProtocolClasses];
  if (v6 && ([v6 isEqualToArray:v4] & 1) == 0)
  {
    v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v6];
    v8 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:v7];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v4);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (([v8 containsObject:v12] & 1) == 0)
          {
            [v8 addObject:v12];
            [v7 addObject:v12];
          }
        }
        uint64_t v9 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
    return v7;
  }
  return v4;
}

- (id).cxx_construct
{
  *((void *)self + 29) = 850045863;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((void *)self + 36) = 0;
  *((void *)self + 37) = 850045863;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_OWORD *)self + 21) = 0u;
  *((void *)self + 44) = 0;
  return self;
}

- (id)_dataTaskWithTaskForClass:(id)a3
{
  v5 = objc_opt_class();
  if (a3)
  {
    objc_setProperty_atomic(a3, v6, v5, 8);
    v7 = self;
    id v8 = a3;
  }
  else
  {
    v7 = self;
    id v8 = 0;
  }

  return -[__NSURLSessionLocal taskForClassInfo:](v7, v8);
}

- (void)task:(uint64_t)a1 terminatedConnection:(uint64_t)a2
{
  if (a1)
  {
    [*(id *)(a1 + 176) removeObject:a2];
    v3 = *(NSObject **)(a1 + 120);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49____NSURLSessionLocal_task_terminatedConnection___block_invoke;
    block[3] = &unk_1E5258228;
    block[4] = a1;
    dispatch_async(v3, block);
  }
}

- (void)removeUnresumedTask:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 400));
    [*(id *)(a1 + 184) removeObject:a2];
    uint64_t v4 = [*(id *)(a1 + 184) anyObject];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 400));
    if (!v4)
    {
      v5 = *(NSObject **)(a1 + 120);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __43____NSURLSessionLocal_removeUnresumedTask___block_invoke;
      block[3] = &unk_1E5258228;
      block[4] = a1;
      dispatch_async(v5, block);
    }
  }
}

- (uint64_t)_request:(uint64_t)a3 isCacheEquivalentTo:
{
  if (!a1) {
    return 0;
  }
  if (!a2) {
    __assert_rtn("-[__NSURLSessionLocal _request:isCacheEquivalentTo:]", "LocalSession.mm", 1797, "a");
  }
  if (!a3) {
    __assert_rtn("-[__NSURLSessionLocal _request:isCacheEquivalentTo:]", "LocalSession.mm", 1798, "b");
  }
  uint64_t v6 = -[__NSURLSessionLocal _protocolClassForRequest:](a1, a2);
  v7 = -[__NSURLSessionLocal _protocolClassForRequest:](a1, a3);
  if (!v6 || !v7 || v6 != v7) {
    return 0;
  }
  if (v6 == objc_opt_class())
  {
    return [v6 requestIsCacheEquivalent:a2 toRequest:a3];
  }
  else
  {
    id v8 = objc_msgSend((id)objc_msgSend(v6, "canonicalRequestForRequest:", a2), "URL");
    uint64_t v9 = objc_msgSend((id)objc_msgSend(v6, "canonicalRequestForRequest:", a3), "URL");
    return [v8 isEqual:v9];
  }
}

- (id)_createCanonicalRequestForTask:(id)result
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    objc_msgSend(a2, "set_protocolForTask:", 0);
    id v6 = (id)[a2 currentRequest];
    uint64_t v4 = -[__NSURLSessionLocal _protocolClassForTask:skipAppSSO:](v3, a2, 0);
    if (v4)
    {
      v5 = v4;
      id v6 = (id)[v4 canonicalRequestForRequest:v6 task:a2];
      objc_msgSend(a2, "set_protocolForTask:", v5);
    }
    return v6;
  }
  return result;
}

- (void)_protocolClassForTask:(int)a3 skipAppSSO:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = -[__NSURLSessionLocal _protocolClassesForTask:](a1, a2);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
          if (!a3 || (objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class(), (void)v12) & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && ([v10 isSubclassOfClass:objc_opt_class()] & 1) == 0)
            {
              if (objc_msgSend(v10, "canInitWithRequest:", objc_msgSend(a2, "currentRequest"))) {
                return v10;
              }
            }
            else if (objc_msgSend(v10, "canInitWithTask:", a2, (void)v12))
            {
              return v10;
            }
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return 0;
}

- (void)_protocolClassForRequest:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = -[__NSURLSessionLocal _protocolClassesForTask:](a1, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v11;
LABEL_4:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v11 != v6) {
      objc_enumerationMutation(v3);
    }
    uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
    if (objc_msgSend(v8, "canInitWithRequest:", a2, (void)v10)) {
      return v8;
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        goto LABEL_4;
      }
      return 0;
    }
  }
}

- (uint64_t)_newURLProtocolForTask:(uint64_t)a1 client:(uint64_t)a2 protocolClass:(void *)a3
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = objc_msgSend(a3, "_cf_internalImpl");
    uint64_t v7 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(v6 + 64))(*MEMORY[0x1E4F1CF80], a1, a2, v6);
    if (v7)
    {
      uint64_t v8 = v7;
      if (TCFObject<URLProtocol>::Class(void)::sOnce != -1) {
        dispatch_once(&TCFObject<URLProtocol>::Class(void)::sOnce, &__block_literal_global_397);
      }
      return v8 + 16;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (TCFObject<URLProtocol>::Class(void)::sOnce != -1) {
      dispatch_once(&TCFObject<URLProtocol>::Class(void)::sOnce, &__block_literal_global_397);
    }
    uint64_t Instance = _CFRuntimeCreateInstance();
    uint64_t v9 = Instance;
    if (Instance)
    {
      *(_OWORD *)(Instance + 16) = 0u;
      uint64_t v9 = Instance + 16;
      *(void *)(Instance + 160) = 0;
      *(_OWORD *)(Instance + 128) = 0u;
      *(_OWORD *)(Instance + 144) = 0u;
      *(_OWORD *)(Instance + 96) = 0u;
      *(_OWORD *)(Instance + 112) = 0u;
      *(_OWORD *)(Instance + 64) = 0u;
      *(_OWORD *)(Instance + 80) = 0u;
      *(_OWORD *)(Instance + 32) = 0u;
      *(_OWORD *)(Instance + 48) = 0u;
    }
    *(void *)uint64_t v9 = &unk_1ECF9DBC0;
    *(void *)(v9 + 8) = &unk_1ECF9DCC8;
    *(void *)(v9 + 16) = &unk_1ECF9DCE8;
    *(_DWORD *)(v9 + 140) = 0;
    *(void *)(v9 + 112) = a3;
    *(void *)(v9 + 144) = _copyPrivateProtocolSchedulingSet();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v9 + 56))(v9, a1, a2);
  }
  return v9;
}

- (uint64_t)_onqueue_configureAndCreateConnection:(void *)a3 task:
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = objc_opt_class();
    [a3 updateCurrentRequest:a2];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66____NSURLSessionLocal__onqueue_configureAndCreateConnection_task___block_invoke;
    v7[3] = &unk_1E52582F0;
    v7[4] = v5;
    v7[5] = a3;
    void v7[6] = v6;
    return objc_msgSend(a3, "_onqueue_setupNextEffectiveConfigurationWithCompletionHandler:", v7);
  }
  return result;
}

- (id)replaceTask:(void *)a3 withTask:
{
  if (result)
  {
    uint64_t v5 = result;
    if ([a2 _powerAssertion])
    {
      objc_msgSend(a3, "set_powerAssertion:", objc_msgSend(a2, "_powerAssertion"));
      objc_msgSend(a2, "set_powerAssertion:", 0);
      CFStringRef v6 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"NSURLSessionTask %p", a3);
      if (v6)
      {
        CFStringRef v7 = v6;
        IOPMAssertionSetProperty([a3 _powerAssertion], @"AssertName", v6);
        CFRelease(v7);
      }
    }
    id v8 = a2;
    [v5[22] addObject:a3];
    [v5[22] removeObject:a2];
    return (id *)a2;
  }
  return result;
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 296));

  std::mutex::~mutex((std::mutex *)((char *)self + 232));
}

- (uint64_t)_getCookieHeadersForTask:(uint64_t)a3 completionHandler:
{
  if (result)
  {
    if (nw_settings_get_signposts_enabled()) {
      kdebug_trace();
    }
    v18 = __66____NSURLSessionLocal__getCookieHeadersForTask_completionHandler___block_invoke;
    uint64_t v19 = &unk_1E52525D8;
    v20 = a2;
    uint64_t v21 = a3;
    uint64_t v5 = objc_msgSend(a2, "currentRequest", MEMORY[0x1E4F143A8], 3221225472);
    if (v5
      && (CFStringRef v6 = (void *)v5, [a2 shouldHandleCookiesAndSchemeIsAppropriate])
      && (uint64_t v7 = [a2 _createXCookieStorage]) != 0)
    {
      id v8 = (_OWORD *)v7;
      uint64_t v9 = *(void *)([v6 _inner] + 56);
      if (v9)
      {
        long long v10 = *(const void **)(v9 + 184);
        if (v10)
        {
          CFTypeRef v11 = CFRetain(v10);
          if (v11)
          {
            long long v12 = v11;
            CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            long long v14 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 40, 0);
            *long long v14 = 0u;
            v14[1] = 0u;
            *((void *)v14 + 4) = 0;
            CFAllocatedReferenceCountedObject::CFAllocatedReferenceCountedObject((CFAllocatedReferenceCountedObject *)v14, v13);
            *uint64_t v15 = &unk_1ECF9ECB0;
            v15[3] = v8;
            (*(void (**)(_OWORD *))(*(void *)v8 + 40))(v8);
            *((void *)v14 + 4) = _CookieStorageCreateInMemory(v13, v16);
            (*(void (**)(_OWORD *))(*(void *)v8 + 48))(v8);
            (*(void (**)(_OWORD *, const void *))(*(void *)v14 + 80))(v14, v12);
            CFRelease(v12);
            id v8 = v14;
          }
        }
      }
      (*(void (**)(_OWORD *, void *, uint64_t *))(*(void *)v8 + 88))(v8, a2, &v17);
      return (*(uint64_t (**)(_OWORD *))(*(void *)v8 + 48))(v8);
    }
    else
    {
      return v18((uint64_t)&v17, 0);
    }
  }
  return result;
}

- (void)_onqueue_getTasksWithCompletionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[*((id *)self + 22) copy];
  CFStringRef v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        CFTypeRef v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 state] <= 1) {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62____NSURLSessionLocal__onqueue_getTasksWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E5258028;
  v12[4] = v6;
  v12[5] = a3;
  -[NSURLSession runDelegateBlock:]((uint64_t)self, v12);
}

- (__NSURLSessionLocal)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 delegateDispatchQueue:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)__NSURLSessionLocal;
  uint64_t v7 = [(NSURLSession *)&v20 initWithConfiguration:a3 delegate:a4 delegateQueue:a5 delegateDispatchQueue:a6];
  uint64_t v8 = v7;
  if (v7)
  {
    *((void *)v7 + 20) = 1;
    *((void *)v7 + 22) = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    if (a3)
    {
      [a3 getConnectionCacheLimits];
    }
    else
    {
      uint64_t v19 = 0;
      long long v17 = 0u;
      long long v18 = 0u;
    }
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    objc_setProperty_atomic(v8, v10, v9, 152);
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    long long v12 = (char *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 160, 0);
    *(_OWORD *)long long v12 = 0u;
    *((_OWORD *)v12 + 1) = 0u;
    *((_OWORD *)v12 + 2) = 0u;
    *((_OWORD *)v12 + 3) = 0u;
    *((_OWORD *)v12 + 8) = 0u;
    *((_OWORD *)v12 + 9) = 0u;
    *((_OWORD *)v12 + 6) = 0u;
    *((_OWORD *)v12 + 7) = 0u;
    *((_OWORD *)v12 + 4) = 0u;
    *((_OWORD *)v12 + 5) = 0u;
    CFAllocatedReferenceCountedObject::CFAllocatedReferenceCountedObject((CFAllocatedReferenceCountedObject *)v12, v11);
    *(void *)long long v12 = &unk_1ECF9C2D0;
    *((void *)v12 + 3) = &unk_1ECFA0310;
    *((void *)v12 + 4) = CFDictionaryCreateMutable(v11, 0, &CFAllocatedReferenceCountedObject::skCFTypeDictionaryKeyCallBacks, &CFAllocatedReferenceCountedObject::skCFTypeDictionaryValueCallBacks);
    *(_OWORD *)(v12 + 104) = v17;
    *(_OWORD *)(v12 + 120) = v18;
    *((void *)v12 + 18) = 0;
    *((void *)v12 + 19) = 0;
    *((void *)v12 + 17) = v19;
    pthread_mutexattr_init(&v21);
    pthread_mutexattr_settype(&v21, 0);
    pthread_mutex_init((pthread_mutex_t *)(v12 + 40), &v21);
    pthread_mutexattr_destroy(&v21);
    *((void *)v8 + 21) = v12;
    uint64_t v13 = *((void *)v8 + 2);
    long long v14 = (std::__shared_weak_count *)*((void *)v8 + 3);
    if (v14)
    {
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    long long v15 = (std::__shared_weak_count *)*((void *)v12 + 19);
    *((void *)v12 + 18) = v13;
    *((void *)v12 + 19) = v14;
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v15);
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v14);
    }
    *((unsigned char *)v8 + 224) = 0;
    *((unsigned char *)v8 + 225) = 0;
    *((void *)v8 + 23) = (id)objc_msgSend(MEMORY[0x1E4F28D30], "weakObjectsHashTable", v17, v18, v19);
    *((_DWORD *)v8 + 100) = 0;
  }
  return v8;
}

- (uint64_t)_cfurlRequest:(CFTypeRef)cf2 isCacheEquivalentTo:
{
  if (!cf1) {
    __assert_rtn("-[__NSURLSessionLocal _cfurlRequest:isCacheEquivalentTo:]", "LocalSession.mm", 1818, "a");
  }
  if (cf1 == cf2 || CFEqual(cf1, cf2)) {
    return 1;
  }
  id v7 = [[NSURLRequest alloc] _initWithCFURLRequest:cf1];
  id v8 = [[NSURLRequest alloc] _initWithCFURLRequest:cf2];
  uint64_t v9 = -[__NSURLSessionLocal _request:isCacheEquivalentTo:](a1, (uint64_t)v7, (uint64_t)v8);

  return v9;
}

- (id)_downloadTaskWithTaskForClass:(id)a3
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)self + 360))
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    id v3 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_184085000, v3, OS_LOG_TYPE_ERROR, "Attempted to create a task in a session that has been invalidated", buf, 2u);
    }
    uint64_t v4 = (NSString *)dyld_program_sdk_at_least();
    if (v4) {
      __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v4);
    }
    return 0;
  }
  if (!a3 || !objc_getProperty(a3, a2, 16, 1) && !objc_getProperty(a3, v8, 64, 1))
  {
    if (dyld_program_sdk_at_least()) {
      __URLSESSION_CLIENT_API_MISUSE_NIL_ARGUMENT__(&cfstr_CannotCreateDo.isa);
    }
    return 0;
  }
  id Property = objc_getProperty(a3, v8, 64, 1);
  SEL v10 = [__NSCFLocalDownloadTask alloc];
  id v12 = [(NSURLSession *)self defaultTaskGroup];
  if (!Property)
  {
    id v41 = objc_getProperty(a3, v11, 16, 1);
    id v36 = objc_getProperty(a3, v42, 56, 1);
    uint64_t v37 = [(__NSURLSessionLocal *)self nextSeed];
    v38 = v10;
    uint64_t v39 = (uint64_t)v12;
    uint64_t v40 = (uint64_t)v41;
    goto LABEL_34;
  }
  id v13 = objc_getProperty(a3, v11, 64, 1);
  unint64_t v14 = [(__NSURLSessionLocal *)self nextSeed];
  if (v10)
  {
    unint64_t v16 = v14;
    v10->_initialResumeSize = -1;
    id v17 = +[__NSCFLocalDownloadTask _expandResumeData:v13];
    if (!v17
      || (long long v18 = v17,
          (uint64_t v19 = +[__NSCFLocalDownloadTask _requestFromResumeDataDictionary:]((uint64_t)__NSCFLocalDownloadTask, v17)) == 0))
    {

      goto LABEL_30;
    }
    objc_super v20 = v19;
    v106.receiver = v10;
    v106.super_class = (Class)__NSCFLocalDownloadTask;
    pthread_mutexattr_t v21 = [(__NSURLSessionLocal *)&v106 initWithOriginalRequest:v19 ident:v16 taskGroup:v12];
    if (!v21) {
      goto LABEL_30;
    }
    id v22 = +[__NSCFLocalDownloadTask _requestFromResumeDataDictionary:key:]((uint64_t)__NSCFLocalDownloadTask, v18, @"NSURLSessionResumeOriginalRequest");
    if (v22) {
      [(__NSURLSessionLocal *)v21 setOriginalRequest:v22];
    }
    uint64_t v23 = [v18 objectForKeyedSubscript:@"NSURLSessionResumeResponse"];
    if (v23)
    {
      *(void *)v111 = 0;
      -[__NSURLSessionLocal setResponse:](v21, "setResponse:", [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v23 error:v111]);
      if (![(__NSURLSessionLocal *)v21 response])
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        v24 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          uint64_t v85 = [(__NSURLSessionLocal *)v21 _loggableDescription];
          *(_DWORD *)v113 = 138543618;
          *(void *)&v113[4] = v85;
          *(_WORD *)&v113[12] = 2112;
          *(void *)&v113[14] = *(void *)v111;
          _os_log_error_impl(&dword_184085000, v24, OS_LOG_TYPE_ERROR, "%{public}@ failed to unarchive response: %@", v113, 0x16u);
        }
      }
    }
    *(void *)v113 = 0;
    *(void *)&v113[8] = v113;
    *(void *)&v113[16] = 0x2020000000;
    uint64_t v114 = -1;
    uint64_t v25 = [v18 objectForKey:@"NSURLSessionResumeInfoLocalPath"];
    v26 = (NSString *)v25;
    if (!v25)
    {
      v27 = (NSString *)[-[__NSCFLocalDownloadTask explicitDownloadDirectory](v21) path];
      if (!v27) {
        v27 = NSTemporaryDirectory();
      }
      uint64_t v28 = [v18 objectForKey:@"NSURLSessionResumeInfoTempFileName"];
      if (v28) {
        v26 = [(NSString *)v27 stringByAppendingPathComponent:v28];
      }
      else {
        v26 = 0;
      }
    }
    v51 = (void *)[v18 objectForKey:@"NSURLSessionResumeExtractor"];
    if (v51)
    {
      [(__NSURLSessionLocal *)v21 set_extractor:v51];
      *(void *)v111 = 0;
      *(void *)&v111[8] = v111;
      *(void *)&v111[16] = 0x2020000000;
      char v112 = 1;
      if (v26)
      {
        v52 = dispatch_semaphore_create(0);
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        v53 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v54 = [(__NSURLSessionLocal *)v21 _loggableDescription];
          *(_DWORD *)v107 = 138543619;
          uint64_t v108 = v54;
          __int16 v109 = 2113;
          v110 = v26;
          _os_log_impl(&dword_184085000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ StreamingZip preparing extraction to %{private}@", v107, 0x16u);
        }
        *(void *)buf = MEMORY[0x1E4F143A8];
        uint64_t v98 = 3221225472;
        v99 = __62____NSCFLocalDownloadTask_initWithTaskGroup_resumeData_ident___block_invoke;
        v100 = &unk_1E5252C00;
        v101 = v20;
        v102 = v21;
        v104 = v113;
        v105 = v111;
        v103 = v52;
        [v51 prepareForExtractionToPath:v26 completionBlock:buf];
        if (dispatch_semaphore_wait(v52, 0xFFFFFFFFFFFFFFFFLL))
        {
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
          }
          v55 = CFNLog::logger;
          if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
          {
            uint64_t v84 = [(__NSURLSessionLocal *)v21 _loggableDescription];
            *(_DWORD *)v107 = 138543362;
            uint64_t v108 = v84;
            _os_log_error_impl(&dword_184085000, v55, OS_LOG_TYPE_ERROR, "%{public}@ StreamingZip Error - timed out waiting for return from prepareForExtraction.", v107, 0xCu);
          }
          *(unsigned char *)(*(void *)&v111[8] + 24) = 0;
        }
        dispatch_release(v52);
        if (!*(unsigned char *)(*(void *)&v111[8] + 24))
        {

          _Block_object_dispose(v111, 8);
LABEL_112:
          _Block_object_dispose(v113, 8);
          goto LABEL_30;
        }
      }
      _Block_object_dispose(v111, 8);
LABEL_74:
      uint64_t v67 = [v18 objectForKey:@"NSURLSessionResumeEntityTag"];
      if (!v67) {
        uint64_t v67 = [v18 objectForKey:@"NSURLSessionResumeServerDownloadDate"];
      }
      [(NSMutableURLRequest *)v20 setValue:v67 forHTTPHeaderField:0x1EC0A23B8];
      [(__NSURLSessionLocal *)v21 updateCurrentRequest:v20];
      *((void *)v21 + 123) = *(void *)(*(void *)&v113[8] + 24);
      *((void *)v21 + 121) = *(void *)(*(void *)&v113[8] + 24);
      v68 = objc_msgSend((id)-[__NSURLSessionLocal _taskGroup](v21, "_taskGroup"), "_groupConfiguration");
      if ([v68 _requiresClientToOpenFiles])
      {
        v69 = [__NSCFLocalDownloadFile alloc];
        if (v69)
        {
          v70 = -[__NSCFLocalDownloadFile initQueues](v69);
          v71 = v70;
          if (v70)
          {
            [v70 setPath:v26];
            v71[24] = v21;
          }
        }
        else
        {
          v71 = 0;
        }
        v72 = v71;
      }
      else
      {
        v73 = [__NSCFLocalDownloadFile alloc];
        if (v73)
        {
          v74 = -[__NSCFLocalDownloadFile initQueues](v73);
          if (v74)
          {
            int v75 = open([(NSString *)v26 UTF8String], 9, 438);
            if (v75 < 0)
            {
              v74[47] = *__error();
              if (CFNLog::onceToken != -1) {
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
              }
              v76 = CFNLog::logger;
              if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
              {
                int v88 = v74[47];
                *(_DWORD *)v111 = 67109378;
                *(_DWORD *)&v111[4] = v88;
                *(_WORD *)&v111[8] = 2112;
                *(void *)&v111[10] = v26;
                _os_log_error_impl(&dword_184085000, v76, OS_LOG_TYPE_ERROR, "__NSCFLocalDownloadFile: error %d opening resume file: %@", v111, 0x12u);
              }
            }
            else
            {
              [v74 setPath:v26];
              close(v75);
            }
          }
        }
        else
        {
          v74 = 0;
        }
        [(__NSURLSessionLocal *)v21 setDownloadFile:v74];
        uint64_t v77 = [(__NSURLSessionLocal *)v21 downloadFile];
        if (!v77 || !*(_DWORD *)(v77 + 188)) {
          goto LABEL_98;
        }
        if ([(__NSURLSessionLocal *)v21 _extractor])
        {
          uint64_t v78 = [(__NSURLSessionLocal *)v21 downloadFile];
          if (v78)
          {
            if (*(_DWORD *)(v78 + 188) == 21)
            {
              objc_msgSend((id)-[__NSURLSessionLocal downloadFile](v21, "downloadFile"), "setPath:", v26);
LABEL_98:
              if ([(__NSURLSessionLocal *)v21 downloadFile])
              {
                if (v25) {
                  LOBYTE(v79) = 1;
                }
                else {
                  uint64_t v79 = objc_msgSend(v68, "skip_download_unlink");
                }
                uint64_t v80 = [(__NSURLSessionLocal *)v21 downloadFile];
                if (v80) {
                  *(unsigned char *)(v80 + 185) = v79;
                }
                *((unsigned char *)v21 + 1028) = [(__NSURLSessionLocal *)v21 downloadFile] != 0;
                *((void *)v21 + 124) = v18;
              }
              -[__NSURLSessionLocal set_backgroundPublishingURL:](v21, "set_backgroundPublishingURL:", [v18 objectForKey:@"PublishingURL"]);
              if ([(__NSURLSessionLocal *)v21 downloadFile])
              {
                _Block_object_dispose(v113, 8);
                [(__NSURLSessionLocal *)v21 set_suspensionThreshhold:0x80000];
                goto LABEL_35;
              }
              if (CFNLog::onceToken != -1) {
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
              }
              v81 = CFNLog::logger;
              if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
              {
                uint64_t v82 = [(__NSURLSessionLocal *)v21 _loggableDescription];
                *(_DWORD *)v111 = 138543362;
                *(void *)&v111[4] = v82;
                _os_log_error_impl(&dword_184085000, v81, OS_LOG_TYPE_ERROR, "%{public}@ cannot create download file from resume data", v111, 0xCu);
              }

              goto LABEL_112;
            }
          }
        }
        v72 = 0;
      }
      [(__NSURLSessionLocal *)v21 setDownloadFile:v72];
      goto LABEL_98;
    }
    uint64_t v56 = objc_msgSend((id)objc_msgSend(v18, "objectForKey:", @"NSURLSessionResumeBytesReceived"), "longLongValue");
    *(void *)(*(void *)&v113[8] + 24) = v56;
    v57 = (void *)[v22 valueForHTTPHeaderField:0x1EC0A2700];
    if ([v57 hasPrefix:@"bytes="]
      && (v58 = (void *)[v57 componentsSeparatedByString:@"="], (v59 = v58) != 0)
      && (unint64_t)[v58 count] >= 2
      && (v60 = (void *)[v59 objectAtIndexedSubscript:1], (v61 = v60) != 0))
    {
      v62 = (void *)[v60 componentsSeparatedByString:@"-"];
      if ([v62 count] != 2)
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        v83 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v111 = 138412290;
          *(void *)&v111[4] = v61;
          _os_log_impl(&dword_184085000, v83, OS_LOG_TYPE_DEFAULT, "Unsupported Range header value, restarting: %@", v111, 0xCu);
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data"), "writeToFile:atomically:", v26, 0);
        goto LABEL_74;
      }
      if ([v61 hasPrefix:@"-"])
      {
        uint64_t v63 = objc_msgSend((id)objc_msgSend(v62, "objectAtIndexedSubscript:", 1), "longLongValue");
        uint64_t v64 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=-%lld", v63 - *(void *)(*(void *)&v113[8] + 24));
        [(NSMutableURLRequest *)v20 setValue:v64 forHTTPHeaderField:0x1EC0A2700];
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        v65 = CFNLog::logger;
        if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_74;
        }
        *(_DWORD *)v111 = 138412290;
        *(void *)&v111[4] = v64;
      }
      else if ([v61 hasSuffix:@"-"])
      {
        uint64_t v86 = objc_msgSend((id)objc_msgSend(v62, "objectAtIndexedSubscript:", 0), "longLongValue");
        uint64_t v87 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=%lld-", *(void *)(*(void *)&v113[8] + 24) + v86);
        [(NSMutableURLRequest *)v20 setValue:v87 forHTTPHeaderField:0x1EC0A2700];
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        v65 = CFNLog::logger;
        if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_74;
        }
        *(_DWORD *)v111 = 138412290;
        *(void *)&v111[4] = v87;
      }
      else
      {
        v89 = (void *)[v62 objectAtIndexedSubscript:0];
        v90 = (void *)[v62 objectAtIndexedSubscript:1];
        uint64_t v91 = [v89 longLongValue];
        uint64_t v92 = [v90 longLongValue];
        uint64_t v93 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=%lld-%lld", *(void *)(*(void *)&v113[8] + 24) + v91, v92);
        [(NSMutableURLRequest *)v20 setValue:v93 forHTTPHeaderField:0x1EC0A2700];
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        v65 = CFNLog::logger;
        if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_74;
        }
        *(_DWORD *)v111 = 138412290;
        *(void *)&v111[4] = v93;
      }
    }
    else
    {
      uint64_t v66 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=%lld-", *(void *)(*(void *)&v113[8] + 24));
      [(NSMutableURLRequest *)v20 setValue:v66 forHTTPHeaderField:0x1EC0A2700];
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v65 = CFNLog::logger;
      if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_74;
      }
      *(_DWORD *)v111 = 138412290;
      *(void *)&v111[4] = v66;
    }
    _os_log_debug_impl(&dword_184085000, v65, OS_LOG_TYPE_DEBUG, "Request Range header value: %@", v111, 0xCu);
    goto LABEL_74;
  }
LABEL_30:
  v30 = objc_getProperty(a3, v15, 16, 1);
  if (!v30)
  {
    id v31 = +[__NSCFLocalDownloadTask _expandResumeData:objc_getProperty(a3, v29, 64, 1)];
    v30 = +[__NSCFLocalDownloadTask _requestFromResumeDataDictionary:]((uint64_t)__NSCFLocalDownloadTask, v31);
    if (!v30)
    {
      if (dyld_program_sdk_at_least()) {
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot create download task with corrupt resume data" userInfo:0]);
      }
      return 0;
    }
  }
  v32 = [__NSCFLocalDownloadTask alloc];
  id v34 = objc_getProperty(a3, v33, 88, 1);
  id v36 = objc_getProperty(a3, v35, 56, 1);
  uint64_t v37 = [(__NSURLSessionLocal *)self nextSeed];
  v38 = v32;
  uint64_t v39 = (uint64_t)v34;
  uint64_t v40 = (uint64_t)v30;
LABEL_34:
  pthread_mutexattr_t v21 = (__NSURLSessionLocal *)-[__NSCFLocalDownloadTask initWithTaskGroup:request:filePath:ident:](v38, v39, v40, (uint64_t)v36, v37);
  if (v21)
  {
LABEL_35:
    os_unfair_lock_lock((os_unfair_lock_t)self + 100);
    [*((id *)self + 23) addObject:v21];
    os_unfair_lock_unlock((os_unfair_lock_t)self + 100);
    if (objc_getProperty(a3, v43, 72, 1))
    {
      id v45 = objc_getProperty(a3, v44, 72, 1);
      v46 = _Block_copy(v45);
      newValue[0] = MEMORY[0x1E4F143A8];
      newValue[1] = 3221225472;
      newValue[2] = __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke;
      newValue[3] = &unk_1E5252588;
      newValue[4] = self;
      newValue[5] = v46;
      objc_setProperty_atomic_copy(v21, v47, newValue, 936);
    }
    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    v95[2] = __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke_2;
    v95[3] = &unk_1E52525B0;
    v95[4] = self;
    objc_setProperty_atomic_copy(v21, v44, v95, 808);
    [(__NSURLSessionLocal *)v21 setDelegate:objc_getProperty(a3, v48, 80, 1)];
    uint64_t v49 = *((void *)v21 + 88);
    if (!v49) {
      uint64_t v49 = *((void *)v21 + 87);
    }
    -[__NSCFURLSessionDelegateWrapper didCreateTask:](v49, v21);
    if ([(__NSURLSessionLocal *)v21 state] != 1)
    {
      v50 = *((void *)self + 15);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke_3;
      block[3] = &unk_1E5258228;
      block[4] = v21;
      dispatch_async(v50, block);
    }
  }
  return v21;
}

- (_BYTE)taskForClassInfo:(unsigned char *)result
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v2 = (uint64_t)result;
  if (result[360])
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    id v3 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_184085000, v3, OS_LOG_TYPE_ERROR, "Attempted to create a task in a session that has been invalidated", buf, 2u);
    }
    uint64_t v4 = (NSString *)dyld_program_sdk_at_least();
    if (v4) {
      __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v4);
    }
    return 0;
  }
  if (!self || !objc_getProperty(self, (SEL)self, 16, 1))
  {
    if (dyld_program_sdk_at_least()) {
      __URLSESSION_CLIENT_API_MISUSE_NIL_ARGUMENT__(&cfstr_CannotCreateTa.isa);
    }
    return 0;
  }
  id v7 = objc_alloc((Class)objc_getProperty(self, v6, 8, 1));
  id Property = objc_getProperty(self, v8, 16, 1);
  uint64_t v10 = [(id)v2 nextSeed];
  uint64_t v12 = objc_msgSend(v7, "initWithOriginalRequest:ident:taskGroup:", Property, v10, objc_getProperty(self, v11, 88, 1));
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 400));
  [*(id *)(v2 + 184) addObject:v12];
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 400));
  if (objc_getProperty(self, v13, 24, 1)) {
    objc_msgSend((id)v12, "set_uniqueIdentifier:", objc_getProperty(self, v14, 24, 1));
  }
  if ([*(id *)(v2 + 112) _disableAPWakeOnIdleConnections])
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 48));
    int v16 = *(unsigned char *)(v2 + 69) & 1;
    *(unsigned char *)(v2 + 69) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 48));
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    id v17 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v46 = v16;
      _os_log_impl(&dword_184085000, v17, OS_LOG_TYPE_DEFAULT, "consumeSystemPowerNotification returns %d", buf, 8u);
    }
    if (v16)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      long long v18 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_184085000, v18, OS_LOG_TYPE_DEFAULT, "Cleaning up session connections due to _disableAPWakeOnIdleConnections set", buf, 2u);
      }
      uint64_t v19 = *(CFDictionaryRef **)(v2 + 168);
      if (v19) {
        XTubeManager::invalidateAllConnections(v19, 0);
      }
    }
  }
  if (objc_getProperty(self, v15, 48, 1))
  {
    id v21 = objc_getProperty(self, v20, 48, 1);
    id v22 = _Block_copy(v21);
    newValue[0] = MEMORY[0x1E4F143A8];
    newValue[1] = 3221225472;
    newValue[2] = __40____NSURLSessionLocal_taskForClassInfo___block_invoke;
    newValue[3] = &unk_1E52524E8;
    newValue[4] = v2;
    newValue[5] = v22;
    if (v12)
    {
      objc_setProperty_atomic_copy((id)v12, v20, newValue, 784);
      *(unsigned char *)(v12 + 69) = 0;
    }
  }
  if (objc_getProperty(self, v20, 40, 1))
  {
    v24 = (void *)MEMORY[0x1E4F1C978];
    id v25 = objc_getProperty(self, v23, 40, 1);
    v26 = v24;
    goto LABEL_30;
  }
  if (objc_getProperty(self, v23, 32, 1))
  {
    v29 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(objc_getProperty(self, v30, 32, 1), "fileSystemRepresentation")));
    id v32 = objc_getProperty(self, v31, 32, 1);
    if (v12) {
      objc_setProperty_atomic((id)v12, v28, v32, 768);
    }
    goto LABEL_37;
  }
  uint64_t v39 = objc_msgSend(objc_getProperty(self, v30, 16, 1), "HTTPBodyStream");
  if (v39)
  {
    uint64_t v33 = v39;
    v29 = 0;
    goto LABEL_38;
  }
  v29 = objc_msgSend(objc_getProperty(self, v28, 16, 1), "HTTPBody");
  if (v29)
  {
    objc_getClass("OS_dispatch_data");
    if (objc_opt_isKindOfClass())
    {
      uint64_t v40 = (void *)[MEMORY[0x1E4F1CA48] array];
      applier[0] = MEMORY[0x1E4F143A8];
      applier[1] = 3221225472;
      applier[2] = __40____NSURLSessionLocal_taskForClassInfo___block_invoke_2;
      applier[3] = &unk_1E5252510;
      applier[4] = v40;
      dispatch_data_apply(v29, applier);
      v27 = (id)[v40 copy];
      goto LABEL_31;
    }
    v26 = (void *)MEMORY[0x1E4F1C978];
    id v25 = v29;
LABEL_30:
    v27 = [v26 arrayWithObject:v25];
LABEL_31:
    v29 = v27;
  }
LABEL_37:
  uint64_t v33 = 0;
LABEL_38:
  id v34 = objc_getProperty(self, v28, 32, 1);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __40____NSURLSessionLocal_taskForClassInfo___block_invoke_3;
  v42[3] = &unk_1E5252538;
  v42[4] = v34;
  v42[5] = v2;
  v42[6] = v33;
  v42[7] = v29;
  if (v12)
  {
    objc_setProperty_atomic_copy((id)v12, v35, v42, 808);
    objc_msgSend((id)v12, "setDelegate:", objc_getProperty(self, v36, 80, 1));
    uint64_t v37 = *(void *)(v12 + 704);
    if (!v37) {
      uint64_t v37 = *(void *)(v12 + 696);
    }
  }
  else
  {
    objc_msgSend(0, "setDelegate:", objc_getProperty(self, v35, 80, 1));
    uint64_t v37 = 0;
  }
  -[__NSCFURLSessionDelegateWrapper didCreateTask:](v37, (void *)v12);
  if ([(id)v12 state] != 1)
  {
    v38 = *(NSObject **)(v2 + 120);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __40____NSURLSessionLocal_taskForClassInfo___block_invoke_4;
    v41[3] = &unk_1E5258228;
    v41[4] = v12;
    dispatch_async(v38, v41);
  }
  return (id)v12;
}

- (unint64_t)nextSeed
{
  objc_sync_enter(self);
  unint64_t v3 = *((void *)self + 20);
  *((void *)self + 20) = v3 + 1;
  objc_sync_exit(self);
  return v3;
}

- (id)_uploadTaskWithTaskForClass:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (!a3)
  {
    if (*((unsigned char *)self + 360)) {
      goto LABEL_3;
    }
    goto LABEL_41;
  }
  objc_setProperty_atomic(a3, v6, v5, 8);
  if (*((unsigned char *)self + 360))
  {
LABEL_3:
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    SEL v8 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_184085000, v8, OS_LOG_TYPE_ERROR, "Attempted to create a task in a session that has been invalidated", buf, 2u);
    }
    uint64_t v9 = (NSString *)dyld_program_sdk_at_least();
    if (v9) {
      __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v9);
    }
    return 0;
  }
  if (!objc_getProperty(a3, v7, 16, 1) && !objc_getProperty(a3, v11, 64, 1))
  {
LABEL_41:
    if (dyld_program_sdk_at_least()) {
      __URLSESSION_CLIENT_API_MISUSE_NIL_ARGUMENT__(&cfstr_CannotCreateUp.isa);
    }
    return 0;
  }
  if (__CFNIsRunningInXcode::envCheckOnce != -1) {
    dispatch_once(&__CFNIsRunningInXcode::envCheckOnce, &__block_literal_global_43);
  }
  if (__CFNIsRunningInXcode::runningInXcode == 1
    && (objc_msgSend(objc_getProperty(a3, v11, 16, 1), "HTTPBody")
     || objc_msgSend(objc_getProperty(a3, v12, 16, 1), "HTTPBodyStream")))
  {
    if (__CFNRuntimeIssuesLogHandle::onceToken != -1) {
      dispatch_once(&__CFNRuntimeIssuesLogHandle::onceToken, &__block_literal_global_6_5515);
    }
    SEL v13 = __CFNRuntimeIssuesLogHandle::logger;
    if (os_log_type_enabled((os_log_t)__CFNRuntimeIssuesLogHandle::logger, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
    }
  }
  id Property = objc_getProperty(a3, v11, 64, 1);
  id v17 = objc_alloc((Class)objc_getProperty(a3, v15, 8, 1));
  if (Property)
  {
    id v18 = objc_getProperty(a3, v16, 64, 1);
    unint64_t v19 = [(__NSURLSessionLocal *)self nextSeed];
    uint64_t v21 = objc_msgSend(v17, "initWithResumeData:ident:taskGroup:", v18, v19, objc_getProperty(a3, v20, 88, 1));
    if (!v21)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      id v22 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_184085000, v22, OS_LOG_TYPE_ERROR, "Cannot create upload task with corrupt resume data", buf, 2u);
      }
      return 0;
    }
  }
  else
  {
    id v23 = objc_getProperty(a3, v16, 16, 1);
    unint64_t v24 = [(__NSURLSessionLocal *)self nextSeed];
    uint64_t v21 = objc_msgSend(v17, "initWithOriginalRequest:ident:taskGroup:", v23, v24, objc_getProperty(a3, v25, 88, 1));
  }
  os_unfair_lock_lock((os_unfair_lock_t)self + 100);
  [*((id *)self + 23) addObject:v21];
  os_unfair_lock_unlock((os_unfair_lock_t)self + 100);
  if (objc_getProperty(a3, v26, 24, 1)) {
    objc_msgSend((id)v21, "set_uniqueIdentifier:", objc_getProperty(a3, v27, 24, 1));
  }
  if (objc_getProperty(a3, v27, 48, 1))
  {
    id v29 = objc_getProperty(a3, v28, 48, 1);
    v30 = _Block_copy(v29);
    newValue[0] = MEMORY[0x1E4F143A8];
    newValue[1] = 3221225472;
    newValue[2] = __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke;
    newValue[3] = &unk_1E52524E8;
    newValue[4] = self;
    newValue[5] = v30;
    if (v21)
    {
      objc_setProperty_atomic_copy((id)v21, v28, newValue, 784);
      *(unsigned char *)(v21 + 69) = 0;
    }
  }
  if (!objc_getProperty(a3, v28, 64, 1)) {
    goto LABEL_50;
  }
  id v32 = (void *)[(id)v21 resumableUploadState];
  if (v32) {
    id v34 = objc_getProperty(v32, v33, 32, 1);
  }
  else {
    id v34 = 0;
  }
  objc_setProperty_atomic(a3, v33, v34, 16);
  uint64_t v35 = [(id)v21 resumableUploadState];
  if (!v35)
  {
    uint64_t v37 = (_DWORD *)[(id)v21 resumableUploadState];
    goto LABEL_46;
  }
  int v36 = *(_DWORD *)(v35 + 16);
  uint64_t v37 = (_DWORD *)[(id)v21 resumableUploadState];
  if (!v36)
  {
LABEL_46:
    if (v37) {
      id v38 = objc_getProperty(v37, v31, 40, 1);
    }
    else {
      id v38 = 0;
    }
    id v39 = a3;
    ptrdiff_t v40 = 40;
    goto LABEL_49;
  }
  if (v37 && v37[4] == 1)
  {
    id v38 = (id)objc_msgSend((id)objc_msgSend((id)v21, "resumableUploadState"), "uploadFile");
    id v39 = a3;
    ptrdiff_t v40 = 32;
LABEL_49:
    objc_setProperty_atomic(v39, v31, v38, v40);
  }
LABEL_50:
  if (objc_getProperty(a3, v31, 40, 1))
  {
    id v42 = (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", objc_getProperty(a3, v41, 40, 1));
    uint64_t v43 = [(id)v21 resumableUploadState];
    if (v43) {
      *(_DWORD *)(v43 + 16) = 0;
    }
    id v45 = objc_getProperty(a3, v44, 40, 1);
LABEL_54:
    int v46 = (void *)[(id)v21 resumableUploadState];
    if (v46) {
      objc_setProperty_atomic(v46, v47, v45, 40);
    }
    goto LABEL_64;
  }
  if (objc_getProperty(a3, v41, 32, 1))
  {
    id v42 = (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(objc_getProperty(a3, v48, 32, 1), "fileSystemRepresentation")));
    id v50 = objc_getProperty(a3, v49, 32, 1);
    if (v21) {
      objc_setProperty_atomic((id)v21, v51, v50, 768);
    }
    uint64_t v52 = [(id)v21 resumableUploadState];
    if (v52) {
      *(_DWORD *)(v52 + 16) = 1;
    }
    if (v21) {
      id v54 = objc_getProperty((id)v21, v53, 768, 1);
    }
    else {
      id v54 = 0;
    }
    objc_msgSend((id)objc_msgSend((id)v21, "resumableUploadState"), "setUploadFile:", v54);
    goto LABEL_64;
  }
  uint64_t v60 = objc_msgSend(objc_getProperty(a3, v48, 16, 1), "HTTPBodyStream");
  if (v60)
  {
    id v45 = v60;
LABEL_73:
    id v42 = 0;
    goto LABEL_65;
  }
  id v45 = objc_msgSend(objc_getProperty(a3, v47, 16, 1), "HTTPBody");
  if (!v45) {
    goto LABEL_73;
  }
  objc_getClass("OS_dispatch_data");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v42 = (id)[MEMORY[0x1E4F1C978] arrayWithObject:v45];
    uint64_t v62 = [(id)v21 resumableUploadState];
    if (v62) {
      *(_DWORD *)(v62 + 16) = 0;
    }
    goto LABEL_54;
  }
  v61 = (void *)[MEMORY[0x1E4F1CA48] array];
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke_2;
  applier[3] = &unk_1E5252510;
  applier[4] = v61;
  dispatch_data_apply(v45, applier);
  id v42 = (id)[v61 copy];
LABEL_64:
  id v45 = 0;
LABEL_65:
  id v55 = objc_getProperty(a3, v47, 32, 1);
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke_3;
  v64[3] = &unk_1E5252538;
  v64[4] = v55;
  v64[5] = self;
  v64[6] = v45;
  v64[7] = v42;
  if (v21)
  {
    objc_setProperty_atomic_copy((id)v21, v56, v64, 808);
    objc_msgSend((id)v21, "setDelegate:", objc_getProperty(a3, v57, 80, 1));
    uint64_t v58 = *(void *)(v21 + 704);
    if (!v58) {
      uint64_t v58 = *(void *)(v21 + 696);
    }
  }
  else
  {
    objc_msgSend(0, "setDelegate:", objc_getProperty(a3, v56, 80, 1));
    uint64_t v58 = 0;
  }
  -[__NSCFURLSessionDelegateWrapper didCreateTask:](v58, (void *)v21);
  if ([(id)v21 state] != 1)
  {
    v59 = *((void *)self + 15);
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke_4;
    v63[3] = &unk_1E5258228;
    v63[4] = v21;
    dispatch_async(v59, v63);
  }
  return (id)v21;
}

- (void)_useTLSSessionCacheFromSession:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)__NSURLSessionLocal;
  [(NSURLSession *)&v8 _useTLSSessionCacheFromSession:a3];
  uint64_t v4 = *((void *)self + 21);
  uint64_t v5 = *((void *)self + 2);
  CFStringRef v6 = (std::__shared_weak_count *)*((void *)self + 3);
  if (v6)
  {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v7 = *(std::__shared_weak_count **)(v4 + 152);
  *(void *)(v4 + 144) = v5;
  *(void *)(v4 + 152) = v6;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v7);
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v6);
  }
}

- (void)dealloc
{
  uint64_t v3 = *((void *)self + 21);
  if (v3)
  {
    (*(void (**)(uint64_t, SEL))(*(void *)v3 + 48))(v3, a2);
    *((void *)self + 21) = 0;
  }
  uint64_t v4 = (void *)*((void *)self + 22);
  if (v4)
  {

    *((void *)self + 22) = 0;
  }

  uint64_t v5 = *((void *)self + 26);
  if (v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 48))(v5);
    *((void *)self + 26) = 0;
  }
  uint64_t v6 = *((void *)self + 27);
  if (v6)
  {
    (*(void (**)(uint64_t))(*(void *)v6 + 48))(v6);
    *((void *)self + 27) = 0;
  }

  v7.receiver = self;
  v7.super_class = (Class)__NSURLSessionLocal;
  [(NSURLSession *)&v7 dealloc];
}

- (void)_onqueue_completeInvalidation:(BOOL)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    if ([*((id *)self + 14) _disableAPWakeOnIdleConnections])
    {
      if (*((_DWORD *)self + 13))
      {
        IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)self + 7), 0);
        if (*((_DWORD *)self + 16))
        {
          if (IODeregisterForSystemPower((io_object_t *)self + 16))
          {
            if (CFNLog::onceToken != -1) {
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
            }
            uint64_t v5 = CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_184085000, v5, OS_LOG_TYPE_ERROR, "Failed to IODeregisterForSystemPower", buf, 2u);
            }
          }
          *((_DWORD *)self + 16) = 0;
        }
        IOServiceClose(*((_DWORD *)self + 13));
        *((_DWORD *)self + 13) = 0;
        uint64_t v6 = (IONotificationPort *)*((void *)self + 7);
        if (v6)
        {
          IONotificationPortDestroy(v6);
          *((void *)self + 7) = 0;
        }
      }
    }
    objc_super v7 = *((void *)self + 15);
  }
  else
  {
    objc_super v7 = 0;
    if ([0 _disableAPWakeOnIdleConnections]) {
      objc_super v7 = 0;
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53____NSURLSessionLocal__onqueue_completeInvalidation___block_invoke;
  aBlock[3] = &unk_1E5254428;
  aBlock[4] = self;
  if (self)
  {
    if (*((void *)self + 25))
    {
      __53____NSURLSessionLocal__onqueue_completeInvalidation___block_invoke((uint64_t)aBlock, 0);
    }
    else
    {
      *((void *)self + 25) = _Block_copy(aBlock);
      *((void *)self + 24) = v7;
      if (v7) {
        dispatch_retain(v7);
      }
      if (a3)
      {
        objc_super v8 = (void *)[*((id *)self + 22) mutableCopy];
        os_unfair_lock_lock((os_unfair_lock_t)self + 100);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v9 = (void *)*((void *)self + 23);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:buf count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(v9);
              }
              [v8 addObject:*(void *)(*((void *)&v19 + 1) + 8 * i)];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:buf count:16];
          }
          while (v11);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)self + 100);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v14 = [v8 countByEnumeratingWithState:&v19 objects:buf count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v20 != v16) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v19 + 1) + 8 * j) cancel];
            }
            uint64_t v15 = [v8 countByEnumeratingWithState:&v19 objects:buf count:16];
          }
          while (v15);
        }
      }
      -[__NSURLSessionLocal _onqueue_checkForCompletion]((uint64_t)self);
    }
  }
}

- (void)_onqueue_checkForCompletion
{
  if (a1)
  {
    if (*(void *)(a1 + 200))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 400));
      uint64_t v2 = [*(id *)(a1 + 184) anyObject];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 400));
      if (!v2 && ![*(id *)(a1 + 176) count])
      {
        uint64_t v3 = *(CFDictionaryRef **)(a1 + 168);
        if (v3) {
          XTubeManager::invalidateAllConnections(v3, 0);
        }
        uint64_t v4 = *(void *)(a1 + 208);
        if (v4)
        {
          (*(void (**)(uint64_t))(*(void *)v4 + 48))(v4);
          *(void *)(a1 + 208) = 0;
        }
        uint64_t v5 = *(void *)(a1 + 216);
        if (v5)
        {
          (*(void (**)(uint64_t))(*(void *)v5 + 48))(v5);
          *(void *)(a1 + 216) = 0;
        }
        *(unsigned char *)(a1 + 360) = 1;
        uint64_t v6 = *(void *)(a1 + 200);
        if (v6)
        {
          if (*(void *)(a1 + 192))
          {
            *(void *)(a1 + 200) = 0;
            objc_super v7 = *(NSObject **)(a1 + 192);
            *(void *)(a1 + 192) = 0;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __56____NSURLSessionLocal__onqueue_invokeInvalidateCallback__block_invoke;
            block[3] = &unk_1E5257FD8;
            block[4] = v6;
            dispatch_async(v7, block);
            dispatch_release(v7);
          }
        }
      }
    }
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  if (a4)
  {

    *((void *)self + 47) = 0;
    *((unsigned char *)self + 384) = 1;
  }
}

- (void)_onqueue_markConnectionsReusedAfterAPSleepWake
{
  if (self)
  {
    uint64_t v2 = *((void *)self + 21);
    if (v2)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v2 + 40));
      CFDictionaryApplyFunction(*(CFDictionaryRef *)(v2 + 32), (CFDictionaryApplierFunction)RetainableTypedDict<CoreSchedulingSet const*,GlueTubeManager *>::_visit, &__block_literal_global_372);
      pthread_mutex_unlock((pthread_mutex_t *)(v2 + 40));
    }
  }
}

- (void)_onqueue_flushWithCompletionHandler:(id)a3
{
}

- (void)_flushOrResetStorage:(uint64_t)a3 reset:
{
  if (a1)
  {
    uint64_t v6 = (void *)MEMORY[0x18531D6D0]();
    objc_super v7 = dispatch_group_create();
    uint64_t XCookie = -[__NSURLSessionLocal _createXCookieStorage](a1);
    if (XCookie)
    {
      uint64_t v9 = XCookie;
      dispatch_group_enter(v7);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke;
      v16[3] = &unk_1E5258250;
      v16[4] = v7;
      v16[5] = v9;
      (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v9 + 72))(v9, a3, v16);
    }
    uint64_t XCredential = -[__NSURLSessionLocal _createXCredentialStorage](a1);
    if (XCredential)
    {
      uint64_t v11 = XCredential;
      dispatch_group_enter(v7);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_2;
      v15[3] = &unk_1E5258250;
      v15[4] = v7;
      v15[5] = v11;
      (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v11 + 96))(v11, a3, v15);
    }
    void block[5] = MEMORY[0x1E4F143A8];
    block[6] = 3221225472;
    block[7] = __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_3;
    block[8] = &unk_1E5252560;
    block[9] = v7;
    char v14 = a3;
    -[__NSURLSessionLocal _withXURLCache:]((id *)a1);
    uint64_t v12 = *(NSObject **)(a1 + 120);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_5;
    block[3] = &unk_1E5257FD8;
    block[4] = a2;
    dispatch_group_notify(v7, v12, block);
    dispatch_release(v7);
  }
}

- (uint64_t)_createXCookieStorage
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (std::mutex *)(result + 232);
    std::mutex::lock((std::mutex *)(result + 232));
    if (!*(unsigned char *)(v1 + 224))
    {
      uint64_t v3 = (XCookieStorage *)[*(id *)(v1 + 112) HTTPCookieStorage];
      if (!v3 || (XCookieStorage::createNSXCookieStorage(v3, v4), !v3)) {
        XCookieStorage::createEmptyXCookieStorage(v3, v4);
      }
      *(void *)(v1 + 208) = v3;
      *(unsigned char *)(v1 + 224) = 1;
    }
    std::mutex::unlock(v2);
    result = *(void *)(v1 + 208);
    if (result)
    {
      (*(void (**)(uint64_t))(*(void *)result + 40))(result);
      return *(void *)(v1 + 208);
    }
  }
  return result;
}

- (uint64_t)_createXCredentialStorage
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (std::mutex *)(result + 296);
    std::mutex::lock((std::mutex *)(result + 296));
    if (!*(unsigned char *)(v1 + 225))
    {
      uint64_t v3 = (NSURLCredentialStorage *)[*(id *)(v1 + 112) URLCredentialStorage];
      if (v3)
      {
        uint64_t v4 = (NSXCredentialStorage *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 32, 0);
        *(_OWORD *)uint64_t v4 = 0u;
        *((_OWORD *)v4 + 1) = 0u;
        NSXCredentialStorage::NSXCredentialStorage(v4, v3);
      }
      else
      {
        EmptyXCredentialStorage = XCredentialStorage::createEmptyXCredentialStorage(0);
      }
      *(void *)(v1 + 216) = EmptyXCredentialStorage;
      *(unsigned char *)(v1 + 225) = 1;
    }
    std::mutex::unlock(v2);
    result = *(void *)(v1 + 216);
    if (result)
    {
      (*(void (**)(uint64_t))(*(void *)result + 40))(result);
      return *(void *)(v1 + 216);
    }
  }
  return result;
}

- (id)_withXURLCache:(id *)result
{
  if (result)
  {
    uint64_t v1 = result;
    result = (id *)[result[14] URLCache];
    if (result) {
      XURLCache::createNSXURLCache(result, v1, v2);
    }
  }
  return result;
}

- (void)_onqueue_resetStorageWithCompletionHandler:(id)a3
{
}

- (void)_onqueue_handleConnectionsAtAPSleep
{
  if (self)
  {
    uint64_t v3 = *((void *)self + 21);
    if (v3)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v3 + 40));
      CFDictionaryApplyFunction(*(CFDictionaryRef *)(v3 + 32), (CFDictionaryApplierFunction)RetainableTypedDict<CoreSchedulingSet const*,GlueTubeManager *>::_visit, &__block_literal_global_367);
      pthread_mutex_unlock((pthread_mutex_t *)(v3 + 40));
      uint64_t v4 = (CFDictionaryRef *)*((void *)self + 21);
      if (v4)
      {
        XTubeManager::invalidateAllConnections(v4, 1);
      }
    }
  }
}

- (id)AVAggregateAssetDownloadTaskForURLAsset:(id)a3 mediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7
{
}

- (id)AVAssetDownloadTaskForURLAsset:(id)a3 assetTitle:(id)a4 assetArtworkData:(id)a5 options:(id)a6 downloadConfiguration:(id)a7
{
}

- (id)AVAssetDownloadTaskForURLAsset:(id)a3 destinationURL:(id)a4 options:(id)a5
{
}

- (id)_AVAssetDownloadTaskForURL:(id)a3 destinationURL:(id)a4 options:(id)a5
{
}

- (id)webSocketTaskForURL:(id)a3 protocols:(id)a4
{
  uint64_t v6 = (void *)[MEMORY[0x1E4F29088] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  if ((objc_msgSend((id)objc_msgSend(v6, "scheme"), "isEqualToString:", 0x1EC0A5E58) & 1) == 0
    && !objc_msgSend((id)objc_msgSend(v6, "scheme"), "isEqualToString:", 0x1EC0A5E90))
  {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"WebSocket tasks can only be created with ws or wss schemes" userInfo:0]);
  }
  int v7 = objc_msgSend((id)objc_msgSend(v6, "scheme"), "isEqualToString:", 0x1EC0A5E58);
  objc_super v8 = &kCFURLSchemeHTTP;
  if (!v7) {
    objc_super v8 = &kCFURLSchemeHTTPS;
  }
  [v6 setScheme:*v8];
  uint64_t v9 = -[NSURLRequest initWithURL:]([NSMutableURLRequest alloc], "initWithURL:", [v6 URL]);
  [(NSMutableURLRequest *)v9 setCachePolicy:1];
  if (a4)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    if ([a4 count])
    {
      unint64_t v11 = 0;
      do
      {
        if (v11) {
          [v10 appendString:@", "];
        }
        objc_msgSend(v10, "appendString:", objc_msgSend(a4, "objectAtIndexedSubscript:", v11++));
      }
      while ([a4 count] > v11);
    }
    [(NSMutableURLRequest *)v9 addValue:v10 forHTTPHeaderField:0x1EC0A2818];
  }

  return [(NSURLSession *)self webSocketTaskWithRequest:v9];
}

- (id)webSocketTaskForRequest:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[a3 allHTTPHeaderFields];
  if (![v5 objectForKeyedSubscript:0x1EC0A2850]) {
    [a3 setValue:@"13" forHTTPHeaderField:0x1EC0A2850];
  }
  if (![v5 objectForKeyedSubscript:0x1EC0A2A10]) {
    [a3 setValue:0x1EC0A3260 forHTTPHeaderField:0x1EC0A2A10];
  }
  if (![v5 objectForKeyedSubscript:0x1EC0A2000]) {
    [a3 setValue:0x1EC0A3228 forHTTPHeaderField:0x1EC0A2000];
  }
  if (![v5 objectForKeyedSubscript:0x1EC0A27E0])
  {
    arc4random_buf(__buf, 0x10uLL);
    objc_msgSend(a3, "setValue:forHTTPHeaderField:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", __buf, 16, 0), "base64EncodedStringWithOptions:", 0), 0x1EC0A27E0);
  }
  if (![v5 objectForKeyedSubscript:0x1EC0A27A8]) {
    [a3 setValue:0x1EC0A3180 forHTTPHeaderField:0x1EC0A27A8];
  }
  uint64_t v6 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  int v7 = objc_opt_class();
  if (v6)
  {
    objc_setProperty_atomic(v6, v8, v7, 8);
    objc_setProperty_atomic(v6, v9, a3, 16);
  }
  return -[__NSURLSessionLocal taskForClassInfo:](self, v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = self;
  return self;
}

- (void)addConnectionlessTask:(uint64_t)a1
{
  if (a1)
  {
    [*(id *)(a1 + 176) addObject:a2];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 400));
    [*(id *)(a1 + 184) removeObject:a2];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 400));
  }
}

- (void)removeConnectionlessTask:(uint64_t)a1
{
  if (a1)
  {
    [*(id *)(a1 + 176) removeObject:a2];
    if (![*(id *)(a1 + 176) count])
    {
      uint64_t v3 = *(NSObject **)(a1 + 120);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48____NSURLSessionLocal_removeConnectionlessTask___block_invoke;
      block[3] = &unk_1E5258228;
      block[4] = a1;
      dispatch_async(v3, block);
    }
  }
}

- (void)addUnresumedTask:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 400));
    [*(id *)(a1 + 184) addObject:a2];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 400));
  }
}

- (uint64_t)_withConnectionCache_setCurrentSSLMethod:(uint64_t)a3 forKey:(const void *)a4 scheduling:
{
  uint64_t result = *(void *)(a1 + 168);
  if (result)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = ___ZN12XTubeManager25setCurrentSSLMethodForKeyEPK22HTTPConnectionCacheKeyPK10__CFStringPK17CoreSchedulingSet_block_invoke;
    v5[3] = &__block_descriptor_48_e9_v16__0_v8l;
    v5[4] = a3;
    v5[5] = a2;
    return XTubeManager::withTubeManager(result, a4, (uint64_t)v5);
  }
  return result;
}

@end