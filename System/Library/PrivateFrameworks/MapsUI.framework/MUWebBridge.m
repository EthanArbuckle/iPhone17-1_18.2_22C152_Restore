@interface MUWebBridge
+ (id)URLByAddingConfiguration:(id)a3 toURL:(id)a4 additionalQueryItems:(id)a5;
+ (id)_operatingSystemName;
+ (id)_operatingSystemVersion;
- (MUWebBridge)initWithWebViewFactoryItem:(id)a3;
- (MUWebBridgeDelegate)delegate;
- (MUWebViewFactoryItem)webViewFactoryItem;
- (NSDictionary)callHandlers;
- (int64_t)connectionState;
- (void)_consumeCallbackHandlerWithNumber:(id)a3 result:(id)a4 errorMessage:(id)a5;
- (void)_dispatchCall:(id)a3;
- (void)_dispatchCallback:(id)a3;
- (void)_initializeConnection;
- (void)_postMessage:(id)a3 completionHandler:(id)a4;
- (void)_receiveMessage:(id)a3;
- (void)addCallableMethod:(id)a3 handler:(id)a4;
- (void)callMethod:(id)a3 arguments:(id)a4 callbackHandler:(id)a5;
- (void)closeConnection;
- (void)setDelegate:(id)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
@end

@implementation MUWebBridge

- (MUWebBridge)initWithWebViewFactoryItem:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MUWebBridge;
  v6 = [(MUWebBridge *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webViewFactoryItem, a3);
    v8 = [(MUWebViewFactoryItem *)v7->_webViewFactoryItem messageHandlerProxy];
    [v8 setTarget:v7];

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    callHandlers = v7->_callHandlers;
    v7->_callHandlers = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    pendingCallbackHandlers = v7->_pendingCallbackHandlers;
    v7->_pendingCallbackHandlers = (NSMutableDictionary *)v11;

    id defaultCallbackHandler = v7->_defaultCallbackHandler;
    v7->_id defaultCallbackHandler = &__block_literal_global_18;
  }
  return v7;
}

void __42__MUWebBridge_initWithWebViewFactoryItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = MUGetMUWebContentLog_1();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1931EA000, v4, OS_LOG_TYPE_ERROR, "Bad message response: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

+ (id)URLByAddingConfiguration:(id)a3 toURL:(id)a4 additionalQueryItems:(id)a5
{
  id v7 = a5;
  v8 = (void *)MEMORY[0x1E4F29088];
  id v9 = a3;
  v10 = [v8 componentsWithURL:a4 resolvingAgainstBaseURL:0];
  uint64_t v11 = (void *)MEMORY[0x1E4F1CA48];
  v12 = [v10 queryItems];
  v13 = [v11 arrayWithArray:v12];

  v14 = (void *)MEMORY[0x1E4F290C8];
  objc_super v15 = [v9 bridgeVersion];

  v16 = [v14 queryItemWithName:@"bridgeVersion" value:v15];
  [v13 addObject:v16];

  v17 = (void *)MEMORY[0x1E4F290C8];
  v18 = [(id)objc_opt_class() _operatingSystemName];
  v19 = [v17 queryItemWithName:@"osName" value:v18];
  [v13 addObject:v19];

  v20 = (void *)MEMORY[0x1E4F290C8];
  v21 = [(id)objc_opt_class() _operatingSystemVersion];
  v22 = [v20 queryItemWithName:@"osVersion" value:v21];
  [v13 addObject:v22];

  if ([v7 count]) {
    [v13 addObjectsFromArray:v7];
  }
  [v10 setQueryItems:v13];
  v23 = [v10 URL];

  return v23;
}

- (void)_initializeConnection
{
  if (!self->_connectionState)
  {
    self->_connectionState = 1;
    id v3 = [(MUWebBridge *)self delegate];
    [v3 webBridgeDidConnect:self];
  }
}

- (void)closeConnection
{
  self->_connectionState = 2;
  id v2 = [(MUWebViewFactoryItem *)self->_webViewFactoryItem messageHandlerProxy];
  [v2 setTarget:0];
}

