@interface _EXRunningUISceneExtension(UIApplicationDelegate)
@end

@implementation _EXRunningUISceneExtension(UIApplicationDelegate)

- (void)applicationWillResignActive:()UIApplicationDelegate .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)applicationDidBecomeActive:()UIApplicationDelegate .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)application:()UIApplicationDelegate configurationForConnectingSceneSession:options:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 sourceApplication];
  int v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_2156DD000, a2, OS_LOG_TYPE_DEBUG, "Received scene connection request from host: %{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)application:()UIApplicationDelegate configurationForConnectingSceneSession:options:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end