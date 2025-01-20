@interface _AKAnisetteProviderProxy
- (AKAnisetteServiceProtocol)anisetteDataProvider;
- (_AKAnisetteProviderProxy)initWithProvider:(id)a3;
- (void)eraseAnisetteForContext:(id)a3 withCompletion:(id)a4;
- (void)fetchAnisetteDataForContext:(id)a3 provisionIfNecessary:(BOOL)a4 withCompletion:(id)a5;
- (void)fetchPeerAttestationDataForContext:(id)a3 withRequest:(id)a4 completion:(id)a5;
- (void)legacyAnisetteDataForContext:(id)a3 DSID:(id)a4 withCompletion:(id)a5;
- (void)provisionAnisetteForContext:(id)a3 withCompletion:(id)a4;
- (void)setAnisetteDataProvider:(id)a3;
- (void)syncAnisetteForContext:(id)a3 withSIMData:(id)a4 completion:(id)a5;
@end

@implementation _AKAnisetteProviderProxy

- (_AKAnisetteProviderProxy)initWithProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AKAnisetteProviderProxy;
  v6 = [(_AKAnisetteProviderProxy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_anisetteDataProvider, a3);
  }

  return v7;
}

- (void)provisionAnisetteForContext:(id)a3 withCompletion:(id)a4
{
  id v5 = (void (**)(id, void, void *))a4;
  v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_AKAnisetteProviderProxy provisionAnisetteForContext:withCompletion:]();
  }

  anisetteDataProvider = self->_anisetteDataProvider;
  if (anisetteDataProvider)
  {
    [(AKAnisetteServiceProtocol *)anisetteDataProvider provisionAnisetteWithCompletion:v5];
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7060);
    v5[2](v5, 0, v8);
  }
}

- (void)syncAnisetteForContext:(id)a3 withSIMData:(id)a4 completion:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(id, void, void *))a5;
  objc_super v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[_AKAnisetteProviderProxy syncAnisetteForContext:withSIMData:completion:]();
  }

  anisetteDataProvider = self->_anisetteDataProvider;
  if (anisetteDataProvider)
  {
    [(AKAnisetteServiceProtocol *)anisetteDataProvider syncAnisetteWithSIMData:v7 completion:v8];
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7060);
    v8[2](v8, 0, v11);
  }
}

- (void)eraseAnisetteForContext:(id)a3 withCompletion:(id)a4
{
  id v5 = (void (**)(id, void, void *))a4;
  v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_AKAnisetteProviderProxy eraseAnisetteForContext:withCompletion:]();
  }

  anisetteDataProvider = self->_anisetteDataProvider;
  if (anisetteDataProvider)
  {
    [(AKAnisetteServiceProtocol *)anisetteDataProvider eraseAnisetteWithCompletion:v5];
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7060);
    v5[2](v5, 0, v8);
  }
}

- (void)fetchAnisetteDataForContext:(id)a3 provisionIfNecessary:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  id v7 = (void (**)(id, void, void *))a5;
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_AKAnisetteProviderProxy fetchAnisetteDataForContext:provisionIfNecessary:withCompletion:]();
  }

  anisetteDataProvider = self->_anisetteDataProvider;
  if (anisetteDataProvider)
  {
    [(AKAnisetteServiceProtocol *)anisetteDataProvider fetchAnisetteDataAndProvisionIfNecessary:v5 withCompletion:v7];
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7060);
    v7[2](v7, 0, v10);
  }
}

- (void)legacyAnisetteDataForContext:(id)a3 DSID:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(id, void, void *))a5;
  objc_super v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[_AKAnisetteProviderProxy legacyAnisetteDataForContext:DSID:withCompletion:]();
  }

  anisetteDataProvider = self->_anisetteDataProvider;
  if (anisetteDataProvider)
  {
    [(AKAnisetteServiceProtocol *)anisetteDataProvider legacyAnisetteDataForDSID:v7 withCompletion:v8];
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7060);
    v8[2](v8, 0, v11);
  }
}

- (void)fetchPeerAttestationDataForContext:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = (void (**)(id, void, uint64_t))a5;
  objc_super v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[_AKAnisetteProviderProxy fetchPeerAttestationDataForContext:withRequest:completion:]();
  }

  v10 = self->_anisetteDataProvider;
  if (!v10)
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7060);
LABEL_12:
    v15 = (void *)v14;
    v8[2](v8, 0, v14);

    goto LABEL_13;
  }
  char v11 = objc_opt_respondsToSelector();
  v12 = _AKLogSystem();
  v13 = v12;
  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412802;
      v17 = self;
      __int16 v18 = 2112;
      v19 = v10;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_error_impl(&dword_193494000, v13, OS_LOG_TYPE_ERROR, "%@: Unable to call anisette data provider (%@) to fetch peer attestation data for request (%@) because it does not implement 'fetchPeerAttestationDataForRequest:completion:'", (uint8_t *)&v16, 0x20u);
    }

    uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAnisetteError" code:-8009 userInfo:0];
    goto LABEL_12;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412802;
    v17 = self;
    __int16 v18 = 2112;
    v19 = v10;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "%@: Calling anisette data provider (%@) to fetch peer attestation data for request (%@)", (uint8_t *)&v16, 0x20u);
  }

  [(AKAnisetteServiceProtocol *)v10 fetchPeerAttestationDataForRequest:v7 completion:v8];
LABEL_13:
}

- (AKAnisetteServiceProtocol)anisetteDataProvider
{
  return self->_anisetteDataProvider;
}

- (void)setAnisetteDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)provisionAnisetteForContext:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

- (void)syncAnisetteForContext:withSIMData:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

- (void)eraseAnisetteForContext:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

- (void)fetchAnisetteDataForContext:provisionIfNecessary:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

- (void)legacyAnisetteDataForContext:DSID:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

- (void)fetchPeerAttestationDataForContext:withRequest:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

@end