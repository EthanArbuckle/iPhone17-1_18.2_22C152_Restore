@interface _IMDModernSpotlightClientStateManager
- (_IMDModernSpotlightClientStateManager)init;
- (id)_missingSpotlightIndexError;
- (void)_currentClientStateWithCompletion:(id)a3;
- (void)_saveClientState:(id)a3 withCompletion:(id)a4;
@end

@implementation _IMDModernSpotlightClientStateManager

- (_IMDModernSpotlightClientStateManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)_IMDModernSpotlightClientStateManager;
  v2 = [(_IMDModernSpotlightClientStateManager *)&v5 init];
  if (v2 && [MEMORY[0x1E4F6EA40] _needsMigrationFromDefaults])
  {
    v3 = objc_alloc_init(_IMDLegacySpotlightClientStateManager);
    [(IMDSpotlightClientStateManager *)v2 _migrateClientStateFromManager:v3];
  }
  return v2;
}

- (id)_missingSpotlightIndexError
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v3 = *MEMORY[0x1E4F6E338];
  uint64_t v7 = *MEMORY[0x1E4F28228];
  v8[0] = @"Failed to open the Spotlight index.";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  objc_super v5 = (void *)[v2 initWithDomain:v3 code:1 userInfo:v4];

  return v5;
}

- (void)_currentClientStateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = IMCoreSpotlightIndex();
  if (v5)
  {
    v6 = sub_1AFB66ED0();
    if (!v6)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      void v8[2] = sub_1AFB66FE8;
      v8[3] = &unk_1E5F8E688;
      id v9 = v4;
      [v5 fetchLastClientStateWithCompletionHandler:v8];

      goto LABEL_9;
    }
    uint64_t v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1AFC62094();
    }
  }
  else
  {
    v6 = [(_IMDModernSpotlightClientStateManager *)self _missingSpotlightIndexError];
  }
  (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
LABEL_9:
}

- (void)_saveClientState:(id)a3 withCompletion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  sub_1AFBD526C();
  v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Saving client state: %@", buf, 0xCu);
  }

  id v9 = IMCoreSpotlightIndex();
  if (!v9)
  {
    v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1AFC62138();
    }

    id v11 = [(_IMDModernSpotlightClientStateManager *)self _missingSpotlightIndexError];
    goto LABEL_11;
  }
  uint64_t v10 = sub_1AFB6740C();
  if (v10)
  {
    id v11 = (id)v10;
    v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1AFC621E4();
    }

LABEL_11:
    v7[2](v7, v11);
    goto LABEL_18;
  }
  id v19 = 0;
  v14 = [v6 dataWithError:&v19];
  id v11 = v19;
  if (v11)
  {
    v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6216C((uint64_t)v11, v15);
    }

    v7[2](v7, v11);
  }
  else
  {
    [v9 beginIndexBatch];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1AFB67524;
    v16[3] = &unk_1E5F8E6B0;
    id v17 = 0;
    v18 = v7;
    [v9 endIndexBatchWithClientState:v14 completionHandler:v16];
  }
LABEL_18:
}

@end