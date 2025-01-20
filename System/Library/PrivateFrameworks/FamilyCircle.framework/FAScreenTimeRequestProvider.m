@interface FAScreenTimeRequestProvider
- (BOOL)isScreenTimeSetupForDSID:(id)a3;
- (void)cacheScreenTimeSettingToDiskWithDSID:(id)a3 screentimeObject:(id)a4 completionHandler:(id)a5;
- (void)enableScreenTimeSettingsForDSID:(id)a3 screentimeObject:(id)a4 completionHandler:(id)a5;
- (void)forceRefreshScreenTimeForDSID:(id)a3 completionHandler:(id)a4;
- (void)updateScreenTimeServerFlagSettingsForDSID:(id)a3 ephemeralAuthResults:(id)a4 enabled:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation FAScreenTimeRequestProvider

- (void)cacheScreenTimeSettingToDiskWithDSID:(id)a3 screentimeObject:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[FASaveScreenTimeSettingsCacheRequest alloc] initWithFamilyMemberDSID:v9 screentimeObject:v8];

  [(FASaveScreenTimeSettingsCacheRequest *)v10 startRequestWithCompletionHandler:v7];
}

- (void)enableScreenTimeSettingsForDSID:(id)a3 screentimeObject:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[FAEnableScreenTimeSettingsRequest alloc] initWithFamilyMemberDSID:v9 screentimeModelCache:v8];

  [(FAEnableScreenTimeSettingsRequest *)v10 startRequestWithCompletionHandler:v7];
}

- (void)updateScreenTimeServerFlagSettingsForDSID:(id)a3 ephemeralAuthResults:(id)a4 enabled:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = [[FAUpdateFamilyMemberFlagRequest alloc] initWithFamilyMemberDSID:v11 ephemeralAuthResults:v10 flag:@"FAMemberFlagScreenTime" enabled:v6];

  [(FAUpdateFamilyMemberFlagRequest *)v12 startRequestWithCompletionHandler:v9];
}

- (void)forceRefreshScreenTimeForDSID:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1D252C000, v7, OS_LOG_TYPE_DEFAULT, "Force screentime refresh dsid: %{private}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__7;
  v25 = __Block_byref_object_dispose__7;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  id v8 = (void *)getSTPrivateServiceClientClass_softClass;
  uint64_t v21 = getSTPrivateServiceClientClass_softClass;
  if (!getSTPrivateServiceClientClass_softClass)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __getSTPrivateServiceClientClass_block_invoke;
    v17[3] = &unk_1E69253D8;
    v17[4] = &v18;
    __getSTPrivateServiceClientClass_block_invoke((uint64_t)v17);
    id v8 = (void *)v19[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v18, 8);
  id v26 = objc_alloc_init(v9);
  id v10 = *(void **)(*((void *)&buf + 1) + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__FAScreenTimeRequestProvider_forceRefreshScreenTimeForDSID_completionHandler___block_invoke;
  v13[3] = &unk_1E69259B0;
  id v11 = v5;
  id v14 = v11;
  id v12 = v6;
  id v15 = v12;
  p_long long buf = &buf;
  [v10 forceFamilyFetchWithCompletionHandler:v13];

  _Block_object_dispose(&buf, 8);
}

void __79__FAScreenTimeRequestProvider_forceRefreshScreenTimeForDSID_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _FALogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__FAScreenTimeRequestProvider_forceRefreshScreenTimeForDSID_completionHandler___block_invoke_cold_1((uint64_t)a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    int v9 = 138477827;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1D252C000, v5, OS_LOG_TYPE_DEFAULT, "Completed screentime refresh. It is now aware of family member with dsid: %{private}@", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

- (BOOL)isScreenTimeSetupForDSID:(id)a3
{
  id v3 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v4 = (void *)getSTUserIDClass_softClass;
  uint64_t v22 = getSTUserIDClass_softClass;
  if (!getSTUserIDClass_softClass)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __getSTUserIDClass_block_invoke;
    v17 = &unk_1E69253D8;
    uint64_t v18 = &v19;
    __getSTUserIDClass_block_invoke((uint64_t)&v14);
    v4 = (void *)v20[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v19, 8);
  uint64_t v6 = (void *)[[v5 alloc] initWithDSID:v3];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2050000000;
  uint64_t v7 = (void *)getSTSetupClientClass_softClass;
  uint64_t v22 = getSTSetupClientClass_softClass;
  if (!getSTSetupClientClass_softClass)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __getSTSetupClientClass_block_invoke;
    v17 = &unk_1E69253D8;
    uint64_t v18 = &v19;
    __getSTSetupClientClass_block_invoke((uint64_t)&v14);
    uint64_t v7 = (void *)v20[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v19, 8);
  int v9 = objc_opt_new();
  uint64_t v13 = 0;
  uint64_t v10 = [v9 currentConfigurationForUser:v6 error:&v13];
  BOOL v11 = [v10 screenTimeState] == 1;

  return v11;
}

void __79__FAScreenTimeRequestProvider_forceRefreshScreenTimeForDSID_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138478083;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D252C000, log, OS_LOG_TYPE_ERROR, "Error force refreshing screentime for %{private}@ %@", (uint8_t *)&v4, 0x16u);
}

@end