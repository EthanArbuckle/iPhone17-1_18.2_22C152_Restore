@interface MOSettingMetadata
- (BOOL)isPrivacySensitive;
- (BOOL)isPublic;
- (MOSettingMetadata)initWithSettingName:(id)a3 defaultValue:(id)a4 isPublic:(BOOL)a5 scope:(id)a6 isPrivacySensitive:(BOOL)a7;
- (NSSet)responsibleClients;
- (NSString)scope;
- (NSString)settingName;
- (id)combinePersistableValue:(id)a3 with:(id)a4;
- (id)defaultValue;
- (id)persistableValueFromValue:(id)a3;
- (id)sanitizePersistableValue:(id)a3;
- (id)valueFromPersistableValue:(id)a3;
@end

@implementation MOSettingMetadata

- (id)defaultValue
{
  return self->_defaultValue;
}

- (MOSettingMetadata)initWithSettingName:(id)a3 defaultValue:(id)a4 isPublic:(BOOL)a5 scope:(id)a6 isPrivacySensitive:(BOOL)a7
{
  v12 = (NSString *)a3;
  id v13 = a4;
  v14 = (NSString *)a6;
  v22.receiver = self;
  v22.super_class = (Class)MOSettingMetadata;
  v15 = [(MOSettingMetadata *)&v22 init];
  settingName = v15->_settingName;
  v15->_settingName = v12;
  v17 = v12;

  id defaultValue = v15->_defaultValue;
  v15->_id defaultValue = v13;
  id v19 = v13;

  v15->_isPublic = a5;
  scope = v15->_scope;
  v15->_scope = v14;

  v15->_isPrivacySensitive = a7;
  return v15;
}

- (NSSet)responsibleClients
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  v3 = +[MOManagedSettingsAgentConnection oneTimeConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__MOSettingMetadata_responsibleClients__block_invoke;
  v7[3] = &unk_1E61CBFB8;
  v7[4] = self;
  v9 = &v10;
  id v4 = v3;
  id v8 = v4;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v4 withRetryCount:1 proxyHandler:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return (NSSet *)v5;
}

void __39__MOSettingMetadata_responsibleClients__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = +[MOLogger store];
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [*(id *)(a1 + 32) settingName];
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      _os_log_impl(&dword_1B8ED1000, v8, OS_LOG_TYPE_DEFAULT, "Getting responsible clients for setting “%{public}@”", buf, 0xCu);
    }
    uint64_t v10 = [*(id *)(a1 + 32) settingName];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __39__MOSettingMetadata_responsibleClients__block_invoke_3;
    v13[3] = &unk_1E61CBF90;
    v13[4] = *(void *)(a1 + 32);
    long long v12 = *(_OWORD *)(a1 + 40);
    id v11 = (id)v12;
    long long v14 = v12;
    [v5 responsibleClientsForSetting:v10 replyHandler:v13];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __39__MOSettingMetadata_responsibleClients__block_invoke_cold_1((uint64_t)v6, v8);
    }
  }
}

void __39__MOSettingMetadata_responsibleClients__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = +[MOLogger store];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __39__MOSettingMetadata_responsibleClients__block_invoke_3_cold_1(a1, (uint64_t)v6, v8);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [*(id *)(a1 + 32) settingName];
      int v12 = 138543618;
      id v13 = v5;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl(&dword_1B8ED1000, v8, OS_LOG_TYPE_DEFAULT, "Successfully got responsible clients %{public}@ for setting “%{public}@”", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = v5;
    id v8 = *(NSObject **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }

  [*(id *)(a1 + 40) invalidate];
}

- (NSString)settingName
{
  return self->_settingName;
}

- (BOOL)isPublic
{
  return self->_isPublic;
}

- (NSString)scope
{
  return self->_scope;
}

- (BOOL)isPrivacySensitive
{
  return self->_isPrivacySensitive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_settingName, 0);
  objc_storeStrong(&self->_defaultValue, 0);
}

- (id)persistableValueFromValue:(id)a3
{
  return 0;
}

- (id)valueFromPersistableValue:(id)a3
{
  return 0;
}

- (id)sanitizePersistableValue:(id)a3
{
  return 0;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  return 0;
}

void __39__MOSettingMetadata_responsibleClients__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B8ED1000, a2, OS_LOG_TYPE_ERROR, "Unable to obtain remote object proxy. Error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __39__MOSettingMetadata_responsibleClients__block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [*(id *)(a1 + 32) settingName];
  int v6 = 138543618;
  v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1B8ED1000, a3, OS_LOG_TYPE_ERROR, "Unable to get responsible clients for setting “%{public}@.” Error: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end