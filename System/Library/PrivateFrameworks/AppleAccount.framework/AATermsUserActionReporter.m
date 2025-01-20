@interface AATermsUserActionReporter
- (AATermsUserActionReporter)initWithAccount:(id)a3 parameters:(id)a4;
- (AATermsUserActionReporter)initWithAccount:(id)a3 parameters:(id)a4 remoteServer:(id)a5;
- (id)_authController;
- (void)_createRequestForAccount:(id)a3 requestHandler:(id)a4;
- (void)reportEvent;
@end

@implementation AATermsUserActionReporter

- (AATermsUserActionReporter)initWithAccount:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[AARemoteServer sharedServer];
  v9 = [(AATermsUserActionReporter *)self initWithAccount:v7 parameters:v6 remoteServer:v8];

  return v9;
}

- (AATermsUserActionReporter)initWithAccount:(id)a3 parameters:(id)a4 remoteServer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AATermsUserActionReporter;
  v12 = [(AATermsUserActionReporter *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    uint64_t v14 = [v10 copy];
    requestDictionary = v13->_requestDictionary;
    v13->_requestDictionary = (NSDictionary *)v14;

    v13->_requestCount = 0;
    objc_storeStrong((id *)&v13->_remoteServer, a5);
  }

  return v13;
}

- (void)reportEvent
{
  account = self->_account;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__AATermsUserActionReporter_reportEvent__block_invoke;
  v3[3] = &unk_1E5A49190;
  v3[4] = self;
  [(AATermsUserActionReporter *)self _createRequestForAccount:account requestHandler:v3];
}

void __40__AATermsUserActionReporter_reportEvent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = [AATermsReportUserActionRequest alloc];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = a1 + 32;
    id v7 = [(AATermsReportUserActionRequest *)v4 initWithAccount:*(void *)(v6 + 8) urlRequest:v3 parameters:*(void *)(v6 + 16)];
    v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __40__AATermsUserActionReporter_reportEvent__block_invoke_cold_2(v5, v8, v9);
    }

    ++*(void *)(*(void *)v5 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__AATermsUserActionReporter_reportEvent__block_invoke_26;
    v10[3] = &unk_1E5A4A478;
    v10[4] = *(void *)v5;
    [v7 performRequestWithHandler:v10];
  }
  else
  {
    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __40__AATermsUserActionReporter_reportEvent__block_invoke_cold_1(v7);
    }
  }
}

void __40__AATermsUserActionReporter_reportEvent__block_invoke_26(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __40__AATermsUserActionReporter_reportEvent__block_invoke_26_cold_2(v4, v5);
  }

  uint64_t v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __40__AATermsUserActionReporter_reportEvent__block_invoke_26_cold_1(v4, v6);
  }

  id v7 = [v4 httpResponse];
  uint64_t v8 = [v7 statusCode];

  if (v8 != 200)
  {
    uint64_t v9 = [v4 httpResponse];
    uint64_t v10 = [v9 statusCode];

    if (v10 != 400)
    {
      id v11 = [v4 httpResponse];
      uint64_t v12 = [v11 statusCode];

      if (v12 == 401)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F4EF60]);
        uint64_t v14 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "aa_altDSID");
        [v13 setAltDSID:v14];

        v15 = [*(id *)(*(void *)(a1 + 32) + 8) username];
        [v13 setUsername:v15];

        [v13 setAuthenticationType:1];
        [v13 setIsUsernameEditable:0];
        v16 = [*(id *)(a1 + 32) _authController];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __40__AATermsUserActionReporter_reportEvent__block_invoke_28;
        v19[3] = &unk_1E5A4A450;
        v19[4] = *(void *)(a1 + 32);
        [v16 authenticateWithContext:v13 completion:v19];

LABEL_11:
        goto LABEL_12;
      }
      objc_super v17 = [v4 httpResponse];
      uint64_t v18 = [v17 statusCode];

      if (v18 != 500)
      {
        id v13 = [v4 httpResponse];
        [v13 statusCode];
        goto LABEL_11;
      }
    }
  }
LABEL_12:
}

void __40__AATermsUserActionReporter_reportEvent__block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _AALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __40__AATermsUserActionReporter_reportEvent__block_invoke_28_cold_2();
  }

  if (v6 || (uint64_t v8 = *(void **)(a1 + 32), v8[4] > 2uLL))
  {
    uint64_t v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __40__AATermsUserActionReporter_reportEvent__block_invoke_28_cold_1(v9);
    }
  }
  else
  {
    [v8 reportEvent];
  }
}

