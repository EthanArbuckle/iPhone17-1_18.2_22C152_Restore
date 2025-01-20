@interface DBMutableWorkspaceStateChangeRequest(Dashboard)
@end

@implementation DBMutableWorkspaceStateChangeRequest(Dashboard)

- (void)deactivateApplication:()Dashboard .cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Attempt to deactivate application with nil appInfo", v2, v3, v4, v5, v6);
}

- (void)destroyApplication:()Dashboard .cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Attempt to destroy application with nil appInfo", v2, v3, v4, v5, v6);
}

- (void)activateApplication:()Dashboard .cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Attempt to activate application with nil appInfo", v2, v3, v4, v5, v6);
}

- (void)activateStackedApplication:()Dashboard .cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Attempt to activate stacked application with nil appInfo", v2, v3, v4, v5, v6);
}

@end