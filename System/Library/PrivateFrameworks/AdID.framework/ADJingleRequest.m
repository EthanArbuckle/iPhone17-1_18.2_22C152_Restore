@interface ADJingleRequest
+ (id)incrementToken;
- (NSData)requestBody;
- (NSData)responseBody;
- (NSDictionary)responseHeaders;
- (NSError)error;
- (NSMutableDictionary)requestHeaders;
- (NSNumber)token;
- (NSString)DSID;
- (NSString)bagKey;
- (id)completionHandler;
- (id)init:(id)a3 withCompletion:(id)a4;
- (int64_t)statusCode;
- (void)handleJingleResponse;
- (void)send;
- (void)sendJingleRequest:(id)a3 withCompletion:(id)a4;
- (void)setBagKey:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDSID:(id)a3;
- (void)setError:(id)a3;
- (void)setRequestBody:(id)a3;
- (void)setRequestHeaders:(id)a3;
- (void)setResponseBody:(id)a3;
- (void)setResponseHeaders:(id)a3;
- (void)setStatusCode:(int64_t)a3;
- (void)setToken:(id)a3;
@end

@implementation ADJingleRequest

+ (id)incrementToken
{
  id v2 = a1;
  objc_sync_enter(v2);
  ++token;
  objc_sync_exit(v2);

  v3 = NSNumber;
  uint64_t v4 = token;

  return (id)[v3 numberWithInt:v4];
}

- (id)init:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ADJingleRequest;
  v9 = [(ADJingleRequest *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_DSID, a3);
    uint64_t v11 = +[ADJingleRequest incrementToken];
    token = v10->_token;
    v10->_token = (NSNumber *)v11;

    uint64_t v13 = MEMORY[0x223CA6810](v8);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = (id)v13;

    if (init_withCompletion__onceToken != -1) {
      dispatch_once(&init_withCompletion__onceToken, &__block_literal_global_0);
    }
    uint64_t v15 = [(id)init_withCompletion__defaultHeaders mutableCopy];
    requestHeaders = v10->_requestHeaders;
    v10->_requestHeaders = (NSMutableDictionary *)v15;
  }
  return v10;
}

void __39__ADJingleRequest_init_withCompletion___block_invoke()
{
  v0 = (void *)init_withCompletion__defaultHeaders;
  init_withCompletion__defaultHeaders = (uint64_t)&unk_26D5A54A8;
}

- (void)send
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  v3 = +[ADAMSBagManager sharedInstance];
  uint64_t v4 = [(ADJingleRequest *)self bagKey];
  v5 = [v3 retrieveJingleRequestURLFromAMSBagWithPartialityKey:v4];

  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v28 = objc_alloc(MEMORY[0x263F087E8]);
    v29 = NSString;
    uint64_t v30 = objc_opt_class();
    v31 = [(ADJingleRequest *)self bagKey];
    v32 = [v5 absoluteString];
    v33 = [v29 stringWithFormat:@"[%@]: Invalid value for bag key %@: %@ (class: %@)", v30, v31, v32, objc_opt_class()];
    v25 = (void *)[v28 initWithAdCode:14 andDescription:v33];

    objc_msgSend(v25, "AD_Log:", @"iAdIDLogging");
    [(ADJingleRequest *)self setError:v25];
    v34 = [(ADJingleRequest *)self completionHandler];

    if (!v34)
    {
LABEL_20:

      goto LABEL_21;
    }
    v26 = [(ADJingleRequest *)self completionHandler];
    ((void (**)(void, ADJingleRequest *))v26)[2](v26, self);
