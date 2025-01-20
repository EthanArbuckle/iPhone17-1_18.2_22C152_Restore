@interface AMSMockNetworkProxy
+ (BOOL)canInitWithRequest:(id)a3;
+ (NSArray)executedOverrides;
+ (NSArray)registeredOverrides;
+ (NSMutableArray)_executedOverrides;
+ (id)_overrides;
+ (id)canonicalRequestForRequest:(id)a3;
+ (void)_removeAllOverrides;
+ (void)_removeOverride:(id)a3;
+ (void)_sync:(id)a3;
+ (void)addOverride:(id)a3;
+ (void)clearOverrides;
+ (void)removeOverride:(id)a3;
- (AMSMockURLOverride)currentOverride;
- (void)finishWithData:(id)a3;
- (void)finishWithError:(id)a3;
- (void)performRedirectFromResponse:(id)a3;
- (void)sendResponse:(id)a3;
- (void)setCurrentOverride:(id)a3;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation AMSMockNetworkProxy

+ (id)_overrides
{
  if (_MergedGlobals_133 != -1) {
    dispatch_once(&_MergedGlobals_133, &__block_literal_global_96);
  }
  v2 = (void *)qword_1EB38DE38;
  return v2;
}

uint64_t __33__AMSMockNetworkProxy__overrides__block_invoke()
{
  qword_1EB38DE38 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  return MEMORY[0x1F41817F8]();
}

+ (NSArray)registeredOverrides
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__49;
  v9 = __Block_byref_object_dispose__49;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__AMSMockNetworkProxy_registeredOverrides__block_invoke;
  v4[3] = &unk_1E55A1220;
  v4[4] = &v5;
  v4[5] = a1;
  [a1 _sync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __42__AMSMockNetworkProxy_registeredOverrides__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 40) _overrides];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (NSArray)executedOverrides
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__49;
  v11 = __Block_byref_object_dispose__49;
  id v12 = 0;
  uint64_t v3 = objc_opt_class();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__AMSMockNetworkProxy_executedOverrides__block_invoke;
  v6[3] = &unk_1E55A1220;
  v6[4] = &v7;
  v6[5] = a1;
  [v3 _sync:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __40__AMSMockNetworkProxy_executedOverrides__block_invoke(uint64_t a1)
{
  id v5 = [(id)objc_opt_class() _executedOverrides];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (void)addOverride:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__AMSMockNetworkProxy_addOverride___block_invoke;
  v6[3] = &unk_1E55A1998;
  id v7 = v4;
  id v8 = a1;
  id v5 = v4;
  [a1 _sync:v6];
}

void __35__AMSMockNetworkProxy_addOverride___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) _overrides];
  [v2 addObject:*(void *)(a1 + 32)];
}

+ (void)clearOverrides
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__AMSMockNetworkProxy_clearOverrides__block_invoke;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = a1;
  [a1 _sync:v2];
}

void __37__AMSMockNetworkProxy_clearOverrides__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _overrides];
  [v1 removeAllObjects];
}

+ (void)removeOverride:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__AMSMockNetworkProxy_removeOverride___block_invoke;
  v6[3] = &unk_1E55A1998;
  id v7 = v4;
  id v8 = a1;
  id v5 = v4;
  [a1 _sync:v6];
}

uint64_t __38__AMSMockNetworkProxy_removeOverride___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) _removeOverride:*(void *)(a1 + 32)];
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__AMSMockNetworkProxy_canInitWithRequest___block_invoke;
  v7[3] = &unk_1E55A4BD0;
  id v10 = a1;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v11;
  [a1 _sync:v7];
  LOBYTE(a1) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)a1;
}

void __42__AMSMockNetworkProxy_canInitWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 48), "_overrides", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) shouldOverrideURLRequest:*(void *)(a1 + 32)])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)startLoading
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__49;
  v19 = __Block_byref_object_dispose__49;
  id v20 = 0;
  id v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (id)objc_opt_class();
    v6 = [(NSURLProtocol *)self request];
    long long v7 = AMSLogableURLRequest((uint64_t)v6);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Overriding request: %{public}@", buf, 0x16u);
  }
  long long v8 = objc_opt_class();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __35__AMSMockNetworkProxy_startLoading__block_invoke;
  v14[3] = &unk_1E559F2A8;
  v14[4] = self;
  v14[5] = &v15;
  [v8 _sync:v14];
  [(AMSMockNetworkProxy *)self setCurrentOverride:v16[5]];
  long long v9 = [(id)v16[5] response];
  memset(buf, 0, sizeof(buf));
  long long v10 = [(NSURLProtocol *)self request];
  if (v9) {
    [v9 handleReceivedRequest:v10];
  }
  else {
    memset(buf, 0, sizeof(buf));
  }

  if (*(void *)&buf[8]) {
    -[AMSMockNetworkProxy sendResponse:](self, "sendResponse:");
  }
  if (*(void *)&buf[16])
  {
    -[AMSMockNetworkProxy finishWithError:](self, "finishWithError:");
    uint64_t v11 = [(id)v16[5] executedObservable];
    [v11 sendFailure:*(void *)&buf[16]];
  }
  else
  {
    [(AMSMockNetworkProxy *)self finishWithData:*(void *)buf];
    uint64_t v11 = [(id)v16[5] executedObservable];
    [v11 sendResult:*(void *)&buf[8]];
  }

  uint64_t v12 = objc_opt_class();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __35__AMSMockNetworkProxy_startLoading__block_invoke_3;
  v13[3] = &unk_1E55A30A0;
  v13[4] = self;
  v13[5] = &v15;
  [v12 _sync:v13];

  _Block_object_dispose(&v15, 8);
}

