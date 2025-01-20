@interface BMDaemon(Pruning)
@end

@implementation BMDaemon(Pruning)

+ (void)pruneRestrictedStreamsInDomain:()Pruning account:activity:.cold.1()
{
  OUTLINED_FUNCTION_1_8();
  v3 = [MEMORY[0x1E4F4FB78] privacyPathname:v2];
  _DWORD *v1 = 138412290;
  void *v0 = v3;
  OUTLINED_FUNCTION_0_11(&dword_18E67D000, v4, v5, "Ignoring non-directory file while pruning %@");
}

+ (void)pruneFeatureStoreWithActivity:()Pruning .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "Unable to locate FeatureStore for pruning!", v1, 2u);
}

+ (void)pruneTemporaryFilesInDirectory:()Pruning .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F4FB78] privacyPathname:a1];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "Failed to enumerate temporary files for pruning in directory: %{public}@", (uint8_t *)&v4, 0xCu);
}

+ (void)pruneTemporaryFilesInDirectory:()Pruning .cold.2()
{
  OUTLINED_FUNCTION_1_8();
  uint64_t v2 = (void *)MEMORY[0x1E4F4FB78];
  int v4 = [v3 path];
  uint64_t v5 = [v2 privacyPathname:v4];
  _DWORD *v1 = 138543362;
  void *v0 = v5;
  OUTLINED_FUNCTION_0_11(&dword_18E67D000, v6, v7, "Pruning removed temporary file: %{public}@");
}

@end