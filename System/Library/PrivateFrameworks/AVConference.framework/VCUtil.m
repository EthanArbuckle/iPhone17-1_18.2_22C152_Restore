@interface VCUtil
@end

@implementation VCUtil

void ___VCUtil_GenerateTailspin_block_invoke(uint64_t a1)
{
  BOOL Tailspin = VCTailspinUtil_GenerateTailspin(*(unsigned int *)(a1 + 56), *(void *)(a1 + 48));
  close(*(_DWORD *)(a1 + 56));
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (Tailspin)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        ___VCUtil_GenerateTailspin_block_invoke_cold_1();
      }
    }
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      ___VCUtil_GenerateTailspin_block_invoke_cold_2();
    }
  }
  atomic_fetch_add(*(atomic_uint *volatile *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0xFFFFFFFF);
  free(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

void ___VCUtil_GenerateStackshot_block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  if ((WriteStackshotReport_stdc() & 1) == 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      ___VCUtil_GenerateStackshot_block_invoke_cold_1();
    }
  }
  free(*(void **)(*(void *)(*(void *)v1 + 8) + 24));
}

void ___VCUtil_GenerateSpindump_block_invoke(uint64_t a1)
{
  *(void *)&v22[1021] = *MEMORY[0x1E4F143B8];
  pid_t v2 = getpid();
  bzero(v22, 0x3FDuLL);
  memset(buffer, 63, sizeof(buffer));
  proc_name(v2, buffer, 0x400u);
  v3 = dispatch_semaphore_create(0);
  dispatch_retain(v3);
  memset(__b, 170, sizeof(__b));
  snprintf(__b, 0x400uLL, "AVConference PID:%d", v2);
  memset(__str, 170, sizeof(__str));
  snprintf(__str, 0x400uLL, "%s", *(const char **)(a1 + 40));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      v10 = "_VCUtil_GenerateSpindump_block_invoke";
      __int16 v11 = 1024;
      int v12 = 1665;
      __int16 v13 = 2080;
      v14 = buffer;
      __int16 v15 = 1024;
      pid_t v16 = v2;
      __int16 v17 = 2080;
      v18 = __b;
      _os_log_error_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_ERROR, " [%s] %s:%d ##### Triggering a spindump on %s (PID:%d) signatureCString=%s", buf, 0x36u);
    }
  }
  SPGenerateSpindump();
  dispatch_time_t v6 = dispatch_time(0, 165000000000);
  dispatch_semaphore_wait(v3, v6);
  atomic_fetch_add(*(atomic_uint *volatile *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), 0xFFFFFFFF);
  if (v3) {
    dispatch_release(v3);
  }
}

void ___VCUtil_GenerateSpindump_block_invoke_116(uint64_t a1, int a2, const char *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v8 = 136316162;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      __int16 v11 = "_VCUtil_GenerateSpindump_block_invoke";
      __int16 v12 = 1024;
      int v13 = 1668;
      __int16 v14 = 1024;
      int v15 = a2;
      __int16 v16 = 2080;
      __int16 v17 = a3;
      _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d ##### spindump (error=%d) written to file \"%s\"", (uint8_t *)&v8, 0x2Cu);
    }
  }
  VRLogfileZipOnly(a3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

uint64_t ___VCUtil_DiagnosticsAtomicSharedInstance_block_invoke(uint64_t result)
{
  **(_DWORD **)(result + 32) = 0;
  return result;
}

void ___VCUtil_GenerateTailspin_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_6_6();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d ##### Finished dumping tailspin to file \"%s\"", v2, v3, v4, v5);
}

void ___VCUtil_GenerateTailspin_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_6_6();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d ##### Failed to dump tailspin to file \"%s\"", v2, v3, v4, v5);
}

void ___VCUtil_GenerateStackshot_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_6_6();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d ##### WriteStackshotReport_stdc failed.  No stackshot generated for reason=%s", v2, v3, v4, v5);
}

@end