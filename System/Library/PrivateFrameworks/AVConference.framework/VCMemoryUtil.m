@interface VCMemoryUtil
@end

@implementation VCMemoryUtil

void __VCMemoryUtil_IsProbabilisticGuardMallocEnabled_block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  zone_name = malloc_get_zone_name(*(malloc_zone_t **)*MEMORY[0x1E4F14980]);
  if (zone_name) {
    BOOL v1 = strcmp(zone_name, "ProbGuardMallocZone") == 0;
  }
  else {
    BOOL v1 = 0;
  }
  VCMemoryUtil_IsProbabilisticGuardMallocEnabled_isProbabilisticGuardMallocEnabled = v1;
  BOOL BoolValueForKey = VCDefaults_GetBoolValueForKey(@"forceProbabilisticGuardMallocMode", v1);
  VCMemoryUtil_IsProbabilisticGuardMallocEnabled_isProbabilisticGuardMallocEnabled = BoolValueForKey;
  if (BoolValueForKey && (int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      v8 = "VCMemoryUtil_IsProbabilisticGuardMallocEnabled_block_invoke";
      __int16 v9 = 1024;
      int v10 = 26;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Probabilistic Guard Malloc enabled", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void __VCMemoryUtil_IsAddressSanitizerEnabled_block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  zone_name = (char *)malloc_get_zone_name(*(malloc_zone_t **)*MEMORY[0x1E4F14980]);
  if (zone_name) {
    BOOL v1 = strstr(zone_name, "asan") != 0;
  }
  else {
    BOOL v1 = 0;
  }
  VCMemoryUtil_IsAddressSanitizerEnabled_isASANEnabled = v1;
  BOOL BoolValueForKey = VCDefaults_GetBoolValueForKey(@"forceASANMode", v1);
  VCMemoryUtil_IsAddressSanitizerEnabled_isASANEnabled = BoolValueForKey;
  if (BoolValueForKey && (int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      v8 = "VCMemoryUtil_IsAddressSanitizerEnabled_block_invoke";
      __int16 v9 = 1024;
      int v10 = 40;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ASAN mode detected", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

@end