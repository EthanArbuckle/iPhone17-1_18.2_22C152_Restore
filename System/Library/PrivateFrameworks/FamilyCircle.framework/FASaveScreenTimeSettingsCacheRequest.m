@interface FASaveScreenTimeSettingsCacheRequest
- (FASaveScreenTimeSettingsCacheRequest)initWithFamilyMemberDSID:(id)a3 screentimeObject:(id)a4;
- (FAScreentimeSettingsObjectCache)object;
- (NSNumber)memberDSID;
- (void)setMemberDSID:(id)a3;
- (void)startRequestWithCompletionHandler:(id)a3;
@end

@implementation FASaveScreenTimeSettingsCacheRequest

- (FASaveScreenTimeSettingsCacheRequest)initWithFamilyMemberDSID:(id)a3 screentimeObject:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FASaveScreenTimeSettingsCacheRequest;
  v9 = [(FAFamilyCircleRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memberDSID, a3);
    objc_storeStrong((id *)&v10->_object, a4);
  }

  return v10;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__FASaveScreenTimeSettingsCacheRequest_startRequestWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E6924B90;
  id v12 = v4;
  id v5 = v4;
  v6 = [(FAFamilyCircleRequest *)self serviceRemoteObjectWithErrorHandler:v11];
  id v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = self;
    _os_log_impl(&dword_1D252C000, v7, OS_LOG_TYPE_DEFAULT, "Starting caching of object: %@", buf, 0xCu);
  }

  id v8 = [(FASaveScreenTimeSettingsCacheRequest *)self object];
  v9 = [(FASaveScreenTimeSettingsCacheRequest *)self memberDSID];
  v10 = [(FAFamilyCircleRequest *)self requestOptions];
  [v6 cacheObjectSettings:v8 dsid:v9 options:v10 replyBlock:v5];
}

void __74__FASaveScreenTimeSettingsCacheRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[FASaveScreenTimeSettingsCacheRequest startRequestWithCompletionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1D252C000, v4, OS_LOG_TYPE_DEFAULT, "%s: Error from service - %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSNumber)memberDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMemberDSID:(id)a3
{
}

- (FAScreentimeSettingsObjectCache)object
{
  return (FAScreentimeSettingsObjectCache *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_memberDSID, 0);
}

@end