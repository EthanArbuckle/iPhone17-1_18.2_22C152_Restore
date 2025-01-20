@interface VCMediaNegotiationBlobV2VideoPayload(Utils)
@end

@implementation VCMediaNegotiationBlobV2VideoPayload(Utils)

- (void)initWithPayload:()Utils encodeVideoRules:decodeVideoRules:videoParameterSupport:featureListStrings:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unknown video payload (%d)", v2, v3, v4, v5);
}

- (void)initWithPayload:()Utils encodeVideoRules:decodeVideoRules:videoParameterSupport:featureListStrings:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to encode the decode rules for payload (%d)", v2, v3, v4, v5);
}

- (void)initWithPayload:()Utils encodeVideoRules:decodeVideoRules:videoParameterSupport:featureListStrings:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to encode the encode rules for payload (%d)", v2, v3, v4, v5);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  int v5 = "-[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]";
  __int16 v6 = 1024;
  int v7 = 79;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate video rules", (uint8_t *)&v2, 0x1Cu);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [a2 videoPayload];
  int v6 = 136315906;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_9();
  int v9 = v5;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unknown video payload (%d)", (uint8_t *)&v6, 0x22u);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_13();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_13();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_13();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_9();
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_13();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.11()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.12()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.13()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.14()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_13();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.15()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.16()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.17()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.18()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_13();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.19()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.20()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.21()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.22()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.23()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.24()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.25()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.26()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.27()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.28()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.29()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.30()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.31()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_9();
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_2_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
}

- (void)setupEncode:()Utils videoRules:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v6 = [a2 iWidth];
  int v7 = [a2 iHeight];
  [a2 fRate];
  int v10 = 136316418;
  uint64_t v11 = a1;
  __int16 v12 = 2080;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_9();
  int v13 = v6;
  __int16 v14 = v8;
  int v15 = v7;
  __int16 v16 = 2048;
  uint64_t v17 = v9;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to add video format to negotiation blob: %dx%d %f", (uint8_t *)&v10, 0x32u);
}

@end