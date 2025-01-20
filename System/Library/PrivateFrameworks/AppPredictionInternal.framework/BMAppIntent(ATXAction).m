@interface BMAppIntent(ATXAction)
- (id)atxAction;
- (void)atxAction;
@end

@implementation BMAppIntent(ATXAction)

- (id)atxAction
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  v3 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v4 = objc_opt_class();
  v5 = [a1 interaction];
  id v15 = 0;
  v6 = [v3 unarchivedObjectOfClass:v4 fromData:v5 error:&v15];
  id v7 = v15;

  if (v6)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F4AE38]);
    v9 = [v6 intent];
    v10 = objc_opt_new();
    v11 = [a1 bundleID];
    LOBYTE(v14) = 0;
    v12 = (void *)[v8 initWithIntent:v9 actionUUID:v10 bundleId:v11 heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v14 title:0 subtitle:0];
  }
  else
  {
    v9 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(BMAppIntent(ATXAction) *)(uint64_t)v7 atxAction];
    }
    v12 = 0;
  }

  return v12;
}

- (void)atxAction
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "IntentEventIsCompleteEngagement - Error unarchiving intent: %@", (uint8_t *)&v2, 0xCu);
}

@end