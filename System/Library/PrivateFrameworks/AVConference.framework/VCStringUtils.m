@interface VCStringUtils
+ (BOOL)convertString:(id)a3 toFourcc:(unsigned int *)a4;
@end

@implementation VCStringUtils

+ (BOOL)convertString:(id)a3 toFourcc:(unsigned int *)a4
{
  if (a4)
  {
    if (a3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([a3 length] == 4)
        {
          *a4 = CStrToFourcc((char *)[a3 UTF8String]);
          LOBYTE(v6) = 1;
          return v6;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v7 = VRTraceErrorLogLevelToCSTR();
          v8 = *MEMORY[0x1E4F47A50];
          BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v6) {
            return v6;
          }
          +[VCStringUtils convertString:toFourcc:](v7, a3, v8);
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v6) {
          return v6;
        }
        +[VCStringUtils convertString:toFourcc:].cold.4();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      +[VCStringUtils convertString:toFourcc:]();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v6) {
      return v6;
    }
    +[VCStringUtils convertString:toFourcc:]();
  }
  LOBYTE(v6) = 0;
  return v6;
}

+ (void)convertString:toFourcc:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d fourcc pointer is NULL", v2, v3, v4, v5, v6);
}

+ (void)convertString:toFourcc:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d fourccString is nil", v2, v3, v4, v5, v6);
}

+ (void)convertString:(NSObject *)a3 toFourcc:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [a2 length];
  int v7 = 136316162;
  uint64_t v8 = a1;
  OUTLINED_FUNCTION_0();
  int v9 = 22;
  __int16 v10 = 2112;
  v11 = a2;
  __int16 v12 = 2048;
  uint64_t v13 = v6;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid fourcc string=%@ length=%lu", (uint8_t *)&v7, 0x30u);
}

+ (void)convertString:toFourcc:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid fourcc string class", v2, v3, v4, v5, v6);
}

@end