void __35__AMSMockNetworkProxy_startLoading__block_invoke(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() _overrides];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__AMSMockNetworkProxy_startLoading__block_invoke_2;
  v6[3] = &unk_1E55A4BF8;
  void v6[4] = *(void *)(a1 + 32);
  uint64_t v3 = objc_msgSend(v2, "ams_firstObjectPassingTest:", v6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __35__AMSMockNetworkProxy_startLoading__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 request];
  uint64_t v5 = [v3 shouldOverrideURLRequest:v4];

  return v5;
}

void __35__AMSMockNetworkProxy_startLoading__block_invoke_3(uint64_t a1)
{
  id v3 = [(id)objc_opt_class() _executedOverrides];
  id v2 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
  [v3 addObject:v2];
}

- (void)stopLoading
{
  id v3 = [(AMSMockNetworkProxy *)self currentOverride];
  id v2 = [v3 response];
  [v2 stopRunningTasks];
}

- (void)sendResponse:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v7;
  }
  else {
    id v4 = 0;
  }

  uint64_t v5 = objc_msgSend(v4, "ams_valueForHTTPHeaderField:", @"Location");
  if ([v4 statusCode] >= 300 && objc_msgSend(v4, "statusCode") <= 399 && v5)
  {
    [(AMSMockNetworkProxy *)self performRedirectFromResponse:v7];
  }
  else
  {
    v6 = [(NSURLProtocol *)self client];
    [v6 URLProtocol:self didReceiveResponse:v7 cacheStoragePolicy:2];
  }
}

- (void)performRedirectFromResponse:(id)a3
{
  id v14 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v14;
  }
  else {
    id v4 = 0;
  }

  uint64_t v5 = [(NSURLProtocol *)self request];
  v6 = (void *)[v5 mutableCopy];

  id v7 = objc_msgSend(v4, "ams_valueForHTTPHeaderField:", @"Location");
  long long v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  [v6 setURL:v8];

  uint64_t v9 = [v4 statusCode];
  if (v9 == 303
    || (unint64_t)(v9 - 301) <= 1
    && ([v6 HTTPMethod], (long long v10 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v11 = v10, int v12 = [v10 isEqualToString:@"POST"], v11, v12))
  {
    [v6 setHTTPMethod:@"GET"];
    [v6 setHTTPBody:0];
    [v6 setValue:0 forHTTPHeaderField:@"Content-Length"];
    [v6 setValue:0 forHTTPHeaderField:@"Content-Type"];
  }
  [v6 setValue:0 forHTTPHeaderField:@"Authorization"];
  uint64_t v13 = [(NSURLProtocol *)self client];
  [v13 URLProtocol:self wasRedirectedToRequest:v6 redirectResponse:v14];
}

- (void)finishWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSURLProtocol *)self client];
  [v5 URLProtocol:self didLoadData:v4];

  id v6 = [(NSURLProtocol *)self client];
  [v6 URLProtocolDidFinishLoading:self];
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(NSURLProtocol *)self client];
  [v5 URLProtocol:self didFailWithError:v4];
}

+ (NSMutableArray)_executedOverrides
{
  if (qword_1EB38DE40 != -1) {
    dispatch_once(&qword_1EB38DE40, &__block_literal_global_10_0);
  }
  id v2 = (void *)qword_1EB38DE48;
  return (NSMutableArray *)v2;
}

uint64_t __41__AMSMockNetworkProxy__executedOverrides__block_invoke()
{
  qword_1EB38DE48 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  return MEMORY[0x1F41817F8]();
}

+ (void)_removeAllOverrides
{
  id v2 = [a1 _overrides];
  [v2 removeAllObjects];
}

+ (void)_removeOverride:(id)a3
{
  id v8 = a3;
  id v4 = [a1 _overrides];
  uint64_t v5 = [v4 count];
  if (v5 - 1 >= 0)
  {
    uint64_t v6 = v5;
    while (1)
    {
      id v7 = [v4 objectAtIndexedSubscript:--v6];
      if ([v8 isEqual:v7]) {
        break;
      }

      if (v6 <= 0) {
        goto LABEL_7;
      }
    }
    [v4 removeObjectAtIndex:v6];
  }
LABEL_7:
}

+ (void)_sync:(id)a3
{
  uint64_t v3 = qword_1EB38DE50;
  id v4 = (void (**)(void))a3;
  if (v3 != -1) {
    dispatch_once(&qword_1EB38DE50, &__block_literal_global_12_2);
  }
  id v5 = (id)qword_1EB38DE58;
  [v5 lock];
  v4[2](v4);

  [v5 unlock];
}

uint64_t __29__AMSMockNetworkProxy__sync___block_invoke()
{
  qword_1EB38DE58 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28E08]);
  return MEMORY[0x1F41817F8]();
}

- (AMSMockURLOverride)currentOverride
{
  return self->_currentOverride;
}

- (void)setCurrentOverride:(id)a3
{
}

- (void).cxx_destruct
{
}

@end