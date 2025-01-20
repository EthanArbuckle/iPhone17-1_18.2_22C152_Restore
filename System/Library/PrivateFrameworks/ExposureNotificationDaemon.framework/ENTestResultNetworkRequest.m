@interface ENTestResultNetworkRequest
- (ENTestResultNetworkRequest)initWithRequestURL:(id)a3 URLSession:(id)a4 queue:(id)a5;
- (NSDictionary)additionalRequestHeaders;
- (NSDictionary)bodyJSON;
- (NSDictionary)requestHeaders;
- (NSError)error;
- (NSString)APIKey;
- (NSURL)requestURL;
- (id)_createURLRequestWithError:(id *)a3;
- (id)_dictionaryFromData:(id)a3 response:(id)a4 error:(id *)a5;
- (id)_errorForURLRequestError:(id)a3;
- (id)errorForUnsuccessfulResponse:(id)a3 body:(id)a4;
- (id)getPaddedBodyJSONAndReturnError:(id *)a3;
- (id)handleResponse:(id)a3 body:(id)a4;
- (unint64_t)paddedRequestSize;
- (unint64_t)retryCheck:(id)a3 retryAttempt:(int)a4 baseMultiplier:(int)a5;
- (void)_completeWithError:(id)a3;
- (void)_dataTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (void)_performURLRequest:(id)a3 attempt:(int)a4;
- (void)handleURLResponse:(id)a3 data:(id)a4 error:(id)a5;
- (void)invalidate;
- (void)resumeWithCompletionHandler:(id)a3;
- (void)setAPIKey:(id)a3;
- (void)setMaxRetryTime:(unint64_t)a3;
- (void)setPaddedRequestSize:(unint64_t)a3;
@end

@implementation ENTestResultNetworkRequest

- (ENTestResultNetworkRequest)initWithRequestURL:(id)a3 URLSession:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ENTestResultNetworkRequest;
  v11 = [(ENTestResultNetworkRequest *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    requestURL = v11->_requestURL;
    v11->_requestURL = (NSURL *)v12;

    objc_storeStrong((id *)&v11->_queue, a5);
    objc_storeStrong((id *)&v11->_URLSession, a4);
  }

  return v11;
}

- (void)invalidate
{
  [(NSURLSessionTask *)self->_URLSessionTask cancel];
  URLSessionTask = self->_URLSessionTask;
  self->_URLSessionTask = 0;

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;
}

- (id)getPaddedBodyJSONAndReturnError:(id *)a3
{
  v5 = [(ENTestResultNetworkRequest *)self bodyJSON];
  unint64_t v6 = [(ENTestResultNetworkRequest *)self paddedRequestSize];
  if (v6)
  {
    unint64_t v7 = v6;
    id v8 = (void *)[v5 mutableCopy];
    [v8 setObject:&stru_1F2B29B10 forKeyedSubscript:@"padding"];
    if ([MEMORY[0x1E4F28D88] isValidJSONObject:v5])
    {
      id v9 = [MEMORY[0x1E4F28D88] dataWithJSONObject:v8 options:0 error:a3];
      id v10 = v9;
      if (v9)
      {
        uint64_t v18 = 0;
        v19 = &v18;
        uint64_t v20 = 0x2020000000;
        uint64_t v21 = 0;
        uint64_t v21 = [v9 length];
        v11 = [(ENTestResultNetworkRequest *)self requestHeaders];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __62__ENTestResultNetworkRequest_getPaddedBodyJSONAndReturnError___block_invoke;
        v17[3] = &unk_1E69ADD98;
        v17[4] = &v18;
        [v11 enumerateKeysAndObjectsUsingBlock:v17];

        if (v7 <= v19[3])
        {
          if (a3)
          {
            ENErrorF();
            id v15 = 0;
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v15 = 0;
          }
        }
        else
        {
          uint64_t v12 = NSRandomData();
          v13 = v12;
          if (v12)
          {
            v14 = [v12 base64EncodedStringWithOptions:0];
            [v8 setObject:v14 forKeyedSubscript:@"padding"];

            id v15 = v8;
          }
          else
          {
            id v15 = 0;
          }
        }
        _Block_object_dispose(&v18, 8);
      }
      else
      {
        id v15 = 0;
      }
    }
    else if (a3)
    {
      ENErrorF();
      id v15 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = v5;
  }

  return v15;
}

void __62__ENTestResultNetworkRequest_getPaddedBodyJSONAndReturnError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [a2 length];
  uint64_t v6 = [v5 length];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v6;
}

