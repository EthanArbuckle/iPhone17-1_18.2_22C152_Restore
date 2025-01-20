@interface VCMediaNegotiationBlobV2StreamGroupStream(Utils)
- (unsigned)payloadsVersion;
@end

@implementation VCMediaNegotiationBlobV2StreamGroupStream(Utils)

- (unsigned)payloadsVersion
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_payloadsVersion;
  }
  else {
    return 1;
  }
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:defaultConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to generate the coordinateSystem field!", v2, v3, v4, v5, v6);
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:defaultConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to generate the default payload field!", v2, v3, v4, v5, v6);
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:defaultConfig:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to generate the payload field!", v2, v3, v4, v5, v6);
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:defaultConfig:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to generate the default payload field!", v2, v3, v4, v5, v6);
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:defaultConfig:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to generate the payload specs field!", v2, v3, v4, v5, v6);
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stream config is nil", v2, v3, v4, v5, v6);
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Default stream config doesn't exist", v2, v3, v4, v5, v6);
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to generate the coordinateSystem field!", v2, v3, v4, v5, v6);
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to generate the payloads field!", v2, v3, v4, v5, v6);
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to generate the payload specs field!", v2, v3, v4, v5, v6);
}

- (void)streamConfigWithPayloadConfigs:()Utils payloadConfigSampleRates:streamGroupID:.cold.1(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  FourccToCStr(a2);
  OUTLINED_FUNCTION_7_1();
  v7 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:]";
  __int16 v8 = 1024;
  int v9 = 482;
  __int16 v10 = v4;
  uint64_t v11 = v5;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Missing quality index and stream type. streamGroupID=%s", v6, 0x26u);
}

- (void)streamConfigWithPayloadConfigs:()Utils payloadConfigSampleRates:streamGroupID:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSam"
                      "pleRates:streamGroupID:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unsupported metadata flag (0x%x)", v2, *(const char **)v3, (unint64_t)"-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:]" >> 16, v4);
}

- (void)streamConfigWithPayloadConfigs:()Utils payloadConfigSampleRates:streamGroupID:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid payload specs", v2, v3, v4, v5, v6);
}

- (void)streamConfigWithPayloadConfigs:()Utils payloadConfigSampleRates:streamGroupID:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid payload config Sample Rates", v2, v3, v4, v5, v6);
}

- (void)streamConfigWithPayloadConfigs:()Utils payloadConfigSampleRates:streamGroupID:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid payload specs", v2, v3, v4, v5, v6);
}

- (void)streamConfigWithPayloadConfigs:()Utils payloadConfigSampleRates:streamGroupID:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid input parameter (payloadConfigs and payloadConfigSampleRates have different sizes)", v2, v3, v4, v5, v6);
}

+ (void)payloadsWithStreamConfig:()Utils payloadBitmap:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid payload bitmap", v2, v3, v4, v5, v6);
}

+ (void)payloadsWithStreamConfig:()Utils payloadBitmap:.cold.2()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "+[VCMediaNegotiationBlobV2StreamGroupStream(Utils) payloadsWithStreamConfig:payloadBitmap:]";
  OUTLINED_FUNCTION_3();
  int v4 = 921;
  __int16 v5 = 2112;
  uint64_t v6 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to encode payload=%@", v2, 0x26u);
}

+ (void)payloadsWithPayloadBit:()Utils .cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCMediaNegotiationBlobV2StreamGroupStream(Utils) payloadsWithPayloadBit:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid payload: 0x%x", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiationBlobV2StreamGroupStream(Utils) payloadsWithPayloadBit:]" >> 16, v4);
}

- (void)updatePayloadSpecsForConfig:()Utils defaultConfig:.cold.1(uint64_t a1, void *a2)
{
  [a2 payloadSpecOrPayloads];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Unrecognized payload (0x%x)!", v4, v5, v6, v7, v8);
}

- (void)updatePayloadSpecsForConfig:()Utils defaultConfig:payloadConfigs:.cold.1(uint64_t a1, void *a2)
{
  [a2 payloadSpecOrPayloads];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Unrecognized payload specs (0x%x)!", v4, v5, v6, v7, v8);
}

- (void)updatePayloadSpecsForConfig:()Utils defaultConfig:payloadConfigs:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:payloadConfigs:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid codec index (%d)!", v2, *(const char **)v3, (unint64_t)"-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:payloadConfigs:]" >> 16, v4);
}

- (void)updatePayloadSpecsForConfig:()Utils defaultConfig:payloadConfigs:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:payloadConfigs:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid codec index (%d)!", v2, *(const char **)v3, (unint64_t)"-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:payloadConfigs:]" >> 16, v4);
}

@end