@interface FAEnableScreenTimeSettingsRequest
- (FAEnableScreenTimeSettingsRequest)initWithFamilyMemberDSID:(id)a3 screentimeModelCache:(id)a4;
- (FAScreentimeSettingsObjectCache)screentimeModelCache;
- (NSNumber)memberDSID;
- (id)enableSettings:(id *)a3;
- (void)startRequestWithCompletionHandler:(id)a3;
@end

@implementation FAEnableScreenTimeSettingsRequest

- (FAEnableScreenTimeSettingsRequest)initWithFamilyMemberDSID:(id)a3 screentimeModelCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FAEnableScreenTimeSettingsRequest;
  v9 = [(FAFamilyCircleRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memberDSID, a3);
    objc_storeStrong((id *)&v10->_screentimeModelCache, a4);
  }

  return v10;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__FAEnableScreenTimeSettingsRequest_startRequestWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E6924B90;
  id v12 = v4;
  id v5 = v4;
  v6 = [(FAFamilyCircleRequest *)self serviceRemoteObjectWithErrorHandler:v11];
  id v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[FAEnableScreenTimeSettingsRequest startRequestWithCompletionHandler:](v7);
  }

  id v8 = [(FAEnableScreenTimeSettingsRequest *)self memberDSID];
  v9 = [(FAEnableScreenTimeSettingsRequest *)self screentimeModelCache];
  v10 = [(FAFamilyCircleRequest *)self requestOptions];
  [v6 enableSettingsForMemberDSID:v8 screentimeModelCache:v9 options:v10 replyBlock:v5];
}

void __71__FAEnableScreenTimeSettingsRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[FAEnableScreenTimeSettingsRequest startRequestWithCompletionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1D252C000, v4, OS_LOG_TYPE_DEFAULT, "%s: Error from service - %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)enableSettings:(id *)a3
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  id v24 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__FAEnableScreenTimeSettingsRequest_enableSettings___block_invoke;
  v12[3] = &unk_1E69257C0;
  v12[4] = &v19;
  int v5 = [(FAFamilyCircleRequest *)self synchronousRemoteObjectWithErrorHandler:v12];
  v6 = [(FAEnableScreenTimeSettingsRequest *)self memberDSID];
  __int16 v7 = [(FAEnableScreenTimeSettingsRequest *)self screentimeModelCache];
  id v8 = [(FAFamilyCircleRequest *)self requestOptions];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__FAEnableScreenTimeSettingsRequest_enableSettings___block_invoke_2;
  v11[3] = &unk_1E69257E8;
  void v11[4] = &v13;
  v11[5] = &v19;
  [v5 enableSettingsForMemberDSID:v6 screentimeModelCache:v7 options:v8 replyBlock:v11];

  if (a3) {
    *a3 = (id) v20[5];
  }
  id v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __52__FAEnableScreenTimeSettingsRequest_enableSettings___block_invoke(uint64_t a1, void *a2)
{
}

void __52__FAEnableScreenTimeSettingsRequest_enableSettings___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (NSNumber)memberDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (FAScreentimeSettingsObjectCache)screentimeModelCache
{
  return (FAScreentimeSettingsObjectCache *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screentimeModelCache, 0);
  objc_storeStrong((id *)&self->_memberDSID, 0);
}

- (void)startRequestWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D252C000, log, OS_LOG_TYPE_DEBUG, "Starting ScreenTime enablement request", v1, 2u);
}

@end