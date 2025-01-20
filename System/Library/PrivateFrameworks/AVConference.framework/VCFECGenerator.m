@interface VCFECGenerator
@end

@implementation VCFECGenerator

void ___VCFECGenerator_RegisterPeriodicReportingTask_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = (void *)(a2 + 96520);
    uint64_t v5 = selectDestinationForRTMetrics();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      v8 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v18 = v6;
          __int16 v19 = 2080;
          v20 = "_VCFECGenerator_PeriodicReportingTask";
          __int16 v21 = 1024;
          int v22 = 408;
          __int16 v23 = 2112;
          uint64_t v24 = v5;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCFECGenerator's payload='%@'", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        ___VCFECGenerator_RegisterPeriodicReportingTask_block_invoke_cold_1();
      }
    }
    theDict = (__CFDictionary *)v5;
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 96592));
    if (*v4)
    {
      uint64_t v11 = 0;
      int v12 = 0;
      do
      {
        v13 = (unsigned __int8 *)(a2 + 2 * v11 + 96528);
        CFStringRef v14 = CFStringCreateWithFormat(v9, 0, @"%d", *v13, theDict);
        *(_DWORD *)buf = v13[1];
        CFNumberRef v15 = CFNumberCreate(v9, kCFNumberIntType, buf);
        CFDictionaryAddValue(Mutable, v14, v15);
        CFRelease(v14);
        CFRelease(v15);
        uint64_t v11 = (unsigned __int16)++v12;
      }
      while (*v4 > (unint64_t)(unsigned __int16)v12);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 96592));
    CFDictionaryAddValue(theDict, @"VCFECGenVector", Mutable);
    CFRelease(Mutable);
  }
}

void ___VCFECGenerator_RegisterPeriodicReportingTask_block_invoke_cold_1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  v3 = "_VCFECGenerator_PeriodicReportingTask";
  OUTLINED_FUNCTION_3();
  int v4 = 408;
  __int16 v5 = 2112;
  uint64_t v6 = v0;
  _os_log_debug_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_DEBUG, " [%s] %s:%d VCFECGenerator's payload='%@'", v2, 0x26u);
}

@end