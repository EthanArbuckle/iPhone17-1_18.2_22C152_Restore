@interface VCMediaNegotiationBlobV2StreamGroup(Utils)
@end

@implementation VCMediaNegotiationBlobV2StreamGroup(Utils)

- (void)initWithStreamGroupConfig:()Utils defaultConfig:.cold.1()
{
  OUTLINED_FUNCTION_6_11();
  FourccToCStr([v1 groupID]);
  FourccToCStr([v0 mediaType]);
  FourccToCStr([v0 mediaSubtype]);
  FourccToCStr([v0 syncGroupID]);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_9_8(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Invalid combination of groupID='%s' mediaType='%s' mediaSubtype='%s' syncGroupID='%s'", v4, v5, v6, v7, 2u);
}

- (void)initWithStreamGroupConfig:()Utils defaultConfig:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  FourccToCStr([v0 groupID]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to setup streams for groupID='%s'", v3, v4, v5, v6, v7);
}

- (void)initWithStreamGroupConfig:()Utils defaultConfig:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  FourccToCStr([v0 groupID]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to setup payloads for groupID='%s'", v3, v4, v5, v6, v7);
}

- (void)initWithStreamGroupConfig:()Utils defaultConfig:.cold.4()
{
  OUTLINED_FUNCTION_11_0();
  FourccToCStr([v0 groupID]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to create the U1 config for groupID='%s'", v3, v4, v5, v6, v7);
}

- (void)initWithStreamGroupConfig:()Utils defaultConfig:.cold.5()
{
  OUTLINED_FUNCTION_6_11();
  FourccToCStr([v1 groupID]);
  FourccToCStr([v0 mediaType]);
  FourccToCStr([v0 mediaSubtype]);
  FourccToCStr([v0 syncGroupID]);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_9_8(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Invalid combination of groupID='%s' mediaType='%s' mediaSubtype='%s' syncGroupID='%s'", v4, v5, v6, v7, 2u);
}

- (void)initWithStreamGroupConfig:()Utils .cold.1()
{
  OUTLINED_FUNCTION_6_11();
  FourccToCStr([v1 groupID]);
  FourccToCStr([v0 mediaType]);
  FourccToCStr([v0 mediaSubtype]);
  FourccToCStr([v0 syncGroupID]);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_9_8(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Invalid combination of groupID='%s' mediaType='%s' mediaSubtype='%s' syncGroupID='%s'", v4, v5, v6, v7, 2u);
}

- (void)getStreamGroupConfig:()Utils .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid argument. streamGroupConfig is nil", v2, v3, v4, v5, v6);
}

- (void)getStreamGroupConfig:()Utils .cold.2()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [v1 streamGroup];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  int v5 = 101;
  __int16 v6 = v2;
  int v7 = v3;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to retrieve defaultConfig for streamGroup=%u", v4, 0x22u);
}

- (void)getStreamGroupConfig:()Utils .cold.3()
{
  OUTLINED_FUNCTION_11_0();
  FourccToCStr(v0);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to add streams to stream group (streamGroupID=%s)", v3, v4, v5, v6, v7);
}

- (void)getStreamGroupConfig:()Utils .cold.4()
{
  OUTLINED_FUNCTION_11_0();
  FourccToCStr(v0);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to read the payload configurations for streamGroupID=%s", v3, v4, v5, v6, v7);
}

- (void)codecIndexForType:()Utils inPayloadConfigurations:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid argument. defaultPayloadConfigs is nil", v2, v3, v4, v5, v6);
}

- (void)appendV2PayloadsToStreamConfig:()Utils streamGroupConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid argument. streamGroupConfig is nil", v2, v3, v4, v5, v6);
}

- (void)appendV2PayloadsToStreamConfig:()Utils streamGroupConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid argument. streamConfig is nil", v2, v3, v4, v5, v6);
}

- (void)appendV2PayloadsToStreamConfig:()Utils streamGroupConfig:.cold.3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = 136315906;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_0();
  int v4 = 162;
  __int16 v5 = 2048;
  uint64_t v6 = 20;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid codecIndex for codecType=%ld", (uint8_t *)&v2, 0x26u);
}

- (void)appendStreamsToStreamGroupConfig:()Utils streamGroupID:rtpSampleRates:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  FourccToCStr(v0);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Stream group (streamGroupID=%s) has no valid streams", v3, v4, v5, v6, v7);
}

+ (void)defaultsForStreamGroupCustom:()Utils .cold.1(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  FourccToCStr(a2);
  int v9 = 136316162;
  uint64_t v10 = a1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  int v11 = 324;
  __int16 v12 = v6;
  int v13 = a2;
  __int16 v14 = v7;
  uint64_t v15 = v8;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unexpected streamGroup value=%u ('%s')", (uint8_t *)&v9, 0x2Cu);
}

- (void)setupStreamsWithGroupConfig:()Utils .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the stream config", v2, v3, v4, v5, v6);
}

- (void)setupPayloadsWithGroupConfig:()Utils .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the payload config", v2, v3, v4, v5, v6);
}

- (void)setupPayloadsWithGroupConfig:()Utils .cold.2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_0();
  int v5 = 386;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Found payload config that isn't used for any stream! payloadConfig=%@", (uint8_t *)&v3, 0x26u);
}

- (void)updatePayloadConfigsWithStreamGroupConfig:()Utils rtpSampleRates:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the payload spec", v2, v3, v4, v5, v6);
}

@end