@interface MOEffectiveSettings
+ (void)startObservingChangesWithHandler:(id)a3;
+ (void)subscribeForChangesInGroups:(id)a3 eventName:(id)a4;
- (MOEffectiveAccountSettings)account;
- (MOEffectiveAllowedClientSettings)allowedClient;
- (MOEffectiveSettings)init;
- (MOEffectiveShieldSettings)shield;
- (MOEffectiveUserSettings)user;
@end

@implementation MOEffectiveSettings

- (MOEffectiveSettings)init
{
  v12.receiver = self;
  v12.super_class = (Class)MOEffectiveSettings;
  v2 = [(MOEffectiveSettings *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    account = v2->_account;
    v2->_account = (MOEffectiveAccountSettings *)v3;

    uint64_t v5 = objc_opt_new();
    allowedClient = v2->_allowedClient;
    v2->_allowedClient = (MOEffectiveAllowedClientSettings *)v5;

    uint64_t v7 = objc_opt_new();
    shield = v2->_shield;
    v2->_shield = (MOEffectiveShieldSettings *)v7;

    uint64_t v9 = objc_opt_new();
    user = v2->_user;
    v2->_user = (MOEffectiveUserSettings *)v9;
  }
  return v2;
}

- (MOEffectiveAccountSettings)account
{
  return (MOEffectiveAccountSettings *)objc_getProperty(self, a2, 8, 1);
}

- (MOEffectiveAllowedClientSettings)allowedClient
{
  return (MOEffectiveAllowedClientSettings *)objc_getProperty(self, a2, 16, 1);
}

- (MOEffectiveShieldSettings)shield
{
  return (MOEffectiveShieldSettings *)objc_getProperty(self, a2, 24, 1);
}

- (MOEffectiveUserSettings)user
{
  return (MOEffectiveUserSettings *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_shield, 0);
  objc_storeStrong((id *)&self->_allowedClient, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

+ (void)subscribeForChangesInGroups:(id)a3 eventName:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[MOLogger xpc];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v24 = v5;
    __int16 v25 = 2114;
    id v26 = v6;
    _os_log_impl(&dword_1B8ED1000, v7, OS_LOG_TYPE_DEFAULT, "Subscribing for changes to settings groups: %{public}@ with event name: %{public}@", buf, 0x16u);
  }

  id v8 = v6;
  [v8 UTF8String];
  id v9 = v5;
  if (v9)
  {
    xpc_object_t v10 = xpc_array_create(0, 0);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:buf count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v19 + 1) + 8 * i);
          xpc_object_t v17 = xpc_string_create((const char *)objc_msgSend(v16, "UTF8String", (void)v19));
          xpc_array_append_value(v10, v17);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:buf count:16];
      }
      while (v13);
    }

    xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v18, "SettingsGroups", v10);
  }
  else
  {
    xpc_object_t v18 = 0;
  }

  xpc_set_event();
}

+ (void)startObservingChangesWithHandler:(id)a3
{
  id v3 = a3;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __69__MOEffectiveSettings_EventStream__startObservingChangesWithHandler___block_invoke;
  handler[3] = &unk_1E61CC308;
  id v6 = v3;
  id v4 = v3;
  xpc_set_event_stream_handler("com.apple.ManagedSettings.effective-settings.changed", 0, handler);
}

void __69__MOEffectiveSettings_EventStream__startObservingChangesWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E4F14560]));
  id v5 = v3;
  id v6 = objc_opt_new();
  uint64_t v7 = xpc_dictionary_get_array(v5, "SettingsGroups");
  if (v7)
  {
    *(void *)id v9 = MEMORY[0x1E4F143A8];
    *(void *)&v9[8] = 3221225472;
    *(void *)&v9[16] = __MOSettingsGroupsWithXPCEvent_block_invoke;
    xpc_object_t v10 = &unk_1E61CC330;
    id v11 = v6;
    xpc_array_apply(v7, v9);
  }
  id v8 = +[MOLogger xpc];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v9 = 138543618;
    *(void *)&v9[4] = v4;
    *(_WORD *)&v9[12] = 2114;
    *(void *)&v9[14] = v6;
    _os_log_impl(&dword_1B8ED1000, v8, OS_LOG_TYPE_DEFAULT, "Observed changes for event: %{public}@ with settings groups: %{public}@", v9, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end