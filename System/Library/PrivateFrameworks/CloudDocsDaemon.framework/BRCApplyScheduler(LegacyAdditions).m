@interface BRCApplyScheduler(LegacyAdditions)
@end

@implementation BRCApplyScheduler(LegacyAdditions)

- (void)startWriteCoordinationInAppLibrary:()LegacyAdditions .cold.1(id *a1)
{
  [*a1 totalCount];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Apply Changes: reached maximum allowed number of coordinations (%ld)%@", v3, v4, v5, v6, v7);
}

- (void)endWriteCoordinationInAppLibrary:()LegacyAdditions rowID:.cold.1(id *a1)
{
  [*a1 totalCount];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Apply Changes: below half maximum allowed number of coordinations (%ld)%@", v3, v4, v5, v6, v7);
}

- (void)endWriteCoordinationInAppLibrary:()LegacyAdditions rowID:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: no writer for zone %@%@", v1, 0x16u);
}

- (void)endWriteCoordinationInAppLibrary:()LegacyAdditions rowID:.cold.3()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Apply Changes[%lld]: Skipping rescheduling because throttle was not suspended for coordination%@");
}

- (void)endWriteCoordinationInAppLibrary:()LegacyAdditions rowID:.cold.4()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Apply Changes[%lld]: Rescheduling because coordination completed%@");
}

- (void)monitorFaultingForZone:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Monitoring faulting for %@%@");
}

- (void)stopMonitoringFaultingForZone:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Stop monitoring faulting for %@%@");
}

@end