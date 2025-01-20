@interface ASTMaterializedConnection
- (ASTConnectionStatusDelegate)delegate;
- (ASTIdentity)identity;
- (ASTMaterializedConnection)init;
- (BOOL)allowsCellularAccess;
- (BOOL)retryOnNetworkDisconnected;
- (NSDictionary)parameters;
- (NSDictionary)rawBody;
- (NSMutableURLRequest)request;
- (NSString)accept;
- (NSString)contentType;
- (NSString)endpoint;
- (NSString)method;
- (NSString)sessionId;
- (NSString)signature;
- (NSURL)serverURL;
- (double)timeout;
- (id)_acceptLanguage;
- (id)didReceiveResponse;
- (int64_t)networkDisconnectedRetryCount;
- (int64_t)state;
- (unint64_t)_rootOfTrust;
- (unint64_t)rootOfTrust;
- (void)addBody:(id)a3;
- (void)addBody:(id)a3 gzip:(BOOL)a4;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDidReceiveResponse:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setNetworkDisconnectedRetryCount:(int64_t)a3;
- (void)setRetryOnNetworkDisconnected:(BOOL)a3;
- (void)setSessionId:(id)a3;
- (void)setSignature:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTimeout:(double)a3;
- (void)signBodyWithPayloadSigner:(id)a3;
- (void)signPayload:(id)a3 withPayloadSigner:(id)a4;
@end

@implementation ASTMaterializedConnection

- (ASTMaterializedConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)ASTMaterializedConnection;
  v2 = [(ASTMaterializedConnection *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_networkDisconnectedRetryCount = 0;
    v2->_rootOfTrust = [(ASTMaterializedConnection *)v2 _rootOfTrust];
    v3->_state = 0;
  }
  return v3;
}

- (NSString)method
{
  return (NSString *)@"POST";
}

- (NSString)endpoint
{
  return (NSString *)@"session";
}

- (double)timeout
{
  return 60.0;
}

- (NSString)contentType
{
  return (NSString *)@"application/json; charset=utf-8";
}

- (NSString)accept
{
  return (NSString *)@"application/json";
}

- (NSURL)serverURL
{
  return 0;
}

- (NSMutableURLRequest)request
{
  request = self->_request;
  if (!request)
  {
    v4 = [(ASTMaterializedConnection *)self serverURL];

    if (v4)
    {
      objc_super v5 = [(ASTMaterializedConnection *)self serverURL];
      v6 = [(ASTMaterializedConnection *)self endpoint];
      v7 = [v5 URLByAppendingPathComponent:v6];
    }
    else
    {
      objc_super v5 = +[ASTEnvironment currentEnvironment];
      v6 = [v5 serverURL];
      v8 = [(ASTMaterializedConnection *)self endpoint];
      v7 = [v6 URLByAppendingPathComponent:v8];
    }
    v9 = [(ASTMaterializedConnection *)self parameters];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      v11 = [MEMORY[0x263F08BA0] componentsWithURL:v7 resolvingAgainstBaseURL:0];
      v12 = [MEMORY[0x263EFF980] array];
      v13 = [(ASTMaterializedConnection *)self parameters];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __36__ASTMaterializedConnection_request__block_invoke;
      v42[3] = &unk_264E7DBC8;
      id v43 = v12;
      id v14 = v12;
      [v13 enumerateKeysAndObjectsUsingBlock:v42];

      v15 = (void *)[v14 copy];
      [v11 setQueryItems:v15];

      uint64_t v16 = [v11 URL];

      v7 = (void *)v16;
    }
    id v17 = objc_alloc(MEMORY[0x263F089E0]);
    [(ASTMaterializedConnection *)self timeout];
    v18 = (NSMutableURLRequest *)objc_msgSend(v17, "initWithURL:cachePolicy:timeoutInterval:", v7, 0);
    v19 = self->_request;
    self->_request = v18;

    v20 = [(ASTMaterializedConnection *)self method];
    [(NSMutableURLRequest *)self->_request setHTTPMethod:v20];

    [(NSMutableURLRequest *)self->_request setHTTPShouldHandleCookies:0];
    [(NSMutableURLRequest *)self->_request setAllowsCellularAccess:[(ASTMaterializedConnection *)self allowsCellularAccess]];
    v21 = self->_request;
    v22 = [(ASTMaterializedConnection *)self accept];
    [(NSMutableURLRequest *)v21 setValue:v22 forHTTPHeaderField:@"Accept"];

    v23 = self->_request;
    v24 = [(ASTMaterializedConnection *)self contentType];
    [(NSMutableURLRequest *)v23 setValue:v24 forHTTPHeaderField:@"Content-Type"];

    v25 = self->_request;
    v26 = [v7 host];
    [(NSMutableURLRequest *)v25 setValue:v26 forHTTPHeaderField:@"Host"];

    v27 = self->_request;
    v28 = [(ASTMaterializedConnection *)self _acceptLanguage];
    [(NSMutableURLRequest *)v27 setValue:v28 forHTTPHeaderField:@"Accept-Language"];

    v29 = self->_request;
    v30 = [(ASTMaterializedConnection *)self identity];
    v31 = [v30 userAgent];
    [(NSMutableURLRequest *)v29 setValue:v31 forHTTPHeaderField:@"User-Agent"];

    v32 = self->_request;
    v33 = +[ASTConnectionUtilities getServerLoggingSelection];
    v34 = [v33 stringValue];
    [(NSMutableURLRequest *)v32 setValue:v34 forHTTPHeaderField:@"X-DA-LOG-LEVEL"];

    v35 = [(ASTMaterializedConnection *)self signature];

    if (v35)
    {
      v36 = self->_request;
      v37 = [(ASTMaterializedConnection *)self signature];
      [(NSMutableURLRequest *)v36 setValue:v37 forHTTPHeaderField:@"Signature"];
    }
    v38 = [(ASTMaterializedConnection *)self sessionId];

    if (v38)
    {
      v39 = self->_request;
      v40 = [(ASTMaterializedConnection *)self sessionId];
      [(NSMutableURLRequest *)v39 setValue:v40 forHTTPHeaderField:@"Diagnostic-Session-ID"];
    }
    request = self->_request;
  }

  return request;
}

