@interface ATXSpotlightFeedbackManager
- (ATXSpotlightFeedbackManager)init;
- (ATXSpotlightFeedbackManager)initWithEngagementRecordManager:(id)a3;
- (BOOL)autoShortcutHasBeenHiddenForIdentifier:(id)a3;
- (BOOL)contextHasBeenHiddenForContextIdentifier:(id)a3;
- (BOOL)contextHasBeenHiddenForSuggestion:(id)a3;
- (BOOL)hasBeenHiddenEntityWithIdentifier:(id)a3;
- (BOOL)hasBeenHiddenSuggestion:(id)a3;
- (unint64_t)combineReasons:(unint64_t)a3;
- (void)_toggleSiriSearchSettingsOffForAppSuggestion:(id)a3;
- (void)addHiddenActionExecutableIdentifier:(id)a3;
- (void)addHiddenAppSuggestionBundleIdentifier:(id)a3;
- (void)addHiddenAutoShortcutIdentifier:(id)a3;
- (void)addHiddenContextIdentifier:(id)a3;
- (void)clearHiddenSuggestions;
@end

@implementation ATXSpotlightFeedbackManager

- (ATXSpotlightFeedbackManager)init
{
  v3 = +[ATXEngagementRecordManager sharedInstance];
  v4 = [(ATXSpotlightFeedbackManager *)self initWithEngagementRecordManager:v3];

  return v4;
}

- (ATXSpotlightFeedbackManager)initWithEngagementRecordManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXSpotlightFeedbackManager;
  v6 = [(ATXSpotlightFeedbackManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_engagementRecordManager, a3);
    uint64_t v8 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:44];
    clientModelId = v7->_clientModelId;
    v7->_clientModelId = (NSString *)v8;
  }
  return v7;
}

- (void)addHiddenActionExecutableIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: addHiddenActionExecutableIdentifier: %@", (uint8_t *)&v6, 0xCu);
  }

  [(ATXEngagementRecordManager *)self->_engagementRecordManager addEngagedExecutable:v4 clientModelId:self->_clientModelId engagementRecordType:128];
}

- (void)addHiddenContextIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: addHiddenContext: %@", (uint8_t *)&v6, 0xCu);
  }

  [(ATXEngagementRecordManager *)self->_engagementRecordManager addEngagedExecutable:v4 clientModelId:self->_clientModelId engagementRecordType:256];
}

- (void)addHiddenAutoShortcutIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: addHiddenAutoShortcut: %@", (uint8_t *)&v6, 0xCu);
  }

  [(ATXEngagementRecordManager *)self->_engagementRecordManager addEngagedExecutable:v4 clientModelId:self->_clientModelId engagementRecordType:512];
}

- (void)addHiddenAppSuggestionBundleIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 uuid];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: addHiddenAppSuggestion: %@", (uint8_t *)&v7, 0xCu);
  }
  [(ATXEngagementRecordManager *)self->_engagementRecordManager addHiddenSuggestion:v4 duration:120 engagementRecordType:86400.0];
  [(ATXSpotlightFeedbackManager *)self _toggleSiriSearchSettingsOffForAppSuggestion:v4];
}

- (void)clearHiddenSuggestions
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [(ATXEngagementRecordManager *)self->_engagementRecordManager removeAllEngagementsOfRecordType:896];
  v3 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    engagementRecordManager = self->_engagementRecordManager;
    int v5 = 138412290;
    int v6 = engagementRecordManager;
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: clearHiddenSuggestions for cache: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)hasBeenHiddenSuggestion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 executableSpecification];
  int v5 = [v4 executableIdentifier];

  int v6 = +[ATXSpotlightHidingUIController normalizedIdentifier:v5];

  BOOL v7 = [(ATXEngagementRecordManager *)self->_engagementRecordManager hasEngagedWithExecutable:v6 engagementRecordType:128];
  uint64_t v8 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    objc_super v11 = v6;
    __int16 v12 = 1024;
    BOOL v13 = v7;
    _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: hasBeenHiddenSuggestion:%@ ---> %{BOOL}d", (uint8_t *)&v10, 0x12u);
  }

  return v7;
}

- (BOOL)hasBeenHiddenEntityWithIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(ATXEngagementRecordManager *)self->_engagementRecordManager hasEngagedWithExecutable:v4 engagementRecordType:128];
    int v6 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 1024;
      BOOL v11 = v5;
      _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: hasBeenHiddenEntityWithIdentifier:%@ ---> %{BOOL}d", (uint8_t *)&v8, 0x12u);
    }
  }
  else
  {
    int v6 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: hasBeenHiddenEntityWithIdentifier NIL ---> NO", (uint8_t *)&v8, 2u);
    }
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)contextHasBeenHiddenForSuggestion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 uiSpecification];
  -[ATXSpotlightFeedbackManager combineReasons:](self, "combineReasons:", [v5 predictionReasons]);

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v6 = v4;
  ATXSuggestionPredictionReasonEnumerateReasonCodes();
  BOOL v7 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v6 uiSpecification];
    id v9 = [v8 title];
    int v10 = *((unsigned __int8 *)v14 + 24);
    *(_DWORD *)buf = 138412546;
    v18 = v9;
    __int16 v19 = 1024;
    int v20 = v10;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: contextHasBeenHiddenForSuggestion %@:no context --->  %{BOOL}d", buf, 0x12u);
  }
  BOOL v11 = *((unsigned char *)v14 + 24) != 0;

  _Block_object_dispose(&v13, 8);
  return v11;
}

