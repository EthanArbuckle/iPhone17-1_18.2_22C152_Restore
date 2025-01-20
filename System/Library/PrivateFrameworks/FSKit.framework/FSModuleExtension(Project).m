@interface FSModuleExtension(Project)
@end

@implementation FSModuleExtension(Project)

+ (void)moduleExtensionForAppex:()Project .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendWipeResource:()Project replyHandler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = [a1 bundleID];
  int v5 = 136315394;
  v6 = "-[FSModuleExtension(Project) sendWipeResource:replyHandler:]";
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_24DDB2000, a2, v4, "%s: %{public}@ no connector talking to fskitd is available", (uint8_t *)&v5);
}

- (void)sendWipeResource:()Project replyHandler:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendWipeResource:()Project replyHandler:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendIsVolumeUsed:()Project bundle:replyHandler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = [a1 bundleID];
  int v5 = 136315394;
  v6 = "-[FSModuleExtension(Project) sendIsVolumeUsed:bundle:replyHandler:]";
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_24DDB2000, a2, v4, "%s: %{public}@ no connector talking to fskitd is available", (uint8_t *)&v5);
}

- (void)sendIsVolumeUsed:()Project bundle:replyHandler:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendIsVolumeUsed:()Project bundle:replyHandler:.cold.3()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_24DDB2000, v0, v1, "%s:start:volumeID(%@):bundleID(%@)", v2);
}

- (void)sendConfigureUserClient:()Project replyHandler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = [a1 bundleID];
  int v5 = 136315394;
  v6 = "-[FSModuleExtension(Project) sendConfigureUserClient:replyHandler:]";
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_24DDB2000, a2, v4, "%s: %{public}@ no connector talking to fskitd is available", (uint8_t *)&v5);
}

- (void)sendConfigureUserClient:()Project replyHandler:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendConfigureUserClient:()Project replyHandler:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_24DDB2000, v0, v1, "%s:start:userClient(%@)", (uint8_t *)v2);
}

@end