void __36__ASTMaterializedConnection_request__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x263F08BD0] queryItemWithName:a2 value:a3];
  [v3 addObject:v4];
}

- (NSDictionary)parameters
{
  return 0;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
  id v5 = [(ASTMaterializedConnection *)self request];
  id v4 = [(ASTMaterializedConnection *)self signature];
  [v5 setValue:v4 forHTTPHeaderField:@"Signature"];
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  BOOL v3 = a3;
  self->_allowsCellularAccess = a3;
  id v4 = [(ASTMaterializedConnection *)self request];
  [v4 setAllowsCellularAccess:v3];
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
  id v5 = a3;
  id v7 = [(ASTMaterializedConnection *)self request];
  v6 = [v5 userAgent];

  [v7 setValue:v6 forHTTPHeaderField:@"User-Agent"];
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
  id v4 = [(ASTMaterializedConnection *)self request];
  [v4 setTimeoutInterval:a3];
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
  id v5 = [(ASTMaterializedConnection *)self request];
  id v4 = [(ASTMaterializedConnection *)self sessionId];
  [v5 setValue:v4 forHTTPHeaderField:@"Diagnostic-Session-ID"];
}

- (void)addBody:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v7 = 0;
  id v4 = +[ASTEncodingUtilities jsonSerializeObject:a3 error:&v7];
  id v5 = v7;
  if (v5)
  {
    v6 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_23CA80000, v6, OS_LOG_TYPE_DEFAULT, "Error during json serialization: %@", buf, 0xCu);
    }
  }
  else if (v4)
  {
    [(ASTMaterializedConnection *)self addBody:v4 gzip:+[ASTConnectionUtilities isGzipEnabled]];
  }
}

- (void)addBody:(id)a3 gzip:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    if (v6)
    {
      v8 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
      id v9 = ASTLogHandleForCategory(3);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = (id)objc_opt_class();
        __int16 v21 = 2112;
        v22 = v8;
        id v10 = v20;
        _os_log_impl(&dword_23CA80000, v9, OS_LOG_TYPE_DEFAULT, "[%@] Request Body: %@", buf, 0x16u);
      }
      v11 = +[ASTTestAutomation sharedInstance];
      int v12 = [v11 testAutomationEnabled];

      if (v12)
      {
        id v17 = @"payload";
        v18 = v8;
        v13 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        +[ASTTestAutomation postServerRequest:v13];
      }
    }
    uint64_t v14 = [v7 dataGZipDeflated];

    v15 = [(ASTMaterializedConnection *)self request];
    [v15 setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];

    id v7 = (void *)v14;
  }
  uint64_t v16 = [(ASTMaterializedConnection *)self request];
  [v16 setHTTPBody:v7];
}

