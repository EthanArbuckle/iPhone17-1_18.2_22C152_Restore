@interface VCModeSpecificHardwareSettings
+ (unsigned)encoderUsageTypeWithHardwareSettingsMode:(unsigned __int8)a3;
- (BOOL)supportVCPDecoderHEVC;
- (BOOL)supportVCPEncoderHEVC;
- (BOOL)vcpInitializedForHEVC;
- (BOOL)vcpSupportsHEVCDecoder;
- (BOOL)vcpSupportsHEVCEncoder;
- (NSString)featureListStringFixedPositionH264;
- (NSString)featureListStringFixedPositionHEVC;
- (NSString)featureListStringH264;
- (NSString)featureListStringHEVC;
- (VCModeSpecificHardwareSettings)initWithHardwareSettingsMode:(unsigned __int8)a3;
- (unsigned)numTilesPerVideoFrameForHDRMode:(unint64_t)a3;
- (unsigned)tilesPerVideoFrame;
- (void)dealloc;
- (void)initFeatureListString;
- (void)vcpCodecGetPropertiesForID:(int)a3 block:(id)a4;
@end

@implementation VCModeSpecificHardwareSettings

+ (unsigned)encoderUsageTypeWithHardwareSettingsMode:(unsigned __int8)a3
{
  if ((a3 - 1) > 6) {
    return 0;
  }
  else {
    return dword_1E25A3258[(char)(a3 - 1)];
  }
}

- (VCModeSpecificHardwareSettings)initWithHardwareSettingsMode:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)VCModeSpecificHardwareSettings;
  v4 = [(VCModeSpecificHardwareSettings *)&v6 init];
  if (v4)
  {
    v4->_vcpEncoderUsageMode = +[VCModeSpecificHardwareSettings encoderUsageTypeWithHardwareSettingsMode:v3];
    v4->_hardwareSettingsMode = v3;
    [(VCModeSpecificHardwareSettings *)v4 initFeatureListString];
    [(VCModeSpecificHardwareSettings *)v4 vcpSupportsHEVCDecoder];
    [(VCModeSpecificHardwareSettings *)v4 vcpSupportsHEVCEncoder];
    v4->_vcpInitializedForHEVC = 1;
    v4->_tilesPerVideoFrame = [(VCModeSpecificHardwareSettings *)v4 numTilesPerVideoFrameForHDRMode:0];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCModeSpecificHardwareSettings;
  [(VCModeSpecificHardwareSettings *)&v3 dealloc];
}

- (unsigned)numTilesPerVideoFrameForHDRMode:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t hardwareSettingsMode = (char)self->_hardwareSettingsMode;
  if (hardwareSettingsMode > 8) {
    unsigned int v5 = -1431655766;
  }
  else {
    unsigned int v5 = dword_1E25A3274[hardwareSettingsMode];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = self->_hardwareSettingsMode;
      int v10 = 136316162;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      v13 = "-[VCModeSpecificHardwareSettings numTilesPerVideoFrameForHDRMode:]";
      __int16 v14 = 1024;
      int v15 = 135;
      __int16 v16 = 1024;
      unsigned int v17 = v5;
      __int16 v18 = 1024;
      int v19 = v8;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCHardwareSettings: tilesPerFrame=%d for hardwareSettingsMode=%hhu", (uint8_t *)&v10, 0x28u);
    }
  }
  return v5;
}

- (BOOL)vcpSupportsHEVCDecoder
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (self->_vcpInitializedForHEVC)
  {
    int supportVCPDecoderHEVC = self->_supportVCPDecoderHEVC;
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__VCModeSpecificHardwareSettings_vcpSupportsHEVCDecoder__block_invoke;
    v6[3] = &unk_1E6DB9CC8;
    v6[4] = self;
    v6[5] = &v7;
    [(VCModeSpecificHardwareSettings *)self vcpCodecGetPropertiesForID:0 block:v6];
    int supportVCPDecoderHEVC = *((unsigned __int8 *)v8 + 24);
    self->_int supportVCPDecoderHEVC = supportVCPDecoderHEVC;
  }
  BOOL v4 = supportVCPDecoderHEVC != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __56__VCModeSpecificHardwareSettings_vcpSupportsHEVCDecoder__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a3 BOOLValue];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ([+[VCDefaults sharedInstance] extraPayloads] & 2) != 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    unsigned int v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v7 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
      int v8 = 136316162;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCModeSpecificHardwareSettings vcpSupportsHEVCDecoder]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 153;
      __int16 v14 = 1024;
      int v15 = v6;
      __int16 v16 = 1024;
      int v17 = v7;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCHardwareSettings: VCP support HEVC decoder= %d for mode=%d", (uint8_t *)&v8, 0x28u);
    }
  }
}

- (BOOL)vcpSupportsHEVCEncoder
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (self->_vcpInitializedForHEVC)
  {
    int supportVCPEncoderHEVC = self->_supportVCPEncoderHEVC;
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__VCModeSpecificHardwareSettings_vcpSupportsHEVCEncoder__block_invoke;
    v6[3] = &unk_1E6DB9CC8;
    v6[4] = self;
    v6[5] = &v7;
    [(VCModeSpecificHardwareSettings *)self vcpCodecGetPropertiesForID:2 block:v6];
    int supportVCPEncoderHEVC = *((unsigned __int8 *)v8 + 24);
    self->_int supportVCPEncoderHEVC = supportVCPEncoderHEVC;
  }
  BOOL v4 = supportVCPEncoderHEVC != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __56__VCModeSpecificHardwareSettings_vcpSupportsHEVCEncoder__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a3 BOOLValue];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    unsigned int v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v7 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
      int v8 = 136316162;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCModeSpecificHardwareSettings vcpSupportsHEVCEncoder]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 170;
      __int16 v14 = 1024;
      int v15 = v6;
      __int16 v16 = 1024;
      int v17 = v7;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCHardwareSettings: VCP support HEVC encoder=%d for mode=%d", (uint8_t *)&v8, 0x28u);
    }
  }
}

