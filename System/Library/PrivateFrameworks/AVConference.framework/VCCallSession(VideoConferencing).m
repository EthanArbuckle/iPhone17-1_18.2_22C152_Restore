@interface VCCallSession(VideoConferencing)
@end

@implementation VCCallSession(VideoConferencing)

- (void)processBlackFrame:()VideoConferencing .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to get image buffer", v2, v3, v4, v5, v6);
}

- (float)onCaptureFrame:()VideoConferencing audioTS:audioHT:videoHT:cameraBits:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  float v3 = *(double *)(a2 + 24);
  int v4 = *(_DWORD *)(a2 + 48);
  int v6 = 136316162;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  v9 = "-[VCCallSession(VideoConferencing) onCaptureFrame:audioTS:audioHT:videoHT:cameraBits:]";
  __int16 v10 = 1024;
  int v11 = 110;
  __int16 v12 = 2048;
  double v13 = v3;
  __int16 v14 = 1024;
  int v15 = v4;
  _os_log_debug_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_DEBUG, "VCCallSession [%s] %s:%d AFRC Statistics packetLossPercentage=%3.3f burstPacketLoss=%d", (uint8_t *)&v6, 0x2Cu);
  return result;
}

- (void)initializeDisplayLinkWithError:()VideoConferencing .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to create VCDisplayLink", v2, v3, v4, v5, v6);
}

- (void)initializeDisplayLinkWithError:()VideoConferencing .cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to activate VCDisplayLink", v2, v3, v4, v5, v6);
}

- (void)updateSourcePlayoutTime:()VideoConferencing .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Provided playout time is NULL", v2, v3, v4, v5, v6);
}

@end