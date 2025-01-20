@interface NSBundle(VCAdditions)
+ (uint64_t)plistForClass:()VCAdditions withPath:defaultOverride:;
+ (uint64_t)plistFromDefaultOverride:()VCAdditions;
@end

@implementation NSBundle(VCAdditions)

+ (uint64_t)plistFromDefaultOverride:()VCAdditions
{
  v3 = (void *)VCDefaults_CopyStringValueForKey(a3);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v3) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[NSBundle(VCAdditions) plistFromDefaultOverride:]();
      }
    }
    goto LABEL_10;
  }
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v3];
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[NSBundle(VCAdditions) plistFromDefaultOverride:]();
      }
    }
LABEL_10:
    uint64_t v4 = 0;
  }

  return v4;
}

+ (uint64_t)plistForClass:()VCAdditions withPath:defaultOverride:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[NSBundle(VCAdditions) plistForClass:withPath:defaultOverride:](v17, v18);
      }
    }
    return 0;
  }
  if (!a5) {
    goto LABEL_21;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315906;
      uint64_t v21 = v8;
      __int16 v22 = 2080;
      v23 = "+[NSBundle(VCAdditions) plistForClass:withPath:defaultOverride:]";
      __int16 v24 = 1024;
      int v25 = 34;
      __int16 v26 = 2112;
      v27 = a5;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Loading plist from file: path=%@", (uint8_t *)&v20, 0x26u);
    }
  }
  uint64_t v10 = [MEMORY[0x1E4F28B50] plistFromDefaultOverride:a5];
  if (!v10)
  {
LABEL_21:
    v11 = (void *)[a4 copy];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315906;
        uint64_t v21 = v12;
        __int16 v22 = 2080;
        v23 = "+[NSBundle(VCAdditions) plistForClass:withPath:defaultOverride:]";
        __int16 v24 = 1024;
        int v25 = 39;
        __int16 v26 = 2112;
        v27 = v11;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Loading plist from bundle: path=%@", (uint8_t *)&v20, 0x26u);
      }
    }
    uint64_t v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", a3), "pathForResource:ofType:", v11, @"plist");
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v14];

    if (!v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v20 = 136316162;
          uint64_t v21 = v15;
          __int16 v22 = 2080;
          v23 = "+[NSBundle(VCAdditions) plistForClass:withPath:defaultOverride:]";
          __int16 v24 = 1024;
          int v25 = 45;
          __int16 v26 = 2112;
          v27 = a4;
          __int16 v28 = 2112;
          v29 = a5;
          _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to load the resource at path=%@ defaultOverride=%@", (uint8_t *)&v20, 0x30u);
        }
      }
      return 0;
    }
  }
  return v10;
}

+ (void)plistFromDefaultOverride:()VCAdditions .cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Configuration plist specified but the file could not be loaded: path=%@");
}

+ (void)plistFromDefaultOverride:()VCAdditions .cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Configuration plist specified but the path is invalid: path=%@");
}

+ (void)plistForClass:()VCAdditions withPath:defaultOverride:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  v5 = "+[NSBundle(VCAdditions) plistForClass:withPath:defaultOverride:]";
  __int16 v6 = 1024;
  int v7 = 29;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d resourcePath is nil", (uint8_t *)&v2, 0x1Cu);
}

@end