- (void)callMethod:(id)a3 arguments:(id)a4 callbackHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id defaultCallbackHandler = a5;
  uint64_t v11 = defaultCallbackHandler;
  if (self->_connectionState == 1)
  {
    int64_t nextCallNumber = self->_nextCallNumber;
    self->_int64_t nextCallNumber = nextCallNumber + 1;
    if (nextCallNumber < 0)
    {
      MUGetMUWebContentLog_1();
      v16 = (MUWebMessage *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1931EA000, &v16->super, OS_LOG_TYPE_ERROR, "Call limit exceeded", (uint8_t *)location, 2u);
      }
    }
    else
    {
      if (!defaultCallbackHandler) {
        id defaultCallbackHandler = self->_defaultCallbackHandler;
      }
      v13 = _Block_copy(defaultCallbackHandler);
      pendingCallbackHandlers = self->_pendingCallbackHandlers;
      objc_super v15 = [NSNumber numberWithInteger:nextCallNumber];
      [(NSMutableDictionary *)pendingCallbackHandlers setObject:v13 forKeyedSubscript:v15];

      v16 = objc_alloc_init(MUWebMessage);
      [(MUWebMessage *)v16 setType:0x1EE3CE860];
      v17 = [(MUWebViewFactoryItem *)self->_webViewFactoryItem bridgeConfiguration];
      v18 = [v17 nativeControllerName];
      [(MUWebMessage *)v16 setCaller:v18];

      v19 = [(MUWebViewFactoryItem *)self->_webViewFactoryItem bridgeConfiguration];
      v20 = [v19 webControllerName];
      [(MUWebMessage *)v16 setCallee:v20];

      [(MUWebMessage *)v16 setMethod:v8];
      v21 = [NSNumber numberWithInteger:nextCallNumber];
      [(MUWebMessage *)v16 setCallNumber:v21];

      [(MUWebMessage *)v16 setArguments:v9];
      objc_initWeak(location, self);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __52__MUWebBridge_callMethod_arguments_callbackHandler___block_invoke;
      v22[3] = &unk_1E574FDA0;
      objc_copyWeak(&v23, location);
      [(MUWebBridge *)self _postMessage:v16 completionHandler:v22];
      objc_destroyWeak(&v23);
      objc_destroyWeak(location);
    }
  }
}

void __52__MUWebBridge_callMethod_arguments_callbackHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    WeakRetained = MUGetMUWebContentLog_1();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1931EA000, WeakRetained, OS_LOG_TYPE_ERROR, "Error evaluating JavaScript: %@", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_6;
  }
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _receiveMessage:v5];
LABEL_6:
  }
}

- (void)addCallableMethod:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v8 = (id)[a4 copy];
  id v7 = _Block_copy(v8);
  [(NSMutableDictionary *)self->_callHandlers setObject:v7 forKeyedSubscript:v6];
}

- (void)_receiveMessage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (id v5 = [[MUWebMessage alloc] initWithJSONObject:v4]) != 0)
  {
    p_super = &v5->super;
    id v7 = [(MUWebMessage *)v5 type];
    int v8 = [v7 isEqualToString:0x1EE3CE860];

    if (v8)
    {
      [(MUWebBridge *)self _dispatchCall:p_super];
    }
    else
    {
      id v9 = [p_super type];
      int v10 = [v9 isEqualToString:0x1EE3CE880];

      if (v10)
      {
        [(MUWebBridge *)self _dispatchCallback:p_super];
      }
      else
      {
        uint64_t v11 = MUGetMUWebContentLog_1();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = [p_super type];
          int v13 = 138412290;
          v14 = v12;
          _os_log_impl(&dword_1931EA000, v11, OS_LOG_TYPE_ERROR, "Unknown message type: %@", (uint8_t *)&v13, 0xCu);
        }
      }
    }
  }
  else
  {
    p_super = MUGetMUWebContentLog_1();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1931EA000, p_super, OS_LOG_TYPE_ERROR, "Invalid message", (uint8_t *)&v13, 2u);
    }
  }
}

- (void)_postMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void, id))a4;
  id v7 = (void *)MEMORY[0x1E4F28D90];
  int v8 = [a3 JSONObject];
  id v17 = 0;
  id v9 = [v7 dataWithJSONObject:v8 options:0 error:&v17];
  id v10 = v17;

  if (v9)
  {
    uint64_t v11 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
    v12 = NSString;
    int v13 = [(MUWebViewFactoryItem *)self->_webViewFactoryItem bridgeConfiguration];
    v14 = [v13 webControllerName];
    uint64_t v15 = [v12 stringWithFormat:@"window.%@.receiveMessage(%@)", v14, v11];

    v16 = [(MUWebViewFactoryItem *)self->_webViewFactoryItem webView];
    [v16 evaluateJavaScript:v15 completionHandler:v6];
  }
  else
  {
    v6[2](v6, 0, v10);
  }
}

