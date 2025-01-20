@interface SOClient
+ (id)_queue;
- (SOClient)init;
- (SOServiceConnection)serviceConnection;
- (void)beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4;
- (void)cancelAuthorization:(id)a3 completion:(id)a4;
- (void)configurationWithCompletion:(id)a3;
- (void)debugHintsWithCompletion:(id)a3;
- (void)finishAuthorization:(id)a3 completion:(id)a4;
- (void)getAuthorizationHintsWithURL:(id)a3 responseCode:(int64_t)a4 completion:(id)a5;
- (void)isConfigurationActiveForExtensionIdentifier:(id)a3 completion:(id)a4;
- (void)isExtensionProcessWithAuditToken:(id *)a3 completion:(id)a4;
- (void)performAuthorizationWithRequestParameters:(id)a3 completion:(id)a4;
- (void)profilesWithExtensionBundleIdentifier:(id)a3 completion:(id)a4;
- (void)realmsWithCompletion:(id)a3;
- (void)setServiceConnection:(id)a3;
@end

@implementation SOClient

uint64_t __18__SOClient__queue__block_invoke()
{
  _queue_queue = (uint64_t)dispatch_queue_create("com.apple.AppSSO.client-queue", 0);
  return MEMORY[0x1F41817F8]();
}

- (SOClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)SOClient;
  v2 = [(SOClient *)&v8 init];
  if (v2)
  {
    v3 = [SOServiceConnection alloc];
    v4 = +[SOClient _queue];
    uint64_t v5 = [(SOServiceConnection *)v3 initWithQueue:v4];
    serviceConnection = v2->_serviceConnection;
    v2->_serviceConnection = (SOServiceConnection *)v5;
  }
  return v2;
}

+ (id)_queue
{
  if (_queue_onceToken != -1) {
    dispatch_once(&_queue_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)_queue_queue;
  return v2;
}

- (void)configurationWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOClient();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOClient configurationWithCompletion:]";
    __int16 v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_1D7206000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  serviceConnection = self->_serviceConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__SOClient_configurationWithCompletion___block_invoke;
  v8[3] = &unk_1E6A6EF10;
  id v9 = v4;
  id v7 = v4;
  [(SOServiceConnection *)serviceConnection configurationWithCompletion:v8];
}

void __40__SOClient_configurationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = SO_LOG_SOClient();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = @"YES";
    if (!v5) {
      objc_super v8 = @"NO";
    }
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1D7206000, v7, OS_LOG_TYPE_DEFAULT, "configurationWithCompletion: success = %{public}@, error = %{public}@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (void)getAuthorizationHintsWithURL:(id)a3 responseCode:(int64_t)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = SO_LOG_SOClient();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316163;
    v16 = "-[SOClient getAuthorizationHintsWithURL:responseCode:completion:]";
    __int16 v17 = 2160;
    uint64_t v18 = 1752392040;
    __int16 v19 = 2117;
    id v20 = v8;
    __int16 v21 = 1024;
    int v22 = a4;
    __int16 v23 = 2112;
    v24 = self;
    _os_log_impl(&dword_1D7206000, v10, OS_LOG_TYPE_DEFAULT, "%s url: %{sensitive, mask.hash}@, responseCode: %d on %@", buf, 0x30u);
  }

  serviceConnection = self->_serviceConnection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__SOClient_getAuthorizationHintsWithURL_responseCode_completion___block_invoke;
  v13[3] = &unk_1E6A6EE70;
  id v14 = v9;
  id v12 = v9;
  [(SOServiceConnection *)serviceConnection getAuthorizationHintsWithURL:v8 responseCode:a4 completion:v13];
}

void __65__SOClient_getAuthorizationHintsWithURL_responseCode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = SO_LOG_SOClient();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_1D7206000, v7, OS_LOG_TYPE_DEFAULT, "SOClient authorization hints: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)performAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SO_LOG_SOClient();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[SOClient performAuthorizationWithRequestParameters:completion:]";
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = self;
    _os_log_impl(&dword_1D7206000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", buf, 0x20u);
  }

  serviceConnection = self->_serviceConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__SOClient_performAuthorizationWithRequestParameters_completion___block_invoke;
  v11[3] = &unk_1E6A6EE98;
  id v12 = v7;
  id v10 = v7;
  [(SOServiceConnection *)serviceConnection performAuthorizationWithRequestParameters:v6 completion:v11];
}

void __65__SOClient_performAuthorizationWithRequestParameters_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = SO_LOG_SOClient();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138478083;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_1D7206000, v7, OS_LOG_TYPE_DEFAULT, "SOClient credential: %{private}@, error: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SO_LOG_SOClient();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[SOClient beginAuthorizationWithRequestParameters:completion:]";
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = self;
    _os_log_impl(&dword_1D7206000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", buf, 0x20u);
  }

  serviceConnection = self->_serviceConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__SOClient_beginAuthorizationWithRequestParameters_completion___block_invoke;
  v11[3] = &unk_1E6A6EEC0;
  id v12 = v7;
  id v10 = v7;
  [(SOServiceConnection *)serviceConnection beginAuthorizationWithRequestParameters:v6 completion:v11];
}

void __63__SOClient_beginAuthorizationWithRequestParameters_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = SO_LOG_SOClient();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543874;
    id v13 = v7;
    __int16 v14 = 2114;
    id v15 = v8;
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_impl(&dword_1D7206000, v10, OS_LOG_TYPE_DEFAULT, "SOClient extension id: %{public}@, endpoint: %{public}@, error: %{public}@", (uint8_t *)&v12, 0x20u);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id, id, id))(v11 + 16))(v11, v7, v8, v9);
  }
}

