@interface SOAuthorizationCore(Core)
@end

@implementation SOAuthorizationCore(Core)

- (void)beginAuthorizationWithRequestParameters:()Core completion:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = [a1 identifier];
  v6[0] = 136315650;
  OUTLINED_FUNCTION_3_0();
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1D7206000, a3, OS_LOG_TYPE_DEBUG, "%s requestIdentifier = %{public}@ on %@", (uint8_t *)v6, 0x20u);
}

- (void)performBlockOnDelegateQueue:()Core .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *(__CFString **)(a1 + 40);
  v4 = "-[SOAuthorizationCore(Core) performBlockOnDelegateQueue:]";
  int v3 = 136315650;
  if (!v2) {
    v2 = @"main_queue";
  }
  __int16 v5 = 2114;
  v6 = v2;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  _os_log_debug_impl(&dword_1D7206000, a2, OS_LOG_TYPE_DEBUG, "%s queue = %{public}@ on %@", (uint8_t *)&v3, 0x20u);
}

- (void)finishAuthorization:()Core completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  int v3 = "-[SOAuthorizationCore(Core) finishAuthorization:completion:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1D7206000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

- (void)createSecKeysFromSecKeyProxyEndpoints:()Core error:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D7206000, a2, OS_LOG_TYPE_ERROR, "failed to create SecKey from SecKeyProxyEndpoint: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)createSecKeysFromSecKeyProxyEndpoints:()Core error:.cold.2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_3_0();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_1D7206000, v1, OS_LOG_TYPE_DEBUG, "%s %{public}@ on %@", (uint8_t *)v2, 0x20u);
}

@end