- (void)resumeWithCompletionHandler:(id)a3
{
  v4 = (void *)[a3 copy];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v4;

  id v8 = 0;
  uint64_t v6 = [(ENTestResultNetworkRequest *)self _createURLRequestWithError:&v8];
  id v7 = v8;
  if (v6) {
    [(ENTestResultNetworkRequest *)self _performURLRequest:v6 attempt:0];
  }
  else {
    [(ENTestResultNetworkRequest *)self _completeWithError:v7];
  }
}

- (void)handleURLResponse:(id)a3 data:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(NSURLSessionTask *)self->_URLSessionTask cancel];
  URLSessionTask = self->_URLSessionTask;
  self->_URLSessionTask = 0;

  id v12 = v8;
  v13 = [v12 URL];
  v14 = [v13 absoluteString];

  uint64_t v15 = [v12 statusCode];
  if (v12)
  {
    uint64_t v16 = v15;
    if (v9)
    {
      id v35 = 0;
      v17 = [(ENTestResultNetworkRequest *)self _dictionaryFromData:v9 response:v12 error:&v35];
      id v18 = v35;
    }
    else
    {
      v17 = 0;
      id v18 = 0;
    }
    uint64_t v21 = +[ENLoggingPrefs sharedENLoggingPrefs];
    char v22 = [v21 isSensitiveLoggingAllowed];

    if ((v22 & 1) != 0
      && gLogCategory_ENTestResultNetworkRequest <= 30
      && (gLogCategory_ENTestResultNetworkRequest != -1 || _LogCategory_Initialize()))
    {
      uint64_t v33 = [v9 length];
      v34 = v17;
      id v29 = v14;
      uint64_t v31 = v16;
      LogPrintF_safe();
    }
    v23 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v24 = [v23 isSensitiveLoggingAllowed];

    if (v24
      && gLogCategory_ENTestResultNetworkRequest <= 30
      && (gLogCategory_ENTestResultNetworkRequest != -1 || _LogCategory_Initialize()))
    {
      [v12 allHeaderFields];
      v32 = v30 = v14;
      LogPrintF_safe();
    }
    if (v16 == 200)
    {
      if (v17) {
        goto LABEL_26;
      }
    }
    else
    {
      if (!v18)
      {
        if (v17) {
          v25 = v17;
        }
        else {
          v25 = (void *)MEMORY[0x1E4F1CC00];
        }
        -[ENTestResultNetworkRequest errorForUnsuccessfulResponse:body:](self, "errorForUnsuccessfulResponse:body:", v12, v25, v30, v32);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (v17)
      {
LABEL_26:
        if (!v18)
        {
          CFStringGetTypeID();
          v26 = CFDictionaryGetTypedValue();
          v27 = v26;
          if (v26 && [v26 length])
          {
            v30 = v27;
            uint64_t v28 = ENTestResultErrorF(6);
          }
          else
          {
            uint64_t v28 = -[ENTestResultNetworkRequest handleResponse:body:](self, "handleResponse:body:", v12, v17, v30);
          }
          id v18 = (id)v28;

          goto LABEL_38;
        }
      }
    }
    if (v18) {
      goto LABEL_38;
    }
LABEL_37:
    ENTestResultErrorF(1);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  v19 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v20 = [v19 isSensitiveLoggingAllowed];

  if (v20
    && gLogCategory_ENTestResultNetworkRequest <= 90
    && (gLogCategory_ENTestResultNetworkRequest != -1 || _LogCategory_Initialize()))
  {
    id v29 = v10;
    LogPrintF_safe();
  }
  -[ENTestResultNetworkRequest _errorForURLRequestError:](self, "_errorForURLRequestError:", v10, v29);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (!v18) {
    goto LABEL_37;
  }
LABEL_38:
  -[ENTestResultNetworkRequest _completeWithError:](self, "_completeWithError:", v18, v30);
}

- (void)setMaxRetryTime:(unint64_t)a3
{
  self->_maxRetryTime = a3;
}

- (id)_dictionaryFromData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 length])
  {
    id v9 = [v8 MIMEType];
    id v22 = 0;
    id v10 = [MEMORY[0x1E4F28D88] JSONObjectWithData:v7 options:0 error:&v22];
    id v11 = v22;
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v10;
LABEL_20:

        goto LABEL_21;
      }
      if (a5)
      {
LABEL_32:
        v19 = ENTestResultErrorF(4);
        goto LABEL_33;
      }
