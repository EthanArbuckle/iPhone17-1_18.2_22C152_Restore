@interface FMJSONCommand
- (BOOL)_hasParsedResponseBody;
- (FMJSONCommand)init;
- (NSDictionary)_requestBodyDict;
- (NSDictionary)_responseBodyDict;
- (NSDictionary)jsonResponseDictionary;
- (NSDictionary)serverAlertInfo;
- (NSError)jsonResponseParseError;
- (OS_dispatch_queue)responseQueue;
- (id)body;
- (id)headers;
- (id)jsonBodyDictionary;
- (void)body;
- (void)sendRequest;
- (void)setJsonResponseParseError:(id)a3;
- (void)setResponseQueue:(id)a3;
- (void)set_hasParsedResponseBody:(BOOL)a3;
- (void)set_requestBodyDict:(id)a3;
- (void)set_responseBodyDict:(id)a3;
@end

@implementation FMJSONCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->__requestBodyDict, 0);
  objc_storeStrong((id *)&self->__responseBodyDict, 0);
  objc_storeStrong((id *)&self->_jsonResponseParseError, 0);
}

- (void)sendRequest
{
  [(FMJSONCommand *)self set_hasParsedResponseBody:0];
  [(FMJSONCommand *)self set_responseBodyDict:0];
  [(FMJSONCommand *)self setJsonResponseParseError:0];
  v3.receiver = self;
  v3.super_class = (Class)FMJSONCommand;
  [(FMCommandBase *)&v3 sendRequest];
}

- (FMJSONCommand)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMJSONCommand;
  v2 = [(FMCommandBase *)&v5 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.icloud.fmcore.FMJSONCommand.response", 0);
    [(FMJSONCommand *)v2 setResponseQueue:v3];
  }
  return v2;
}

- (id)headers
{
  v9.receiver = self;
  v9.super_class = (Class)FMJSONCommand;
  dispatch_queue_t v3 = [(FMCommandBase *)&v9 headers];
  v4 = [(FMJSONCommand *)self _requestBodyDict];
  if (v4)
  {
    [(FMJSONCommand *)self set_requestBodyDict:v4];
  }
  else
  {
    objc_super v5 = [(FMJSONCommand *)self jsonBodyDictionary];
    [(FMJSONCommand *)self set_requestBodyDict:v5];
  }
  v6 = [(FMJSONCommand *)self _requestBodyDict];
  uint64_t v7 = [v6 count];

  if (v7) {
    [v3 setObject:@"application/json; charset=utf-8" forKeyedSubscript:@"Content-Type"];
  }
  return v3;
}

- (NSDictionary)_requestBodyDict
{
  return self->__requestBodyDict;
}

- (NSDictionary)jsonResponseDictionary
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  id v12 = (id)MEMORY[0x1E4F1CC08];
  dispatch_queue_t v3 = [(FMJSONCommand *)self responseQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__FMJSONCommand_jsonResponseDictionary__block_invoke;
  v6[3] = &unk_1E689EA20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (id)body
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = [MEMORY[0x1E4F1C9B8] data];
  id v4 = [(FMJSONCommand *)self _requestBodyDict];
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(FMJSONCommand *)self jsonBodyDictionary];
  }
  uint64_t v7 = v6;

  v8 = LogCategory_NetworkingVerbose();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v15 = self;
    __int16 v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1D0EC4000, v8, OS_LOG_TYPE_INFO, "[%p] request_body: %@", buf, 0x16u);
  }

  if ([v7 count])
  {
    id v13 = 0;
    uint64_t v9 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:0 error:&v13];
    id v10 = v13;

    if (v10)
    {
      v11 = LogCategory_Networking();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        [(FMJSONCommand *)(uint64_t)self body];
      }

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"[%@] JSON Creation error: %@", self, v10 format];
    }

    dispatch_queue_t v3 = (void *)v9;
  }

  return v3;
}

void __39__FMJSONCommand_jsonResponseDictionary__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  int v3 = [*(id *)(a1 + 32) _hasParsedResponseBody];
  id v4 = *v2;
  if (!v3)
  {
    objc_super v5 = [v4 valueForResponseHTTPHeader:@"Content-Type"];
    id v6 = [*v2 responseData];
    if ([v6 length])
    {
      uint64_t v7 = [v5 lowercaseString];
      uint64_t v8 = [v7 rangeOfString:@"json"];

      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_16:
        objc_msgSend(*(id *)(a1 + 32), "set_hasParsedResponseBody:", 1);
        objc_msgSend(*(id *)(a1 + 32), "set_responseBodyDict:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));

        return;
      }
      uint64_t v9 = (void *)MEMORY[0x1E4F28D90];
      id v10 = [*(id *)(a1 + 32) responseData];
      id v23 = 0;
      uint64_t v11 = [v9 JSONObjectWithData:v10 options:0 error:&v23];
      id v6 = v23;
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      v14 = LogCategory_NetworkingVerbose();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = *(void **)(a1 + 32);
        __int16 v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 134218242;
        id v25 = v15;
        __int16 v26 = 2112;
        v27 = v16;
        _os_log_impl(&dword_1D0EC4000, v14, OS_LOG_TYPE_INFO, "[%p] response_body: %@", buf, 0x16u);
      }

      if (v6)
      {
        [*v2 setJsonResponseParseError:v6];
        v17 = LogCategory_ServerError();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __39__FMJSONCommand_jsonResponseDictionary__block_invoke_cold_1(v2, (uint64_t)v6, v17);
        }

        uint64_t v18 = LogCategory_ServerError();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = *v2;
          id v20 = [NSString alloc];
          v21 = [*v2 responseData];
          v22 = (void *)[v20 initWithData:v21 encoding:4];
          *(_DWORD *)buf = 134218242;
          id v25 = v19;
          __int16 v26 = 2112;
          v27 = v22;
          _os_log_impl(&dword_1D0EC4000, v18, OS_LOG_TYPE_INFO, "[%p] Actual JSON that failed to parse: %@", buf, 0x16u);
        }
      }
    }

    goto LABEL_16;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [v4 _responseBodyDict];
  MEMORY[0x1F41817F8]();
}

- (BOOL)_hasParsedResponseBody
{
  return self->__hasParsedResponseBody;
}

- (void)set_responseBodyDict:(id)a3
{
}

- (void)set_requestBodyDict:(id)a3
{
}

- (void)set_hasParsedResponseBody:(BOOL)a3
{
  self->__hasParsedResponseBody = a3;
}

- (void)setResponseQueue:(id)a3
{
}

- (void)setJsonResponseParseError:(id)a3
{
}

- (id)jsonBodyDictionary
{
  return (id)[MEMORY[0x1E4F1CA60] dictionary];
}

- (NSDictionary)_responseBodyDict
{
  return self->__responseBodyDict;
}

- (NSDictionary)serverAlertInfo
{
  v2 = [(FMJSONCommand *)self jsonResponseDictionary];
  int v3 = [v2 objectForKeyedSubscript:@"alert"];
  id v4 = objc_msgSend(v3, "fm_nullToNil");

  return (NSDictionary *)v4;
}

- (NSError)jsonResponseParseError
{
  return self->_jsonResponseParseError;
}

- (void)body
{
  *(_DWORD *)int v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_1D0EC4000, a2, a3, "[%@] JSON Creation error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __39__FMJSONCommand_jsonResponseDictionary__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 134218242;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_1D0EC4000, a2, a3, "[%p] JSON parse error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end