@interface BRCUserActionsNavigator
+ (id)defaultNavigator;
- (void)openAppStoreForBundleID:(id)a3;
- (void)openShareURLInWebBrowser:(id)a3 withReason:(id)a4;
- (void)openiCloudSettings;
@end

@implementation BRCUserActionsNavigator

+ (id)defaultNavigator
{
  if (defaultNavigator_onceToken != -1) {
    dispatch_once(&defaultNavigator_onceToken, &__block_literal_global_61);
  }
  v2 = (void *)defaultNavigator_navigator;
  return v2;
}

void __43__BRCUserActionsNavigator_defaultNavigator__block_invoke()
{
  v0 = objc_alloc_init(BRCUserActionsNavigator);
  v1 = (void *)defaultNavigator_navigator;
  defaultNavigator_navigator = (uint64_t)v0;
}

- (void)openShareURLInWebBrowser:(id)a3 withReason:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6) {
      goto LABEL_3;
    }
    goto LABEL_22;
  }
  v28 = brc_bread_crumbs();
  v29 = brc_default_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
    -[BRCUserActionsNavigator openShareURLInWebBrowser:withReason:]();
  }

  if (!v7)
  {
LABEL_22:
    v30 = brc_bread_crumbs();
    v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      -[BRCUserActionsNavigator openShareURLInWebBrowser:withReason:]();
    }
  }
LABEL_3:
  v8 = [MEMORY[0x1E4F29088] componentsWithURL:v5 resolvingAgainstBaseURL:0];
  [v8 setScheme:@"https"];
  v9 = [v8 query];
  v10 = v9;
  if (v9)
  {
    if ([v9 rangeOfString:@"redirectReason"] != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_8;
    }
    uint64_t v11 = [v10 stringByAppendingFormat:@"&%@=%@", @"redirectReason", v7];
  }
  else
  {
    uint64_t v11 = [NSString stringWithFormat:@"%@=%@", @"redirectReason", v7];
  }
  v12 = (void *)v11;
  [v8 setQuery:v11];

LABEL_8:
  v13 = [v8 fragment];
  char v14 = [v13 hasSuffix:@":nooverride"];

  if ((v14 & 1) == 0)
  {
    uint64_t v15 = [v8 fragment];
    v16 = (void *)v15;
    v17 = &stru_1F2AC7720;
    if (v15) {
      v17 = (__CFString *)v15;
    }
    v18 = v17;

    v19 = [(__CFString *)v18 stringByAppendingString:@":nooverride"];

    [v8 setFragment:v19];
  }
  v20 = [v8 URL];

  v21 = brc_bread_crumbs();
  v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v35 = v7;
    __int16 v36 = 2112;
    v37 = v20;
    __int16 v38 = 2112;
    v39 = v21;
    _os_log_debug_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Opening in web browser (reason: %@) %@%@", buf, 0x20u);
  }

  v23 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v32 = *MEMORY[0x1E4F22338];
  uint64_t v33 = MEMORY[0x1E4F1CC38];
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  char v25 = [v23 openURL:v20 withOptions:v24];

  if ((v25 & 1) == 0)
  {
    v26 = brc_bread_crumbs();
    v27 = brc_default_log();
    if (os_log_type_enabled(v27, (os_log_type_t)0x90u)) {
      -[BRCUserActionsNavigator openShareURLInWebBrowser:withReason:]();
    }
  }
}

- (void)openiCloudSettings
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Ubiquity"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

- (void)openAppStoreForBundleID:(id)a3
{
  if (a3)
  {
    [NSString stringWithFormat:@"itms-apps://?bundleIdentifier=%@", a3];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v4 openSensitiveURL:v3 withOptions:0];
  }
  else
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
      -[BRCUserActionsNavigator openAppStoreForBundleID:]();
    }
  }
}

- (void)openShareURLInWebBrowser:withReason:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D353B000, v1, (os_log_type_t)0x90u, "[ERROR] Can't open \"%@\" using default web browser%@", v2, 0x16u);
}

- (void)openShareURLInWebBrowser:withReason:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: redirectReason%@", v1, 0xCu);
}

- (void)openShareURLInWebBrowser:withReason:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: shareURL%@", v1, 0xCu);
}

- (void)openAppStoreForBundleID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] passed nil app bundle ID%@", v1, 0xCu);
}

@end