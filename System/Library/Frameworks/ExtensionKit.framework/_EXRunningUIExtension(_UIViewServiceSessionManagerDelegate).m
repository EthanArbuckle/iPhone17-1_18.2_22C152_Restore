@interface _EXRunningUIExtension(_UIViewServiceSessionManagerDelegate)
- (void)installRunloopObserverToPingLaunchdAfterEvent;
@end

@implementation _EXRunningUIExtension(_UIViewServiceSessionManagerDelegate)

- (void)viewServiceSessionManager:()_UIViewServiceSessionManagerDelegate didCreateViewController:contextToken:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2156DD000, a2, OS_LOG_TYPE_ERROR, "Session is not found for %{public}@ context token", (uint8_t *)&v2, 0xCu);
}

- (void)viewServiceSessionManager:()_UIViewServiceSessionManagerDelegate didCreateViewController:contextToken:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7[0] = 136316162;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  v7[6] = 88;
  __int16 v8 = 2114;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  uint64_t v11 = v6;
}

- (void)viewServiceSessionManager:()_UIViewServiceSessionManagerDelegate didCreateViewController:contextToken:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_opt_class();
  v5[0] = 136315906;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  v5[6] = 84;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
}

- (void)viewServiceSessionManager:()_UIViewServiceSessionManagerDelegate didCreateViewController:contextToken:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_2156DD000, v0, v1, "Received UI session root view controller from UIKit", v2, v3, v4, v5, v6);
}

- (void)installRunloopObserverToPingLaunchdAfterEvent
{
  __assert_rtn("-[_EXRunningUIExtension(_UIViewServiceSessionManagerDelegate) installRunloopObserverToPingLaunchdAfterEvent]", "EXRunningUIExtension.m", 130, "mainRunLoop != NULL");
}

@end