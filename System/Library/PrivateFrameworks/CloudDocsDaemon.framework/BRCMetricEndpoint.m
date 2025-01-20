@interface BRCMetricEndpoint
- (BRCMetricEndpoint)initWithSession:(id)a3;
@end

@implementation BRCMetricEndpoint

- (BRCMetricEndpoint)initWithSession:(id)a3
{
  v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[BRCMetricEndpoint initWithSession:]();
  }

  return 0;
}

- (void)initWithSession:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: needs override%@", v1, 0xCu);
}

@end