LABEL_19:

    goto LABEL_20;
  }
  v49 = v5;
  v6 = [MEMORY[0x263F241C0] sharedInstance];
  id v7 = [v6 iTunesAccountDSID];
  id v8 = [MEMORY[0x263F241D8] sharedInstance];
  v9 = [v8 activeDSIDRecord];
  v10 = [v9 DSID];
  char v11 = [v7 isEqualToString:v10];

  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F27ED8]);
    [v12 setRequestEncoding:3];
    uint64_t v13 = [MEMORY[0x263F241C0] sharedInstance];
    v14 = [v13 iTunesStoreAccount];
    [v12 setAccount:v14];

    v48 = v12;
    [v12 setUrlKnownToBeTrusted:1];
    id v50 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v15 = self;
    v16 = [(ADJingleRequest *)self requestHeaders];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v54 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v22 = [(ADJingleRequest *)v15 requestHeaders];
            v23 = [v22 objectForKey:v21];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v50 setValue:v23 forKey:v21];
            }
            else
            {
              v24 = [NSString stringWithFormat:@"Non-string value in additional headers: %@", v23];
              _ADLog();
            }
          }
          else
          {
            v23 = [NSString stringWithFormat:@"Non-string key in additional headers: %@", v21];
            _ADLog();
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v18);
    }

    v25 = v12;
    v5 = v49;
    v26 = (void (**)(void, void))v50;
    v27 = [v48 requestWithMethod:4 URL:v49 parameters:v50];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __23__ADJingleRequest_send__block_invoke;
    v51[3] = &unk_264669BE0;
    v51[4] = v15;
    id v52 = v49;
    [v27 addFinishBlock:v51];

    goto LABEL_19;
  }
  id v35 = objc_alloc(MEMORY[0x263F087E8]);
  v36 = NSString;
  uint64_t v37 = objc_opt_class();
  v38 = [MEMORY[0x263F241C0] sharedInstance];
  v39 = [v38 iTunesAccountDSID];
  v40 = [MEMORY[0x263F241D8] sharedInstance];
  [v40 activeDSIDRecord];
  v42 = v41 = self;
  v43 = [v42 DSID];
  v44 = [v36 stringWithFormat:@"[%@]: iTunes DSID mismatch. Active DSID: %@. Record DSID: %@. Cannot request Segments.", v37, v39, v43];
  v45 = (void *)[v35 initWithAdCode:3 andDescription:v44];

  objc_msgSend(v45, "AD_Log:", @"iAdIDLogging");
  [(ADJingleRequest *)v41 setError:v45];
  v46 = [(ADJingleRequest *)v41 completionHandler];

  if (v46)
  {
    v47 = [(ADJingleRequest *)v41 completionHandler];
    ((void (**)(void, ADJingleRequest *))v47)[2](v47, v41);
  }
LABEL_21:
}

void __23__ADJingleRequest_send__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 requestBody];
  [v4 setHTTPBody:v5];

  v6 = [MEMORY[0x263F241C0] sharedInstance];
  [v6 jingleTimeoutInterval];
  objc_msgSend(v4, "setTimeoutInterval:");

  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  id v8 = [*(id *)(a1 + 32) requestHeaders];
  [v7 setObject:v8 forKey:@"headers"];

  v9 = (void *)MEMORY[0x263F08900];
  v10 = [*(id *)(a1 + 32) requestBody];
  char v11 = [v9 JSONObjectWithData:v10 options:0 error:0];
  [v7 setObject:v11 forKey:@"body"];

  id v12 = NSString;
  uint64_t v13 = [*(id *)(a1 + 40) absoluteString];
  v14 = objc_msgSend(v7, "AD_jsonString");
  uint64_t v15 = [v12 stringWithFormat:@"POSTing to Jingle (%@): %@", v13, v14];
  _ADLog();

  v16 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __23__ADJingleRequest_send__block_invoke_2;
  v17[3] = &unk_264669BB8;
  v17[4] = v16;
  [v16 sendJingleRequest:v4 withCompletion:v17];
}

void __23__ADJingleRequest_send__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (v5 | v6)
  {
    id v7 = [(id)v5 data];
    id v8 = (void *)[v7 copy];
    [*(id *)(a1 + 32) setResponseBody:v8];

    v9 = [(id)v5 responseHeaders];
    v10 = (void *)[v9 copy];
    [*(id *)(a1 + 32) setResponseHeaders:v10];

    char v11 = (void *)[(id)v6 copy];
    [*(id *)(a1 + 32) setError:v11];

    objc_msgSend(*(id *)(a1 + 32), "setStatusCode:", objc_msgSend((id)v5, "responseStatusCode"));
  }
  else
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithAdCode:12 andDescription:@"Jingle response is nil."];
    [*(id *)(a1 + 32) setError:v12];
  }
  uint64_t v13 = [MEMORY[0x263F24230] workQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __23__ADJingleRequest_send__block_invoke_3;
  v14[3] = &unk_2646696C0;
  v14[4] = *(void *)(a1 + 32);
  [v13 addOperationWithBlock:v14];
}

uint64_t __23__ADJingleRequest_send__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleJingleResponse];
}

