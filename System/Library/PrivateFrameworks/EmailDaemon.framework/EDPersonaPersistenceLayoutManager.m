@interface EDPersonaPersistenceLayoutManager
+ (OS_os_log)log;
+ (id)baseAccountDirectoryForPersonaIdentifier:(id)a3;
+ (id)baseAccountDirectoryPathForPersonaIdentifier:(id)a3;
+ (id)iOS_baseAccountDirectoryPathForPersonaIdentifier:(id)a3;
+ (id)macOS_baseAccountDirectoryPathForPersonaIdentifier:(id)a3;
@end

@implementation EDPersonaPersistenceLayoutManager

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__EDPersonaPersistenceLayoutManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_71 != -1) {
    dispatch_once(&log_onceToken_71, block);
  }
  v2 = (void *)log_log_71;

  return (OS_os_log *)v2;
}

void __40__EDPersonaPersistenceLayoutManager_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_71;
  log_log_71 = (uint64_t)v1;
}

+ (id)baseAccountDirectoryForPersonaIdentifier:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = [a1 baseAccountDirectoryPathForPersonaIdentifier:a3];
  v5 = [v3 fileURLWithPath:v4 isDirectory:1];

  return v5;
}

+ (id)baseAccountDirectoryPathForPersonaIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  v6 = [v5 currentPersona];

  id v17 = 0;
  v7 = (void *)[v6 copyCurrentPersonaContextWithError:&v17];
  id v8 = v17;
  if (v8)
  {
    v9 = v8;
    v10 = +[EDPersonaPersistenceLayoutManager log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = objc_msgSend(v9, "ef_publicDescription");
      +[EDPersonaPersistenceLayoutManager baseAccountDirectoryPathForPersonaIdentifier:(uint64_t)v18];
    }

    v12 = 0;
  }
  else
  {
    v9 = [v6 generateAndRestorePersonaContextWithIdentityString:v4];
    if (v9)
    {
      v13 = +[EDPersonaPersistenceLayoutManager log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v14 = objc_msgSend(v9, "ef_publicDescription");
        +[EDPersonaPersistenceLayoutManager baseAccountDirectoryPathForPersonaIdentifier:(uint64_t)v18];
      }

      v12 = 0;
    }
    else
    {
      v12 = objc_msgSend(a1, "iOS_baseAccountDirectoryPathForPersonaIdentifier:", v4);
      v9 = 0;
    }
    id v15 = (id)[v6 restorePersonaWithSavedPersonaContext:v7];
  }

  return v12;
}

+ (id)macOS_baseAccountDirectoryPathForPersonaIdentifier:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", a3);
  id v4 = [v3 containerURLForSecurityApplicationGroupIdentifier:@"com.apple.MailPersonaStorage"];
  v5 = [v4 path];

  return v5;
}

+ (id)iOS_baseAccountDirectoryPathForPersonaIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 1;
  id v4 = (void *)container_create_or_lookup_app_group_paths_for_current_user();
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:xpc_dictionary_get_count(v4)];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __86__EDPersonaPersistenceLayoutManager_iOS_baseAccountDirectoryPathForPersonaIdentifier___block_invoke;
    v12[3] = &unk_1E6C04548;
    v12[4] = v5;
    xpc_dictionary_apply(v4, v12);
    v6 = [v5 objectForKeyedSubscript:@"com.apple.MailPersonaStorage"];
    v7 = [v6 absoluteString];

    if (!v7)
    {
      id v8 = +[EDPersonaPersistenceLayoutManager log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        +[EDPersonaPersistenceLayoutManager iOS_baseAccountDirectoryPathForPersonaIdentifier:](v8);
      }
    }
    v9 = v7;

    v10 = v9;
  }
  else
  {
    v9 = +[EDPersonaPersistenceLayoutManager log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[EDPersonaPersistenceLayoutManager iOS_baseAccountDirectoryPathForPersonaIdentifier:v9];
    }
    v10 = 0;
  }

  return v10;
}

uint64_t __86__EDPersonaPersistenceLayoutManager_iOS_baseAccountDirectoryPathForPersonaIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = [NSString stringWithUTF8String:a2];
  v7 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v5)];
  v9 = [v7 URLWithString:v8 relativeToURL:0];

  [*(id *)(a1 + 32) setObject:v9 forKey:v6];
  return 1;
}

+ (void)baseAccountDirectoryPathForPersonaIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_2(a1, (uint64_t)a2, a3, 5.8382e-34);
  _os_log_fault_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_FAULT, "Failed to generate and restore persona context with identifier: %{public}@ error: %{public}@ ", v4, 0x16u);
}

+ (void)baseAccountDirectoryPathForPersonaIdentifier:(uint64_t)a3 .cold.2(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_2(a1, (uint64_t)a2, a3, 5.8382e-34);
  _os_log_fault_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_FAULT, "Failed to create saved persona context for identifier: %{public}@ error: %{public}@ ", v4, 0x16u);
}

+ (void)iOS_baseAccountDirectoryPathForPersonaIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_fault_impl(&dword_1DB39C000, log, OS_LOG_TYPE_FAULT, "Failed to create container with identifier %{public}@ due to container manager error: %llu", (uint8_t *)&v4, 0x16u);
}

+ (void)iOS_baseAccountDirectoryPathForPersonaIdentifier:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1DB39C000, log, OS_LOG_TYPE_FAULT, "Mail persona container is not in the group container URLs", v1, 2u);
}

@end