- (void)_dispatchCall:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 copy];
  [v5 setType:0x1EE3CE880];
  int64_t connectionState = self->_connectionState;
  if (connectionState == 2)
  {
    [v5 setStatus:0x1EE3CE8C0];
    id v9 = @"bridge closed";
    goto LABEL_13;
  }
  if (connectionState != 1)
  {
    if (connectionState)
    {
LABEL_14:
      [(MUWebBridge *)self _postMessage:v5 completionHandler:&__block_literal_global_45];
      goto LABEL_15;
    }
    id v7 = [v4 method];
    int v8 = [v7 isEqualToString:@"init"];

    if (v8)
    {
      [(MUWebBridge *)self _initializeConnection];
      [v5 setStatus:0x1EE3CE8A0];
      goto LABEL_14;
    }
    [v5 setStatus:0x1EE3CE8C0];
    id v9 = @"bridge not initialized";
LABEL_13:
    [v5 setErrorMessage:v9];
    goto LABEL_14;
  }
  id v10 = [v4 method];
  int v11 = [v10 isEqualToString:@"init"];

  if (v11)
  {
    [v5 setStatus:0x1EE3CE8C0];
    id v9 = @"bridge already initialized";
    goto LABEL_13;
  }
  callHandlers = self->_callHandlers;
  int v13 = [v4 method];
  v14 = [(NSMutableDictionary *)callHandlers objectForKeyedSubscript:v13];

  if (!v14)
  {
    [v5 setStatus:0x1EE3CE8C0];
    id v9 = @"method not supported";
    goto LABEL_13;
  }
  objc_initWeak(&location, self);
  uint64_t v15 = [v4 arguments];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __29__MUWebBridge__dispatchCall___block_invoke;
  v16[3] = &unk_1E574FDE8;
  objc_copyWeak(&v18, &location);
  id v17 = v5;
  ((void (**)(void, void *, void *))v14)[2](v14, v15, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

LABEL_15:
}

void __29__MUWebBridge__dispatchCall___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained && [WeakRetained connectionState] == 1)
  {
    int v8 = *(void **)(a1 + 32);
    if (v5)
    {
      [v8 setStatus:0x1EE3CE8C0];
      [*(id *)(a1 + 32) setErrorMessage:v5];
    }
    else
    {
      [v8 setStatus:0x1EE3CE8A0];
      [*(id *)(a1 + 32) setResult:v9];
    }
    [v7 _postMessage:*(void *)(a1 + 32) completionHandler:&__block_literal_global_36];
  }
}

void __29__MUWebBridge__dispatchCall___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = MUGetMUWebContentLog_1();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1931EA000, v4, OS_LOG_TYPE_ERROR, "Error evaluating JavaScript: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void __29__MUWebBridge__dispatchCall___block_invoke_43(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = MUGetMUWebContentLog_1();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1931EA000, v4, OS_LOG_TYPE_ERROR, "Error evaluating JavaScript: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_dispatchCallback:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  if (self->_connectionState == 1)
  {
    id v6 = [v4 status];
    if ([v6 isEqualToString:0x1EE3CE8A0])
    {
      uint64_t v7 = [v5 callNumber];
      int v8 = [v5 result];
      id v9 = self;
      id v10 = v7;
      int v11 = v8;
      v12 = 0;
    }
    else
    {
      if (![v6 isEqualToString:0x1EE3CE8C0])
      {
        int v13 = MUGetMUWebContentLog_1();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int v14 = 138412290;
          uint64_t v15 = v5;
          _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_ERROR, "Unknown status in message: %@", (uint8_t *)&v14, 0xCu);
        }

        goto LABEL_10;
      }
      uint64_t v7 = [v5 callNumber];
      int v8 = [v5 errorMessage];
      id v9 = self;
      id v10 = v7;
      int v11 = 0;
      v12 = v8;
    }
    [(MUWebBridge *)v9 _consumeCallbackHandlerWithNumber:v10 result:v11 errorMessage:v12];

LABEL_10:
  }
}

- (void)_consumeCallbackHandlerWithNumber:(id)a3 result:(id)a4 errorMessage:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(NSMutableDictionary *)self->_pendingCallbackHandlers objectForKeyedSubscript:v8];
  if (v11)
  {
    [(NSMutableDictionary *)self->_pendingCallbackHandlers removeObjectForKey:v8];
    ((void (**)(void, id, id))v11)[2](v11, v9, v10);
  }
  else
  {
    v12 = MUGetMUWebContentLog_1();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_1931EA000, v12, OS_LOG_TYPE_ERROR, "No matching callback handler found for callback %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v8 = a4;
  int v5 = [v8 frameInfo];
  int v6 = [v5 isMainFrame];

  if (v6)
  {
    uint64_t v7 = [v8 body];
    [(MUWebBridge *)self _receiveMessage:v7];
  }
}

+ (id)_operatingSystemName
{
  return @"ios";
}

+ (id)_operatingSystemVersion
{
  long long v6 = 0uLL;
  id v2 = [MEMORY[0x1E4F28F80] processInfo];
  id v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }
  else {
    long long v6 = 0uLL;
  }

  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d.%d.%d", v6, 0);
  return v4;
}

- (NSDictionary)callHandlers
{
  return &self->_callHandlers->super;
}

- (MUWebViewFactoryItem)webViewFactoryItem
{
  return self->_webViewFactoryItem;
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (MUWebBridgeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUWebBridgeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webViewFactoryItem, 0);
  objc_storeStrong((id *)&self->_callHandlers, 0);
  objc_storeStrong(&self->_defaultCallbackHandler, 0);
  objc_storeStrong((id *)&self->_pendingCallbackHandlers, 0);
}

@end