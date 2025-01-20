@interface BMAccessControlPolicy(DaemonToAgent)
@end

@implementation BMAccessControlPolicy(DaemonToAgent)

- (void)allowsAccessToBiomeAgentForUser:()DaemonToAgent .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B30A0000, log, OS_LOG_TYPE_ERROR, "Cross-user not allowed", v1, 2u);
}

@end