@interface VCAudioTierPickerPlistEntry
- (BOOL)configure:(id)a3;
- (NSString)featureFlag;
- (VCAudioTierPickerPlistEntry)initWithDictionary:(id)a3;
- (int)payload;
- (unint64_t)codecBitrate;
- (unint64_t)packetsPerBundle;
- (unint64_t)redNumPayloads;
- (void)dealloc;
- (void)setCodecBitrate:(unint64_t)a3;
- (void)setFeatureFlag:(id)a3;
- (void)setPacketsPerBundle:(unint64_t)a3;
- (void)setPayload:(int)a3;
- (void)setRedNumPayloads:(unint64_t)a3;
@end

@implementation VCAudioTierPickerPlistEntry

- (VCAudioTierPickerPlistEntry)initWithDictionary:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCAudioTierPickerPlistEntry;
  v4 = [(VCAudioTierPickerPlistEntry *)&v7 init];
  v5 = v4;
  if (v4 && ![(VCAudioTierPickerPlistEntry *)v4 configure:a3])
  {

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioTierPickerPlistEntry;
  [(VCAudioTierPickerPlistEntry *)&v3 dealloc];
}

- (BOOL)configure:(id)a3
{
  v5 = (void *)[a3 objectForKeyedSubscript:@"payload"];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      -[VCAudioTierPickerPlistEntry configure:]();
    }
LABEL_18:
    LOBYTE(v9) = 0;
    return v9;
  }
  self->_payload = [v5 integerValue];
  v6 = (void *)[a3 objectForKeyedSubscript:@"codecBitrate"];
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      -[VCAudioTierPickerPlistEntry configure:]();
    }
    goto LABEL_18;
  }
  self->_codecBitrate = [v6 unsignedIntegerValue];
  objc_super v7 = (void *)[a3 objectForKeyedSubscript:@"packetsPerBundle"];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      -[VCAudioTierPickerPlistEntry configure:]();
    }
    goto LABEL_18;
  }
  self->_packetsPerBundle = [v7 unsignedIntegerValue];
  uint64_t v8 = (void *)[a3 objectForKeyedSubscript:@"redNumPayloads"];
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      -[VCAudioTierPickerPlistEntry configure:].cold.4();
    }
    goto LABEL_18;
  }
  self->_redNumPayloads = [v8 unsignedIntegerValue];
  self->_featureFlag = (NSString *)(id)[a3 objectForKeyedSubscript:@"featureFlag"];
  LOBYTE(v9) = 1;
  return v9;
}

- (int)payload
{
  return self->_payload;
}

- (void)setPayload:(int)a3
{
  self->_payload = a3;
}

- (unint64_t)codecBitrate
{
  return self->_codecBitrate;
}

- (void)setCodecBitrate:(unint64_t)a3
{
  self->_codecBitrate = a3;
}

- (unint64_t)packetsPerBundle
{
  return self->_packetsPerBundle;
}

- (void)setPacketsPerBundle:(unint64_t)a3
{
  self->_packetsPerBundle = a3;
}

- (unint64_t)redNumPayloads
{
  return self->_redNumPayloads;
}

- (void)setRedNumPayloads:(unint64_t)a3
{
  self->_redNumPayloads = a3;
}

- (NSString)featureFlag
{
  return self->_featureFlag;
}

- (void)setFeatureFlag:(id)a3
{
}

- (void)configure:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Missing %@", v2, v3, v4, v5, v6);
}

- (void)configure:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Missing %@", v2, v3, v4, v5, v6);
}

- (void)configure:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Missing %@", v2, v3, v4, v5, v6);
}

- (void)configure:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Missing %@", v2, v3, v4, v5, v6);
}

@end