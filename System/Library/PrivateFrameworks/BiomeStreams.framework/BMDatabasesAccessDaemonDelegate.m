@interface BMDatabasesAccessDaemonDelegate
- (BOOL)handlesDirectoryCreationForResource:(id)a3 inContainer:(id)a4;
- (BOOL)handlesDirectoryRemovalForResource:(id)a3 inContainer:(id)a4;
- (BOOL)prepareResource:(id)a3 withMode:(unint64_t)a4 inContainer:(id)a5;
- (BOOL)teardownResource:(id)a3 inContainer:(id)a4;
@end

@implementation BMDatabasesAccessDaemonDelegate

- (BOOL)handlesDirectoryCreationForResource:(id)a3 inContainer:(id)a4
{
  return 0;
}

- (BOOL)handlesDirectoryRemovalForResource:(id)a3 inContainer:(id)a4
{
  return 0;
}

- (BOOL)prepareResource:(id)a3 withMode:(unint64_t)a4 inContainer:(id)a5
{
  id v6 = a3;
  v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BMDatabasesAccessDaemonDelegate prepareResource:withMode:inContainer:]((uint64_t)v6, a4, v7);
  }

  v8 = [v6 name];
  BOOL v9 = +[BMDatabaseInitializer initializeSQLDatabaseWithIdentifier:v8];

  return v9;
}

- (BOOL)teardownResource:(id)a3 inContainer:(id)a4
{
  return 0;
}

- (void)prepareResource:(uint64_t)a1 withMode:(uint64_t)a2 inContainer:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = BMAccessModePrintableDescription();
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  BOOL v9 = v5;
  _os_log_debug_impl(&dword_18E67D000, a3, OS_LOG_TYPE_DEBUG, "BMDatabasesAccessDaemonDelegate preparing resource %{public}@ for mode %{public}@", (uint8_t *)&v6, 0x16u);
}

@end