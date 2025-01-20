@interface AAFollowUpController(Convenience)
- (void)isRenewCredentialsCFUPosted;
@end

@implementation AAFollowUpController(Convenience)

- (void)dismissFollowUpsStartingWithIdentifierPrefix:()Convenience account:completion:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A11D8000, v1, OS_LOG_TYPE_DEBUG, "Attempting to teardown followups starting with identifier %@ for account: %@", v2, 0x16u);
}

- (void)isRenewCredentialsCFUPosted
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to fetch pending renew credentials CFU, error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)creationDateOfOldestFollowUpWithIdentifiers:()Convenience .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to fetch pending CFUs, error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)creationDateOfOldestFollowUpWithIdentifiers:()Convenience .cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "No follow ups with valid creation date found", v2, v3, v4, v5, v6);
}

- (void)creationDateOfOldestFollowUpWithIdentifiers:()Convenience .cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1A11D8000, v0, v1, "Attempting to fetch pending CFUs - %@", v2, v3, v4, v5, v6);
}

- (void)pendingFollowUpItemUserInfosWithIdentifier:()Convenience .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to fetch pending follow ups with Identifieer: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_pendingFollowUpItemsWithIdentifier:()Convenience forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Failed to fetch pending CFUs", v2, v3, v4, v5, v6);
}

- (void)_pendingFollowUpItemsWithIdentifier:()Convenience forAccount:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "Attempting to fetch pending CFUs", v2, v3, v4, v5, v6);
}

@end