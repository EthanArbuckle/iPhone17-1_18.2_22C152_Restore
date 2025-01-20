@interface LSDefaultApplicationQueryDatabaseDefaultAppEvaluator
- (id)URLOfDefaultAppForCategory:(unint64_t)a3;
@end

@implementation LSDefaultApplicationQueryDatabaseDefaultAppEvaluator

- (id)URLOfDefaultAppForCategory:(unint64_t)a3
{
  v3 = LSGetDefaultAppCategoryInfoForCategory(a3);
  v4 = [LSClaimBinding alloc];
  uint64_t v5 = *((void *)v3 + 1);
  id v11 = 0;
  v6 = [(LSClaimBinding *)v4 initWithTypeIdentifier:v5 error:&v11];
  id v7 = v11;
  if (v6)
  {
    v8 = [(LSClaimBinding *)v6 bundleRecord];
    v9 = [v8 URL];
  }
  else
  {
    v8 = _LSDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[LSDefaultApplicationQueryDatabaseDefaultAppEvaluator URLOfDefaultAppForCategory:]();
    }
    v9 = 0;
  }

  return v9;
}

- (void)URLOfDefaultAppForCategory:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "No best app for %@: %@");
}

@end