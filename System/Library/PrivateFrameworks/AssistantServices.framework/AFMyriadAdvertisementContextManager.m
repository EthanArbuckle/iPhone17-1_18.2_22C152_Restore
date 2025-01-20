@interface AFMyriadAdvertisementContextManager
- (AFMyriadAdvertisementContextManager)initWithQueue:(id)a3;
- (id)_settingsConnection;
- (void)_resetSettingsConnection;
- (void)pushMyriadAdvertisementContext:(id)a3 completionHandler:(id)a4;
- (void)reset;
- (void)triggerABCForType:(id)a3 subType:(id)a4 context:(id)a5;
@end

@implementation AFMyriadAdvertisementContextManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
}

- (void)reset
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[AFMyriadAdvertisementContextManager reset]";
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AFMyriadAdvertisementContextManager_reset__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __44__AFMyriadAdvertisementContextManager_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetSettingsConnection];
}

- (void)triggerABCForType:(id)a3 subType:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__AFMyriadAdvertisementContextManager_triggerABCForType_subType_context___block_invoke;
  v15[3] = &unk_1E592C220;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __73__AFMyriadAdvertisementContextManager_triggerABCForType_subType_context___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _settingsConnection];
  [v2 triggerABCForType:*(void *)(a1 + 40) subType:*(void *)(a1 + 48) context:*(void *)(a1 + 56) completionHandler:&__block_literal_global_46722];
}

void __73__AFMyriadAdvertisementContextManager_triggerABCForType_subType_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      v5 = "-[AFMyriadAdvertisementContextManager triggerABCForType:subType:context:]_block_invoke_2";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s #myriad triggerABCForSubType failed: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)pushMyriadAdvertisementContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__AFMyriadAdvertisementContextManager_pushMyriadAdvertisementContext_completionHandler___block_invoke;
  block[3] = &unk_1E592C598;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __88__AFMyriadAdvertisementContextManager_pushMyriadAdvertisementContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v9 = "-[AFMyriadAdvertisementContextManager pushMyriadAdvertisementContext:completionHandler:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s #myriad Pushing Myriad advertisement context %@", buf, 0x16u);
  }
  int v4 = [*(id *)(a1 + 40) _settingsConnection];
  uint64_t v5 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__AFMyriadAdvertisementContextManager_pushMyriadAdvertisementContext_completionHandler___block_invoke_1;
  v6[3] = &unk_1E592C1D8;
  id v7 = *(id *)(a1 + 48);
  [v4 pushMyriadAdvertisementContext:v5 completionHandler:v6];
}

void __88__AFMyriadAdvertisementContextManager_pushMyriadAdvertisementContext_completionHandler___block_invoke_1(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __88__AFMyriadAdvertisementContextManager_pushMyriadAdvertisementContext_completionHandler___block_invoke_2;
    v10[3] = &unk_1E592C1B0;
    id v7 = v8;
    id v11 = v7;
    [v5 enumerateObjectsUsingBlock:v10];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v7, v6);
  }
}

void __88__AFMyriadAdvertisementContextManager_pushMyriadAdvertisementContext_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 content];
  id v5 = [v4 myriadAdvertisementContext];
  if (v5)
  {
    id v6 = [[AFMyriadAdvertisementContextRecord alloc] initWithMyriadAdvertisementContextRecordData:v5];
    id v7 = v6;
    if (v6)
    {
      id v8 = [(AFMyriadAdvertisementContextRecord *)v6 deviceID];
      if (v8)
      {
        [*(id *)(a1 + 32) setObject:v7 forKey:v8];
      }
      else
      {
        uint64_t v9 = (id)AFSiriLogContextConnection;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          __int16 v10 = [v3 info];
          id v11 = v10;
          if (!v10)
          {
            id v11 = [v4 deviceInfo];
          }
          int v12 = 136315650;
          id v13 = "-[AFMyriadAdvertisementContextManager pushMyriadAdvertisementContext:completionHandler:]_block_invoke_2";
          __int16 v14 = 2112;
          v15 = v7;
          __int16 v16 = 2112;
          id v17 = v11;
          _os_log_error_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_ERROR, "%s #myriad Dropped %@ from %@ because there's no device ID.", (uint8_t *)&v12, 0x20u);
          if (!v10) {
        }
          }
      }
    }
  }
}

- (void)_resetSettingsConnection
{
  settingsConnection = self->_settingsConnection;
  if (settingsConnection)
  {
    self->_settingsConnection = 0;
  }
}

- (id)_settingsConnection
{
  settingsConnection = self->_settingsConnection;
  if (!settingsConnection)
  {
    int v4 = objc_alloc_init(AFSettingsConnection);
    id v5 = self->_settingsConnection;
    self->_settingsConnection = v4;

    [(AFSettingsConnection *)self->_settingsConnection setXPCConnectionManagementQueue:self->_queue];
    settingsConnection = self->_settingsConnection;
  }
  return settingsConnection;
}

- (AFMyriadAdvertisementContextManager)initWithQueue:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)AFMyriadAdvertisementContextManager;
    id v6 = [(AFMyriadAdvertisementContextManager *)&v10 init];
    id v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_queue, a3);
    }
    self = v7;
    id v8 = self;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

@end