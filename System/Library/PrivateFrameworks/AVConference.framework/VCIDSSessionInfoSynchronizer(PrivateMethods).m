@interface VCIDSSessionInfoSynchronizer(PrivateMethods)
@end

@implementation VCIDSSessionInfoSynchronizer(PrivateMethods)

- (void)checkVCIDSSessionInfoNeedUpdate:()PrivateMethods .cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 266;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d primary connection is nil", v1, 0x1Cu);
}

- (void)updateVCIDSSessionInfoResponse:()PrivateMethods .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No IDSSessionInfoResponse in the eventInfo!", v2, v3, v4, v5, v6);
}

- (void)optInStreamIDsForConnection:()PrivateMethods .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Primary connection is nil", v2, v3, v4, v5, v6);
}

- (void)optOutStreamIDsForNonPrimaryConnection:()PrivateMethods sentOnConnection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Connection is nil", v2, v3, v4, v5, v6);
}

@end