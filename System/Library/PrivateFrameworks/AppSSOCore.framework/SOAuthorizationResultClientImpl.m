@interface SOAuthorizationResultClientImpl
- (id)authorizationHandleCredentialCompletion;
- (id)authorizationHandleResponseCompletion;
- (void)authorization:(id)a3 didCompleteWithError:(id)a4;
- (void)authorization:(id)a3 didCompleteWithHTTPAuthorizationHeaders:(id)a4;
- (void)authorization:(id)a3 didCompleteWithHTTPResponse:(id)a4 httpBody:(id)a5;
- (void)authorizationDidCancel:(id)a3;
- (void)authorizationDidComplete:(id)a3;
- (void)authorizationDidNotHandle:(id)a3;
- (void)setAuthorizationHandleCredentialCompletion:(id)a3;
- (void)setAuthorizationHandleResponseCompletion:(id)a3;
@end

@implementation SOAuthorizationResultClientImpl

- (void)authorizationDidNotHandle:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SO_LOG_SOClientImpl();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[SOAuthorizationResultClientImpl authorizationDidNotHandle:]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_1D7206000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = +[SOErrorHelper errorWithCode:-5];
  [(SOAuthorizationResultClientImpl *)self authorization:v4 didCompleteWithError:v6];
}

- (void)authorizationDidCancel:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SO_LOG_SOClientImpl();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[SOAuthorizationResultClientImpl authorizationDidCancel:]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_1D7206000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = +[SOErrorHelper errorWithCode:-2];
  [(SOAuthorizationResultClientImpl *)self authorization:v4 didCompleteWithError:v6];
}

- (void)authorizationDidComplete:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SO_LOG_SOClientImpl();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[SOAuthorizationResultClientImpl authorizationDidComplete:]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_1D7206000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = +[SOErrorHelper errorWithCode:-3];
  [(SOAuthorizationResultClientImpl *)self authorization:v4 didCompleteWithError:v6];
}

- (void)authorization:(id)a3 didCompleteWithError:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = SO_LOG_SOClientImpl();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    v14 = "-[SOAuthorizationResultClientImpl authorization:didCompleteWithError:]";
    __int16 v15 = 2114;
    id v16 = v7;
    __int16 v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_1D7206000, v8, OS_LOG_TYPE_DEFAULT, "%s error=%{public}@ on %@", (uint8_t *)&v13, 0x20u);
  }

  __int16 v9 = [(SOAuthorizationResultClientImpl *)self authorizationHandleCredentialCompletion];

  if (v9)
  {
    v10 = [(SOAuthorizationResultClientImpl *)self authorizationHandleCredentialCompletion];
    ((void (**)(void, void, id))v10)[2](v10, 0, v7);

    [(SOAuthorizationResultClientImpl *)self setAuthorizationHandleCredentialCompletion:0];
  }
  else
  {
    uint64_t v11 = [(SOAuthorizationResultClientImpl *)self authorizationHandleResponseCompletion];

    if (v11)
    {
      v12 = [(SOAuthorizationResultClientImpl *)self authorizationHandleResponseCompletion];
      ((void (**)(void, void, void, id))v12)[2](v12, 0, 0, v7);

      [(SOAuthorizationResultClientImpl *)self setAuthorizationHandleResponseCompletion:0];
    }
  }
  [(id)_authorizationPool removeAuthorization:v6];
}

