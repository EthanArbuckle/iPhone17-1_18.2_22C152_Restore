@interface FAFollowupManager
+ (id)_followupManager;
+ (void)synchronizeFollowupWithPayload:(id)a3 altDSID:(id)a4;
+ (void)tearDownFollowupItemWithIdentifier:(id)a3 completion:(id)a4;
+ (void)teardownFollowUpWithContext:(id)a3 completion:(id)a4;
+ (void)teardownPendingFollowup;
@end

@implementation FAFollowupManager

+ (void)tearDownFollowupItemWithIdentifier:(id)a3 completion:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F5B768];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithClientIdentifier:@"com.icloud.family"];
  v13[0] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__FAFollowupManager_tearDownFollowupItemWithIdentifier_completion___block_invoke;
  v11[3] = &unk_1E6924CA8;
  id v12 = v5;
  id v10 = v5;
  [v8 clearPendingFollowUpItemsWithUniqueIdentifiers:v9 completion:v11];
}

void __67__FAFollowupManager_tearDownFollowupItemWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = _FALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __67__FAFollowupManager_tearDownFollowupItemWithIdentifier_completion___block_invoke_cold_1(v5);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

+ (void)synchronizeFollowupWithPayload:(id)a3 altDSID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 _followupManager];
  id v13 = 0;
  int v9 = [v8 synchronizeFollowUpsWithServerPayload:v7 altDSID:v6 error:&v13];

  id v10 = v13;
  v11 = _FALogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v12) {
      +[FAFollowupManager synchronizeFollowupWithPayload:altDSID:](v11);
    }
  }
  else if (v12)
  {
    +[FAFollowupManager synchronizeFollowupWithPayload:altDSID:](v10, v11);
  }
}

+ (void)teardownPendingFollowup
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_0(&dword_1D252C000, v2, v3, "Failed to clear pending family followup items with error: %@", v4, v5, v6, v7, 2u);
}

+ (void)teardownFollowUpWithContext:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_1D252C000, v8, OS_LOG_TYPE_DEFAULT, "teardownFollowUpWithContext called with context: %@", buf, 0xCu);
  }

  int v9 = [a1 _followupManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__FAFollowupManager_teardownFollowUpWithContext_completion___block_invoke;
  v11[3] = &unk_1E6924CA8;
  id v12 = v7;
  id v10 = v7;
  [v9 teardownFollowUpWithContext:v6 completion:v11];
}

void __60__FAFollowupManager_teardownFollowUpWithContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _FALogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D252C000, v6, OS_LOG_TYPE_DEFAULT, "Successfully cleared pending family followup items.", (uint8_t *)&v9, 2u);
    }
  }
  else if (v7)
  {
    v8 = [v5 debugDescription];
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl(&dword_1D252C000, v6, OS_LOG_TYPE_DEFAULT, "Failed to clear pending family followup items with error: %@", (uint8_t *)&v9, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_followupManager
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F5B768]) initWithClientIdentifier:@"com.icloud.family"];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F4F038]) initWithFLFollowupController:v2];
  id v4 = objc_alloc_init(MEMORY[0x1E4F4F040]);
  [v4 setExtensionIdentifier:@"com.apple.family.FAFollowupExtension"];
  [v4 setRepresentingBundlePath:@"/System/Library/PreferencePanes/FamilySharingPrefPane.prefPane"];
  [v4 setBundleIconName:@"iCloudFamily"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F4EFC8]) initWithFollowUpFactory:v4 provider:v3];

  return v5;
}

void __67__FAFollowupManager_tearDownFollowupItemWithIdentifier_completion___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_0(&dword_1D252C000, v2, v3, "Failed to teardown followup item with error: %@", v4, v5, v6, v7, 2u);
}

+ (void)synchronizeFollowupWithPayload:(os_log_t)log altDSID:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D252C000, log, OS_LOG_TYPE_DEBUG, "Family followup posted successfully.", v1, 2u);
}

+ (void)synchronizeFollowupWithPayload:(void *)a1 altDSID:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 debugDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1D252C000, a2, OS_LOG_TYPE_DEBUG, "Failed to post followup with error %@", (uint8_t *)&v4, 0xCu);
}

@end