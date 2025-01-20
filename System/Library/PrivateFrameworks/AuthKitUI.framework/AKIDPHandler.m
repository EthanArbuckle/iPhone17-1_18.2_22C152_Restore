@interface AKIDPHandler
- (AKIDPHandler)initWithConfiguration:(id)a3 withCompletionHandler:(id)a4;
- (AKIDPHandlerDelegate)delegate;
- (AKServerRequestConfiguration)configuration;
- (id)_safeACSDictionaryFromResult:(id)a3;
- (id)_samlJavaScriptQuery;
- (id)_sanitizeError:(id)a3;
- (id)completion;
- (void)_completeFlowWithError:(id)a3;
- (void)_completeWithACSPostRequestFromWebView:(id)a3;
- (void)cancel;
- (void)setCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5;
@end

@implementation AKIDPHandler

- (AKIDPHandler)initWithConfiguration:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AKIDPHandler;
  v9 = [(AKIDPHandler *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    uint64_t v11 = MEMORY[0x1C8777520](v8);
    id completion = v10->_completion;
    v10->_id completion = (id)v11;

    v13 = [AKURLRequestApprover alloc];
    v14 = [v7 whitelistedPathURLs];
    uint64_t v15 = [(AKURLRequestApprover *)v13 initWithWhitelistedPaths:v14];
    redirectApprover = v10->_redirectApprover;
    v10->_redirectApprover = (AKURLRequestApprover *)v15;
  }
  return v10;
}

- (void)cancel
{
  objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(AKIDPHandler *)self _completeFlowWithError:v3];
}

- (id)_safeACSDictionaryFromResult:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = (void *)[v3 mutableCopy];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6 = a3;
  v5 = [(AKIDPHandler *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 IDPHandler:self didFinishLoadingPageInWebView:v6];
  }
}

- (id)_samlJavaScriptQuery
{
  v2 = NSString;
  id v3 = [MEMORY[0x1E4F4F0C8] bagForAltDSID:0];
  v4 = [v3 acsURL];
  v5 = v4);

  return v5;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v8 = a4;
  v30 = (void (**)(id, AKURLRequestApprover *))a5;
  redirectApprover = self->_redirectApprover;
  v9 = [v8 request];
  LODWORD(redirectApprover) = [(AKURLRequestApprover *)redirectApprover shouldAllowRequest:v9];

  uint64_t v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AKIDPHandler webView:decidePolicyForNavigationAction:decisionHandler:](v8, v11);
  }

  v12 = [v8 request];
  v13 = [v12 URL];
  v14 = [v13 absoluteString];
  uint64_t v15 = [MEMORY[0x1E4F4F0C8] bagForAltDSID:0];
  v16 = [v15 acsURL];
  v17 = [v16 absoluteString];
  int v18 = [v14 hasPrefix:v17];

  if (!v18)
  {
    redirectApprover = (AKURLRequestApprover *)redirectApprover;
LABEL_11:
    v28 = v31;
    goto LABEL_13;
  }
  v19 = _AKLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v19, OS_LOG_TYPE_DEFAULT, "We reached the acsURL path, canceling the webView and providing the request to idMS", buf, 2u);
  }

  v20 = [v8 request];
  v21 = [v20 HTTPMethod];
  int v22 = [v21 isEqualToString:@"GET"];

  if (v22)
  {
    v23 = [(AKIDPHandler *)self completion];

    if (v23)
    {
      v24 = [(AKIDPHandler *)self completion];
      uint64_t v33 = *MEMORY[0x1E4F4EED8];
      v25 = [v8 request];
      v26 = [v25 URL];
      v34[0] = v26;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      ((void (**)(void, void, void *, void))v24)[2](v24, 0, v27, 0);

      [(AKIDPHandler *)self setCompletion:0];
    }
    redirectApprover = 0;
    goto LABEL_11;
  }
  v28 = v31;
  [(AKIDPHandler *)self _completeWithACSPostRequestFromWebView:v31];
  redirectApprover = 0;
LABEL_13:
  v29 = [(AKIDPHandler *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v29 IDPHandler:self didStartLoadingPageInWebView:v28];
  }
  v30[2](v30, redirectApprover);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
}

- (void)_completeWithACSPostRequestFromWebView:(id)a3
{
  id v4 = a3;
  v5 = [(AKIDPHandler *)self _samlJavaScriptQuery];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__AKIDPHandler__completeWithACSPostRequestFromWebView___block_invoke;
  v6[3] = &unk_1E648FD00;
  v6[4] = self;
  [v4 evaluateJavaScript:v5 completionHandler:v6];
}

void __55__AKIDPHandler__completeWithACSPostRequestFromWebView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __55__AKIDPHandler__completeWithACSPostRequestFromWebView___block_invoke_cold_1();
  }

  id v8 = [*(id *)(a1 + 32) _safeACSDictionaryFromResult:v5];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 objectForKeyedSubscript:@"acs_action"];
    [v9 removeObjectForKey:@"acs_action"];
    uint64_t v11 = objc_msgSend(v9, "aaf_toUrlQueryString");
    v12 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
    v13 = *(void **)(a1 + 32);
    if (v11 && v12)
    {
      v14 = [v13 completion];

      if (v14)
      {
        uint64_t v15 = [*(id *)(a1 + 32) completion];
        uint64_t v16 = *MEMORY[0x1E4F4EED8];
        v18[0] = *MEMORY[0x1E4F4EED0];
        v18[1] = v16;
        v19[0] = v11;
        v19[1] = v12;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
        ((void (**)(void, void, void *, void))v15)[2](v15, 0, v17, 0);

        [*(id *)(a1 + 32) setCompletion:0];
      }
    }
    else
    {
      [v13 _completeFlowWithError:v6];
    }
  }
  else
  {
    [*(id *)(a1 + 32) _completeFlowWithError:v6];
  }
}

- (id)_sanitizeError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AKIDPHandler _sanitizeError:]();
    }

    id v6 = [(AKIDPHandler *)self delegate];
    id v7 = v4;
    if (objc_opt_respondsToSelector())
    {
      id v7 = [v6 IDPHandler:self sanitizeError:v4];
    }
    if ((objc_msgSend(v4, "ak_isAuthenticationErrorWithCode:", objc_msgSend(v4, "code")) & 1) == 0)
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7019);

      id v7 = (void *)v8;
    }
    v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AKIDPHandler _sanitizeError:]();
    }

    id v10 = v7;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_completeFlowWithError:(id)a3
{
  id v7 = a3;
  id v4 = [(AKIDPHandler *)self completion];

  if (v4)
  {
    id v5 = [(AKIDPHandler *)self completion];
    id v6 = [(AKIDPHandler *)self _sanitizeError:v7];
    ((void (**)(void, void, void, void *))v5)[2](v5, 0, 0, v6);

    [(AKIDPHandler *)self setCompletion:0];
  }
}

- (AKServerRequestConfiguration)configuration
{
  return self->_configuration;
}

- (AKIDPHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKIDPHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_redirectApprover, 0);
}

- (void)webView:(void *)a1 decidePolicyForNavigationAction:(NSObject *)a2 decisionHandler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 request];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "Processing IDP URL navigation: %@", v4, 0xCu);
}

void __55__AKIDPHandler__completeWithACSPostRequestFromWebView___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1C38C1000, v1, OS_LOG_TYPE_DEBUG, "Evaluating ACS result: %@, error: %@", v2, 0x16u);
}

- (void)_sanitizeError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_ERROR, "Sanitized IDP error: %@", v1, 0xCu);
}

- (void)_sanitizeError:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_ERROR, "IDP error: %@", v1, 0xCu);
}

@end