- (void)cancelAuthorization:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = SO_LOG_SOClient();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v14 = "-[SOClient cancelAuthorization:completion:]";
    __int16 v15 = 2112;
    __int16 v16 = self;
    _os_log_impl(&dword_1D7206000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  serviceConnection = self->_serviceConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__SOClient_cancelAuthorization_completion___block_invoke;
  v11[3] = &unk_1E6A6EEE8;
  id v12 = v6;
  id v10 = v6;
  [(SOServiceConnection *)serviceConnection cancelAuthorization:v7 completion:v11];
}

void __43__SOClient_cancelAuthorization_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = SO_LOG_SOClient();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_1D7206000, v6, OS_LOG_TYPE_DEFAULT, "cancelAuthorizationWithCompletion: success = %{public}@, error = %{public}@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)realmsWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SO_LOG_SOClient();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[SOClient realmsWithCompletion:]";
    __int16 v12 = 2112;
    uint64_t v13 = self;
    _os_log_impl(&dword_1D7206000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  serviceConnection = self->_serviceConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__SOClient_realmsWithCompletion___block_invoke;
  v8[3] = &unk_1E6A6EF38;
  id v9 = v4;
  id v7 = v4;
  [(SOServiceConnection *)serviceConnection realmsWithCompletion:v8];
}

void __33__SOClient_realmsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = SO_LOG_SOClient();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_1D7206000, v7, OS_LOG_TYPE_DEFAULT, "realmsWithCompletion: realms = %{public}@, error = %{public}@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)debugHintsWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SO_LOG_SOClient();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[SOClient debugHintsWithCompletion:]";
    __int16 v12 = 2112;
    uint64_t v13 = self;
    _os_log_impl(&dword_1D7206000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  serviceConnection = self->_serviceConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__SOClient_debugHintsWithCompletion___block_invoke;
  v8[3] = &unk_1E6A6EF60;
  id v9 = v4;
  id v7 = v4;
  [(SOServiceConnection *)serviceConnection debugHintsWithCompletion:v8];
}

void __37__SOClient_debugHintsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = SO_LOG_SOClient();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_1D7206000, v7, OS_LOG_TYPE_DEFAULT, "debugHintsWithCompletion: hints = %@, error = %{public}@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)finishAuthorization:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = SO_LOG_SOClient();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "-[SOClient finishAuthorization:completion:]";
    __int16 v15 = 2112;
    __int16 v16 = self;
    _os_log_impl(&dword_1D7206000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  serviceConnection = self->_serviceConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__SOClient_finishAuthorization_completion___block_invoke;
  v11[3] = &unk_1E6A6EEE8;
  id v12 = v6;
  id v10 = v6;
  [(SOServiceConnection *)serviceConnection finishAuthorization:v7 completion:v11];
}

void __43__SOClient_finishAuthorization_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = SO_LOG_SOClient();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_1D7206000, v6, OS_LOG_TYPE_DEFAULT, "finishAuthorizationWithCompletion: success = %d, error = %{public}@", (uint8_t *)v8, 0x12u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)isExtensionProcessWithAuditToken:(id *)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = SO_LOG_SOClient();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SOClient isExtensionProcessWithAuditToken:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_1D7206000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  serviceConnection = self->_serviceConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__SOClient_isExtensionProcessWithAuditToken_completion___block_invoke;
  v11[3] = &unk_1E6A6EEE8;
  id v12 = v6;
  long long v9 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v9;
  id v10 = v6;
  [(SOServiceConnection *)serviceConnection isExtensionProcessWithAuditToken:buf completion:v11];
}

uint64_t __56__SOClient_isExtensionProcessWithAuditToken_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)profilesWithExtensionBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SO_LOG_SOClient();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "-[SOClient profilesWithExtensionBundleIdentifier:completion:]";
    __int16 v17 = 2112;
    uint64_t v18 = self;
    _os_log_impl(&dword_1D7206000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  serviceConnection = self->_serviceConnection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__SOClient_profilesWithExtensionBundleIdentifier_completion___block_invoke;
  v12[3] = &unk_1E6A6EF88;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SOServiceConnection *)serviceConnection profilesWithExtensionBundleIdentifier:v11 completion:v12];
}

void __61__SOClient_profilesWithExtensionBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = SO_LOG_SOClient();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138543874;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    id v13 = v5;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_1D7206000, v7, OS_LOG_TYPE_DEFAULT, "profilesWithExtensionBundleIdentifier: extension = %{public}@, profiles = %{public}@, error = %{public}@", (uint8_t *)&v10, 0x20u);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (void)isConfigurationActiveForExtensionIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SO_LOG_SOClient();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[SOClient isConfigurationActiveForExtensionIdentifier:completion:]";
    __int16 v17 = 2112;
    uint64_t v18 = self;
    _os_log_impl(&dword_1D7206000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  serviceConnection = self->_serviceConnection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__SOClient_isConfigurationActiveForExtensionIdentifier_completion___block_invoke;
  v12[3] = &unk_1E6A6EFB0;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SOServiceConnection *)serviceConnection isConfigurationActiveForExtensionIdentifier:v11 completion:v12];
}

void __67__SOClient_isConfigurationActiveForExtensionIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = SO_LOG_SOClient();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v8;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_1D7206000, v6, OS_LOG_TYPE_DEFAULT, "isConfigurationActiveForExtensionIdentifier: extension = %{public}@, ready = %{public}@, error = %{public}@", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
}

- (SOServiceConnection)serviceConnection
{
  return (SOServiceConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setServiceConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end