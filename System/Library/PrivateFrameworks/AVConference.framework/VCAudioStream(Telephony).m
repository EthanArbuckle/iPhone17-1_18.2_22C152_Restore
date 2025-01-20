@interface VCAudioStream(Telephony)
@end

@implementation VCAudioStream(Telephony)

- (void)setJitterBufferMode:()Telephony .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 64;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Audio receiver is not initialized", (uint8_t *)&v2, 0x1Cu);
}

- (void)handleCodecModeChangeEvent:()Telephony .cold.1(uint64_t a1, int *a2, os_log_t log)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v3 = *a2;
  int v4 = 136316162;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  v7 = "-[VCAudioStream(Telephony) handleCodecModeChangeEvent:]";
  __int16 v8 = 1024;
  int v9 = 144;
  __int16 v10 = 1024;
  int v11 = v3;
  __int16 v12 = 2048;
  uint64_t v13 = 0;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d codecType is invalid for payload=%d, codecType=%ld", (uint8_t *)&v4, 0x2Cu);
}

- (void)getCodecModeChangeEvent:()Telephony forCodecBitrate:payload:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 205;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d codecModeChangeEvent is invalid", (uint8_t *)&v2, 0x1Cu);
}

- (void)handleBasebandRateTrendSuggestion:()Telephony .cold.1()
{
  OUTLINED_FUNCTION_11_0();
  objc_msgSend((id)OUTLINED_FUNCTION_4_15(v0, *MEMORY[0x1E4F143B8]), "payload");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_8_12(&dword_1E1EA4000, v1, v2, " [%s] %s:%d codecType is invalid for payload=%d, codecType=%ld", v3, v4, v5, v6, v7);
}

- (void)handleANBR:()Telephony forDirection:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  objc_msgSend((id)OUTLINED_FUNCTION_4_15(v0, *MEMORY[0x1E4F143B8]), "payload");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_8_12(&dword_1E1EA4000, v1, v2, " [%s] %s:%d codecType is invalid for payload=%d, codecType=%ld", v3, v4, v5, v6, v7);
}

- (void)handleANBR:()Telephony forDirection:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  objc_msgSend((id)OUTLINED_FUNCTION_4_15(v0, *MEMORY[0x1E4F143B8]), "payload");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_6_1(&dword_1E1EA4000, v1, v2, " [%s] %s:%d codecRateMode is invalid for payload=%d, codecRateMode=%u", v3, v4, v5, v6, v7);
}

- (void)handleANBR:()Telephony forDirection:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  objc_msgSend((id)OUTLINED_FUNCTION_4_15(v0, *MEMORY[0x1E4F143B8]), "payload");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_6_1(&dword_1E1EA4000, v1, v2, " [%s] %s:%d codecBitrate is invalid for payload=%d, codecBitrate=%u", v3, v4, v5, v6, v7);
}

- (void)rateAdaptation:()Telephony targetBitrateDidChange:rateChangeCounter:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Target bitrate change not supported targetBitrate=%d", v2, v3, v4, 361);
}

- (void)rateAdaptation:()Telephony targetBitrateDidChange:rateChangeCounter:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Bitrate adaptation not supported payload=%d", v2, v3, v4, 360);
}

@end