LABEL_34:
      id v12 = 0;
      goto LABEL_20;
    }
    if ([v9 isEqualToString:@"application/json"])
    {
      if (a5)
      {
        v19 = ENNestedTestResultErrorF(v11, 4);
LABEL_33:
        id v12 = 0;
        *a5 = v19;
        goto LABEL_20;
      }
      goto LABEL_34;
    }
    if ([v9 isEqualToString:@"text/plain"])
    {
      if ((unint64_t)[v7 length] <= 0x3FF)
      {
        v13 = (void *)[objc_alloc(MEMORY[0x1E4F29020]) initWithData:v7 encoding:4];
        v14 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v15 = [v14 isSensitiveLoggingAllowed];

        if (v15
          && gLogCategory_ENTestResultNetworkRequest <= 50
          && (gLogCategory_ENTestResultNetworkRequest != -1 || _LogCategory_Initialize()))
        {
          int v20 = [v8 URL];
          uint64_t v21 = (uint64_t)v13;
          LogPrintF_safe();
        }
        goto LABEL_17;
      }
      uint64_t v16 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v17 = [v16 isSensitiveLoggingAllowed];

      if (v17
        && gLogCategory_ENTestResultNetworkRequest <= 50
        && (gLogCategory_ENTestResultNetworkRequest != -1 || _LogCategory_Initialize()))
      {
        v13 = [v8 URL];
        int v20 = v13;
        uint64_t v21 = [v7 length];
        LogPrintF_safe();
LABEL_17:
      }
    }
    if (objc_msgSend(v8, "statusCode", v20, v21) != 200)
    {
      id v12 = (id)MEMORY[0x1E4F1CC00];
      goto LABEL_20;
    }
    if (a5) {
      goto LABEL_32;
    }
    goto LABEL_34;
  }
  id v12 = (id)MEMORY[0x1E4F1CC00];
LABEL_21:

  return v12;
}

- (NSDictionary)additionalRequestHeaders
{
  return (NSDictionary *)MEMORY[0x1E4F1CC00];
}

- (NSDictionary)bodyJSON
{
  return (NSDictionary *)MEMORY[0x1E4F1CC00];
}

- (id)handleResponse:(id)a3 body:(id)a4
{
  return 0;
}

- (id)errorForUnsuccessfulResponse:(id)a3 body:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  CFStringGetTypeID();
  id v7 = CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  id v8 = CFDictionaryGetTypedValue();

  uint64_t v9 = [v6 statusCode];
  if (v9 == 429)
  {
    id v10 = ENTestResultErrorF(7);
  }
  else
  {
    id v11 = [&unk_1F2B36068 objectForKeyedSubscript:v8];
    id v12 = v11;
    if (v11) {
      uint64_t v13 = [v11 integerValue];
    }
    else {
      uint64_t v13 = 6;
    }
    [v7 length];
    id v10 = ENTestResultErrorF(v13);
  }

  return v10;
}

