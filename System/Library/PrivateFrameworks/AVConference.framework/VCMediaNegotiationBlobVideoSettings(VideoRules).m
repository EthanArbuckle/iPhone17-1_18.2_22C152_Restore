@interface VCMediaNegotiationBlobVideoSettings(VideoRules)
- (void)newCameraConfiguration;
@end

@implementation VCMediaNegotiationBlobVideoSettings(VideoRules)

- (void)initWithSSRC:()VideoRules allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create video rules media blob entries", v2, v3, v4, v5, v6);
}

- (void)initWithScreenSSRC:()VideoRules allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:customVideoWidth:customVideoHeight:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:fecEnabled:rtxEnabled:blackFrameOnClearScreenEnabled:foveationSupported:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create screen sharing media blob entries", v2, v3, v4, v5, v6);
}

- (void)setVideoRuleCollections:()VideoRules featureStrings:isScreen:isCellular16x9Capable:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [a2 unsignedIntValue];
  int v7 = 136315906;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  OUTLINED_FUNCTION_3_0();
  int v10 = 372;
  __int16 v11 = v5;
  int v12 = v6;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid parameter set for payload %u", (uint8_t *)&v7, 0x22u);
}

- (void)setVideoRuleCollections:()VideoRules featureStrings:isScreen:isCellular16x9Capable:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v6 = [a2 iWidth];
  int v7 = [a2 iHeight];
  [a2 fRate];
  int v10 = 136316418;
  uint64_t v11 = a1;
  __int16 v12 = 2080;
  OUTLINED_FUNCTION_3_0();
  int v13 = 509;
  __int16 v14 = v8;
  int v15 = v6;
  __int16 v16 = v8;
  int v17 = v7;
  __int16 v18 = 2048;
  uint64_t v19 = v9;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to add video format to negotiation blob: %dx%d %f", (uint8_t *)&v10, 0x32u);
}

- (void)newVideoRuleCollectionsForScreen:()VideoRules isCellular16x9Capable:isLocalConfig:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) newVideoRuleCollectionsForScreen:isCellular16x9"
                       "Capable:isLocalConfig:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, a2, a3, " [%s] %s:%d Failed to allocate video rule collection (screen=%d)", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCMediaNegotiationBlobVideoSettings(VideoRules) newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:]" >> 16, 560);
}

- (void)newVideoRuleCollectionsForScreen:()VideoRules isCellular16x9Capable:isLocalConfig:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate video rules array (screen=%d)", v2, v3, v4, v5);
}

- (void)newCameraConfiguration
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate videoFeatureStrings", v2, v3, v4, v5, v6);
}

- (void)newScreenConfigurationWithCameraConfiguration:()VideoRules .cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v3 = 713;
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to copy cameraConfiguration=%@", v2, 0x26u);
}

@end