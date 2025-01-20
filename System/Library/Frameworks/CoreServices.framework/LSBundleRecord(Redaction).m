@interface LSBundleRecord(Redaction)
- (void)redact;
@end

@implementation LSBundleRecord(Redaction)

- (void)redact
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_182959000, v0, OS_LOG_TYPE_FAULT, "bundle record %@ is not eligible for redaction", v1, 0xCu);
}

- (void)unredactWithError:()Redaction .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182959000, log, OS_LOG_TYPE_FAULT, "Current process may not map the database, so it may not unredact records.", v1, 2u);
}

@end