@interface FAFetchScreenTimeSettingsCacheRequest
- (FAFetchScreenTimeSettingsCacheRequest)initWithFamilyMemberDSID:(id)a3;
- (NSNumber)memberDSID;
- (id)enableSettings:(id *)a3;
- (void)startRequestWithCompletionHandler:(id)a3;
@end

@implementation FAFetchScreenTimeSettingsCacheRequest

- (FAFetchScreenTimeSettingsCacheRequest)initWithFamilyMemberDSID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAFetchScreenTimeSettingsCacheRequest;
  v6 = [(FAFamilyCircleRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_memberDSID, a3);
  }

  return v7;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__FAFetchScreenTimeSettingsCacheRequest_startRequestWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E6924B90;
  id v10 = v4;
  id v5 = v4;
  v6 = [(FAFamilyCircleRequest *)self serviceRemoteObjectWithErrorHandler:v9];
  v7 = [(FAFetchScreenTimeSettingsCacheRequest *)self memberDSID];
  v8 = [(FAFamilyCircleRequest *)self requestOptions];
  [v6 enableSettingsForMemberDSID:v7 options:v8 replyBlock:v5];
}

void __75__FAFetchScreenTimeSettingsCacheRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[FAFetchScreenTimeSettingsCacheRequest startRequestWithCompletionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1D252C000, v4, OS_LOG_TYPE_DEFAULT, "%s: Error from service - %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)enableSettings:(id *)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__FAFetchScreenTimeSettingsCacheRequest_enableSettings___block_invoke;
  v11[3] = &unk_1E69257C0;
  v11[4] = &v18;
  int v5 = [(FAFamilyCircleRequest *)self synchronousRemoteObjectWithErrorHandler:v11];
  v6 = [(FAFetchScreenTimeSettingsCacheRequest *)self memberDSID];
  __int16 v7 = [(FAFamilyCircleRequest *)self requestOptions];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__FAFetchScreenTimeSettingsCacheRequest_enableSettings___block_invoke_2;
  v10[3] = &unk_1E69257E8;
  v10[4] = &v12;
  v10[5] = &v18;
  [v5 enableSettingsForMemberDSID:v6 options:v7 replyBlock:v10];

  if (a3) {
    *a3 = (id) v19[5];
  }
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __56__FAFetchScreenTimeSettingsCacheRequest_enableSettings___block_invoke(uint64_t a1, void *a2)
{
}

void __56__FAFetchScreenTimeSettingsCacheRequest_enableSettings___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (NSNumber)memberDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
}

@end