- (void)initFeatureListString
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_hardwareSettingsMode == 5)
  {
    self->_featureListStringH264 = (NSString *)[[NSString alloc] initWithString:@"FLS;"];
    self->_featureListStringHEVC = (NSString *)[[NSString alloc] initWithString:@"FLS;"];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int vcpEncoderUsageMode = self->_vcpEncoderUsageMode;
        int v6 = [(NSString *)self->_featureListStringHEVC UTF8String];
        int v7 = [(NSString *)self->_featureListStringH264 UTF8String];
        *(_DWORD *)buf = 136316418;
        uint64_t v11 = v3;
        __int16 v12 = 2080;
        int v13 = "-[VCModeSpecificHardwareSettings initFeatureListString]";
        __int16 v14 = 1024;
        int v15 = 184;
        __int16 v16 = 1024;
        unsigned int v17 = vcpEncoderUsageMode;
        __int16 v18 = 2080;
        int v19 = v6;
        __int16 v20 = 2080;
        v21 = v7;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [FLS] mode=%2d: HEVC=%s ; H264=%s",
          buf,
          0x36u);
      }
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__VCModeSpecificHardwareSettings_initFeatureListString__block_invoke;
    v9[3] = &unk_1E6DB9CF0;
    v9[4] = self;
    [(VCModeSpecificHardwareSettings *)self vcpCodecGetPropertiesForID:1 block:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__VCModeSpecificHardwareSettings_initFeatureListString__block_invoke_13;
    v8[3] = &unk_1E6DB9CF0;
    v8[4] = self;
    [(VCModeSpecificHardwareSettings *)self vcpCodecGetPropertiesForID:4 block:v8];
  }
}

void __55__VCModeSpecificHardwareSettings_initFeatureListString__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 12) == 6)
  {
    *(void *)(*(void *)(a1 + 32) + 24) = @"FLS;SW:1;";
    uint64_t v4 = @"FLS;VRAE:0;SW:1;";
    uint64_t v5 = 16;
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 16) = [a3 copy];
    uint64_t v4 = (__CFString *)[a2 copy];
    uint64_t v5 = 24;
  }
  *(void *)(*(void *)(a1 + 32) + v5) = v4;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    int v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = *(_DWORD *)(v9 + 8);
      uint64_t v11 = [*(id *)(v9 + 16) UTF8String];
      uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 24) UTF8String];
      int v13 = 136316418;
      uint64_t v14 = v7;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCModeSpecificHardwareSettings initFeatureListString]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 196;
      __int16 v19 = 1024;
      int v20 = v10;
      __int16 v21 = 2080;
      uint64_t v22 = v11;
      __int16 v23 = 2080;
      uint64_t v24 = v12;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [FLS] mode=%2d: HEVC=%s ; H264=%s",
        (uint8_t *)&v13,
        0x36u);
    }
  }
}

void __55__VCModeSpecificHardwareSettings_initFeatureListString__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 32) = [a3 copy];
  *(void *)(*(void *)(a1 + 32) + 40) = [a2 copy];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = *(_DWORD *)(v7 + 8);
      uint64_t v9 = [*(id *)(v7 + 32) UTF8String];
      uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 40) UTF8String];
      int v11 = 136316418;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      uint64_t v14 = "-[VCModeSpecificHardwareSettings initFeatureListString]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 202;
      __int16 v17 = 1024;
      int v18 = v8;
      __int16 v19 = 2080;
      uint64_t v20 = v9;
      __int16 v21 = 2080;
      uint64_t v22 = v10;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [FLS] FixedPosition mode=%2d: HEVC=%s ; H264=%s",
        (uint8_t *)&v11,
        0x36u);
    }
  }
}

- (void)vcpCodecGetPropertiesForID:(int)a3 block:(id)a4
{
  if (VCPCodecCopyProperties())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCModeSpecificHardwareSettings vcpCodecGetPropertiesForID:block:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCModeSpecificHardwareSettings vcpCodecGetPropertiesForID:block:]();
    }
  }
}

- (BOOL)supportVCPDecoderHEVC
{
  return self->_supportVCPDecoderHEVC;
}

- (BOOL)supportVCPEncoderHEVC
{
  return self->_supportVCPEncoderHEVC;
}

- (BOOL)vcpInitializedForHEVC
{
  return self->_vcpInitializedForHEVC;
}

- (unsigned)tilesPerVideoFrame
{
  return self->_tilesPerVideoFrame;
}

- (NSString)featureListStringHEVC
{
  return self->_featureListStringHEVC;
}

- (NSString)featureListStringH264
{
  return self->_featureListStringH264;
}

- (NSString)featureListStringFixedPositionHEVC
{
  return self->_featureListStringFixedPositionHEVC;
}

- (NSString)featureListStringFixedPositionH264
{
  return self->_featureListStringFixedPositionH264;
}

- (void)vcpCodecGetPropertiesForID:block:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d dictAllCodecs is nil", v2, v3, v4, v5, v6);
}

- (void)vcpCodecGetPropertiesForID:block:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate memory to get VCP Codec properties", v2, v3, v4, v5, v6);
}

@end