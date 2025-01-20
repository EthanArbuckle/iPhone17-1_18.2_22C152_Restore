@interface EXAuditTokenForCurrentProcess
@end

@implementation EXAuditTokenForCurrentProcess

void ___EXAuditTokenForCurrentProcess_block_invoke()
{
  kern_return_t v0;
  int v1;
  NSObject *v2;
  mach_msg_type_number_t task_info_outCnt;

  task_info_outCnt = 8;
  v0 = task_info(*MEMORY[0x1E4F14960], 0xFu, _EXAuditTokenForCurrentProcess_sOurAuditToken, &task_info_outCnt);
  if (v0)
  {
    v1 = v0;
    v2 = _EXDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      ___EXAuditTokenForCurrentProcess_block_invoke_cold_1(v1, v2);
    }
  }
  else
  {
    _EXAuditTokenForCurrentProcess_result = (uint64_t)_EXAuditTokenForCurrentProcess_sOurAuditToken;
  }
}

void ___EXAuditTokenForCurrentProcess_block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_191F29000, a2, OS_LOG_TYPE_ERROR, "Failed to get audit token for current process: %llx", (uint8_t *)&v2, 0xCu);
}

@end