- (void)authorization:(id)a3 didCompleteWithHTTPResponse:(id)a4 httpBody:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = SO_LOG_SOClientImpl();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136316419;
    v18 = "-[SOAuthorizationResultClientImpl authorization:didCompleteWithHTTPResponse:httpBody:]";
    __int16 v19 = 2160;
    uint64_t v20 = 1752392040;
    __int16 v21 = 2117;
    id v22 = v9;
    __int16 v23 = 2160;
    uint64_t v24 = 1752392040;
    __int16 v25 = 2117;
    id v26 = v10;
    __int16 v27 = 2112;
    v28 = self;
    _os_log_impl(&dword_1D7206000, v11, OS_LOG_TYPE_DEFAULT, "%s httpResponse = %{sensitive, mask.hash}@, httpBody = %{sensitive, mask.hash}@ on %@", (uint8_t *)&v17, 0x3Eu);
  }

  v12 = [(SOAuthorizationResultClientImpl *)self authorizationHandleCredentialCompletion];

  if (v12)
  {
    int v13 = SO_LOG_SOClientImpl();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SOAuthorizationResultClientImpl authorization:didCompleteWithHTTPResponse:httpBody:]();
    }

    v14 = [(SOAuthorizationResultClientImpl *)self authorizationHandleCredentialCompletion];
    v14[2](v14, 0, _unexpectedResponseError);

    [(SOAuthorizationResultClientImpl *)self setAuthorizationHandleCredentialCompletion:0];
  }
  else
  {
    __int16 v15 = [(SOAuthorizationResultClientImpl *)self authorizationHandleResponseCompletion];

    if (v15)
    {
      id v16 = [(SOAuthorizationResultClientImpl *)self authorizationHandleResponseCompletion];
      ((void (**)(void, uint64_t, id, void))v16)[2](v16, [v9 _CFURLResponse], v10, 0);

      [(SOAuthorizationResultClientImpl *)self setAuthorizationHandleResponseCompletion:0];
    }
  }
  [(id)_authorizationPool removeAuthorization:v8];
}

- (void)authorization:(id)a3 didCompleteWithHTTPAuthorizationHeaders:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = SO_LOG_SOClientImpl();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315907;
    __int16 v15 = "-[SOAuthorizationResultClientImpl authorization:didCompleteWithHTTPAuthorizationHeaders:]";
    __int16 v16 = 2160;
    uint64_t v17 = 1752392040;
    __int16 v18 = 2117;
    id v19 = v7;
    __int16 v20 = 2112;
    __int16 v21 = self;
    _os_log_impl(&dword_1D7206000, v8, OS_LOG_TYPE_DEFAULT, "%s httpAuthorizationHeaders = %{sensitive, mask.hash}@ on %@", (uint8_t *)&v14, 0x2Au);
  }

  id v9 = [(SOAuthorizationResultClientImpl *)self authorizationHandleCredentialCompletion];

  if (v9)
  {
    id v10 = [(SOAuthorizationResultClientImpl *)self authorizationHandleCredentialCompletion];
    ((void (**)(void, id, void))v10)[2](v10, v7, 0);

    [(SOAuthorizationResultClientImpl *)self setAuthorizationHandleCredentialCompletion:0];
  }
  else
  {
    uint64_t v11 = [(SOAuthorizationResultClientImpl *)self authorizationHandleResponseCompletion];

    if (v11)
    {
      v12 = SO_LOG_SOClientImpl();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SOAuthorizationResultClientImpl authorization:didCompleteWithHTTPResponse:httpBody:]();
      }

      int v13 = [(SOAuthorizationResultClientImpl *)self authorizationHandleResponseCompletion];
      v13[2](v13, 0, 0, _unexpectedResponseError);

      [(SOAuthorizationResultClientImpl *)self setAuthorizationHandleResponseCompletion:0];
    }
  }
  [(id)_authorizationPool removeAuthorization:v6];
}

- (id)authorizationHandleResponseCompletion
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setAuthorizationHandleResponseCompletion:(id)a3
{
}

- (id)authorizationHandleCredentialCompletion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setAuthorizationHandleCredentialCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authorizationHandleCredentialCompletion, 0);
  objc_storeStrong(&self->_authorizationHandleResponseCompletion, 0);
}

- (void)authorization:didCompleteWithHTTPResponse:httpBody:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(&dword_1D7206000, v0, OS_LOG_TYPE_ERROR, "unexpected response from the extension - check type of the extension (redirect/credential)", v1, 2u);
}

@end