- (void)handleJingleResponse
{
  v3 = NSString;
  if (self->_error)
  {
    uint64_t v4 = objc_opt_class();
    unint64_t v5 = [(ADJingleRequest *)self error];
    uint64_t v6 = [v5 code];
    id v7 = [(ADJingleRequest *)self token];
    id v8 = [(ADJingleRequest *)self error];
    v9 = [v8 localizedDescription];
    v10 = [v3 stringWithFormat:@"[%@]: Error %ld in Jingle response for %@: %@", v4, v6, v7, v9];
    _ADLog();

LABEL_3:
    goto LABEL_4;
  }
  id v12 = [(ADJingleRequest *)self token];
  uint64_t v13 = [v3 stringWithFormat:@"Jingle response for %@ received with status %ld", v12, -[ADJingleRequest statusCode](self, "statusCode")];
  _ADLog();

  if ([(ADJingleRequest *)self statusCode] != 200)
  {
    if ([(ADJingleRequest *)self statusCode] == 401)
    {
      v27 = +[ADJingleRequestManager sharedInstance];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __39__ADJingleRequest_handleJingleResponse__block_invoke;
      v33[3] = &unk_264669C08;
      v33[4] = self;
      [v27 authenticateUser:v33];

      return;
    }
    id v28 = objc_alloc(MEMORY[0x263F087E8]);
    int64_t v29 = [(ADJingleRequest *)self statusCode];
    unint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown HTTP response code: %ld", -[ADJingleRequest statusCode](self, "statusCode"));
    id v7 = (void *)[v28 initWithAdCode:v29 andDescription:v5];
    [(ADJingleRequest *)self setError:v7];
    goto LABEL_3;
  }
  v14 = NSString;
  id v15 = [NSString alloc];
  v16 = [(ADJingleRequest *)self responseBody];
  uint64_t v17 = (void *)[v15 initWithData:v16 encoding:4];
  uint64_t v18 = [v14 stringWithFormat:@"Jingle response body:\n %@", v17];
  _ADLog();

  if (MGGetBoolAnswer())
  {
    uint64_t v19 = [MEMORY[0x263F241B8] sharedInstance];
    if ([v19 BOOLForKey:@"ForceU13SegmentResponse"])
    {
LABEL_13:

LABEL_14:
      unint64_t v5 = [MEMORY[0x263F08900] JSONObjectWithData:self->_responseBody options:1 error:0];
      uint64_t v21 = [MEMORY[0x263F241B8] sharedInstance];
      int v22 = [v21 BOOLForKey:@"ForceU13SegmentResponse"];

      if (v22) {
        [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"u13flag"];
      }
      v23 = [MEMORY[0x263F241B8] sharedInstance];
      int v24 = [v23 BOOLForKey:@"ForceT13SegmentResponse"];

      if (v24) {
        [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"t13flag"];
      }
      v25 = [MEMORY[0x263F241B8] sharedInstance];
      int v26 = [v25 BOOLForKey:@"ForceU18SegmentResponse"];

      if (v26) {
        [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"u18flag"];
      }
      id v7 = [MEMORY[0x263F08900] dataWithJSONObject:v5 options:1 error:0];
      [(ADJingleRequest *)self setResponseBody:v7];
      goto LABEL_3;
    }
    v20 = [MEMORY[0x263F241B8] sharedInstance];
    if ([v20 BOOLForKey:@"ForceT13SegmentResponse"])
    {

      goto LABEL_13;
    }
    uint64_t v30 = [MEMORY[0x263F241B8] sharedInstance];
    char v31 = [v30 BOOLForKey:@"ForceU18SegmentResponse"];

    if (v31) {
      goto LABEL_14;
    }
  }
LABEL_4:
  char v11 = [(ADJingleRequest *)self completionHandler];

  if (v11)
  {
    v32 = [(ADJingleRequest *)self completionHandler];
    v32[2](v32, self);
  }
}

void __39__ADJingleRequest_handleJingleResponse__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    [v3 send];
  }
  else
  {
    id v4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithAdCode:8 andDescription:@"Jingle authentication error."];
    [*(id *)(a1 + 32) setError:v4];
  }
}

- (void)sendJingleRequest:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x263F08C00];
  id v7 = a3;
  id v8 = [v6 defaultSessionConfiguration];
  v9 = (void *)[objc_alloc(MEMORY[0x263F27EF0]) initWithConfiguration:v8 delegate:0 delegateQueue:0];
  id v10 = objc_alloc_init(MEMORY[0x263F27E10]);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __52__ADJingleRequest_sendJingleRequest_withCompletion___block_invoke;
  uint64_t v17 = &unk_264669C58;
  id v18 = v10;
  id v19 = v5;
  id v11 = v5;
  id v12 = v10;
  uint64_t v13 = [v9 dataTaskWithRequest:v7 completionHandler:&v14];

  objc_msgSend(v13, "resume", v14, v15, v16, v17);
  [v9 finishTasksAndInvalidate];
}

void __52__ADJingleRequest_sendJingleRequest_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__ADJingleRequest_sendJingleRequest_withCompletion___block_invoke_2;
  v5[3] = &unk_264669C30;
  id v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v4 addFinishBlock:v5];
}

uint64_t __52__ADJingleRequest_sendJingleRequest_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (NSNumber)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSData)responseBody
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResponseBody:(id)a3
{
}

- (NSDictionary)responseHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResponseHeaders:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setError:(id)a3
{
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (NSString)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSString)bagKey
{
  return self->_bagKey;
}

- (void)setBagKey:(id)a3
{
}

- (NSData)requestBody
{
  return self->_requestBody;
}

- (void)setRequestBody:(id)a3
{
}

- (NSMutableDictionary)requestHeaders
{
  return self->_requestHeaders;
}

- (void)setRequestHeaders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHeaders, 0);
  objc_storeStrong((id *)&self->_requestBody, 0);
  objc_storeStrong((id *)&self->_bagKey, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_responseBody, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

@end