- (id)_authController
{
  authController = self->_authController;
  if (!authController)
  {
    id v4 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x1E4F4EF68]);
    id v5 = self->_authController;
    self->_authController = v4;

    authController = self->_authController;
  }

  return authController;
}

- (void)_createRequestForAccount:(id)a3 requestHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  remoteServer = self->_remoteServer;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke;
  v11[3] = &unk_1E5A4A4A0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  [(AARemoteServerProtocol *)remoteServer configurationWithCompletion:v11];
}

void __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke(id *a1, void *a2)
{
  id v3 = [a2 termsReportUserActionURL];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    id v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_cold_1(v4, v5);
    }

    id v6 = [MEMORY[0x1E4F18D50] requestWithURL:v4];
    id v7 = objc_alloc_init(MEMORY[0x1E4F4EF60]);
    uint64_t v8 = objc_msgSend(a1[4], "aida_alternateDSID");
    [v7 setAltDSID:v8];

    id v9 = [a1[5] _authController];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_39;
    v14[3] = &unk_1E5A491E0;
    id v10 = a1[6];
    id v15 = v6;
    id v16 = v10;
    id v11 = v6;
    [v9 getServerUILoadDelegateWithContext:v7 completion:v14];
  }
  else
  {
    id v12 = (void (**)(id, void, void *))a1[6];
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.appleaccount" code:-2 userInfo:0];
    v12[2](v12, 0, v13);
  }
}

void __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_40;
    v9[3] = &unk_1E5A491B8;
    id v10 = v6;
    id v11 = *(id *)(a1 + 40);
    [a2 signRequest:v10 withCompletionHandler:v9];
  }
  else
  {
    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_39_cold_1();
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v5);
    }
  }
}

void __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_40(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) allHTTPHeaderFields];
  id v3 = (void *)[v2 mutableCopy];

  [v3 setValue:@"application/json" forKey:@"Accept"];
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_40_cold_1();
  }

  [*(id *)(a1 + 32) setAllHTTPHeaderFields:v3];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, *(void *)(a1 + 32), 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteServer, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_requestDictionary, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

void __40__AATermsUserActionReporter_reportEvent__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "TermsQFA: AATermsUserActionReporter URL is not available in URL Configuration", v1, 2u);
}

void __40__AATermsUserActionReporter_reportEvent__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  int v4 = 138477827;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_1_4(&dword_1A11D8000, a2, a3, "TermsQFA: Starting AATermsUserActionReporter sending event with parameters %{private}@", (uint8_t *)&v4);
}

void __40__AATermsUserActionReporter_reportEvent__block_invoke_26_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 httpResponse];
  [v3 statusCode];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1A11D8000, a2, v4, "TermsQFA: Response status code = %ld", v5);
}

void __40__AATermsUserActionReporter_reportEvent__block_invoke_26_cold_2(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 statusCode];
  uint64_t v5 = [a1 responseParameters];
  int v6 = 134218243;
  uint64_t v7 = v4;
  __int16 v8 = 2113;
  id v9 = v5;
  _os_log_debug_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_DEBUG, "TermsQFA: AATermsUserActionReporter response %ld %{private}@", (uint8_t *)&v6, 0x16u);
}

void __40__AATermsUserActionReporter_reportEvent__block_invoke_28_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "TermsQFA: AATermsUserActionReporter NOT reporting event. Retry count exceeded.", v1, 2u);
}

void __40__AATermsUserActionReporter_reportEvent__block_invoke_28_cold_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A11D8000, v1, OS_LOG_TYPE_DEBUG, "TermsQFA: AATermsUserActionReporter reporting event after reauth with authResults %{private}@ and error: %@", v2, 0x16u);
}

void __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  __int16 v3 = [a1 absoluteString];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1A11D8000, a2, v4, "TermsQFA: termsReportUserActionURL = %{private}@", v5);
}

void __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_39_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1A11D8000, v0, v1, "TermsQFA: Error obtaining AKAppleIDServerResourceLoadDelegate: %@", v2);
}

void __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_40_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1A11D8000, v0, v1, "TermsQFA: requestHeaders after loadDelegate signed the request: %{private}@", v2);
}

@end