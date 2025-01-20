@interface AKAppleIDServerUIContextController
- (AKAppleIDServerResourceLoadDelegate)serverUIDelegate;
- (AKAppleIDServerUIContextController)initWithRequestConfiguration:(id)a3 completion:(id)a4;
- (AKAppleIDServerUIDataHarvester)serverDataHarvester;
- (BOOL)handleAuthKitActionAttribute:(id)a3;
- (NSURL)initiatingURL;
- (id)_headerValueFromType:(unint64_t)a3;
- (void)_completeWithResponse:(id)a3 additionalData:(id)a4 error:(id)a5;
- (void)completeWithError:(id)a3;
- (void)completeWithError:(id)a3 additionalData:(id)a4;
- (void)completeWithFinalResponse:(id)a3;
- (void)processResponse:(id)a3;
- (void)signRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)tearDownContext;
@end

@implementation AKAppleIDServerUIContextController

- (void)tearDownContext
{
  id serverUICompletion = self->_serverUICompletion;
  self->_id serverUICompletion = 0;

  initiatingURL = self->_initiatingURL;
  self->_initiatingURL = 0;
}

- (AKAppleIDServerUIContextController)initWithRequestConfiguration:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(AKAppleIDServerUIContextController *)self init];
  if (v9)
  {
    uint64_t v10 = [v7 resourceLoadDelegate];
    serverUIDelegate = v9->_serverUIDelegate;
    v9->_serverUIDelegate = (AKAppleIDServerResourceLoadDelegate *)v10;

    uint64_t v12 = MEMORY[0x1C8777520](v8);
    id serverUICompletion = v9->_serverUICompletion;
    v9->_id serverUICompletion = (id)v12;

    v14 = [v7 request];
    uint64_t v15 = [v14 URL];
    initiatingURL = v9->_initiatingURL;
    v9->_initiatingURL = (NSURL *)v15;

    objc_storeStrong((id *)&v9->_configuration, a3);
    uint64_t v17 = objc_opt_new();
    serverDataHarvester = v9->_serverDataHarvester;
    v9->_serverDataHarvester = (AKAppleIDServerUIDataHarvester *)v17;
  }
  return v9;
}

- (BOOL)handleAuthKitActionAttribute:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "Detected BuddyML button tap with %@ action", (uint8_t *)&v11, 0xCu);
    }
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F4ED30]])
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = -7038;
LABEL_9:
    id v8 = objc_msgSend(v6, "ak_errorWithCode:", v7);
    [(AKAppleIDServerUIContextController *)self completeWithError:v8];

    goto LABEL_10;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F4ED20]])
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = -7003;
    goto LABEL_9;
  }
  if (![v4 isEqualToString:*MEMORY[0x1E4F4ED28]])
  {
    BOOL v9 = 0;
    goto LABEL_11;
  }
  [(AKAppleIDServerUIContextController *)self completeWithFinalResponse:self->_latestReadResponse];
LABEL_10:
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (void)signRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AKServerRequestConfiguration *)self->_configuration presentationType])
  {
    id v8 = [v6 URL];
    int v9 = [v8 isEqual:self->_initiatingURL];

    if (v9)
    {
      uint64_t v10 = [(AKAppleIDServerUIContextController *)self _headerValueFromType:[(AKServerRequestConfiguration *)self->_configuration presentationType]];
      int v11 = _AKLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[AKAppleIDServerUIContextController signRequest:withCompletionHandler:]((uint64_t)v10, v11);
      }

      if (v10) {
        [v6 setValue:v10 forHTTPHeaderField:@"X-Apple-ServerUI-Action"];
      }
    }
  }
  [(AKAppleIDServerResourceLoadDelegate *)self->_serverUIDelegate signRequest:v6 withCompletionHandler:v7];
}

- (id)_headerValueFromType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0;
  }
  else {
    return off_1E648F1E0[a3 - 1];
  }
}

- (void)processResponse:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1C38C1000, v6, OS_LOG_TYPE_DEFAULT, "Processing a server UI response: %@", (uint8_t *)&v8, 0xCu);
  }

  if ([MEMORY[0x1E4F4EF70] signalFromServerResponse:v5] == 6) {
    objc_storeStrong((id *)&self->_latestReadResponse, a3);
  }
  if (v5)
  {
    id v7 = [(AKAppleIDServerUIContextController *)self serverDataHarvester];
    [v7 harvestDataFromServerHTTPResponse:v5];

    [(AKAppleIDServerResourceLoadDelegate *)self->_serverUIDelegate processResponse:v5];
  }
}

- (void)completeWithError:(id)a3
{
}

- (void)completeWithError:(id)a3 additionalData:(id)a4
{
}

- (void)completeWithFinalResponse:(id)a3
{
  id v4 = a3;
  id v6 = [(AKAppleIDServerUIContextController *)self serverDataHarvester];
  id v5 = [v6 harvestedData];
  [(AKAppleIDServerUIContextController *)self _completeWithResponse:v4 additionalData:v5 error:0];
}

- (void)_completeWithResponse:(id)a3 additionalData:(id)a4 error:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = v10;
  if (self->_serverUICompletion)
  {
    if (v8)
    {
      id v12 = _AKLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        id v19 = v8;
        _os_log_impl(&dword_1C38C1000, v12, OS_LOG_TYPE_DEFAULT, "Completed server UI request with final response: %@", (uint8_t *)&v18, 0xCu);
      }

      uint64_t v13 = _AKLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [v8 allHeaderFields];
        int v18 = 138412290;
        id v19 = v14;
        _os_log_impl(&dword_1C38C1000, v13, OS_LOG_TYPE_DEFAULT, "Final response headers: %@", (uint8_t *)&v18, 0xCu);
      }
    }
    else
    {
      if (!v10)
      {
LABEL_13:
        id serverUICompletion = (void (**)(id, id, id, void *))self->_serverUICompletion;
        uint64_t v17 = objc_msgSend(v11, "ac_secureCodingError");
        serverUICompletion[2](serverUICompletion, v8, v9, v17);

        uint64_t v15 = self->_serverUICompletion;
        self->_id serverUICompletion = 0;
        goto LABEL_14;
      }
      uint64_t v13 = _AKLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[AKAppleIDServerUIContextController _completeWithResponse:additionalData:error:]((uint64_t)v11, v13);
      }
    }

    goto LABEL_13;
  }
  uint64_t v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[AKAppleIDServerUIContextController _completeWithResponse:additionalData:error:](v15);
  }
LABEL_14:
}

- (AKAppleIDServerResourceLoadDelegate)serverUIDelegate
{
  return self->_serverUIDelegate;
}

- (AKAppleIDServerUIDataHarvester)serverDataHarvester
{
  return self->_serverDataHarvester;
}

- (NSURL)initiatingURL
{
  return self->_initiatingURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatingURL, 0);
  objc_storeStrong((id *)&self->_serverDataHarvester, 0);
  objc_storeStrong((id *)&self->_serverUIDelegate, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_latestReadResponse, 0);

  objc_storeStrong(&self->_serverUICompletion, 0);
}

- (void)signRequest:(uint64_t)a1 withCompletionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "Signing request with presentation action: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_completeWithResponse:(os_log_t)log additionalData:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C38C1000, log, OS_LOG_TYPE_ERROR, "We're done with the server UI flow client-side, but there's no completion block to call!", v1, 2u);
}

- (void)_completeWithResponse:(uint64_t)a1 additionalData:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_ERROR, "Completed server UI request with error: %@", (uint8_t *)&v2, 0xCu);
}

@end