- (void)signBodyWithPayloadSigner:(id)a3
{
  id v4 = a3;
  id v5 = [(ASTMaterializedConnection *)self rawBody];

  if (v5)
  {
    id v6 = [(ASTMaterializedConnection *)self rawBody];
    [(ASTMaterializedConnection *)self signPayload:v6 withPayloadSigner:v4];
  }
  else
  {
    id v7 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ASTMaterializedConnection signBodyWithPayloadSigner:](v7);
    }
  }
}

- (void)signPayload:(id)a3 withPayloadSigner:(id)a4
{
  id v6 = (void (**)(id, void *, id *))a4;
  id v13 = 0;
  id v7 = +[ASTEncodingUtilities jsonSerializeObject:a3 error:&v13];
  id v8 = v13;
  if (v8)
  {
    id v9 = v8;
    id v10 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ASTMaterializedConnection signPayload:withPayloadSigner:]((uint64_t)v9, v10);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (v6 && v7)
  {
    id v12 = 0;
    id v10 = v6[2](v6, v7, &v12);
    id v9 = v12;
    if (v10)
    {
      v11 = [v10 base64EncodedStringWithOptions:0];
      [(ASTMaterializedConnection *)self setSignature:v11];
    }
    else
    {
      v11 = ASTLogHandleForCategory(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ASTMaterializedConnection signPayload:withPayloadSigner:]((uint64_t)v9, v11);
      }
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (unint64_t)_rootOfTrust
{
  v2 = +[ASTEnvironment currentEnvironment];
  uint64_t v3 = [v2 server];

  if ((unint64_t)(v3 - 1) > 0xB) {
    return 0;
  }
  else {
    return qword_23CAB0A50[v3 - 1];
  }
}

- (id)_acceptLanguage
{
  v12[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = [MEMORY[0x263EFF960] preferredLanguages];
  if ([MEMORY[0x263F31AC0] isCheckerBoardActive])
  {
    id v4 = [MEMORY[0x263EFF960] currentLocale];
    id v5 = [v4 languageIdentifier];
    v12[0] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];

    uint64_t v3 = (void *)v6;
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__ASTMaterializedConnection__acceptLanguage__block_invoke;
  v10[3] = &unk_264E7DB28;
  id v11 = v2;
  id v7 = v2;
  [v3 enumerateObjectsUsingBlock:v10];
  id v8 = [v7 componentsJoinedByString:@", "];

  return v8;
}

void __44__ASTMaterializedConnection__acceptLanguage__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, BOOL *a4)
{
  float v5 = (float)((float)a3 * -0.1) + 1.0;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [NSString stringWithFormat:@"%@q=%0.1g", a2, v5];;
  [v6 addObject:v7];

  *a4 = v5 <= 0.5;
}

- (id)didReceiveResponse
{
  return self->_didReceiveResponse;
}

- (void)setDidReceiveResponse:(id)a3
{
}

- (ASTConnectionStatusDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASTConnectionStatusDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)networkDisconnectedRetryCount
{
  return self->_networkDisconnectedRetryCount;
}

- (void)setNetworkDisconnectedRetryCount:(int64_t)a3
{
  self->_networkDisconnectedRetryCount = a3;
}

- (BOOL)retryOnNetworkDisconnected
{
  return self->_retryOnNetworkDisconnected;
}

- (void)setRetryOnNetworkDisconnected:(BOOL)a3
{
  self->_retryOnNetworkDisconnected = a3;
}

- (unint64_t)rootOfTrust
{
  return self->_rootOfTrust;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (NSString)signature
{
  return self->_signature;
}

- (ASTIdentity)identity
{
  return self->_identity;
}

- (NSDictionary)rawBody
{
  return self->_rawBody;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawBody, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong(&self->_didReceiveResponse, 0);
}

- (void)signBodyWithPayloadSigner:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23CA80000, log, OS_LOG_TYPE_ERROR, "Unable to sign body, raw body is nil", v1, 2u);
}

- (void)signPayload:(uint64_t)a1 withPayloadSigner:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23CA80000, a2, OS_LOG_TYPE_ERROR, "Unable to create connection signature, error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)signPayload:(uint64_t)a1 withPayloadSigner:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23CA80000, a2, OS_LOG_TYPE_ERROR, "Unable to serialize payload, error: %@", (uint8_t *)&v2, 0xCu);
}

@end