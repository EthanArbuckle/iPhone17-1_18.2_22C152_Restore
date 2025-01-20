@interface DEDBugSession(DaemonTasks)
- (void)hasStaleDirectory;
- (void)state;
@end

@implementation DEDBugSession(DaemonTasks)

- (void)state
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "BugSession has pending operations but isn't finishing, uploading  or compressing. Returning .unknown", v1, 2u);
}

- (void)hasStaleDirectory
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = [a1 identifier];
  int v6 = 138543618;
  v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_21FE04000, a3, OS_LOG_TYPE_ERROR, "Error getting [%{public}@] directory metadata with error: [%{public}@]", (uint8_t *)&v6, 0x16u);
}

@end