void __65__ATXSpotlightFeedbackManager_contextHasBeenHiddenForSuggestion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = stringForATXSuggestionPredictionReasonCode();
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [*(id *)(a1 + 32) contextHasBeenHiddenForContextIdentifier:v2];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  *(unsigned char *)(v3 + 24) = v4;
  BOOL v5 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 40) uiSpecification];
    BOOL v7 = [v6 title];
    int v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    int v9 = 138412802;
    int v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v2;
    __int16 v13 = 1024;
    int v14 = v8;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: contextHasBeenHiddenForSuggestion %@:%@ ---> %{BOOL}d", (uint8_t *)&v9, 0x1Cu);
  }
}

- (BOOL)contextHasBeenHiddenForContextIdentifier:(id)a3
{
  if (a3)
  {
    engagementRecordManager = self->_engagementRecordManager;
    return -[ATXEngagementRecordManager hasEngagedWithExecutable:engagementRecordType:](engagementRecordManager, "hasEngagedWithExecutable:engagementRecordType:");
  }
  else
  {
    BOOL v5 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightFeedbackManager contextHasBeenHiddenForContextIdentifier:](v5);
    }

    return 0;
  }
}

- (BOOL)autoShortcutHasBeenHiddenForIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(ATXEngagementRecordManager *)self->_engagementRecordManager hasEngagedWithExecutable:v4 engagementRecordType:512];
    id v6 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 1024;
      BOOL v11 = v5;
      _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: autoShortcutHasBeenHiddenForIdentifier %@ --->  %{BOOL}d", (uint8_t *)&v8, 0x12u);
    }
  }
  else
  {
    id v6 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightFeedbackManager autoShortcutHasBeenHiddenForIdentifier:](v6);
    }
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (unint64_t)combineReasons:(unint64_t)a3
{
  unint64_t v3 = 0x3000000000;
  if ((a3 & 0x3000000000) == 0) {
    unint64_t v3 = a3;
  }
  if ((a3 & 0x380000000) != 0) {
    unint64_t v3 = 0x380000000;
  }
  if ((a3 & 0x700000) != 0) {
    return 7340032;
  }
  else {
    return v3;
  }
}

- (void)_toggleSiriSearchSettingsOffForAppSuggestion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 executableSpecification];
  uint64_t v5 = [v4 executableType];

  id v6 = [v3 executableSpecification];
  BOOL v7 = [v6 executableObject];

  if (v5 == 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v8 = v7;
    id v9 = objc_alloc(MEMORY[0x1E4F1CA80]);
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    uint64_t v12 = (void *)CFPreferencesCopyValue(@"SBSearchSuggestAppDisabled", @"com.apple.spotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    __int16 v13 = v12;
    if (v12) {
      id v14 = v12;
    }
    else {
      id v14 = (id)objc_opt_new();
    }
    uint64_t v15 = v14;

    char v16 = (void *)[v9 initWithArray:v15];
    [v16 addObject:v8];
    CFPreferencesSetAppValue(@"SBSearchSuggestAppDisabled", (CFPropertyListRef)[v16 allObjects], @"com.apple.spotlightui");
    CFPreferencesSynchronize(@"com.apple.spotlightui", v10, v11);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.spotlightui.prefschanged", 0, 0, 1u);

    v18 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      int v20 = v8;
      _os_log_impl(&dword_1A790D000, v18, OS_LOG_TYPE_DEFAULT, "toggled siri & search settings for spotlight OFF for app prediction: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    int v8 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(ATXSpotlightFeedbackManager *)v3 _toggleSiriSearchSettingsOffForAppSuggestion:v8];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelId, 0);

  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
}

- (void)contextHasBeenHiddenForContextIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "ATXSpotlightFeedbackManager contextHasBeenHiddenForContextIdentifier:NIL hidden=NO", v1, 2u);
}

- (void)autoShortcutHasBeenHiddenForIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "ATXSpotlightFeedbackManager autoShortcutHasBeenHiddenForIdentifier:NIL hidden=NO", v1, 2u);
}

- (void)_toggleSiriSearchSettingsOffForAppSuggestion:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F93950];
  uint64_t v5 = [a1 executableSpecification];
  id v6 = objc_msgSend(v4, "stringForExecutableType:", objc_msgSend(v5, "executableType"));
  BOOL v7 = (objc_class *)objc_opt_class();
  int v8 = NSStringFromClass(v7);
  int v9 = 136315650;
  CFStringRef v10 = "-[ATXSpotlightFeedbackManager _toggleSiriSearchSettingsOffForAppSuggestion:]";
  __int16 v11 = 2114;
  uint64_t v12 = v6;
  __int16 v13 = 2114;
  id v14 = v8;
  _os_log_error_impl(&dword_1A790D000, a3, OS_LOG_TYPE_ERROR, "%s: attempted to toggle siri & search settings off for non-app executable type: %{public}@ class: %{public}@", (uint8_t *)&v9, 0x20u);
}

@end