- (id)_createURLRequestWithError:(id *)a3
{
  id v5 = (void *)MEMORY[0x1D9439DC0](self, a2);
  id v20 = 0;
  id v6 = [(ENTestResultNetworkRequest *)self getPaddedBodyJSONAndReturnError:&v20];
  id v7 = v20;
  if (!v6)
  {
    id v8 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v9 = [v8 isSensitiveLoggingAllowed];

    if (v9
      && gLogCategory_ENTestResultNetworkRequest <= 90
      && (gLogCategory_ENTestResultNetworkRequest != -1 || _LogCategory_Initialize()))
    {
      uint64_t v17 = objc_opt_class();
      id v18 = v7;
      LogPrintF_safe();
    }
    id v6 = [(ENTestResultNetworkRequest *)self bodyJSON];
  }
  if ([MEMORY[0x1E4F28D88] isValidJSONObject:v6])
  {
    id v19 = 0;
    id v10 = [MEMORY[0x1E4F28D88] dataWithJSONObject:v6 options:0 error:&v19];
    id v11 = v19;
  }
  else
  {
    id v11 = 0;
    id v10 = 0;
  }

  if (v10)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F18D58]);
    uint64_t v13 = [(ENTestResultNetworkRequest *)self requestURL];
    v14 = (void *)[v12 initWithURL:v13];

    int v15 = [(ENTestResultNetworkRequest *)self requestHeaders];
    [v14 setAllHTTPHeaderFields:v15];

    [v14 setHTTPBody:v10];
    [v14 setHTTPMethod:@"POST"];
  }
  else if (a3)
  {
    ENNestedTestResultErrorF(v11, 1);
    v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSDictionary)requestHeaders
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA68]);
  [v3 setObject:self->_APIKey forKeyedSubscript:@"X-API-Key"];
  [v3 setObject:@"application/json" forKeyedSubscript:@"Content-Type"];
  v4 = [(ENTestResultNetworkRequest *)self additionalRequestHeaders];
  [v3 addEntriesFromDictionary:v4];

  id v5 = (void *)[v3 copy];

  return (NSDictionary *)v5;
}

- (id)_errorForURLRequestError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F289A8]];

  if (!v5 || (uint64_t v6 = [v3 code], v6 == -1002))
  {
    id v7 = v3;
    uint64_t v8 = 1;
  }
  else if (v6 == -1001)
  {
    id v7 = v3;
    uint64_t v8 = 8;
  }
  else
  {
    id v7 = v3;
    uint64_t v8 = 11;
  }
  int v9 = ENNestedTestResultErrorF(v7, v8);

  return v9;
}

- (void)_performURLRequest:(id)a3 attempt:(int)a4
{
  id v7 = a3;
  if (self->_URLSessionTask)
  {
    int v9 = [MEMORY[0x1E4F28B08] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"ENTestResultNetworkRequest.m", 296, @"Invalid parameter not satisfying: %@", @"!_URLSessionTask" object file lineNumber description];
  }
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  int v14 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__ENTestResultNetworkRequest__performURLRequest_attempt___block_invoke;
  v10[3] = &unk_1E69ADDC0;
  v10[4] = self;
  id v12 = v13;
  id v8 = v7;
  id v11 = v8;
  [(ENTestResultNetworkRequest *)self _dataTaskWithRequest:v8 completionHandler:v10];

  _Block_object_dispose(v13, 8);
}

void __57__ENTestResultNetworkRequest__performURLRequest_attempt___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) retryCheck:v8 retryAttempt:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) baseMultiplier:2];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v13 = [v12 isSensitiveLoggingAllowed];

    if (v13
      && gLogCategory_ENTestResultNetworkRequest <= 30
      && (gLogCategory_ENTestResultNetworkRequest != -1 || _LogCategory_Initialize()))
    {
      uint64_t v23 = v11;
      LogPrintF_safe();
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "cancel", v23);
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(void **)(v17 + 32);
    *(void *)(v17 + 32) = 0;

    dispatch_time_t v19 = dispatch_time(0, 1000000000 * v11);
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = *(NSObject **)(v20 + 16);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __57__ENTestResultNetworkRequest__performURLRequest_attempt___block_invoke_2;
    v29[3] = &unk_1E69ACB90;
    v29[4] = v20;
    uint64_t v16 = (id *)&v30;
    long long v24 = *(_OWORD *)(a1 + 40);
    id v22 = (id)v24;
    long long v30 = v24;
    dispatch_after(v19, v21, v29);
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 32);
    int v15 = *(NSObject **)(v14 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__ENTestResultNetworkRequest__performURLRequest_attempt___block_invoke_3;
    block[3] = &unk_1E69AD768;
    block[4] = v14;
    uint64_t v16 = &v26;
    id v26 = v8;
    id v27 = v7;
    id v28 = v9;
    dispatch_async(v15, block);
  }
}

