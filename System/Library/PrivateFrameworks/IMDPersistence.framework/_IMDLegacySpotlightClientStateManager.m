@interface _IMDLegacySpotlightClientStateManager
- (_IMDLegacySpotlightClientStateManager)init;
- (void)_currentClientStateWithCompletion:(id)a3;
- (void)_saveClientState:(id)a3 withCompletion:(id)a4;
@end

@implementation _IMDLegacySpotlightClientStateManager

- (_IMDLegacySpotlightClientStateManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)_IMDLegacySpotlightClientStateManager;
  v2 = [(_IMDLegacySpotlightClientStateManager *)&v5 init];
  if (v2 && [MEMORY[0x1E4F6EA40] _needsMigrationToDefaults])
  {
    v3 = objc_alloc_init(_IMDModernSpotlightClientStateManager);
    [(IMDSpotlightClientStateManager *)v2 _migrateClientStateFromManager:v3];
  }
  return v2;
}

- (void)_currentClientStateWithCompletion:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, void, void *))a3;
  v4 = sub_1AFB66ED0();
  if (v4)
  {
    objc_super v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1AFC62094();
    }

    v3[2](v3, 0, v4);
  }
  else
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F6EA40]) initImportingFromDefaults];
    v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Current client state: %@", (uint8_t *)&v8, 0xCu);
    }

    v3[2](v3, v6, 0);
    v3 = (void (**)(id, void, void *))v6;
  }
}

- (void)_saveClientState:(id)a3 withCompletion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  sub_1AFBD526C();
  v7 = IMLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Saving client state: %@", (uint8_t *)&v10, 0xCu);
  }

  int v8 = sub_1AFB6740C();
  if (v8)
  {
    uint64_t v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1AFC621E4();
    }

    v6[2](v6, v8);
  }
  else
  {
    [v5 _writeToDefaults];
    notify_post("com.apple.imdpersistenceagent.notification.spotlightclientstateupdated");
    v6[2](v6, 0);
  }
}

@end