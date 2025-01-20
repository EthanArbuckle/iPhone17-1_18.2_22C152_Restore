@interface VCMediaNegotiationBlobV2SettingsU1(Utils)
@end

@implementation VCMediaNegotiationBlobV2SettingsU1(Utils)

- (void)initWithU1Config:()Utils .cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 28;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d U1 config is nil", v1, 0x1Cu);
}

- (void)initWithU1Config:()Utils .cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 32;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to load encodeDecodeFeatures to U1 Settings", v1, 0x1Cu);
}

+ (void)negotiationCipherSuiteFromMediaStreamCipherSuite:()Utils .cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  v5 = "+[VCMediaNegotiationBlobV2SettingsU1(Utils) negotiationCipherSuiteFromMediaStreamCipherSuite:]";
  __int16 v6 = 1024;
  int v7 = 139;
  __int16 v8 = 2048;
  uint64_t v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Passing unsupported mediaStreamCipherSuite=%ld for negotiation transform.", v3, 0x26u);
}

@end