uint64_t __57__ENTestResultNetworkRequest__performURLRequest_attempt___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performURLRequest:attempt:", *(void *)(a1 + 40));
}

uint64_t __57__ENTestResultNetworkRequest__performURLRequest_attempt___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleURLResponse:*(void *)(a1 + 40) data:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)_dataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  URLSession = self->_URLSession;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __69__ENTestResultNetworkRequest__dataTaskWithRequest_completionHandler___block_invoke;
  id v22 = &unk_1E69ADDE8;
  id v9 = v7;
  id v23 = v9;
  uint64_t v10 = [(NSURLSession *)URLSession dataTaskWithRequest:v6 completionHandler:&v19];
  URLSessionTask = self->_URLSessionTask;
  self->_URLSessionTask = v10;

  id v12 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v13 = [v12 isSensitiveLoggingAllowed];

  if (v13
    && gLogCategory_ENTestResultNetworkRequest <= 30
    && (gLogCategory_ENTestResultNetworkRequest != -1 || _LogCategory_Initialize()))
  {
    uint64_t v14 = [v6 allHTTPHeaderFields];
    int v15 = [v6 HTTPBody];
    uint64_t v17 = v14;
    uint64_t v18 = [v15 length];
    id v16 = v6;
    LogPrintF_safe();
  }
  [(NSURLSessionTask *)self->_URLSessionTask resume];
}

uint64_t __69__ENTestResultNetworkRequest__dataTaskWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)retryCheck:(id)a3 retryAttempt:(int)a4 baseMultiplier:(int)a5
{
  uint64_t v9 = [a3 statusCode];
  if (a4 < 0)
  {
    unint64_t v19 = 0;
  }
  else
  {
    uint32x2_t v10 = (uint32x2_t)vdup_n_s32(a4);
    int32x2_t v11 = vdup_n_s32(a5);
    int32x2_t v12 = (int32x2_t)0x100000000;
    unsigned int v13 = (a4 & 0xFFFFFFFE) + 2;
    int64x2_t v14 = 0uLL;
    do
    {
      int8x16_t v15 = (int8x16_t)v14;
      uint32x2_t v16 = (uint32x2_t)v12;
      int64x2_t v14 = vaddw_s32(v14, (int32x2_t)vshl_u32((uint32x2_t)0x100000001, (uint32x2_t)vmul_s32(v12, v11)));
      int32x2_t v12 = vadd_s32(v12, (int32x2_t)0x200000002);
      v13 -= 2;
    }
    while (v13);
    uint32x2_t v17 = vcgt_u32(v16, v10);
    v18.i64[0] = v17.i32[0];
    v18.i64[1] = v17.i32[1];
    unint64_t v19 = vaddvq_s64((int64x2_t)vbslq_s8(v18, v15, (int8x16_t)v14));
  }
  unint64_t v20 = 0;
  BOOL v22 = v9 != 429 && (unint64_t)(v9 - 600) < 0xFFFFFFFFFFFFFF9CLL;
  if (a3)
  {
    if (v9)
    {
      if (!v22)
      {
        unint64_t v20 = 1 << (a5 * a4);
        if (v19 >= self->_maxRetryTime) {
          return 0;
        }
      }
    }
  }
  return v20;
}

- (void)_completeWithError:(id)a3
{
  id v9 = a3;
  v4 = (NSError *)[v9 copy];
  error = self->_error;
  self->_error = v4;

  uint64_t v6 = MEMORY[0x1D9439FF0](self->_completionHandler);
  id v7 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t, ENTestResultNetworkRequest *, id))(v6 + 16))(v6, self, v9);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;
  }
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (NSString)APIKey
{
  return self->_APIKey;
}

- (void)setAPIKey:(id)a3
{
}

- (unint64_t)paddedRequestSize
{
  return self->_paddedRequestSize;
}

- (void)setPaddedRequestSize:(unint64_t)a3
{
  self->_paddedRequestSize = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_APIKey, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_URLSessionTask, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end