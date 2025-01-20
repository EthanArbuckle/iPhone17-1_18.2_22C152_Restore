@interface VCMediaNegotiationBlobV2CameraSettingsU1(Utils)
- (void)videoRuleCollections;
@end

@implementation VCMediaNegotiationBlobV2CameraSettingsU1(Utils)

- (void)initWithSSRC:()Utils videoRuleCollections:screenSize:aspectRatioPortrait:aspectRatioLandscape:orientationMismatchAspectRatioLandscape:featureListStrings:u1AuthTagEnabled:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d setupVideoRuleCollection failed", v2, v3, v4, v5, v6);
}

- (void)addVideoRules:()Utils encodingType:payload:videoRuleCollections:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video rules", v2, v3, v4, v5, v6);
}

- (void)videoRuleCollections
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to add encoding rules", v2, v3, v4, v5, v6);
}

- (void)setupVideoRuleCollection:()Utils featureListStrings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate video payload", v2, v3, v4, v5, v6);
}

@end