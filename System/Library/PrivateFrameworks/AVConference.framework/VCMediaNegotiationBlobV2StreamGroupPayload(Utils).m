@interface VCMediaNegotiationBlobV2StreamGroupPayload(Utils)
@end

@implementation VCMediaNegotiationBlobV2StreamGroupPayload(Utils)

- (void)initWithPayloadConfig:()Utils rtpSampleRate:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  [v0 codecType];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to encode the codec=%d", v3, v4, v5, v6, v7);
}

- (void)initWithPayloadConfig:()Utils rtpSampleRate:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  [v0 cipherSuite];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to encode the cipherSuite=%d", v3, v4, v5, v6, v7);
}

- (void)initWithPayloadConfig:()Utils rtpSampleRate:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid payload config", v2, v3, v4, v5, v6);
}

- (void)initWithPayloadConfig:()Utils index:rtpSampleRate:streamGroupID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid payload config", v2, v3, v4, v5, v6);
}

- (void)initWithPayloadConfig:()Utils index:rtpSampleRate:streamGroupID:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  objc_msgSend((id)OUTLINED_FUNCTION_12_6(v0, *MEMORY[0x1E4F143B8]), "H264PacketizationMode");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Unsupported H264PacketizationMode=%d", v3, v4, v5, v6, v7);
}

- (void)initWithPayloadConfig:()Utils index:rtpSampleRate:streamGroupID:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  objc_msgSend((id)OUTLINED_FUNCTION_12_6(v0, *MEMORY[0x1E4F143B8]), "H264LevelAsymmetryAllowed");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Unsupported H264LevelAsymmetryAllowed=%d", v3, v4, v5, v6, v7);
}

- (void)initWithPayloadConfig:()Utils index:rtpSampleRate:streamGroupID:.cold.4()
{
  OUTLINED_FUNCTION_11_0();
  [v0 cipherSuite];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Unsupported cipher suite (%u)", v3, v4, v5, v6, v7);
}

- (void)initWithPayloadConfig:()Utils index:rtpSampleRate:streamGroupID:.cold.5()
{
  OUTLINED_FUNCTION_11_0();
  [v0 codecType];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to encode the codec=%d", v3, v4, v5, v6, v7);
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d codecType=%u is too large for packed format", v2, v3, v4, v5);
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  objc_msgSend((id)OUTLINED_FUNCTION_12_6(v0, *MEMORY[0x1E4F143B8]), "rtpPayload");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d rtpPayload=%u is too large for packed format", v3, v4, v5, v6, v7);
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d rtcpFlags=%u is too large for packed format", v2, v3, v4, v5);
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d rtpSampleRate=%u is too large for packed format", v2, v3, v4, v5);
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unknown rtpSampleRate=%u", v2, v3, v4, v5);
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d negotiationCipherSuite=%u is too large for packed format", v2, v3, v4, v5);
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d mediaFlags=%u is too large for packed format", v2, v3, v4, v5);
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate VCMediaNegotiationBlobV2StreamGroupPayload (extension)", v2, v3, v4, v5, v6);
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.9()
{
  OUTLINED_FUNCTION_11_0();
  objc_msgSend((id)OUTLINED_FUNCTION_12_6(v1, *MEMORY[0x1E4F143B8]), "pTime");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  int v4 = 777;
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d pTime=%lu is too large for packed format or is not", v3, 0x26u);
}

@end