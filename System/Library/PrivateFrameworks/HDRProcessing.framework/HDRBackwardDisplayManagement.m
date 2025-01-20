@interface HDRBackwardDisplayManagement
- (BOOL)inputIsSDRVideoFormat:(__IOSurface *)a3;
- (BOOL)inputIsVideoOnly:(__IOSurface *)a3 inputUI:(__IOSurface *)a4;
- (BOOL)updateConfigFromMetadata:(id *)a3 uiScaleFactor:(float)a4 width:(int)a5 background:(id *)a6 hdrVideoOnly:(BOOL)a7 hdr10TV:(BOOL)a8 sdrOnly:(BOOL)a9;
- (HDRBackwardDisplayManagement)initWithDevice:(id)a3;
- (HDRBackwardDisplayManagement)initWithDevice:(id)a3 displayProperties:(id)a4;
- (float)adjustUiScaleForDoViToHDR10Conversion:(float)a3;
- (id)createRenderCommandEncoderWithCommandBuffer:(id)a3 texture:(id)a4 widthScale:(unsigned int)a5 loadAction:(unint64_t)a6;
- (id)createShaderWithVertexName:(id)a3 fragmentName:(id)a4 colorFormat:(unint64_t)a5 useCustomMatrix:(BOOL)a6 p3CSC:(BOOL)a7 applyYGamma:(BOOL)a8;
- (id)getRenderPipelineStateForShader:(id)a3;
- (int)adjustMetaData:(id *)a3 HDRUIBlending:(BOOL)a4 hasLetterbox:(BOOL)a5;
- (int)getTVIndex:(BOOL)a3;
- (int)pixelNumPerThreadFullScreen:(BOOL)a3 videoInput:(__IOSurface *)a4 UI:(__IOSurface *)a5 Output:(__IOSurface *)a6 widthScaling:(BOOL)a7;
- (int64_t)EncodeToCommandBuffer:(id)a3 inputSurface:(__IOSurface *)a4 uiSurface:(__IOSurface *)a5 outputSurface:(__IOSurface *)a6 frameProperties:(id)a7;
- (int64_t)encodeToCommandBuffer:(id)a3 inputSurface:(__IOSurface *)a4 outputSurface:(__IOSurface *)a5 frameProperties:(id)a6;
- (int64_t)encodeToCommandBuffer:(id)a3 video:(__IOSurface *)a4 videoSrcRegion:(id)a5 videoDstRegion:(id)a6 ui:(__IOSurface *)a7 uiSrcRegion:(id)a8 uiDstRegion:(id)a9 backgroundColor:(id *)a10 output:(__IOSurface *)a11 frameProperties:(id)a12;
- (int64_t)encodeToCommandBuffer:(id)a3 video:(__IOSurface *)a4 videoSrcRegion:(id)a5 videoDstRegion:(id)a6 ui:(__IOSurface *)buffer output:(__IOSurface *)a8 frameProperties:(id)a9;
- (int64_t)setAccessibilityMatrix:(id *)a3;
- (unint64_t)getPixelFormatFromSurface:(__IOSurface *)a3 DeGamma:(BOOL)a4 forceUseOnePlane:(BOOL)a5 default:(unint64_t)a6;
- (unsigned)getPackagingColorFormatFromDictionary:(id)a3 withDefaultValue:(unsigned int)a4;
- (void)attatchInfoFrame:(id *)a3 toOutputSurface:(__IOSurface *)a4;
- (void)createBuffers;
- (void)createInverseScalingFactorTable;
- (void)createKernels;
- (void)createL2PQTable;
- (void)createMetadataTexture;
- (void)createMetadataVertexBuffer;
- (void)createPQ2LTable;
- (void)createSDRScalingFactorTable;
- (void)createSamplers;
- (void)createYUVScalingFactorTable;
- (void)drawMetaWithEncoder:(id)a3 widthScale:(int)a4 dmPayLoadLength:(int)a5;
- (void)fillInverseScalingFactorTableFromDMConfig:(id *)a3;
- (void)fillScalingTable_SDR2HDR:(id *)a3 target_White:(float)a4 target_Black:(float)a5;
- (void)fillScalingTable_YUVTM:(id *)a3 targetwhite:(float)a4 targetblack:(float)a5 satBoost:(float)a6 scalingFactor:(BOOL)a7 sdrOnly:(BOOL)a8;
- (void)generateMetaAndConfig:(id)a3 inputSurface:(__IOSurface *)a4 outputSurface:(__IOSurface *)a5 payLoad:(id *)a6 dmCfg:(id *)a7;
- (void)handleMetaInsertion:(BOOL)a3 encoder:(id)a4 widthScale:(int)a5 payloadLength:(unsigned int)a6;
- (void)initDisplayAttributes:(id)a3;
- (void)packetizeMetadata:(id *)a3 length:(int)a4 into:(int)a5 onSurface:(__IOSurface *)a6;
- (void)setupMetadataTextureWithOutput:(__IOSurface *)a3;
- (void)setupMetal;
- (void)setupTexturesWithInput:(__IOSurface *)a3 VideoSRGB:(BOOL)a4 UI:(__IOSurface *)a5 UISRGB:(BOOL)a6 Output:(__IOSurface *)a7 PixelPerThread:(int)a8 ptvMode:(BOOL)a9;
- (void)updateUniformUIScaleForVideo:(BOOL)a3 forTV:(BOOL)a4 videoPeakBrightnessInNits:(int)a5 uiHWDegamma:(BOOL)a6 dovi50toHDR10TVMode:(unsigned int)a7;
- (void)updateVertices:(id)a3 videoInput:(__IOSurface *)a4 videoDstRegion:(id)a5 videoSrcRegion:(id)a6 uiInput:(__IOSurface *)a7 uiDstRegion:(id)a8 uiSrcRegion:(id)a9 dstWidth:(int)a10 dstHeight:(int)a11 videoSrcWidth:(int)a12 videoSrcHeight:(int)a13 index:(int)a14 scale:(int)a15;
@end

@implementation HDRBackwardDisplayManagement

- (HDRBackwardDisplayManagement)initWithDevice:(id)a3 displayProperties:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDRBackwardDisplayManagement;
  v8 = [(HDRBackwardDisplayManagement *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(HDRBackwardDisplayManagement *)v8 initDisplayAttributes:v7];
    [(HDRBackwardDisplayManagement *)v9 initWithDevice:v6];
  }
  else if (enableLogInstance)
  {
    if (logInstanceID) {
      uint64_t v10 = logInstanceID;
    }
    else {
      uint64_t v10 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v15 = (const char *)WORD1(v10);
      __int16 v16 = 2080;
      v17 = "-[HDRBackwardDisplayManagement initWithDevice:displayProperties:]";
      __int16 v18 = 2048;
      v19 = 0;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : error, self = %p \n", buf, 0x20u);
    }
    prevLogInstanceID = v10;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315394;
    v15 = "-[HDRBackwardDisplayManagement initWithDevice:displayProperties:]";
    __int16 v16 = 2048;
    v17 = 0;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : error, self = %p \n", buf, 0x16u);
  }
  if (enableLogInstance)
  {
    if (logInstanceID) {
      uint64_t v11 = logInstanceID;
    }
    else {
      uint64_t v11 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v15 = (const char *)WORD1(v11);
      __int16 v16 = 2080;
      v17 = "-[HDRBackwardDisplayManagement initWithDevice:displayProperties:]";
      __int16 v18 = 2048;
      v19 = v9;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx    %s : instance=%p", buf, 0x20u);
    }
    prevLogInstanceID = v11;
    goto LABEL_21;
  }
LABEL_19:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[HDRBackwardDisplayManagement initWithDevice:displayProperties:]";
    __int16 v16 = 2048;
    v17 = (const char *)v9;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]    %s : instance=%p", buf, 0x16u);
  }
LABEL_21:

  return v9;
}

- (HDRBackwardDisplayManagement)initWithDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = (char *)a3;
  if (v5 && !self->_device)
  {
    objc_storeStrong((id *)&self->_device, a3);
    [(HDRBackwardDisplayManagement *)self setupMetal];
    [(HDRBackwardDisplayManagement *)self createKernels];
    [(HDRBackwardDisplayManagement *)self createSamplers];
    [(HDRBackwardDisplayManagement *)self createPQ2LTable];
    [(HDRBackwardDisplayManagement *)self createL2PQTable];
    [(HDRBackwardDisplayManagement *)self createInverseScalingFactorTable];
    [(HDRBackwardDisplayManagement *)self createSDRScalingFactorTable];
    [(HDRBackwardDisplayManagement *)self createYUVScalingFactorTable];
    [(HDRBackwardDisplayManagement *)self createBuffers];
    [(HDRBackwardDisplayManagement *)self createMetadataTexture];
    self->_useAccessibilityMatrix = 0;
  }
  else if (enableLogInstance)
  {
    if (logInstanceID) {
      uint64_t v6 = logInstanceID;
    }
    else {
      uint64_t v6 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      device = self->_device;
      int v10 = 134218754;
      uint64_t v11 = (const char *)WORD1(v6);
      __int16 v12 = 2080;
      objc_super v13 = "-[HDRBackwardDisplayManagement initWithDevice:]";
      __int16 v14 = 2048;
      v15 = (MTLDeviceSPI *)v5;
      __int16 v16 = 2048;
      v17 = device;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : error, device = %p, _device=%p\n", (uint8_t *)&v10, 0x2Au);
    }
    prevLogInstanceID = v6;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_device;
    int v10 = 136315650;
    uint64_t v11 = "-[HDRBackwardDisplayManagement initWithDevice:]";
    __int16 v12 = 2048;
    objc_super v13 = v5;
    __int16 v14 = 2048;
    v15 = v8;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : error, device = %p, _device=%p\n", (uint8_t *)&v10, 0x20u);
  }

  return result;
}

- (void)initDisplayAttributes:(id)a3
{
  id v44 = a3;
  v4 = [v44 valueForKey:@"ApiInterfaceVersionKey"];
  v5 = v4;
  if (v4) {
    int v6 = [v4 intValue];
  }
  else {
    int v6 = 0;
  }
  self->_callerApiVersion = v6;
  id v7 = [v44 valueForKey:@"HDRProcessingDestinationDisplayTypeKey"];
  v8 = v7;
  if (v6 <= 0 && v7)
  {
    if (([v7 isEqualToString:@"HDRProcessingDestinationDisplayTypeDolbyVisionTV"] & 1) == 0)
    {
      if (([v8 isEqualToString:@"HDRProcessingDestinationDisplayTypeLowLatencyDolbyVisionTV"] & 1) == 0)
      {
        if (([v8 isEqualToString:@"HDRProcessingDestinationDisplayTypeHDR10TV"] & 1) == 0)
        {
          if (([v8 isEqualToString:@"HDRProcessingDestinationDisplayTypeInternalPanel"] & 1) == 0)
          {
            if ([v8 isEqualToString:@"HDRProcessingDestinationDisplayTypeInternalPanelLCD"])
            {
LABEL_11:
              unsigned int v9 = 4;
              goto LABEL_22;
            }
            if ([v8 isEqualToString:@"HDRProcessingDestinationDisplayTypeInternalPanelMac"])
            {
              unsigned int v9 = 5;
              goto LABEL_22;
            }
            if ([v8 isEqualToString:@"HDRProcessingDestinationDisplayTypeSDRTV"])
            {
              unsigned int v9 = 6;
              goto LABEL_22;
            }
            BOOL v42 = [v8 isEqualToString:@"HDRProcessingDestinationDisplayTypeReferenceDisplay"] == 0;
            int v43 = 7;
            goto LABEL_71;
          }
          goto LABEL_21;
        }
        goto LABEL_19;
      }
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  unsigned int v9 = 0;
  if (v6 >= 1 && v7)
  {
    if (([v7 isEqualToString:@"HDRProcessingDestinationDisplayTypeDolbyVisionTV"] & 1) == 0)
    {
      if (([v8 isEqualToString:@"HDRProcessingDestinationDisplayTypeLowLatencyDolbyVisionTV"] & 1) == 0)
      {
        if (([v8 isEqualToString:@"HDRProcessingDestinationDisplayTypeHDR10TV"] & 1) == 0)
        {
          if (([v8 isEqualToString:@"HDRProcessingDestinationDisplayTypeInternalPanelOLED"] & 1) == 0)
          {
            if ([v8 isEqualToString:@"HDRProcessingDestinationDisplayTypeInternalPanel2DBL"])
            {
              unsigned int v9 = 7;
              goto LABEL_22;
            }
            if ([v8 isEqualToString:@"HDRProcessingDestinationDisplayTypeInternalPanel0DBL"]) {
              goto LABEL_11;
            }
            BOOL v42 = [v8 isEqualToString:@"HDRProcessingDestinationDisplayTypeSDRTV"] == 0;
            int v43 = 6;
LABEL_71:
            if (v42) {
              unsigned int v9 = 0;
            }
            else {
              unsigned int v9 = v43;
            }
            goto LABEL_22;
          }
LABEL_21:
          unsigned int v9 = 3;
          goto LABEL_22;
        }
LABEL_19:
        unsigned int v9 = 2;
        goto LABEL_22;
      }
LABEL_17:
      unsigned int v9 = 1;
      goto LABEL_22;
    }
LABEL_15:
    unsigned int v9 = 0;
  }
LABEL_22:

  self->_displayType = v9;
  int v10 = [v44 valueForKey:@"MaximumDisplayBrightnessKey"];
  uint64_t v11 = v10;
  if (v10)
  {
    unsigned int v12 = [v10 intValue];
    self->_displayMaxBrightnessInNits = v12;
    if (v12 >= 0xFA) {
      unsigned int v13 = 250;
    }
    else {
      unsigned int v13 = v12;
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
    unsigned int v13 = 250;
    self->_displayMaxBrightnessInNits = 250;
  }
  self->_displayMaxBrightnessInNitsForSDR = v13;
  self->_hasDisplayBrightnessFromEDID = v14;
  v15 = [v44 valueForKey:@"MinimumDisplayBrightnessKey"];
  __int16 v16 = v15;
  if (v15)
  {
    [v15 floatValue];
    if (v17 < 0.05) {
      float v17 = 0.05;
    }
    if (v17 > 16.0) {
      float v17 = 16.0;
    }
    self->_displayMinBrightnessInNits = v17;
  }
  else
  {
    self->_displayMinBrightnessInNits = 0.05;
  }
  uint64_t v18 = [v44 valueForKey:@"DisplayChromaticityRx"];
  v19 = v18;
  if (v18)
  {
    [v18 floatValue];
    float v21 = v20;
    v22 = [v44 valueForKey:@"DisplayChromaticityRy"];

    if (v22)
    {
      [v22 floatValue];
      float v24 = v23;
    }
    else
    {
      float v24 = 0.0;
    }
    v25 = [v44 valueForKey:@"DisplayChromaticityGx"];

    if (v25)
    {
      [v25 floatValue];
      float v27 = v26;
    }
    else
    {
      float v27 = 0.0;
    }
    v28 = [v44 valueForKey:@"DisplayChromaticityGy"];

    if (v28)
    {
      [v28 floatValue];
      float v30 = v29;
    }
    else
    {
      float v30 = 0.0;
    }
    v31 = [v44 valueForKey:@"DisplayChromaticityBx"];

    if (v31)
    {
      [v31 floatValue];
      float v33 = v32;
    }
    else
    {
      float v33 = 0.0;
    }
    v34 = [v44 valueForKey:@"DisplayChromaticityBy"];

    if (v34)
    {
      [v34 floatValue];
      float v36 = v35;
    }
    else
    {
      float v36 = 0.0;
    }
    v37 = [v44 valueForKey:@"DisplayChromaticityWx"];

    if (v37)
    {
      [v37 floatValue];
      float v39 = v38;
    }
    else
    {
      float v39 = 0.0;
    }
    v19 = [v44 valueForKey:@"DisplayChromaticityWy"];

    if (v19)
    {
      [v19 floatValue];
      float v41 = v40;
    }
    else
    {
      float v41 = 0.0;
    }
    createRGB2RGB3x3Matrix((uint64_t)self->_709toPanelPrimaryMatrix, v21, v24, v27, v30, v33, v36, v39, v41, 0.64, 0.33, 0.3, 0.6, 0.15, 0.06, 0.3127, 0.329);
  }
  else
  {
    *(_OWORD *)self->_709toPanelPrimaryMatrix = xmmword_2222D11D0;
    *(_OWORD *)&self->_709toPanelPrimaryMatrix[4] = xmmword_2222D11E0;
    self->_709toPanelPrimaryMatrix[8] = 0.9105;
  }
  self->_outputPackingColorFormat = [(HDRBackwardDisplayManagement *)self getPackagingColorFormatFromDictionary:v44 withDefaultValue:0];
  self->_inputScaleFactor = 600.0;
}

- (unsigned)getPackagingColorFormatFromDictionary:(id)a3 withDefaultValue:(unsigned int)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = [a3 valueForKey:@"HDRProcessingDisplayColorFormatKey"];
  int v6 = v5;
  if (v5)
  {
    if (([v5 isEqualToString:@"HDRProcessingDisplayColorFormat_YUV422_12BITS_NATIVE"] & 1) != 0
      || ([v6 isEqualToString:@"HDRProcessingDisplayColorFormat_YUV422_12BITS_DP"] & 1) != 0)
    {
      a4 = 1;
    }
    else if ([v6 isEqualToString:@"HDRProcessingDisplayColorFormat_YUV422_12BITS_HDMI"])
    {
      a4 = 2;
    }
    else if ([v6 isEqualToString:@"HDRProcessingDisplayColorFormat_YUV422_12BITS_DOLBYVISION"])
    {
      a4 = 3;
    }
    else if ([v6 isEqualToString:@"HDRProcessingDisplayColorFormat_IPT422_12BITS"])
    {
      a4 = 0;
    }
    else if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v8 = logInstanceID;
      }
      else {
        uint64_t v8 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134217984;
        uint64_t v10 = WORD1(v8);
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/BackwardDisplayManagement/HDRBackwardDisplayManagement.mm\" at line 860\n", (uint8_t *)&v9, 0xCu);
      }
      prevLogInstanceID = v8;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/BackwardDisplayManagement/HDRBackwardDisplayManagement.mm\" at line 860\n", (uint8_t *)&v9, 2u);
    }
  }

  return a4;
}

- (void)setupMetal
{
  id v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HDRProcessing"];
  v3 = [v7 pathForResource:@"default.metallib" ofType:0];
  device = self->_device;
  if (v3) {
    v5 = (MTLLibrary *)[(MTLDeviceSPI *)device newLibraryWithFile:v3 error:0];
  }
  else {
    v5 = (MTLLibrary *)[(MTLDeviceSPI *)device newDefaultLibrary];
  }
  defaultLibrary = self->_defaultLibrary;
  self->_defaultLibrary = v5;
}

- (id)createShaderWithVertexName:(id)a3 fragmentName:(id)a4 colorFormat:(unint64_t)a5 useCustomMatrix:(BOOL)a6 p3CSC:(BOOL)a7 applyYGamma:(BOOL)a8
{
  uint64_t v8 = +[BackwardDmShader createShaderWithVertexName:a3 fragmentName:a4 colorFormat:a5 useCustomMatrix:a6 p3CSC:a7 applyYGamma:a8];
  return v8;
}

- (id)getRenderPipelineStateForShader:(id)a3
{
  v3 = [a3 getRenderPipelineStateForDevice:self->_device Library:self->_defaultLibrary];
  return v3;
}

- (void)createKernels
{
  v3 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_ARGB_Linear_Full" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  BKDM_ARGB_Linear = self->_BKDM_ARGB_Linear;
  self->_BKDM_ARGB_Linear = v3;

  v5 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Dolby_PTV" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  int v6 = self->_BKDM_3Plane_2Pixel_PTV[0];
  self->_BKDM_3Plane_2Pixel_PTV[0] = v5;

  id v7 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_HDR10_PTV" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  uint64_t v8 = self->_BKDM_3Plane_2Pixel_PTV[2];
  self->_BKDM_3Plane_2Pixel_PTV[2] = v7;

  int v9 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Dolby_PTV" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  uint64_t v10 = self->_BKDM_3Plane_2Pixel_PTV[6];
  self->_BKDM_3Plane_2Pixel_PTV[6] = v9;

  uint64_t v11 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_HDR10_PTV" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  unsigned int v12 = self->_BKDM_3Plane_2Pixel_PTV[8];
  self->_BKDM_3Plane_2Pixel_PTV[8] = v11;

  unsigned int v13 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Dolby_PTV" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  BOOL v14 = self->_BKDM_3Plane_1Pixel_PTV[0];
  self->_BKDM_3Plane_1Pixel_PTV[0] = v13;

  v15 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_HDR10_PTV" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  __int16 v16 = self->_BKDM_3Plane_1Pixel_PTV[2];
  self->_BKDM_3Plane_1Pixel_PTV[2] = v15;

  float v17 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Dolby_PTV" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  uint64_t v18 = self->_BKDM_3Plane_1Pixel_PTV[6];
  self->_BKDM_3Plane_1Pixel_PTV[6] = v17;

  v19 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_HDR10_PTV" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  float v20 = self->_BKDM_3Plane_1Pixel_PTV[8];
  self->_BKDM_3Plane_1Pixel_PTV[8] = v19;

  float v21 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_UIBlending_Dolby_PTV" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v22 = self->_BKDM_3Plane_2Pixel_UIBlending_PTV[0];
  self->_BKDM_3Plane_2Pixel_UIBlending_PTV[0] = v21;

  float v23 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_UIBlending_HDR10_PTV" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  float v24 = self->_BKDM_3Plane_2Pixel_UIBlending_PTV[2];
  self->_BKDM_3Plane_2Pixel_UIBlending_PTV[2] = v23;

  v25 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_UIBlending_Dolby_PTV" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  float v26 = self->_BKDM_3Plane_2Pixel_UIBlending_PTV[6];
  self->_BKDM_3Plane_2Pixel_UIBlending_PTV[6] = v25;

  float v27 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_UIBlending_HDR10_PTV" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v28 = self->_BKDM_3Plane_2Pixel_UIBlending_PTV[8];
  self->_BKDM_3Plane_2Pixel_UIBlending_PTV[8] = v27;

  float v29 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_UIBlending_Dolby_PTV" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  float v30 = self->_BKDM_3Plane_1Pixel_UIBlending_PTV[0];
  self->_BKDM_3Plane_1Pixel_UIBlending_PTV[0] = v29;

  v31 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_UIBlending_HDR10_PTV" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  float v32 = self->_BKDM_3Plane_1Pixel_UIBlending_PTV[2];
  self->_BKDM_3Plane_1Pixel_UIBlending_PTV[2] = v31;

  float v33 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_UIBlending_Dolby_PTV" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v34 = self->_BKDM_3Plane_1Pixel_UIBlending_PTV[6];
  self->_BKDM_3Plane_1Pixel_UIBlending_PTV[6] = v33;

  float v35 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_UIBlending_HDR10_PTV" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  float v36 = self->_BKDM_3Plane_1Pixel_UIBlending_PTV[8];
  self->_BKDM_3Plane_1Pixel_UIBlending_PTV[8] = v35;

  v37 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Linear_Full" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  float v38 = self->_BKDM_3Plane_2Pixel_Linear[0];
  self->_BKDM_3Plane_2Pixel_Linear[0] = v37;

  float v39 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Linear_Full" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  float v40 = self->_BKDM_3Plane_2Pixel_Linear[1];
  self->_BKDM_3Plane_2Pixel_Linear[1] = v39;

  float v41 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Linear_HDR10" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  BOOL v42 = self->_BKDM_3Plane_2Pixel_Linear[2];
  self->_BKDM_3Plane_2Pixel_Linear[2] = v41;

  int v43 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Linear_HDR10" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  id v44 = self->_BKDM_3Plane_2Pixel_Linear[3];
  self->_BKDM_3Plane_2Pixel_Linear[3] = v43;

  v45 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Linear_LinearStretch" colorFormat:103 useCustomMatrix:0 p3CSC:1 applyYGamma:0];
  v46 = self->_BKDM_3Plane_2Pixel_Linear[4];
  self->_BKDM_3Plane_2Pixel_Linear[4] = v45;

  v47 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Linear_LinearStretch" colorFormat:103 useCustomMatrix:1 p3CSC:1 applyYGamma:0];
  v48 = self->_BKDM_3Plane_2Pixel_Linear[5];
  self->_BKDM_3Plane_2Pixel_Linear[5] = v47;

  v49 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Linear_Full" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v50 = self->_BKDM_3Plane_2Pixel_Linear[6];
  self->_BKDM_3Plane_2Pixel_Linear[6] = v49;

  v51 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Linear_Full" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v52 = self->_BKDM_3Plane_2Pixel_Linear[7];
  self->_BKDM_3Plane_2Pixel_Linear[7] = v51;

  v53 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Linear_HDR10" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v54 = self->_BKDM_3Plane_2Pixel_Linear[8];
  self->_BKDM_3Plane_2Pixel_Linear[8] = v53;

  v55 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Linear_HDR10" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v56 = self->_BKDM_3Plane_2Pixel_Linear[9];
  self->_BKDM_3Plane_2Pixel_Linear[9] = v55;

  v57 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Linear_LinearStretch" colorFormat:103 useCustomMatrix:0 p3CSC:1 applyYGamma:1];
  v58 = self->_BKDM_3Plane_2Pixel_Linear[10];
  self->_BKDM_3Plane_2Pixel_Linear[10] = v57;

  v59 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Linear_LinearStretch" colorFormat:103 useCustomMatrix:1 p3CSC:1 applyYGamma:1];
  v60 = self->_BKDM_3Plane_2Pixel_Linear[11];
  self->_BKDM_3Plane_2Pixel_Linear[11] = v59;

  v61 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Linear_Full" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v62 = self->_BKDM_3Plane_1Pixel_Linear[0];
  self->_BKDM_3Plane_1Pixel_Linear[0] = v61;

  v63 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Linear_Full" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v64 = self->_BKDM_3Plane_1Pixel_Linear[1];
  self->_BKDM_3Plane_1Pixel_Linear[1] = v63;

  v65 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Linear_HDR10" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v66 = self->_BKDM_3Plane_1Pixel_Linear[2];
  self->_BKDM_3Plane_1Pixel_Linear[2] = v65;

  v67 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Linear_HDR10" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v68 = self->_BKDM_3Plane_1Pixel_Linear[3];
  self->_BKDM_3Plane_1Pixel_Linear[3] = v67;

  v69 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Linear_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:0];
  v70 = self->_BKDM_3Plane_1Pixel_Linear[4];
  self->_BKDM_3Plane_1Pixel_Linear[4] = v69;

  v71 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Linear_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:0];
  v72 = self->_BKDM_3Plane_1Pixel_Linear[5];
  self->_BKDM_3Plane_1Pixel_Linear[5] = v71;

  v73 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Linear_Full" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v74 = self->_BKDM_3Plane_1Pixel_Linear[6];
  self->_BKDM_3Plane_1Pixel_Linear[6] = v73;

  v75 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Linear_Full" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v76 = self->_BKDM_3Plane_1Pixel_Linear[7];
  self->_BKDM_3Plane_1Pixel_Linear[7] = v75;

  v77 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Linear_HDR10" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v78 = self->_BKDM_3Plane_1Pixel_Linear[8];
  self->_BKDM_3Plane_1Pixel_Linear[8] = v77;

  v79 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Linear_HDR10" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v80 = self->_BKDM_3Plane_1Pixel_Linear[9];
  self->_BKDM_3Plane_1Pixel_Linear[9] = v79;

  v81 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Linear_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:1];
  v82 = self->_BKDM_3Plane_1Pixel_Linear[10];
  self->_BKDM_3Plane_1Pixel_Linear[10] = v81;

  v83 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Linear_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:1];
  v84 = self->_BKDM_3Plane_1Pixel_Linear[11];
  self->_BKDM_3Plane_1Pixel_Linear[11] = v83;

  v85 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Gamma_Full" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v86 = self->_BKDM_3Plane_1Pixel_Gamma[0];
  self->_BKDM_3Plane_1Pixel_Gamma[0] = v85;

  v87 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Gamma_Full" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v88 = self->_BKDM_3Plane_1Pixel_Gamma[1];
  self->_BKDM_3Plane_1Pixel_Gamma[1] = v87;

  v89 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Gamma_HDR10" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v90 = self->_BKDM_3Plane_1Pixel_Gamma[2];
  self->_BKDM_3Plane_1Pixel_Gamma[2] = v89;

  v91 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Gamma_HDR10" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v92 = self->_BKDM_3Plane_1Pixel_Gamma[3];
  self->_BKDM_3Plane_1Pixel_Gamma[3] = v91;

  v93 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Gamma_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:0];
  v94 = self->_BKDM_3Plane_1Pixel_Gamma[4];
  self->_BKDM_3Plane_1Pixel_Gamma[4] = v93;

  v95 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Gamma_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:0];
  v96 = self->_BKDM_3Plane_1Pixel_Gamma[5];
  self->_BKDM_3Plane_1Pixel_Gamma[5] = v95;

  v97 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Gamma_Full" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v98 = self->_BKDM_3Plane_1Pixel_Gamma[6];
  self->_BKDM_3Plane_1Pixel_Gamma[6] = v97;

  v99 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Gamma_Full" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v100 = self->_BKDM_3Plane_1Pixel_Gamma[7];
  self->_BKDM_3Plane_1Pixel_Gamma[7] = v99;

  v101 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Gamma_HDR10" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v102 = self->_BKDM_3Plane_1Pixel_Gamma[8];
  self->_BKDM_3Plane_1Pixel_Gamma[8] = v101;

  v103 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Gamma_HDR10" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v104 = self->_BKDM_3Plane_1Pixel_Gamma[9];
  self->_BKDM_3Plane_1Pixel_Gamma[9] = v103;

  v105 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Gamma_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:1];
  v106 = self->_BKDM_3Plane_1Pixel_Gamma[10];
  self->_BKDM_3Plane_1Pixel_Gamma[10] = v105;

  v107 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_Pixel_Gamma_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:1];
  v108 = self->_BKDM_3Plane_1Pixel_Gamma[11];
  self->_BKDM_3Plane_1Pixel_Gamma[11] = v107;

  v109 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Gamma_Scaled_HDR10_Inverse_HLGOOTF" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v110 = self->_BKDM_3Plane_1Pixel_Gamma_Scaled_Inverse_HLGOOTF[0];
  self->_BKDM_3Plane_1Pixel_Gamma_Scaled_Inverse_HLGOOTF[0] = v109;

  v111 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Gamma_Scaled_HDR10_Inverse_HLGOOTF" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v112 = self->_BKDM_3Plane_1Pixel_Gamma_Scaled_Inverse_HLGOOTF[1];
  self->_BKDM_3Plane_1Pixel_Gamma_Scaled_Inverse_HLGOOTF[1] = v111;

  uint64_t v113 = 0x1FFFFFFFFFFFFFF6;
  do
  {
    objc_storeStrong((id *)&self->_BKDM_3Plane_1Pixel_Gamma_Scaled_Inverse_YScale[v113], self->_BKDM_3Plane_1Pixel_Gamma_Scaled_Inverse_HLGOOTF[0]);
    objc_storeStrong((id *)&self->_BKDM_3Plane_1Pixel_Gamma_Scaled_Inverse_YScale[v113 + 1], self->_BKDM_3Plane_1Pixel_Gamma_Scaled_Inverse_HLGOOTF[1]);
    v113 += 2;
  }
  while (v113 * 8);
  v114 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Gamma_Scaled_HDR10_Inverse_YScale" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v115 = self->_BKDM_3Plane_1Pixel_Gamma_Scaled_Inverse_YScale[0];
  self->_BKDM_3Plane_1Pixel_Gamma_Scaled_Inverse_YScale[0] = v114;

  v116 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Gamma_Scaled_HDR10_Inverse_YScale" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v117 = self->_BKDM_3Plane_1Pixel_Gamma_Scaled_Inverse_YScale[1];
  self->_BKDM_3Plane_1Pixel_Gamma_Scaled_Inverse_YScale[1] = v116;

  uint64_t v118 = 0x1FFFFFFFFFFFFFF6;
  do
  {
    objc_storeStrong((id *)&self->_BKDM_3Plane_1Pixel_Video_Scaled[v118], self->_BKDM_3Plane_1Pixel_Gamma_Scaled_Inverse_YScale[0]);
    objc_storeStrong((id *)&self->_BKDM_3Plane_1Pixel_Video_Scaled[v118 + 1], self->_BKDM_3Plane_1Pixel_Gamma_Scaled_Inverse_YScale[1]);
    v118 += 2;
  }
  while (v118 * 8);
  v119 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Gamma_Scaled" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v120 = self->_BKDM_3Plane_1Pixel_Gamma_Scaled[0];
  self->_BKDM_3Plane_1Pixel_Gamma_Scaled[0] = v119;

  v121 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Gamma_Scaled" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v122 = self->_BKDM_3Plane_1Pixel_Gamma_Scaled[1];
  self->_BKDM_3Plane_1Pixel_Gamma_Scaled[1] = v121;

  v123 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Gamma_Scaled_HDR10" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v124 = self->_BKDM_3Plane_1Pixel_Gamma_Scaled[2];
  self->_BKDM_3Plane_1Pixel_Gamma_Scaled[2] = v123;

  v125 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Gamma_Scaled_HDR10" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v126 = self->_BKDM_3Plane_1Pixel_Gamma_Scaled[3];
  self->_BKDM_3Plane_1Pixel_Gamma_Scaled[3] = v125;

  v127 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Gamma_Scaled_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:0];
  v128 = self->_BKDM_3Plane_1Pixel_Gamma_Scaled[4];
  self->_BKDM_3Plane_1Pixel_Gamma_Scaled[4] = v127;

  v129 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Gamma_Scaled_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:0];
  v130 = self->_BKDM_3Plane_1Pixel_Gamma_Scaled[5];
  self->_BKDM_3Plane_1Pixel_Gamma_Scaled[5] = v129;

  v131 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Gamma_Scaled" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v132 = self->_BKDM_3Plane_1Pixel_Gamma_Scaled[6];
  self->_BKDM_3Plane_1Pixel_Gamma_Scaled[6] = v131;

  v133 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Gamma_Scaled" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v134 = self->_BKDM_3Plane_1Pixel_Gamma_Scaled[7];
  self->_BKDM_3Plane_1Pixel_Gamma_Scaled[7] = v133;

  v135 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Gamma_Scaled_HDR10" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v136 = self->_BKDM_3Plane_1Pixel_Gamma_Scaled[8];
  self->_BKDM_3Plane_1Pixel_Gamma_Scaled[8] = v135;

  v137 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Gamma_Scaled_HDR10" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v138 = self->_BKDM_3Plane_1Pixel_Gamma_Scaled[9];
  self->_BKDM_3Plane_1Pixel_Gamma_Scaled[9] = v137;

  v139 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Gamma_Scaled_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:1];
  v140 = self->_BKDM_3Plane_1Pixel_Gamma_Scaled[10];
  self->_BKDM_3Plane_1Pixel_Gamma_Scaled[10] = v139;

  v141 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Gamma_Scaled_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:1];
  v142 = self->_BKDM_3Plane_1Pixel_Gamma_Scaled[11];
  self->_BKDM_3Plane_1Pixel_Gamma_Scaled[11] = v141;

  v143 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Video_Scaled_HDR10_Inverse_HLGOOTF" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v144 = self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_HLGOOTF[0];
  self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_HLGOOTF[0] = v143;

  v145 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Video_Scaled_HDR10_Inverse_HLGOOTF" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v146 = self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_HLGOOTF[1];
  self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_HLGOOTF[1] = v145;

  uint64_t v147 = 0x1FFFFFFFFFFFFFF6;
  do
  {
    objc_storeStrong((id *)&self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_YScale[v147], self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_HLGOOTF[0]);
    objc_storeStrong((id *)&self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_YScale[v147 + 1], self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_HLGOOTF[1]);
    v147 += 2;
  }
  while (v147 * 8);
  v148 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Video_Scaled_HDR10_Inverse_YScale" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v149 = self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_YScale[0];
  self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_YScale[0] = v148;

  v150 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Video_Scaled_HDR10_Inverse_YScale" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v151 = self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_YScale[1];
  self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_YScale[1] = v150;

  uint64_t v152 = 0x1FFFFFFFFFFFFFF6;
  do
  {
    objc_storeStrong((id *)&self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_YScale[v152 + 12], self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_YScale[0]);
    objc_storeStrong((id *)((char *)&self->_BKDM_3Plane_2Pixel_Video_HDR10 + v152 * 8), self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_YScale[1]);
    v152 += 2;
  }
  while (v152 * 8);
  v153 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Video_HDR10_Ref" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  BKDM_3Plane_1Pixel_Video_HDR10 = self->_BKDM_3Plane_1Pixel_Video_HDR10;
  self->_BKDM_3Plane_1Pixel_Video_HDR10 = v153;

  v155 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Video_HDR10_Ref" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  BKDM_3Plane_2Pixel_Video_HDR10 = self->_BKDM_3Plane_2Pixel_Video_HDR10;
  self->_BKDM_3Plane_2Pixel_Video_HDR10 = v155;

  v157 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Gamma_Scaled" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v158 = self->_BKDM_3Plane_2Pixel_Gamma_Scaled[0];
  self->_BKDM_3Plane_2Pixel_Gamma_Scaled[0] = v157;

  v159 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Gamma_Scaled" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v160 = self->_BKDM_3Plane_2Pixel_Gamma_Scaled[1];
  self->_BKDM_3Plane_2Pixel_Gamma_Scaled[1] = v159;

  v161 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Gamma_Scaled_HDR10" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v162 = self->_BKDM_3Plane_2Pixel_Gamma_Scaled[2];
  self->_BKDM_3Plane_2Pixel_Gamma_Scaled[2] = v161;

  v163 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Gamma_Scaled_HDR10" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v164 = self->_BKDM_3Plane_2Pixel_Gamma_Scaled[3];
  self->_BKDM_3Plane_2Pixel_Gamma_Scaled[3] = v163;

  v165 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Gamma_Scaled_LinearStretch" colorFormat:103 useCustomMatrix:0 p3CSC:1 applyYGamma:0];
  v166 = self->_BKDM_3Plane_2Pixel_Gamma_Scaled[4];
  self->_BKDM_3Plane_2Pixel_Gamma_Scaled[4] = v165;

  v167 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Gamma_Scaled_LinearStretch" colorFormat:103 useCustomMatrix:1 p3CSC:1 applyYGamma:0];
  v168 = self->_BKDM_3Plane_2Pixel_Gamma_Scaled[5];
  self->_BKDM_3Plane_2Pixel_Gamma_Scaled[5] = v167;

  v169 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Gamma_Scaled" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v170 = self->_BKDM_3Plane_2Pixel_Gamma_Scaled[6];
  self->_BKDM_3Plane_2Pixel_Gamma_Scaled[6] = v169;

  v171 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Gamma_Scaled" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v172 = self->_BKDM_3Plane_2Pixel_Gamma_Scaled[7];
  self->_BKDM_3Plane_2Pixel_Gamma_Scaled[7] = v171;

  v173 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Gamma_Scaled_HDR10" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v174 = self->_BKDM_3Plane_2Pixel_Gamma_Scaled[8];
  self->_BKDM_3Plane_2Pixel_Gamma_Scaled[8] = v173;

  v175 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Gamma_Scaled_HDR10" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v176 = self->_BKDM_3Plane_2Pixel_Gamma_Scaled[9];
  self->_BKDM_3Plane_2Pixel_Gamma_Scaled[9] = v175;

  v177 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Gamma_Scaled_LinearStretch" colorFormat:103 useCustomMatrix:0 p3CSC:1 applyYGamma:1];
  v178 = self->_BKDM_3Plane_2Pixel_Gamma_Scaled[10];
  self->_BKDM_3Plane_2Pixel_Gamma_Scaled[10] = v177;

  v179 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Gamma_Scaled_LinearStretch" colorFormat:103 useCustomMatrix:1 p3CSC:1 applyYGamma:1];
  v180 = self->_BKDM_3Plane_2Pixel_Gamma_Scaled[11];
  self->_BKDM_3Plane_2Pixel_Gamma_Scaled[11] = v179;

  v181 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Video_Scaled" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v182 = self->_BKDM_3Plane_1Pixel_Video_Scaled[0];
  self->_BKDM_3Plane_1Pixel_Video_Scaled[0] = v181;

  v183 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Video_Scaled" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v184 = self->_BKDM_3Plane_1Pixel_Video_Scaled[1];
  self->_BKDM_3Plane_1Pixel_Video_Scaled[1] = v183;

  v185 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Video_Scaled_HDR10" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v186 = self->_BKDM_3Plane_1Pixel_Video_Scaled[2];
  self->_BKDM_3Plane_1Pixel_Video_Scaled[2] = v185;

  v187 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Video_Scaled_HDR10" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v188 = self->_BKDM_3Plane_1Pixel_Video_Scaled[3];
  self->_BKDM_3Plane_1Pixel_Video_Scaled[3] = v187;

  v189 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Video_Scaled_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:0];
  v190 = self->_BKDM_3Plane_1Pixel_Video_Scaled[4];
  self->_BKDM_3Plane_1Pixel_Video_Scaled[4] = v189;

  v191 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Video_Scaled_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:0];
  v192 = self->_BKDM_3Plane_1Pixel_Video_Scaled[5];
  self->_BKDM_3Plane_1Pixel_Video_Scaled[5] = v191;

  v193 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Video_Scaled" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v194 = self->_BKDM_3Plane_1Pixel_Video_Scaled[6];
  self->_BKDM_3Plane_1Pixel_Video_Scaled[6] = v193;

  v195 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Video_Scaled" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v196 = self->_BKDM_3Plane_1Pixel_Video_Scaled[7];
  self->_BKDM_3Plane_1Pixel_Video_Scaled[7] = v195;

  v197 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Video_Scaled_HDR10" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v198 = self->_BKDM_3Plane_1Pixel_Video_Scaled[8];
  self->_BKDM_3Plane_1Pixel_Video_Scaled[8] = v197;

  v199 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Video_Scaled_HDR10" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v200 = self->_BKDM_3Plane_1Pixel_Video_Scaled[9];
  self->_BKDM_3Plane_1Pixel_Video_Scaled[9] = v199;

  v201 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Video_Scaled_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:1];
  v202 = self->_BKDM_3Plane_1Pixel_Video_Scaled[10];
  self->_BKDM_3Plane_1Pixel_Video_Scaled[10] = v201;

  v203 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_1Pixel_Video_Scaled_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:1];
  v204 = self->_BKDM_3Plane_1Pixel_Video_Scaled[11];
  self->_BKDM_3Plane_1Pixel_Video_Scaled[11] = v203;

  v205 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Video_Scaled" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v206 = self->_BKDM_3Plane_2Pixel_Video_Scaled[0];
  self->_BKDM_3Plane_2Pixel_Video_Scaled[0] = v205;

  v207 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Video_Scaled" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v208 = self->_BKDM_3Plane_2Pixel_Video_Scaled[1];
  self->_BKDM_3Plane_2Pixel_Video_Scaled[1] = v207;

  v209 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Video_Scaled_HDR10" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v210 = self->_BKDM_3Plane_2Pixel_Video_Scaled[2];
  self->_BKDM_3Plane_2Pixel_Video_Scaled[2] = v209;

  v211 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Video_Scaled_HDR10" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v212 = self->_BKDM_3Plane_2Pixel_Video_Scaled[3];
  self->_BKDM_3Plane_2Pixel_Video_Scaled[3] = v211;

  v213 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Video_Scaled_LinearStretch" colorFormat:103 useCustomMatrix:0 p3CSC:1 applyYGamma:0];
  v214 = self->_BKDM_3Plane_2Pixel_Video_Scaled[4];
  self->_BKDM_3Plane_2Pixel_Video_Scaled[4] = v213;

  v215 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Video_Scaled_LinearStretch" colorFormat:103 useCustomMatrix:1 p3CSC:1 applyYGamma:0];
  v216 = self->_BKDM_3Plane_2Pixel_Video_Scaled[5];
  self->_BKDM_3Plane_2Pixel_Video_Scaled[5] = v215;

  v217 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Video_Scaled" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v218 = self->_BKDM_3Plane_2Pixel_Video_Scaled[6];
  self->_BKDM_3Plane_2Pixel_Video_Scaled[6] = v217;

  v219 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Video_Scaled" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v220 = self->_BKDM_3Plane_2Pixel_Video_Scaled[7];
  self->_BKDM_3Plane_2Pixel_Video_Scaled[7] = v219;

  v221 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Video_Scaled_HDR10" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v222 = self->_BKDM_3Plane_2Pixel_Video_Scaled[8];
  self->_BKDM_3Plane_2Pixel_Video_Scaled[8] = v221;

  v223 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Video_Scaled_HDR10" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v224 = self->_BKDM_3Plane_2Pixel_Video_Scaled[9];
  self->_BKDM_3Plane_2Pixel_Video_Scaled[9] = v223;

  v225 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Video_Scaled_LinearStretch" colorFormat:103 useCustomMatrix:0 p3CSC:1 applyYGamma:1];
  v226 = self->_BKDM_3Plane_2Pixel_Video_Scaled[10];
  self->_BKDM_3Plane_2Pixel_Video_Scaled[10] = v225;

  v227 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_3Plane_2Pixel_Video_Scaled_LinearStretch" colorFormat:103 useCustomMatrix:1 p3CSC:1 applyYGamma:1];
  v228 = self->_BKDM_3Plane_2Pixel_Video_Scaled[11];
  self->_BKDM_3Plane_2Pixel_Video_Scaled[11] = v227;

  v229 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill1_hdmi" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v230 = self->_colorfill1[0];
  self->_colorfill1[0] = v229;

  v231 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill1_hdmi" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v232 = self->_colorfill1[1];
  self->_colorfill1[1] = v231;

  v233 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill1_dp" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v234 = self->_colorfill1[2];
  self->_colorfill1[2] = v233;

  v235 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill1_dp" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v236 = self->_colorfill1[3];
  self->_colorfill1[3] = v235;

  v237 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill1_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:0];
  v238 = self->_colorfill1[4];
  self->_colorfill1[4] = v237;

  v239 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill1_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:0];
  v240 = self->_colorfill1[5];
  self->_colorfill1[5] = v239;

  v241 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill1_hdmi" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v242 = self->_colorfill1[6];
  self->_colorfill1[6] = v241;

  v243 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill1_hdmi" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v244 = self->_colorfill1[7];
  self->_colorfill1[7] = v243;

  v245 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill1_dp" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v246 = self->_colorfill1[8];
  self->_colorfill1[8] = v245;

  v247 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill1_dp" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v248 = self->_colorfill1[9];
  self->_colorfill1[9] = v247;

  v249 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill1_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:1];
  v250 = self->_colorfill1[10];
  self->_colorfill1[10] = v249;

  v251 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill1_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:1];
  v252 = self->_colorfill1[11];
  self->_colorfill1[11] = v251;

  v253 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill2_hdmi" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v254 = self->_colorfill2[0];
  self->_colorfill2[0] = v253;

  v255 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill2_hdmi" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v256 = self->_colorfill2[1];
  self->_colorfill2[1] = v255;

  v257 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill2_dp" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v258 = self->_colorfill2[2];
  self->_colorfill2[2] = v257;

  v259 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill2_dp" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v260 = self->_colorfill2[3];
  self->_colorfill2[3] = v259;

  v261 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill2_LinearStretch" colorFormat:103 useCustomMatrix:0 p3CSC:1 applyYGamma:0];
  v262 = self->_colorfill2[4];
  self->_colorfill2[4] = v261;

  v263 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill2_LinearStretch" colorFormat:103 useCustomMatrix:1 p3CSC:1 applyYGamma:0];
  v264 = self->_colorfill2[5];
  self->_colorfill2[5] = v263;

  v265 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill2_hdmi" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v266 = self->_colorfill2[6];
  self->_colorfill2[6] = v265;

  v267 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill2_hdmi" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v268 = self->_colorfill2[7];
  self->_colorfill2[7] = v267;

  v269 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill2_dp" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v270 = self->_colorfill2[8];
  self->_colorfill2[8] = v269;

  v271 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill2_dp" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v272 = self->_colorfill2[9];
  self->_colorfill2[9] = v271;

  v273 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill2_LinearStretch" colorFormat:103 useCustomMatrix:0 p3CSC:1 applyYGamma:1];
  v274 = self->_colorfill2[10];
  self->_colorfill2[10] = v273;

  v275 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_colorfill2_LinearStretch" colorFormat:103 useCustomMatrix:1 p3CSC:1 applyYGamma:1];
  v276 = self->_colorfill2[11];
  self->_colorfill2[11] = v275;

  v277 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_HDR_hdmi" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v278 = self->_fillUI1ForHDR[0];
  self->_fillUI1ForHDR[0] = v277;

  v279 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_HDR_hdmi" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v280 = self->_fillUI1ForHDR[1];
  self->_fillUI1ForHDR[1] = v279;

  v281 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_HDR_dp" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v282 = self->_fillUI1ForHDR[2];
  self->_fillUI1ForHDR[2] = v281;

  v283 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_HDR_dp" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v284 = self->_fillUI1ForHDR[3];
  self->_fillUI1ForHDR[3] = v283;

  v285 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_HDR_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:0];
  v286 = self->_fillUI1ForHDR[4];
  self->_fillUI1ForHDR[4] = v285;

  v287 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_HDR_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:0];
  v288 = self->_fillUI1ForHDR[5];
  self->_fillUI1ForHDR[5] = v287;

  v289 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_HDR_hdmi" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v290 = self->_fillUI1ForHDR[6];
  self->_fillUI1ForHDR[6] = v289;

  v291 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_HDR_hdmi" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v292 = self->_fillUI1ForHDR[7];
  self->_fillUI1ForHDR[7] = v291;

  v293 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_HDR_dp" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v294 = self->_fillUI1ForHDR[8];
  self->_fillUI1ForHDR[8] = v293;

  v295 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_HDR_dp" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v296 = self->_fillUI1ForHDR[9];
  self->_fillUI1ForHDR[9] = v295;

  v297 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_HDR_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:1];
  v298 = self->_fillUI1ForHDR[10];
  self->_fillUI1ForHDR[10] = v297;

  v299 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_HDR_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:1];
  v300 = self->_fillUI1ForHDR[11];
  self->_fillUI1ForHDR[11] = v299;

  for (uint64_t i = 0; i != 11; ++i)
    objc_storeStrong((id *)&self->_fillUI1ForHDR_Inverse_YScale[i + 1], self->_fillUI1ForHDR[i + 1]);
  v302 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_HDR_Inverse_YScale_dp" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v303 = self->_fillUI1ForHDR_Inverse_YScale[2];
  self->_fillUI1ForHDR_Inverse_YScale[2] = v302;

  char v304 = 1;
  v305 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_HDR_Inverse_YScale_dp" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v306 = self->_fillUI1ForHDR_Inverse_YScale[3];
  self->_fillUI1ForHDR_Inverse_YScale[3] = v305;

  v307 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_sRGB_hdmi" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v308 = self->_fillUI1SDR24[0];
  self->_fillUI1SDR24[0] = v307;

  v309 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_sRGB_hdmi" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v310 = self->_fillUI1SDR24[1];
  self->_fillUI1SDR24[1] = v309;

  v311 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_sRGB_dp" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v312 = self->_fillUI1SDR24[2];
  self->_fillUI1SDR24[2] = v311;

  v313 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_sRGB_dp" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v314 = self->_fillUI1SDR24[3];
  self->_fillUI1SDR24[3] = v313;

  v315 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_sRGB_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:0];
  v316 = self->_fillUI1SDR24[4];
  self->_fillUI1SDR24[4] = v315;

  v317 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_sRGB_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:0];
  v318 = self->_fillUI1SDR24[5];
  self->_fillUI1SDR24[5] = v317;

  v319 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_sRGB_hdmi" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v320 = self->_fillUI1SDR24[6];
  self->_fillUI1SDR24[6] = v319;

  v321 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_sRGB_hdmi" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v322 = self->_fillUI1SDR24[7];
  self->_fillUI1SDR24[7] = v321;

  v323 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_sRGB_dp" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v324 = self->_fillUI1SDR24[8];
  self->_fillUI1SDR24[8] = v323;

  v325 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_sRGB_dp" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v326 = self->_fillUI1SDR24[9];
  self->_fillUI1SDR24[9] = v325;

  v327 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_sRGB_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:1];
  v328 = self->_fillUI1SDR24[10];
  self->_fillUI1SDR24[10] = v327;

  v329 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI1_sRGB_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:1];
  v330 = self->_fillUI1SDR24[11];
  self->_fillUI1SDR24[11] = v329;

  v331 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI2_HDR_hdmi" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v332 = self->_fillUI2ForHDR[0];
  self->_fillUI2ForHDR[0] = v331;

  v333 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI2_HDR_hdmi" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v334 = self->_fillUI2ForHDR[1];
  self->_fillUI2ForHDR[1] = v333;

  v335 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI2_HDR_dp" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  v336 = self->_fillUI2ForHDR[2];
  self->_fillUI2ForHDR[2] = v335;

  v337 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI2_HDR_dp" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
  v338 = self->_fillUI2ForHDR[3];
  self->_fillUI2ForHDR[3] = v337;

  v339 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI2_HDR_LinearStretch" colorFormat:103 useCustomMatrix:0 p3CSC:1 applyYGamma:0];
  v340 = self->_fillUI2ForHDR[4];
  self->_fillUI2ForHDR[4] = v339;

  v341 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI2_HDR_LinearStretch" colorFormat:103 useCustomMatrix:1 p3CSC:1 applyYGamma:0];
  v342 = self->_fillUI2ForHDR[5];
  self->_fillUI2ForHDR[5] = v341;

  v343 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI2_HDR_hdmi" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v344 = self->_fillUI2ForHDR[6];
  self->_fillUI2ForHDR[6] = v343;

  v345 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI2_HDR_hdmi" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v346 = self->_fillUI2ForHDR[7];
  self->_fillUI2ForHDR[7] = v345;

  v347 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI2_HDR_dp" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:1];
  v348 = self->_fillUI2ForHDR[8];
  self->_fillUI2ForHDR[8] = v347;

  v349 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI2_HDR_dp" colorFormat:103 useCustomMatrix:1 p3CSC:0 applyYGamma:1];
  v350 = self->_fillUI2ForHDR[9];
  self->_fillUI2ForHDR[9] = v349;

  v351 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI2_HDR_LinearStretch" colorFormat:103 useCustomMatrix:0 p3CSC:1 applyYGamma:1];
  v352 = self->_fillUI2ForHDR[10];
  self->_fillUI2ForHDR[10] = v351;

  v353 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_fillUI2_HDR_LinearStretch" colorFormat:103 useCustomMatrix:1 p3CSC:1 applyYGamma:1];
  v354 = self->_fillUI2ForHDR[11];
  self->_fillUI2ForHDR[11] = v353;

  uint64_t v355 = 0;
  BKDM_SDRUIOnly_ShaderDegamma = self->_BKDM_SDRUIOnly_ShaderDegamma;
  do
  {
    char v357 = v304;
    uint64_t v358 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_UI_ShaderDEGAMMA" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
    v359 = &BKDM_SDRUIOnly_ShaderDegamma[v355];
    uint64_t v360 = 8 * v355;
    v361 = *v359;
    *v359 = (BackwardDmShader *)v358;

    uint64_t v362 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_UI_ShaderDEGAMMA" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
    v363 = *(BackwardDmShader **)((char *)BKDM_SDRUIOnly_ShaderDegamma + (v360 | 8));
    *(BackwardDmShader **)((char *)BKDM_SDRUIOnly_ShaderDegamma + (v360 | 8)) = (BackwardDmShader *)v362;

    uint64_t v364 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_UI_ShaderDEGAMMA_HDR10" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
    v365 = v359[2];
    v359[2] = (BackwardDmShader *)v364;

    uint64_t v366 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_UI_ShaderDEGAMMA_HDR10" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
    v367 = v359[3];
    v359[3] = (BackwardDmShader *)v366;

    uint64_t v368 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_UI_ShaderDEGAMMA_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:0];
    v369 = v359[4];
    v359[4] = (BackwardDmShader *)v368;

    uint64_t v370 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_UI_ShaderDEGAMMA_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:0];
    v371 = v359[5];
    v359[5] = (BackwardDmShader *)v370;

    char v304 = 0;
    uint64_t v355 = 6;
  }
  while ((v357 & 1) != 0);
  uint64_t v372 = 0;
  BKDM_SDRUIOnly = self->_BKDM_SDRUIOnly;
  char v374 = 1;
  do
  {
    char v375 = v374;
    uint64_t v376 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_UI" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
    v377 = &BKDM_SDRUIOnly[v372];
    uint64_t v378 = 8 * v372;
    v379 = *v377;
    *v377 = (BackwardDmShader *)v376;

    uint64_t v380 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_UI" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
    v381 = *(BackwardDmShader **)((char *)BKDM_SDRUIOnly + (v378 | 8));
    *(BackwardDmShader **)((char *)BKDM_SDRUIOnly + (v378 | 8)) = (BackwardDmShader *)v380;

    uint64_t v382 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_UI_HDR10" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
    v383 = v377[2];
    v377[2] = (BackwardDmShader *)v382;

    uint64_t v384 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_UI_HDR10" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
    v385 = v377[3];
    v377[3] = (BackwardDmShader *)v384;

    uint64_t v386 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_UI_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:0];
    v387 = v377[4];
    v377[4] = (BackwardDmShader *)v386;

    uint64_t v388 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_UI_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:0];
    v389 = v377[5];
    v377[5] = (BackwardDmShader *)v388;

    char v374 = 0;
    uint64_t v372 = 6;
  }
  while ((v375 & 1) != 0);
  uint64_t v390 = 0;
  BKDM_SDRVideoOnly = self->_BKDM_SDRVideoOnly;
  char v392 = 1;
  do
  {
    char v393 = v392;
    uint64_t v394 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_Video" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
    v395 = &BKDM_SDRVideoOnly[v390];
    uint64_t v396 = 8 * v390;
    v397 = *v395;
    *v395 = (BackwardDmShader *)v394;

    uint64_t v398 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_Video" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
    v399 = *(BackwardDmShader **)((char *)BKDM_SDRVideoOnly + (v396 | 8));
    *(BackwardDmShader **)((char *)BKDM_SDRVideoOnly + (v396 | 8)) = (BackwardDmShader *)v398;

    uint64_t v400 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_Video_HDR10" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
    v401 = v395[2];
    v395[2] = (BackwardDmShader *)v400;

    uint64_t v402 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_Video_HDR10" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
    v403 = v395[3];
    v395[3] = (BackwardDmShader *)v402;

    uint64_t v404 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_Video_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:0];
    v405 = v395[4];
    v395[4] = (BackwardDmShader *)v404;

    uint64_t v406 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_SDR_Video_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:0];
    v407 = v395[5];
    v395[5] = (BackwardDmShader *)v406;

    char v392 = 0;
    uint64_t v390 = 6;
  }
  while ((v393 & 1) != 0);
  uint64_t v408 = 0;
  BKDM_SDRVideoUIBlending = self->_BKDM_SDRVideoUIBlending;
  char v410 = 1;
  do
  {
    char v411 = v410;
    uint64_t v412 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_video_ui_blending" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
    v413 = &BKDM_SDRVideoUIBlending[v408];
    uint64_t v414 = 8 * v408;
    v415 = *v413;
    *v413 = (BackwardDmShader *)v412;

    uint64_t v416 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_video_ui_blending" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
    v417 = *(BackwardDmShader **)((char *)BKDM_SDRVideoUIBlending + (v414 | 8));
    *(BackwardDmShader **)((char *)BKDM_SDRVideoUIBlending + (v414 | 8)) = (BackwardDmShader *)v416;

    uint64_t v418 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_video_ui_blending_HDR10" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
    v419 = v413[2];
    v413[2] = (BackwardDmShader *)v418;

    uint64_t v420 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_video_ui_blending_HDR10" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
    v421 = v413[3];
    v413[3] = (BackwardDmShader *)v420;

    uint64_t v422 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_video_ui_blending_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:0];
    v423 = v413[4];
    v413[4] = (BackwardDmShader *)v422;

    uint64_t v424 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_video_ui_blending_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:0];
    v425 = v413[5];
    v413[5] = (BackwardDmShader *)v424;

    char v410 = 0;
    uint64_t v408 = 6;
  }
  while ((v411 & 1) != 0);
  uint64_t v426 = 0;
  BKDM_SDRUIBlending = self->_BKDM_SDRUIBlending;
  char v428 = 1;
  do
  {
    char v429 = v428;
    uint64_t v430 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_ui_blending" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
    v431 = &BKDM_SDRUIBlending[v426];
    uint64_t v432 = 8 * v426;
    v433 = *v431;
    *v431 = (BackwardDmShader *)v430;

    uint64_t v434 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_ui_blending" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
    v435 = *(BackwardDmShader **)((char *)BKDM_SDRUIBlending + (v432 | 8));
    *(BackwardDmShader **)((char *)BKDM_SDRUIBlending + (v432 | 8)) = (BackwardDmShader *)v434;

    uint64_t v436 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_ui_blending_HDR10" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
    v437 = v431[2];
    v431[2] = (BackwardDmShader *)v436;

    uint64_t v438 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_ui_blending_HDR10" colorFormat:53 useCustomMatrix:1 p3CSC:0 applyYGamma:0];
    v439 = v431[3];
    v431[3] = (BackwardDmShader *)v438;

    uint64_t v440 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_ui_blending_LinearStretch" colorFormat:53 useCustomMatrix:0 p3CSC:1 applyYGamma:0];
    v441 = v431[4];
    v431[4] = (BackwardDmShader *)v440;

    uint64_t v442 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"rdm_vert" fragmentName:@"frag_bkwrd_ui_blending_LinearStretch" colorFormat:53 useCustomMatrix:1 p3CSC:1 applyYGamma:0];
    v443 = v431[5];
    v431[5] = (BackwardDmShader *)v442;

    char v428 = 0;
    uint64_t v426 = 6;
  }
  while ((v429 & 1) != 0);
  v444 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"frag_compdm_bkwrd_cif10_metadata_vert" fragmentName:@"frag_compdm_bkwrd_cif10_metadata_frag" colorFormat:53 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  metadataKernel = self->_metadataKernel;
  self->_metadataKernel = v444;

  v446 = [(HDRBackwardDisplayManagement *)self createShaderWithVertexName:@"frag_compdm_bkwrd_cif10_metadata_vert" fragmentName:@"frag_compdm_bkwrd_cif10_metadata_frag_2" colorFormat:103 useCustomMatrix:0 p3CSC:0 applyYGamma:0];
  metadataKernel2Pixel = self->_metadataKernel2Pixel;
  self->_metadataKernel2Pixel = v446;
}

- (void)createSamplers
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  [v3 setSAddressMode:4];
  [v3 setTAddressMode:4];
  [v3 setMagFilter:1];
  [v3 setMinFilter:1];
  v4 = (MTLSamplerState *)[(MTLDeviceSPI *)self->_device newSamplerStateWithDescriptor:v3];
  inputSampler = self->_inputSampler;
  self->_inputSampler = v4;

  if (!self->_inputSampler)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v6 = logInstanceID;
      }
      else {
        uint64_t v6 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134218242;
        uint64_t v8 = (const char *)WORD1(v6);
        __int16 v9 = 2080;
        uint64_t v10 = "-[HDRBackwardDisplayManagement createSamplers]";
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : Failed to create sampler for composer", (uint8_t *)&v7, 0x16u);
      }
      prevLogInstanceID = v6;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[HDRBackwardDisplayManagement createSamplers]";
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : Failed to create sampler for composer", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)createPQ2LTable
{
  v3 = malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
  setPQ2LBuffer((uint64_t)v3, 0x400uLL);
  id v4 = objc_alloc_init(MEMORY[0x263F12A50]);
  [v4 setTextureType:0];
  [v4 setHeight:1];
  [v4 setWidth:1024];
  [v4 setDepth:1];
  [v4 setPixelFormat:55];
  [v4 setArrayLength:1];
  [v4 setMipmapLevelCount:1];
  v5 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v4];
  pq2LTable = self->_pq2LTable;
  self->_pq2LTable = v5;

  int v7 = self->_pq2LTable;
  memset(v8, 0, sizeof(v8));
  long long v9 = xmmword_2222D11F0;
  uint64_t v10 = 1;
  [(MTLTexture *)v7 replaceRegion:v8 mipmapLevel:0 slice:0 withBytes:v3 bytesPerRow:4096 bytesPerImage:0];
  free(v3);
}

- (void)createL2PQTable
{
  v3 = malloc_type_malloc(0x2000uLL, 0xB8FC7524uLL);
  setL2PQBuffer((uint64_t)v3, 0x800uLL, 16.0, 4000.0);
  id v4 = objc_alloc_init(MEMORY[0x263F12A50]);
  [v4 setTextureType:0];
  [v4 setHeight:1];
  [v4 setWidth:2048];
  [v4 setDepth:1];
  [v4 setPixelFormat:55];
  [v4 setArrayLength:1];
  [v4 setMipmapLevelCount:1];
  v5 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v4];
  l2PQTable = self->_l2PQTable;
  self->_l2PQTable = v5;

  int v7 = self->_l2PQTable;
  memset(v8, 0, sizeof(v8));
  long long v9 = xmmword_2222D1200;
  uint64_t v10 = 1;
  [(MTLTexture *)v7 replaceRegion:v8 mipmapLevel:0 slice:0 withBytes:v3 bytesPerRow:0x2000 bytesPerImage:0];
  free(v3);
}

- (void)createInverseScalingFactorTable
{
  v3 = [MEMORY[0x263EFF990] dataWithLength:4096];
  inverseScalingTable = self->_inverseScalingTable;
  self->_inverseScalingTable = v3;

  id v9 = objc_alloc_init(MEMORY[0x263F12A50]);
  [v9 setTextureType:0];
  [v9 setHeight:1];
  [v9 setWidth:1024];
  [v9 setDepth:1];
  [v9 setPixelFormat:55];
  [v9 setArrayLength:1];
  [v9 setMipmapLevelCount:1];
  uint64_t v5 = 0;
  inverseScalingFactorTableTextures = self->_inverseScalingFactorTableTextures;
  do
  {
    uint64_t v7 = [(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v9];
    uint64_t v8 = inverseScalingFactorTableTextures[v5];
    inverseScalingFactorTableTextures[v5] = (MTLTexture *)v7;

    ++v5;
  }
  while (v5 != 3);
}

- (void)createSDRScalingFactorTable
{
  v3 = [MEMORY[0x263EFF990] dataWithLength:2048];
  sdrScalingTable = self->_sdrScalingTable;
  self->_sdrScalingTable = v3;

  id v7 = objc_alloc_init(MEMORY[0x263F12A50]);
  [v7 setTextureType:0];
  [v7 setHeight:1];
  [v7 setWidth:256];
  [v7 setDepth:1];
  [v7 setPixelFormat:105];
  [v7 setArrayLength:1];
  [v7 setMipmapLevelCount:1];
  uint64_t v5 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v7];
  sdrScalingFactorTableTexture = self->_sdrScalingFactorTableTexture;
  self->_sdrScalingFactorTableTexture = v5;
}

- (void)createYUVScalingFactorTable
{
  v3 = [MEMORY[0x263EFF990] dataWithLength:0x2000];
  yuvScalingTable = self->_yuvScalingTable;
  self->_yuvScalingTable = v3;

  uint64_t v5 = 0;
  yuvScalingFactorTableTextures = self->_yuvScalingFactorTableTextures;
  do
  {
    id v7 = objc_alloc_init(MEMORY[0x263F12A50]);
    [v7 setTextureType:0];
    [v7 setHeight:1];
    [v7 setWidth:1024];
    [v7 setDepth:1];
    [v7 setPixelFormat:105];
    [v7 setArrayLength:1];
    [v7 setMipmapLevelCount:1];
    uint64_t v8 = [(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v7];
    id v9 = yuvScalingFactorTableTextures[v5];
    yuvScalingFactorTableTextures[v5] = (MTLTexture *)v8;

    ++v5;
  }
  while (v5 != 3);
}

- (void)fillInverseScalingFactorTableFromDMConfig:(id *)a3
{
  NSUInteger v5 = [(NSMutableData *)self->_inverseScalingTable length];
  uint64_t v6 = [(NSMutableData *)self->_inverseScalingTable mutableBytes];
  id v7 = v6;
  if (self->_prev_SlopeScaled != a3->var0
    || self->_prev_c1 != a3->var1
    || self->_prev_c2 != a3->var2
    || self->_prev_c3 != a3->var3)
  {
    setInverseScalingFactorTable((uint64_t)v6, 0x400uLL, &a3->var0);
    ++self->_inverseScalingTableIndex;
    self->_prev_SlopeScaled = a3->var0;
    self->_prev_c1 = a3->var1;
    self->_prev_c2 = a3->var2;
    self->_prev_c3 = a3->var3;
  }
  inverseScalingFactorTableTexture = self->_inverseScalingFactorTableTexture;
  memset(v9, 0, sizeof(v9));
  long long v10 = xmmword_2222D11F0;
  uint64_t v11 = 1;
  [(MTLTexture *)inverseScalingFactorTableTexture replaceRegion:v9 mipmapLevel:0 slice:0 withBytes:v7 bytesPerRow:v5 bytesPerImage:0];
}

- (void)fillScalingTable_SDR2HDR:(id *)a3 target_White:(float)a4 target_Black:(float)a5
{
  NSUInteger v8 = [(NSMutableData *)self->_sdrScalingTable length];
  id v9 = [(NSMutableData *)self->_sdrScalingTable mutableBytes];
  long long v10 = v9;
  if (vabds_f32(self->_cached_target_white, a4) > 0.0000001 || vabds_f32(self->_cached_target_black, a5) > 0.0000001)
  {
    self->_cached_target_white = a4;
    self->_cached_target_black = a5;
    GetToneMap_SDR_DOLBY(v9, 0x100uLL, a4, a5, 100.0, 0.005, 1.0);
    sdrScalingFactorTableTexture = self->_sdrScalingFactorTableTexture;
    memset(v12, 0, sizeof(v12));
    long long v13 = xmmword_2222D1210;
    uint64_t v14 = 1;
    [(MTLTexture *)sdrScalingFactorTableTexture replaceRegion:v12 mipmapLevel:0 slice:0 withBytes:v10 bytesPerRow:v8 bytesPerImage:0];
  }
}

- (void)fillScalingTable_YUVTM:(id *)a3 targetwhite:(float)a4 targetblack:(float)a5 satBoost:(float)a6 scalingFactor:(BOOL)a7 sdrOnly:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  NSUInteger v14 = [(NSMutableData *)self->_yuvScalingTable length];
  v15 = [(NSMutableData *)self->_yuvScalingTable mutableBytes];
  __int16 v16 = v15;
  int v17 = a3->var20 != 1 && v9;
  if (vabds_f32(self->_cached_target_white, a4) > 0.0000001
    || vabds_f32(self->_cached_target_black, a5) > 0.0000001
    || vabds_f32(self->_cached_source_white, (float)a3->var16) > 0.0000001
    || vabds_f32(self->_cached_source_black, a3->var17) > 0.0000001
    || self->_cached_scaling_factor != v17)
  {
    self->_cached_target_white = a4;
    self->_cached_target_black = a5;
    self->_cached_scaling_factor = v17;
    GetToneMap_YUV_TM(v15, 0x400uLL, v17, v8, a4, a5, (float)a3->var16, a3->var17, 1.0);
    unsigned int v18 = (self->_indexOfyuvScalingFactorTableTexture + 1) % 3;
    self->_indexOfyuvScalingFactorTableTexture = v18;
    objc_storeStrong((id *)&self->_yuvScalingFactorTableTexture, self->_yuvScalingFactorTableTextures[v18]);
    yuvScalingFactorTableTexture = self->_yuvScalingFactorTableTexture;
    memset(v20, 0, sizeof(v20));
    long long v21 = xmmword_2222D11F0;
    uint64_t v22 = 1;
    [(MTLTexture *)yuvScalingFactorTableTexture replaceRegion:v20 mipmapLevel:0 slice:0 withBytes:v16 bytesPerRow:v14 bytesPerImage:0];
    self->_cached_source_white = (float)a3->var16;
    self->_cached_source_black = a3->var17;
  }
}

- (void)createBuffers
{
  uint64_t v3 = 0;
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v11 = xmmword_2222D1220;
  do
  {
    id v4 = (MTLBuffer *)-[MTLDeviceSPI newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 320, 0, v11);
    NSUInteger v5 = self->_uniformBuffers[v3];
    self->_uniformBuffers[v3] = v4;

    *(_OWORD *)([(MTLBuffer *)self->_uniformBuffers[v3] contents] + 272) = v11;
    uint64_t v6 = (MTLBuffer *)[(MTLDeviceSPI *)self->_device newBufferWithLength:1024 options:0];
    id v7 = self->_vertsBufs[v3];
    self->_vertsBufs[v3] = v6;

    ++v3;
  }
  while (v3 != 3);
  BOOL v8 = (MTLBuffer *)[(MTLDeviceSPI *)self->_device newBufferWithBytes:&vertices length:64 options:0];
  vertsBuffer = self->_vertsBuffer;
  self->_vertsBuffer = v8;

  if (!self->_vertsBuffer)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v10 = logInstanceID;
      }
      else {
        uint64_t v10 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v13 = WORD1(v10);
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"_vertsBuffer\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/BackwardDisplayManagement/HDRBackwardDisplayManagement.mm\" at line 2476\n", buf, 0xCu);
      }
      prevLogInstanceID = v10;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"_vertsBuffer\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/BackwardDisplayManagement/HDRBackwardDisplayManagement.mm\" at line 2476\n", buf, 2u);
    }
  }
}

- (void)createMetadataTexture
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:13 width:128 height:1 mipmapped:0];
  uint64_t v4 = 0;
  metadataTextures = self->_metadataTextures;
  uint64_t v6 = &_os_log_internal;
  *(void *)&long long v7 = 136315906;
  long long v13 = v7;
  do
  {
    for (uint64_t i = 0; i != 5; ++i)
    {
      uint64_t v9 = -[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v3, v13);
      uint64_t v10 = (void **)&(*metadataTextures)[i];
      long long v11 = *v10;
      *uint64_t v10 = (void *)v9;

      if (!*v10)
      {
        if (enableLogInstance)
        {
          if (logInstanceID) {
            uint64_t v12 = logInstanceID;
          }
          else {
            uint64_t v12 = prevLogInstanceID;
          }
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134219010;
            v15 = (const char *)WORD1(v12);
            __int16 v16 = 2080;
            *(void *)int v17 = "-[HDRBackwardDisplayManagement createMetadataTexture]";
            *(_WORD *)&v17[8] = 1024;
            *(_DWORD *)unsigned int v18 = v4;
            *(_WORD *)&v18[4] = 1024;
            *(_DWORD *)&v18[6] = i;
            __int16 v19 = 2048;
            uint64_t v20 = 0;
            _os_log_impl(&dword_22224D000, v6, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : HDR error: Failed to create MTLTexture For _metadataTextures[%d][%d]=%p\n", buf, 0x2Cu);
          }
          prevLogInstanceID = v12;
        }
        else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          v15 = "-[HDRBackwardDisplayManagement createMetadataTexture]";
          __int16 v16 = 1024;
          *(_DWORD *)int v17 = v4;
          *(_WORD *)&v17[4] = 1024;
          *(_DWORD *)&v17[6] = i;
          *(_WORD *)unsigned int v18 = 2048;
          *(void *)&v18[2] = 0;
          _os_log_impl(&dword_22224D000, v6, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : HDR error: Failed to create MTLTexture For _metadataTextures[%d][%d]=%p\n", buf, 0x22u);
        }
      }
    }
    ++v4;
    ++metadataTextures;
  }
  while (v4 != 3);
}

- (void)createMetadataVertexBuffer
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  double v3 = floor(3072.0 / (double)self->_targetWidth);
  uint64_t v4 = (MTLBuffer *)[(MTLDeviceSPI *)self->_device newBufferWithLength:vcvtd_n_s64_f64((v3 + 2.0) * 5.0 + (v3 + 2.0) * 5.0, 4uLL) options:0];
  metadataVertexBuffer = self->_metadataVertexBuffer;
  self->_metadataVertexBuffer = v4;

  if (!self->_metadataVertexBuffer)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v6 = logInstanceID;
      }
      else {
        uint64_t v6 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 134217984;
        uint64_t v25 = WORD1(v6);
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"_metadataVertexBuffer\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/BackwardDisplayManagement/HDRBackwardDisplayManagement.mm\" at line 2515\n", (uint8_t *)&v24, 0xCu);
      }
      prevLogInstanceID = v6;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"_metadataVertexBuffer\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/BackwardDisplayManagement/HDRBackwardDisplayManagement.mm\" at line 2515\n", (uint8_t *)&v24, 2u);
    }
  }
  long long v7 = (float *)[(MTLBuffer *)self->_metadataVertexBuffer contents];
  uint64_t v8 = 0;
  int v9 = 0;
  int v10 = 0;
  do
  {
    int v11 = 0;
    int v12 = 0;
    int targetWidth = self->_targetWidth;
    double v14 = (double)targetWidth;
    double targetHeight = (double)self->_targetHeight;
    float v16 = ((double)(int)v8 + 0.5) / 5.0;
    do
    {
      int v17 = targetWidth - v10;
      if (targetWidth - v10 >= 3072 - v11) {
        int v17 = 3072 - v11;
      }
      float v18 = ((double)v10 + 0.5) / v14;
      float v19 = ((double)v11 + 0.5) * 0.0009765625;
      v7[2] = v19;
      v7[3] = v16;
      v10 += v17;
      float v20 = ((double)v9 + 0.5) / targetHeight;
      v11 += v17;
      *long long v7 = v18;
      v7[1] = v20;
      float v21 = ((double)v10 + 0.5) / v14;
      float v22 = ((double)v11 + 0.5) * 0.0009765625;
      float v23 = v7 + 8;
      ++v12;
      v7[4] = v21;
      v7[5] = v20;
      v7[6] = v22;
      v7[7] = v16;
      if (v10 == targetWidth)
      {
        int v10 = 0;
        ++v9;
      }
      v7 += 8;
    }
    while (v11 < 3072);
    self->_metadataSpanCount[v8++] = v12;
    long long v7 = v23;
  }
  while (v8 != 5);
}

- (void)updateVertices:(id)a3 videoInput:(__IOSurface *)a4 videoDstRegion:(id)a5 videoSrcRegion:(id)a6 uiInput:(__IOSurface *)a7 uiDstRegion:(id)a8 uiSrcRegion:(id)a9 dstWidth:(int)a10 dstHeight:(int)a11 videoSrcWidth:(int)a12 videoSrcHeight:(int)a13 index:(int)a14 scale:(int)a15
{
  unsigned int var1 = a5.var1.var1;
  v67.origin = ($E903C2A7C2E773B40766EDD788E6C3F6)a3.var0;
  v67.size.height = a3.var1.var1;
  DWORD1(v66) = a5.var0.var1;
  HIDWORD(v66) = a5.var1.var1;
  DWORD1(v65) = a6.var0.var1;
  HIDWORD(v65) = a6.var1.var1;
  DWORD1(v64) = a8.var0.var1;
  HIDWORD(v64) = a8.var1.var1;
  DWORD1(v63) = a9.var0.var1;
  HIDWORD(v63) = a9.var1.var1;
  v67.size.width = a3.var1.var0 / a15;
  unsigned int v54 = a5.var0.var1;
  unsigned int v58 = a5.var0.var0 / a15;
  LODWORD(v66) = a5.var0.var0 / a15;
  unsigned int v55 = a5.var1.var0 / a15;
  DWORD2(v66) = a5.var1.var0 / a15;
  unsigned int v57 = a6.var0.var0 / a15;
  LODWORD(v65) = a6.var0.var0 / a15;
  DWORD2(v65) = a6.var1.var0 / a15;
  LODWORD(v64) = a8.var0.var0 / a15;
  DWORD2(v64) = a8.var1.var0 / a15;
  LODWORD(v63) = a9.var0.var0 / a15;
  DWORD2(v63) = a9.var1.var0 / a15;
  if (a4)
  {
    OSType PixelFormat = IOSurfaceGetPixelFormat(a4);
    if (a7)
    {
LABEL_3:
      OSType v17 = IOSurfaceGetPixelFormat(a7);
      goto LABEL_6;
    }
  }
  else
  {
    OSType PixelFormat = 0;
    if (a7) {
      goto LABEL_3;
    }
  }
  OSType v17 = 0;
LABEL_6:
  if (*(void *)&v67.origin == *(void *)&self->_cachedFullRegion.origin
    && *(void *)&v67.size == *(void *)&self->_cachedFullRegion.size)
  {
    float v21 = (char *)self + 16 * a14;
    float v22 = self;
    uint64_t v20 = a14;
    uint64_t v23 = *((void *)v21 + 359);
    uint64_t v24 = *((void *)v21 + 360);
    if ((void)v66 == v23 && *((void *)&v66 + 1) == v24)
    {
      float v19 = v22;
      uint64_t v26 = &v22->super.isa + 2 * a14;
      if ((Class)v65 == v26[365] && *((void *)&v65 + 1) == (void)v26[366])
      {
        Class v28 = v26[371];
        Class v29 = v26[372];
        if ((Class)v64 == v28 && *((void *)&v64 + 1) == (void)v29)
        {
          v31 = (char *)v22 + 16 * a14;
          uint64_t v32 = *((void *)v31 + 377);
          uint64_t v33 = *((void *)v31 + 378);
          BOOL v34 = (void)v63 == v32 && *((void *)&v63 + 1) == v33;
          if (v34 && v22->_cached_videoInputFormat == PixelFormat && v22->_cached_uiInputFormat == v17) {
            return;
          }
        }
      }
    }
    else
    {
      float v19 = v22;
    }
  }
  else
  {
    float v19 = self;
    uint64_t v20 = a14;
  }
  int v56 = a10 / a15;
  float v35 = v19;
  p_cachedFullRegion = &v19->_cachedFullRegion;
  float v36 = (float)var1 / (float)a6.var1.var1;
  int v53 = a12 / a15;
  OSType v50 = v17;
  shape_alloc_bounds();
  shape_alloc_bounds();
  shape_alloc_bounds();
  shape_intersect();
  shape_difference();
  shape_difference();
  shape_union();
  shape_difference();
  shape_free();
  shape_free();
  shape_free();
  shape_free();
  v35->_num_Blend_Rects[v20] = 0;
  v35->_num_Video_Rects[v20] = 0;
  v35->_num_UI_Rects[v20] = 0;
  v35->_num_ColorFill_Rects[v20] = 0;
  $F4CBBA381B99B469DB7699D1913B014D *p_cachedFullRegion = v67;
  v37 = (char *)v35 + 16 * v20;
  *(_OWORD *)(v37 + 2872) = v66;
  *(_OWORD *)(v37 + 2920) = v65;
  *(_OWORD *)(v37 + 2968) = v64;
  *(_OWORD *)(v37 + 3016) = v63;
  v35->_cached_videoInputFormat = PixelFormat;
  v35->_cached_uiInputFormat = v50;
  uint64_t v61 = 0;
  uint64_t v62 = 0;
  float v38 = (float *)[(MTLBuffer *)v35->_vertsBuf contents];
  shape_enum_alloc();
  for (; shape_enum_next(); v38 += 16)
  {
    v60.i16[0] = WORD2(v62);
    v60.i16[1] = WORD2(v61);
    v60.i16[2] = v62;
    v60.i16[3] = v61;
    uint64_t v59 = 0;
    *(float *)v39.i32 = (float)v55 / (float)(a6.var1.var0 / a15);
    deriveSrcRect(&v59, &v60, v58, v54, v57, a6.var0.var1, v39, v36, v40, v41, v42);
    createVerticesFromRect(v38, (__int16 *)&v60, v56, a11, (__int16 *)&v59, v53, a13);
    ++v35->_num_Blend_Rects[v20];
  }
  shape_enum_free();
  shape_enum_alloc();
  for (; shape_enum_next(); v38 += 16)
  {
    v60.i16[0] = WORD2(v62);
    v60.i16[1] = WORD2(v61);
    v60.i16[2] = v62;
    v60.i16[3] = v61;
    uint64_t v59 = 0;
    *(float *)v43.i32 = (float)v55 / (float)(a6.var1.var0 / a15);
    deriveSrcRect(&v59, &v60, v58, v54, v57, a6.var0.var1, v43, v36, v44, v45, v46);
    createVerticesFromRect(v38, (__int16 *)&v60, v56, a11, (__int16 *)&v59, v53, a13);
    ++v35->_num_Video_Rects[v20];
  }
  shape_enum_free();
  shape_enum_alloc();
  if (shape_enum_next())
  {
    num_ColorFill_Rects = v35->_num_ColorFill_Rects;
    int v49 = a10 / a15;
    int v48 = a11;
    do
    {
      v60.i16[0] = WORD2(v62);
      v60.i16[1] = WORD2(v61);
      v60.i16[2] = v62;
      v60.i16[3] = v61;
      createVerticesFromRect(v38, (__int16 *)&v60, v56, a11, (__int16 *)&v60, v56, a11);
      ++v35->_num_UI_Rects[v20];
      v38 += 16;
    }
    while (shape_enum_next());
  }
  else
  {
    num_ColorFill_Rects = v35->_num_ColorFill_Rects;
    int v49 = a10 / a15;
    int v48 = a11;
  }
  shape_enum_free();
  shape_enum_alloc();
  while (shape_enum_next())
  {
    v60.i16[0] = WORD2(v62);
    v60.i16[1] = WORD2(v61);
    v60.i16[2] = v62;
    v60.i16[3] = v61;
    createVerticesFromRect(v38, (__int16 *)&v60, v49, v48, (__int16 *)&v60, v49, v48);
    ++num_ColorFill_Rects[v20];
    v38 += 16;
  }
  shape_enum_free();
  shape_free();
  shape_free();
  shape_free();
  shape_free();
}

- (float)adjustUiScaleForDoViToHDR10Conversion:(float)a3
{
  float uiEDRFactor = self->_uiEDRFactor;
  Config = GetConfig((HDRConfig *)self);
  if (!Config)
  {
    unsigned int v7 = 0;
    goto LABEL_5;
  }
  uint64_t v6 = GetConfig((HDRConfig *)Config);
  unsigned int v7 = *(_DWORD *)HDRConfig::GetConfigEntryValue((uint64_t)v6, 0x62u, 0);
  if (v7 != -1)
  {
LABEL_5:
    float v8 = (float)v7 / 10000.0;
    return v8 * a3;
  }
  float v8 = flt_2222D1128[uiEDRFactor < 1.0];
  return v8 * a3;
}

- (void)updateUniformUIScaleForVideo:(BOOL)a3 forTV:(BOOL)a4 videoPeakBrightnessInNits:(int)a5 uiHWDegamma:(BOOL)a6 dovi50toHDR10TVMode:(unsigned int)a7
{
  BOOL v10 = a4;
  uint64_t v13 = [(MTLBuffer *)self->_uniformBuffer contents];
  float v15 = 1.0;
  if (a3) {
    goto LABEL_9;
  }
  if (a5 >= 151 && v10)
  {
    double v14 = (double)a5 * -0.0001438 + 0.6709;
    *(float *)&double v14 = v14;
    float v16 = 0.4;
    if (*(float *)&v14 >= 0.4) {
      float v16 = *(float *)&v14;
    }
    if (*(float *)&v14 <= 0.75) {
      float v15 = v16;
    }
    else {
      float v15 = 0.75;
    }
LABEL_9:
    if (a6) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v10) {
    float v15 = 0.65057;
  }
  else {
    float v15 = 0.73379;
  }
  if (a6) {
    goto LABEL_11;
  }
LABEL_10:
  float v15 = v15 / powf(self->_uiEDRFactor, 0.45045);
LABEL_11:
  if (a7 == 1)
  {
    *(float *)&double v14 = v15;
    [(HDRBackwardDisplayManagement *)self adjustUiScaleForDoViToHDR10Conversion:v14];
    float v15 = v17;
  }
  *(float *)(v13 + 224) = v15;
}

- (BOOL)inputIsVideoOnly:(__IOSurface *)a3 inputUI:(__IOSurface *)a4
{
  return (!a3 || !a4)
      && (a3 && -[HDRBackwardDisplayManagement inputIsSDRVideoFormat:](self, "inputIsSDRVideoFormat:")
       || a4 && [(HDRBackwardDisplayManagement *)self inputIsSDRVideoFormat:a4]);
}

- (BOOL)updateConfigFromMetadata:(id *)a3 uiScaleFactor:(float)a4 width:(int)a5 background:(id *)a6 hdrVideoOnly:(BOOL)a7 hdr10TV:(BOOL)a8 sdrOnly:(BOOL)a9
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  uint64_t v114 = *MEMORY[0x263EF8340];
  self->_inputScaleFactor = a3->var11;
  float v17 = (float *)[(MTLBuffer *)self->_uniformBuffer contents];
  float v18 = v17;
  v17[56] = a4;
  float var1 = a3->var1;
  v17[59] = var1;
  v17[58] = 1.0 / a3->var0;
  float var3 = a3->var3;
  if (var3 == 0.0)
  {
    a3->float var3 = 0.00001;
    float var3 = 0.00001;
  }
  v17[60] = 1.0 / var3;
  float v21 = a3->var2 / var3;
  v17[61] = v21;
  v17[62] = (float)(v21 - var1) / var3;
  float v22 = powf(v21, 0.33333);
  uint64_t v23 = 0;
  v18[63] = fminf(v22, 1.0);
  *((_DWORD *)v18 + 72) = 1;
  *((_OWORD *)v18 + 16) = xmmword_2222D1230;
  long long v24 = *((_OWORD *)v18 + 12);
  do
  {
    float v25 = a3->var9[v23];
    long long v111 = v24;
    *(float *)((unint64_t)&v111 & 0xFFFFFFFFFFFFFFF3 | (4 * (v23 & 3))) = v25;
    long long v24 = v111;
    v18[50] = *((float *)&v111 + 2);
    *((void *)v18 + 24) = v24;
    ++v23;
  }
  while (v23 != 3);
  uint64_t v26 = 0;
  long long v96 = *((_OWORD *)v18 + 12);
  v18[57] = (float)a3->var16;
  var4 = (float *)&-[HDRBackwardDisplayManagement updateConfigFromMetadata:uiScaleFactor:width:background:hdrVideoOnly:hdr10TV:sdrOnly:]::bt2020_to_lms_host;
  long long v28 = *((_OWORD *)v18 + 3);
  if (v11) {
    var4 = a3->var4;
  }
  long long v29 = *((_OWORD *)v18 + 4);
  long long v30 = *((_OWORD *)v18 + 5);
  if (v10) {
    var4 = (float *)&-[HDRBackwardDisplayManagement updateConfigFromMetadata:uiScaleFactor:width:background:hdrVideoOnly:hdr10TV:sdrOnly:]::BT709toBT2020_host;
  }
  long long v31 = *((_OWORD *)v18 + 6);
  long long v32 = *((_OWORD *)v18 + 7);
  long long v33 = *((_OWORD *)v18 + 8);
  long long v34 = *((_OWORD *)v18 + 9);
  long long v35 = *((_OWORD *)v18 + 10);
  long long v36 = *((_OWORD *)v18 + 11);
  long long v37 = *(_OWORD *)v18;
  long long v38 = *((_OWORD *)v18 + 1);
  int32x4_t v39 = var4 + 3;
  var8 = a3->var8;
  double v41 = &self->_709toPanelPrimaryMatrix[6];
  long long v42 = *((_OWORD *)v18 + 2);
  do
  {
    float v43 = *(v39 - 3) * self->_inputScaleFactor;
    long long v99 = v28;
    *(float *)((unint64_t)&v99 & 0xFFFFFFFFFFFFFFF3 | (4 * (v26 & 3))) = v43;
    long long v28 = v99;
    v18[14] = *((float *)&v99 + 2);
    *((void *)v18 + 6) = v28;
    float v44 = *v39 * self->_inputScaleFactor;
    long long v100 = v29;
    *(float *)((unint64_t)&v100 & 0xFFFFFFFFFFFFFFF3 | (4 * (v26 & 3))) = v44;
    long long v29 = v100;
    v18[18] = *((float *)&v100 + 2);
    *((void *)v18 + 8) = v29;
    float v45 = v39[3] * self->_inputScaleFactor;
    long long v101 = v30;
    *(float *)((unint64_t)&v101 & 0xFFFFFFFFFFFFFFF3 | (4 * (v26 & 3))) = v45;
    long long v30 = v101;
    v18[22] = *((float *)&v101 + 2);
    *((void *)v18 + 10) = v30;
    int v46 = *((_DWORD *)var8 - 27);
    long long v102 = v31;
    *(_DWORD *)((unint64_t)&v102 & 0xFFFFFFFFFFFFFFF3 | (4 * (v26 & 3))) = v46;
    long long v31 = v102;
    v18[26] = *((float *)&v102 + 2);
    *((void *)v18 + 12) = v31;
    int v47 = *((_DWORD *)var8 - 24);
    long long v103 = v32;
    *(_DWORD *)((unint64_t)&v103 & 0xFFFFFFFFFFFFFFF3 | (4 * (v26 & 3))) = v47;
    long long v32 = v103;
    v18[30] = *((float *)&v103 + 2);
    *((void *)v18 + 14) = v32;
    int v48 = *((_DWORD *)var8 - 21);
    long long v104 = v33;
    *(_DWORD *)((unint64_t)&v104 & 0xFFFFFFFFFFFFFFF3 | (4 * (v26 & 3))) = v48;
    long long v33 = v104;
    v18[34] = *((float *)&v104 + 2);
    *((void *)v18 + 16) = v33;
    int v49 = *(_DWORD *)var8;
    long long v105 = v34;
    *(_DWORD *)((unint64_t)&v105 & 0xFFFFFFFFFFFFFFF3 | (4 * (v26 & 3))) = v49;
    long long v34 = v105;
    v18[38] = *((float *)&v105 + 2);
    *((void *)v18 + 18) = v34;
    int v50 = *((_DWORD *)var8 + 3);
    long long v106 = v35;
    *(_DWORD *)((unint64_t)&v106 & 0xFFFFFFFFFFFFFFF3 | (4 * (v26 & 3))) = v50;
    long long v35 = v106;
    v18[42] = *((float *)&v106 + 2);
    *((void *)v18 + 20) = v35;
    int v51 = *((_DWORD *)var8 + 6);
    long long v107 = v36;
    *(_DWORD *)((unint64_t)&v107 & 0xFFFFFFFFFFFFFFF3 | (4 * (v26 & 3))) = v51;
    long long v36 = v107;
    v18[46] = *((float *)&v107 + 2);
    *((void *)v18 + 22) = v36;
    int v52 = *((_DWORD *)v41 - 6);
    long long v108 = v37;
    *(_DWORD *)((unint64_t)&v108 & 0xFFFFFFFFFFFFFFF3 | (4 * (v26 & 3))) = v52;
    long long v37 = v108;
    v18[2] = *((float *)&v108 + 2);
    *(void *)float v18 = v37;
    int v53 = *((_DWORD *)v41 - 3);
    long long v109 = v38;
    *(_DWORD *)((unint64_t)&v109 & 0xFFFFFFFFFFFFFFF3 | (4 * (v26 & 3))) = v53;
    long long v38 = v109;
    v18[6] = *((float *)&v109 + 2);
    *((void *)v18 + 2) = v38;
    int v54 = *(_DWORD *)v41++;
    long long v110 = v42;
    *(_DWORD *)((unint64_t)&v110 & 0xFFFFFFFFFFFFFFF3 | (4 * (v26 & 3))) = v54;
    long long v42 = v110;
    unsigned char v18[10] = *((float *)&v110 + 2);
    ++v26;
    *((void *)v18 + 4) = v42;
    ++v39;
    ++var8;
  }
  while (v26 != 3);
  if (self->_useAccessibilityMatrix)
  {
    for (uint64_t i = 0; i != 3; ++i)
    {
      uint64_t v56 = 0;
      unsigned int v57 = &v18[4 * i + 12];
      float v58 = *v57;
      float v59 = v57[1];
      float v60 = v57[2];
      long long v61 = 0uLL;
      do
      {
        float v62 = (float)((float)(v59 * self->_cachedHDRMatrix.parameter[1][v56])
                    + (float)(v58 * self->_cachedHDRMatrix.parameter[0][v56]))
            + (float)(v60 * self->_cachedHDRMatrix.parameter[2][v56]);
        long long v98 = v61;
        *(float *)((unint64_t)&v98 & 0xFFFFFFFFFFFFFFF3 | (4 * (v56 & 3))) = v62;
        uint64_t v63 = v98;
        long long v64 = v98;
        HIDWORD(v64) = HIDWORD(v61);
        ++v56;
        long long v61 = v64;
      }
      while (v56 != 3);
      v57[2] = *((float *)&v98 + 2);
      *(void *)unsigned int v57 = v63;
    }
  }
  float v65 = powf((float)a3->var16 * 0.0001, 0.1593);
  float v66 = powf((float)((float)(v65 * 18.852) + 0.83594) / (float)((float)(v65 * 18.688) + 1.0), 78.844);
  if (!v10 || a9) {
    float v67 = 1.0 / v66;
  }
  else {
    float v67 = 1.0 / (v66 * 0.85546875);
  }
  v18[73] = v67;
  float v68 = 1.0 / (double)a5;
  v18[74] = v68;
  if (a6)
  {
    double v69 = fmin(a6->var0 * 250.0, 250.0);
    float v70 = v69;
    BOOL v71 = v69 <= 0.0;
    float v72 = 0.0;
    if (!v71) {
      float v72 = v70;
    }
    float64x2_t v73 = (float64x2_t)vdupq_n_s64(0x406F400000000000uLL);
    float64x2_t v74 = vmulq_f64(*(float64x2_t *)&a6->var1, v73);
    int8x16_t v75 = (int8x16_t)vcgtq_f64(v73, v74);
    int8x16_t v76 = (int8x16_t)vcgtzq_f64(v74);
    int8x8_t v77 = vbsl_s8((int8x8_t)vmovn_s64((int64x2_t)vornq_s8(vmvnq_s8(v75), v76)), vand_s8((int8x8_t)vdup_n_s32(0x437A0000u), (int8x8_t)vmovn_s64((int64x2_t)vornq_s8(v76, v75))), (int8x8_t)vcvt_f32_f64(v74));
  }
  else
  {
    int8x8_t v77 = 0;
    float v72 = 0.0;
  }
  uint64_t v78 = 0;
  v18[75] = v72;
  *((int8x8_t *)v18 + 38) = v77;
  long long v79 = *((_OWORD *)v18 + 13);
  do
  {
    float v80 = a3->var10[v78];
    long long v97 = v79;
    *(float *)((unint64_t)&v97 & 0xFFFFFFFFFFFFFFF3 | (4 * (v78 & 3))) = v80;
    long long v79 = v97;
    v18[54] = *((float *)&v97 + 2);
    *((void *)v18 + 26) = v79;
    ++v78;
  }
  while (v78 != 3);
  unsigned int displayType = self->_displayType;
  if (displayType)
  {
    if (displayType == 1)
    {
      v18[78] = 0.0;
      v18[79] = (float)self->_displayMaxBrightnessInNits;
    }
    else
    {
      if (displayType == 6)
      {
        if (enableLogInstance)
        {
          if (logInstanceID) {
            uint64_t v82 = logInstanceID;
          }
          else {
            uint64_t v82 = prevLogInstanceID;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v113 = WORD1(v82);
            _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"_displayType != kHDRDestinationSDRTV\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/BackwardDisplayManagement/HDRBackwardDisplayManagement.mm\" at line 2921\n", buf, 0xCu);
          }
          prevLogInstanceID = v82;
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"_displayType != kHDRDestinationSDRTV\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/BackwardDisplayManagement/HDRBackwardDisplayManagement.mm\" at line 2921\n", buf, 2u);
        }
      }
      unsigned int var14 = a3->var14;
      float v90 = (float)var14;
      v18[79] = (float)var14;
      if (a3->var20 == 2)
      {
        unsigned int var14 = a3->var16;
        float v90 = (float)var14;
      }
      long double v91 = (float)(v90 / 1000.0);
      if (var14 - 401 > 0x63E)
      {
        long double v93 = log2(v91);
        double v92 = pow(1.11099994, v93) * 1.20000005 + -1.0;
      }
      else
      {
        double v92 = log10(v91) * 0.419999987 + 1.20000005 + -1.0;
      }
      float v94 = v92;
      v18[78] = v94;
    }
  }
  else
  {
    unsigned int displayMaxBrightnessInNits = self->_displayMaxBrightnessInNits;
    float v84 = (float)displayMaxBrightnessInNits;
    long double v85 = (float)((float)displayMaxBrightnessInNits / 1000.0);
    if (displayMaxBrightnessInNits - 401 > 0x63E)
    {
      long double v87 = log2(v85);
      double v86 = pow(1.11099994, v87) * 1.20000005 + -1.0;
    }
    else
    {
      double v86 = log10(v85) * 0.419999987 + 1.20000005 + -1.0;
    }
    float v88 = v86;
    v18[78] = v88;
    v18[79] = v84;
  }
  return *(float *)&v96 <= 1.0;
}

- (void)generateMetaAndConfig:(id)a3 inputSurface:(__IOSurface *)a4 outputSurface:(__IOSurface *)a5 payLoad:(id *)a6 dmCfg:(id *)a7
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  int v12 = [a3 valueForKey:@"BackwardDMHDRDictionary"];
  id v13 = [v12 valueForKey:@"DolbyVisionBackwardDMParameter"];
  double v14 = (const void *)[v13 bytes];
  float v44 = a7;
  [v12 valueForKey:@"DolbyVisionHDMIData"];
  double v41 = a6;
  float v43 = a5;
  id v15 = objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 bytes];
  float v17 = (void *)v16;
  if (v13) {
    BOOL v18 = v14 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  int v19 = v18;
  if (v15) {
    BOOL v20 = v16 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  int v21 = v20;
  int v45 = v21;
  size_t PlaneCount = IOSurfaceGetPlaneCount(a4);
  IOSurfaceID ID = IOSurfaceGetID(a4);
  if (!a4 || PlaneCount != 3) {
    goto LABEL_20;
  }
  IOSurfaceID v24 = ID;
  if (v19 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)&uint8_t buf[4] = 67109120;
    IOSurfaceID v53 = v24;
    _os_log_error_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Current rg3h video input surface (IOSurface ID: %x) does not have config data\n", &buf[4], 8u);
  }
  if (!v45 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
LABEL_20:
    if (v19) {
      goto LABEL_21;
    }
LABEL_27:
    memcpy(dmMetaCfgData, v14, 0x120uLL);
    long long v38 = v43;
    goto LABEL_28;
  }
  *(_DWORD *)&uint8_t buf[4] = 67109120;
  IOSurfaceID v53 = v24;
  _os_log_error_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Current rg3h video input surface (IOSurface ID: %x) does not have meta data\n", &buf[4], 8u);
  if (!v19) {
    goto LABEL_27;
  }
LABEL_21:
  xmmword_267F7CD18 = 0u;
  unk_267F7CD28 = 0u;
  xmmword_267F7CCF8 = 0u;
  xmmword_267F7CD08 = 0u;
  xmmword_267F7CCD8 = 0u;
  unk_267F7CCE8 = 0u;
  xmmword_267F7CCB8 = 0u;
  unk_267F7CCC8 = 0u;
  unsigned int displayMaxBrightnessInNitsForSDR = self->_displayMaxBrightnessInNitsForSDR;
  float displayMinBrightnessInNits = self->_displayMinBrightnessInNits;
  *(void *)buf = 0;
  float v50 = 0.0;
  float v51 = 0.0;
  getStaticToneCurves(0.01514, 0.82735, 0.01514, 0.75189, 0.65275, 0.01514, 0.75189, 42.0, (float *)&buf[4], (float *)buf, &v51, &v50);
  simd_float3 v27 = 0uLL;
  uint64_t v28 = 0;
  dword_267F7CC54 = 1043183977;
  unk_267F7CC4C = 0xC0948E8E40AF20C2;
  dword_267F7CC60 = -1104418156;
  qword_267F7CC58 = 0x4012C144BF900536;
  dword_267F7CC6C = 1066723388;
  unk_267F7CC64 = 0xBE45C4443CF41305;
  dword_267F7CC30 = 1027506446;
  qword_267F7CC28 = 0x3F23B89E3EA0BEA2;
  dword_267F7CC3C = 1035050131;
  unk_267F7CC34 = 0x3F42074C3E1F1486;
  dword_267F7CC48 = 1063219193;
  qword_267F7CC40 = 0x3DE026133C916888;
  dword_267F7CC78 = 1045220557;
  qword_267F7CC70 = 0x3ECCCCCD3ECCCCCDLL;
  dword_267F7CC84 = 1053474947;
  unk_267F7CC7C = 0xC09B3B64408E8F5CLL;
  dword_267F7CC90 = -1080764767;
  qword_267F7CC88 = 0x3EB6E2EB3F4E3BCDLL;
  dword_267F7CC9C = 1045571297;
  unk_267F7CC94 = 0x3DC7D2383F800000;
  dword_267F7CCA8 = 1040738836;
  qword_267F7CCA0 = 0xBDE938133F800000;
  dword_267F7CCB4 = -1087551366;
  dmMetaCfgData[0] = *(_DWORD *)&buf[4];
  *(_DWORD *)algn_267F7CC1C = *(_DWORD *)buf;
  unk_267F7CCAC = 0x3D05976C3F800000;
  simd_float3 v29 = 0uLL;
  dword_267F7CC20 = LODWORD(v51);
  unk_267F7CC24 = LODWORD(v50);
  simd_float3 v30 = 0uLL;
  do
  {
    long long v31 = (int *)((char *)&R2020_Yuv2RgbNarrow + 4 * v28);
    int v32 = *v31;
    v49.columns[0] = v30;
    *(_DWORD *)((unint64_t)&v49 & 0xFFFFFFFFFFFFFFF3 | (4 * (v28 & 3))) = v32;
    v35.columns[0] = v49.columns[0];
    simd_float3 v33 = v49.columns[0];
    v33.i32[3] = v30.i32[3];
    v35.columns[1].i32[0] = v31[3];
    v49.columns[2] = v29;
    *(_DWORD *)((unint64_t)&v49.columns[2] & 0xFFFFFFFFFFFFFFF3 | (4 * (v28 & 3))) = v35.columns[1].i32[0];
    v35.columns[1] = v49.columns[2];
    simd_float3 v34 = v49.columns[2];
    v34.i32[3] = v29.i32[3];
    v35.columns[2].i32[0] = v31[6];
    v49.columns[1] = v27;
    *(_DWORD *)((unint64_t)&v49.columns[1] & 0xFFFFFFFFFFFFFFF3 | (4 * (v28 & 3))) = v35.columns[2].i32[0];
    v35.columns[2] = v49.columns[1];
    simd_float3 v36 = v49.columns[1];
    ++v28;
    v36.i32[3] = v27.i32[3];
    simd_float3 v27 = v36;
    simd_float3 v29 = v34;
    simd_float3 v30 = v33;
  }
  while (v28 != 3);
  simd_float3x3 v55 = __invert_f3(v35);
  uint64_t v37 = 0;
  long long v38 = v43;
  do
  {
    simd_float3 v48 = v55.columns[0];
    int32x4_t v39 = &dmMetaCfgData[v37];
    v39[40] = *(_DWORD *)((unint64_t)&v48 & 0xFFFFFFFFFFFFFFF3 | (4 * (v37 & 3)));
    simd_float3 v47 = v55.columns[1];
    v39[43] = *(_DWORD *)((unint64_t)&v47 & 0xFFFFFFFFFFFFFFF3 | (4 * (v37 & 3)));
    simd_float3 v46 = v55.columns[2];
    v39[46] = *(_DWORD *)((unint64_t)&v46 & 0xFFFFFFFFFFFFFFF3 | (4 * (v37++ & 3)));
  }
  while (v37 != 3);
  HIDWORD(xmmword_267F7CCD8) = 1157627904;
  *(void *)((char *)&xmmword_267F7CCD8 + 4) = 0x4500000043800000;
  dword_267F7CCF4 = 1065353216;
  DWORD2(xmmword_267F7CCF8) = displayMaxBrightnessInNitsForSDR;
  *((float *)&xmmword_267F7CCF8 + 3) = displayMinBrightnessInNits;
  *(void *)&xmmword_267F7CD08 = 0x3BA3D70A00000064;
  byte_267F7CD30 &= ~1u;
LABEL_28:
  -[HDRBackwardDisplayManagement attatchInfoFrame:toOutputSurface:](self, "attatchInfoFrame:toOutputSurface:", dmMetaCfgData, v38, v41);
  int32x4_t v40 = &SDRMetaData;
  if (!v45) {
    int32x4_t v40 = v17;
  }
  *float v44 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)dmMetaCfgData;
  *long long v42 = v40;
}

- (void)drawMetaWithEncoder:(id)a3 widthScale:(int)a4 dmPayLoadLength:(int)a5
{
  id v15 = a3;
  uint64_t v8 = 2560;
  if (a4 == 1) {
    uint64_t v8 = 2552;
  }
  int v9 = [(HDRBackwardDisplayManagement *)self getRenderPipelineStateForShader:*(Class *)((char *)&self->super.isa + v8)];
  [v15 setRenderPipelineState:v9];
  [v15 setFragmentTexture:self->_metadataTexture[0] atIndex:0];
  [v15 setVertexBuffer:self->_metadataVertexBuffer offset:0 atIndex:0];
  [v15 drawPrimitives:1 vertexStart:0 vertexCount:2 * self->_metadataSpanCount[0]];
  if (a5 >= 120)
  {
    LODWORD(v10) = 0;
    BOOL v11 = &self->_metadataSpanCount[1];
    int v12 = &self->_metadataTexture[1];
    int v13 = a5 + 2;
    do
    {
      int v14 = *(v11 - 1);
      [v15 setFragmentTexture:*v12 atIndex:0];
      uint64_t v10 = (v10 + 2 * v14);
      [v15 drawPrimitives:1 vertexStart:v10 vertexCount:2 * *v11++];
      ++v12;
      v13 -= 121;
    }
    while (v13 > 121);
  }
}

- (void)handleMetaInsertion:(BOOL)a3 encoder:(id)a4 widthScale:(int)a5 payloadLength:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a3;
  id v10 = a4;
  if (v8) {
    [(HDRBackwardDisplayManagement *)self drawMetaWithEncoder:v10 widthScale:v7 dmPayLoadLength:v6];
  }
}

- (int)getTVIndex:(BOOL)a3
{
  if (self->_outputPackingColorFormat == 1)
  {
    unsigned int displayType = self->_displayType;
    if (displayType == 6 || displayType == 1) {
      int v5 = 4;
    }
    else {
      int v5 = 2;
    }
  }
  else
  {
    int v5 = 0;
  }
  if (a3) {
    v5 += 6;
  }
  return v5 | self->_useAccessibilityMatrix;
}

- (int)adjustMetaData:(id *)a3 HDRUIBlending:(BOOL)a4 hasLetterbox:(BOOL)a5
{
  BOOL v5 = a5;
  adjustL1MetaData((uint64_t)a3, a4);
  return adjustL2MetaData(&a3->var0, v5);
}

- (void)packetizeMetadata:(id *)a3 length:(int)a4 into:(int)a5 onSurface:(__IOSurface *)a6
{
  uint64_t v9 = 0;
  uint64_t v20 = *MEMORY[0x263EF8340];
  metadataTexture = (void **)self->_metadataTexture;
  BOOL v11 = self->_metadataTextures[a5];
  do
  {
    objc_storeStrong(&metadataTexture[v9], v11[v9]);
    ++v9;
  }
  while (v9 != 5);
  int v12 = malloc_type_calloc(0x280uLL, 1uLL, 0x100004077774924uLL);
  *(void *)bytes = v12;
  if (v12)
  {
    PacketizeMetadata((char *)a3, a4, metadataTexture, (uint64_t)v12);
    CFDataRef v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, 8);
    IOSurfaceSetValue(a6, @"HDMIMetaData", v13);
    CFRelease(v13);
    free(*(void **)bytes);
  }
  else if (enableLogInstance)
  {
    if (logInstanceID) {
      uint64_t v14 = logInstanceID;
    }
    else {
      uint64_t v14 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      float v17 = (const char *)WORD1(v14);
      __int16 v18 = 2080;
      int v19 = "-[HDRBackwardDisplayManagement packetizeMetadata:length:into:onSurface:]";
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s: calloc failed!\n", buf, 0x16u);
    }
    prevLogInstanceIOSurfaceID ID = v14;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    float v17 = "-[HDRBackwardDisplayManagement packetizeMetadata:length:into:onSurface:]";
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s: calloc failed!\n", buf, 0xCu);
  }
}

- (int64_t)encodeToCommandBuffer:(id)a3 inputSurface:(__IOSurface *)a4 outputSurface:(__IOSurface *)a5 frameProperties:(id)a6
{
  return [(HDRBackwardDisplayManagement *)self encodeToCommandBuffer:a3 video:a4 ui:0 output:a5 frameProperties:a6];
}

- (int64_t)EncodeToCommandBuffer:(id)a3 inputSurface:(__IOSurface *)a4 uiSurface:(__IOSurface *)a5 outputSurface:(__IOSurface *)a6 frameProperties:(id)a7
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v78 = a7;
  uint64_t v79 = 0;
  uint64_t v80 = 0;
  int8x8_t v77 = v12;
  if (!v12 || !a6 || !((unint64_t)a4 | (unint64_t)a5))
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v13 = logInstanceID;
      }
      else {
        uint64_t v13 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219008;
        *(void *)uint64_t v82 = WORD1(v13);
        *(_WORD *)&v82[8] = 2048;
        *(void *)v83 = v12;
        *(_WORD *)&v83[8] = 2048;
        *(void *)&v83[10] = a6;
        *(_WORD *)float v84 = 2048;
        *(void *)&v84[2] = a4;
        __int16 v85 = 2048;
        double v86 = a5;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx commanBuffer=%p, output=%p, input=%p, ui=%p", buf, 0x34u);
      }
      uint64_t v14 = 0;
      id v15 = 0;
      uint64_t v16 = 0;
      prevLogInstanceIOSurfaceID ID = v13;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        *(void *)uint64_t v82 = v12;
        *(_WORD *)&v82[8] = 2048;
        *(void *)v83 = a6;
        *(_WORD *)&v83[8] = 2048;
        *(void *)&v83[10] = a4;
        *(_WORD *)float v84 = 2048;
        *(void *)&v84[2] = a5;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] commanBuffer=%p, output=%p, input=%p, ui=%p", buf, 0x2Au);
      }
      uint64_t v14 = 0;
      id v15 = 0;
      uint64_t v16 = 0;
    }
    int64_t v17 = -17006;
    goto LABEL_160;
  }
  if (a4)
  {
    self->_int width = IOSurfaceGetWidth(a4);
    int Height = IOSurfaceGetHeight(a4);
  }
  else
  {
    self->_int width = IOSurfaceGetWidth(a5);
    int Height = IOSurfaceGetHeight(a5);
  }
  self->_height = Height;
  if (a5) {
    float edrfactor = iosurface_get_edrfactor(a5);
  }
  else {
    float edrfactor = 1.0;
  }
  self->_float uiEDRFactor = edrfactor;
  self->_int targetWidth = IOSurfaceGetWidth(a6);
  int v20 = IOSurfaceGetHeight(a6);
  int v21 = v20;
  self->_double targetHeight = v20;
  if (!a4)
  {
    int width = self->_width;
    int targetWidth = self->_targetWidth;
    if (width != targetWidth || self->_height != v20)
    {
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v28 = logInstanceID;
        }
        else {
          uint64_t v28 = prevLogInstanceID;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = self->_height;
          *(_DWORD *)buf = 134219008;
          *(void *)uint64_t v82 = WORD1(v28);
          *(_WORD *)&v82[8] = 1024;
          *(_DWORD *)v83 = width;
          *(_WORD *)&v83[4] = 1024;
          *(_DWORD *)&v83[6] = targetWidth;
          *(_WORD *)&v83[10] = 1024;
          *(_DWORD *)&v83[12] = v29;
          *(_WORD *)&v83[16] = 1024;
          *(_DWORD *)float v84 = v21;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx _width=%d, _targetWidth=%d, _height=%d, _targetHeight=%d", buf, 0x24u);
        }
        uint64_t v14 = 0;
        id v15 = 0;
        uint64_t v16 = 0;
        prevLogInstanceIOSurfaceID ID = v28;
        goto LABEL_159;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v54 = self->_height;
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)uint64_t v82 = width;
        *(_WORD *)&v82[4] = 1024;
        *(_DWORD *)&v82[6] = targetWidth;
        *(_WORD *)v83 = 1024;
        *(_DWORD *)&v83[2] = v54;
        *(_WORD *)&v83[6] = 1024;
        *(_DWORD *)&v83[8] = v21;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] _width=%d, _targetWidth=%d, _height=%d, _targetHeight=%d", buf, 0x1Au);
      }
      uint64_t v14 = 0;
      id v15 = 0;
LABEL_116:
      uint64_t v16 = 0;
LABEL_159:
      int64_t v17 = -17000;
      goto LABEL_160;
    }
  }
  if (!self->_metadataVertexBuffer) {
    [(HDRBackwardDisplayManagement *)self createMetadataVertexBuffer];
  }
  [(HDRBackwardDisplayManagement *)self generateMetaAndConfig:v78 inputSurface:a4 outputSurface:a6 payLoad:&v80 dmCfg:&v79];
  if (v79)
  {
    int v24 = *(_DWORD *)(v79 + 224);
    BOOL v25 = v24 == 2;
    BOOL v70 = v24 == 3;
  }
  else
  {
    BOOL v25 = 0;
    BOOL v70 = 0;
  }
  unsigned int outputPackingColorFormat = self->_outputPackingColorFormat;
  if (bswap32(*(unsigned __int16 *)(v80 + 78)) >> 16 == 0xFFFF)
  {
    unsigned int v30 = __rev16(*(unsigned __int16 *)(v80 + 76));
    BOOL v31 = v30 == 0xFFFF;
    if (!a4 || v30 == 0xFFFF) {
      goto LABEL_45;
    }
    goto LABEL_41;
  }
  if (a4)
  {
LABEL_41:
    BOOL v31 = IOSurfaceGetPixelFormat(a4) == 1999843442 || IOSurfaceGetPixelFormat(a4) == 1647534392;
    goto LABEL_45;
  }
  BOOL v31 = 0;
LABEL_45:
  BOOL v72 = bswap32(*(unsigned __int16 *)(v80 + 78)) >> 16 == 65534
     && bswap32(*(unsigned __int16 *)(v80 + 76)) >> 16 == 65534;
  BOOL v32 = 0;
  char v69 = *(unsigned char *)(v79 + 280);
  if (v31) {
    simd_float3 v33 = 0;
  }
  else {
    simd_float3 v33 = a4;
  }
  if (v31) {
    a5 = a4;
  }
  if (a5) {
    BOOL v34 = v33 == 0;
  }
  else {
    BOOL v34 = 0;
  }
  int v35 = v34;
  unsigned int v76 = v35;
  if (v33 && !a5) {
    BOOL v32 = IOSurfaceGetPlaneCount(v33) == 3;
  }
  float displayMaxBrightnessInNitsForSDR = (float)self->_displayMaxBrightnessInNitsForSDR;
  if (v72)
  {
    uint64_t v37 = v79;
LABEL_64:
    float displayMaxBrightnessInNits = (float)*(unsigned int *)(v37 + 232);
    goto LABEL_65;
  }
  if (((v25 || v70) | v76) != 1 || outputPackingColorFormat) {
    goto LABEL_67;
  }
  uint64_t v37 = v79;
  if (v25) {
    goto LABEL_64;
  }
  float displayMaxBrightnessInNits = (float)self->_displayMaxBrightnessInNits;
  if (!v70)
  {
    float displayMinBrightnessInNits = self->_displayMinBrightnessInNits;
    LODWORD(v22) = 1128792064;
    LODWORD(v23) = 5.0;
    [(HDRBackwardDisplayManagement *)self fillScalingTable_SDR2HDR:v79 target_White:v22 target_Black:v23];
    float v40 = displayMaxBrightnessInNitsForSDR;
    goto LABEL_66;
  }
LABEL_65:
  float displayMinBrightnessInNits = *(float *)(v37 + 236);
  float v40 = displayMaxBrightnessInNits;
LABEL_66:
  *(float *)&double v22 = displayMaxBrightnessInNits;
  setTargitBrightnessInMetaData(v80, v22, displayMinBrightnessInNits, v40, displayMinBrightnessInNits);
LABEL_67:
  BOOL v73 = v32;
  objc_storeStrong((id *)&self->_uniformBuffer, self->_uniformBuffers[self->_frameIndex % 3]);
  objc_storeStrong((id *)&self->_inverseScalingFactorTableTexture, self->_inverseScalingFactorTableTextures[self->_frameIndex % 3]);
  if (v76) {
    float v41 = 100.0;
  }
  else {
    float v41 = 1.0;
  }
  id v15 = [v78 valueForKey:@"UILayerScaleFactor"];
  long long v42 = [v78 valueForKey:@"SDRMaxBrightnessInNits"];
  uint64_t v14 = v42;
  if (v42)
  {
    if (v15) {
      goto LABEL_116;
    }
    [v42 floatValue];
    hasDisplayBrightnessFromEDIOSurfaceID ID = self->_hasDisplayBrightnessFromEDID;
    if ((int)*(float *)&v43 > (int)displayMaxBrightnessInNitsForSDR)
    {
      ++_MergedGlobals_4;
      *(float *)&double v43 = displayMaxBrightnessInNitsForSDR;
    }
    if (*(float *)&v43 == 0.0 && hasDisplayBrightnessFromEDID) {
      *(float *)&double v43 = displayMaxBrightnessInNitsForSDR;
    }
    if ((int)*(float *)&v43 <= 99)
    {
      ++qword_26ABE1E00;
      *(float *)&double v43 = displayMaxBrightnessInNitsForSDR;
    }
    float v41 = *(float *)&v43 / displayMaxBrightnessInNitsForSDR;
  }
  else if (v15)
  {
    [v15 floatValue];
    float v41 = *(float *)&v43 / 3.0;
  }
  unsigned int v68 = outputPackingColorFormat - 1;
  *(float *)&double v43 = v41;
  [(HDRBackwardDisplayManagement *)self updateConfigFromMetadata:v79 uiScaleFactor:self->_targetWidth width:0 background:v73 hdrVideoOnly:outputPackingColorFormat - 1 < 2 hdr10TV:v76 sdrOnly:v43];
  if (outputPackingColorFormat - 1 <= 1)
  {
    if (v76)
    {
      LODWORD(v47) = 5.0;
      LODWORD(v46) = 1128792064;
    }
    else
    {
      LODWORD(v47) = *(_DWORD *)(v79 + 236);
      *(float *)&double v46 = (float)*(unsigned int *)(v79 + 232);
    }
    LODWORD(v48) = 1.0;
    [(HDRBackwardDisplayManagement *)self fillScalingTable_YUVTM:v79 targetwhite:1 targetblack:v76 satBoost:v46 scalingFactor:v47 sdrOnly:v48];
    goto LABEL_102;
  }
  [(HDRBackwardDisplayManagement *)self fillInverseScalingFactorTableFromDMConfig:v79];
  if (outputPackingColorFormat)
  {
LABEL_102:
    unsigned int v67 = 0;
    goto LABEL_103;
  }
  if (a5) {
    BOOL v49 = v33 == 0;
  }
  else {
    BOOL v49 = 1;
  }
  uint64_t v50 = !v49;
  unsigned int v67 = [(HDRBackwardDisplayManagement *)self adjustMetaData:v80 HDRUIBlending:v50 hasLetterbox:0];
  [(HDRBackwardDisplayManagement *)self packetizeMetadata:v80 length:v67 into:self->_frameIndex % 3 onSurface:a6];
LABEL_103:
  unsigned int v74 = [(HDRBackwardDisplayManagement *)self pixelNumPerThreadFullScreen:1 videoInput:v33 UI:a5 Output:a6 widthScaling:0];
  LOBYTE(v66) = v69 & 1;
  [(HDRBackwardDisplayManagement *)self setupTexturesWithInput:v33 VideoSRGB:v76 UI:a5 UISRGB:v76 Output:a6 PixelPerThread:v74 ptvMode:v66];
  uint64_t v51 = [(HDRBackwardDisplayManagement *)self createRenderCommandEncoderWithCommandBuffer:v77 texture:self->_outputTexture widthScale:v74 loadAction:0];
  if (v51)
  {
    uint64_t v16 = (void *)v51;
    int v71 = [(HDRBackwardDisplayManagement *)self getTVIndex:v70];
    if (v33)
    {
      [v16 setFragmentTexture:self->_inputTexture[0] atIndex:0];
      unsigned int v52 = 1;
    }
    else
    {
      unsigned int v52 = 0;
    }
    size_t PlaneCount = IOSurfaceGetPlaneCount(a4);
    if (!v33 || PlaneCount != 3)
    {
      if (v33)
      {
        if (v69)
        {
          if (enableLogInstance)
          {
            if (logInstanceID) {
              uint64_t v57 = logInstanceID;
            }
            else {
              uint64_t v57 = prevLogInstanceID;
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              *(void *)uint64_t v82 = WORD1(v57);
              _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"!ptvMode\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/BackwardDisplayManagement/HDRBackwardDisplayManagement.mm\" at line 3609\n", buf, 0xCu);
            }
            prevLogInstanceIOSurfaceID ID = v57;
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"!ptvMode\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/BackwardDisplayManagement/HDRBackwardDisplayManagement.mm\" at line 3609\n", buf, 2u);
          }
        }
        uint64_t v60 = [(HDRBackwardDisplayManagement *)self getRenderPipelineStateForShader:self->_BKDM_ARGB_Linear];
      }
      else
      {
        BOOL v58 = [(HDRBackwardDisplayManagement *)self inputIsSDRVideoFormat:0];
        [(HDRBackwardDisplayManagement *)self updateUniformUIScaleForVideo:v58 forTV:v68 < 2 videoPeakBrightnessInNits:*(unsigned int *)(v79 + 240) uiHWDegamma:v76 dovi50toHDR10TVMode:*(unsigned int *)(v79 + 276)];
        uint64_t v59 = 1592;
        if (v58) {
          uint64_t v59 = 1688;
        }
        uint64_t v60 = [(HDRBackwardDisplayManagement *)self getRenderPipelineStateForShader:*(Class *)((char *)&self->super.isa + 8 * v71 + v59)];
      }
      long long v61 = (void *)v60;
      goto LABEL_152;
    }
    if (a5)
    {
      p_BKDM_3Plane_2Pixel_Video_HDR10 = &self->_BKDM_3Plane_1Pixel_Gamma[v71];
    }
    else
    {
      if (!v72)
      {
        if (self->_width != self->_targetWidth || self->_height != self->_targetHeight)
        {
          if (v69) {
            p_BKDM_3Plane_2Pixel_Video_HDR10 = &self->_BKDM_3Plane_1Pixel_PTV[v71];
          }
          else {
            p_BKDM_3Plane_2Pixel_Video_HDR10 = &self->_BKDM_3Plane_1Pixel_Linear[v71];
          }
          goto LABEL_151;
        }
        if (v69)
        {
          p_BKDM_3Plane_2Pixel_Video_HDR10 = &self->_BKDM_3Plane_2Pixel_PTV[v71];
          goto LABEL_151;
        }
        if (*(unsigned char *)(v79 + 281))
        {
          p_BKDM_3Plane_2Pixel_Video_HDR10 = &self->_BKDM_3Plane_2Pixel_Video_HDR10;
          goto LABEL_151;
        }
      }
      p_BKDM_3Plane_2Pixel_Video_HDR10 = &self->_BKDM_3Plane_2Pixel_Linear[v71];
    }
LABEL_151:
    uint64_t v62 = [(HDRBackwardDisplayManagement *)self getRenderPipelineStateForShader:*p_BKDM_3Plane_2Pixel_Video_HDR10];
    [v16 setFragmentTexture:self->_inputTexture[1] atIndex:v52];
    [v16 setFragmentTexture:self->_inputTexture[2] atIndex:v52 + 1];
    v52 |= 2u;
    long long v61 = (void *)v62;
LABEL_152:
    [v16 setRenderPipelineState:v61];
    [v16 setFragmentTexture:self->_pq2LTable atIndex:v52];
    uint64_t v63 = 2592;
    if (v68 < 2) {
      uint64_t v63 = 2640;
    }
    uint64_t v64 = 2632;
    if ((v76 & (outputPackingColorFormat == 0)) == 0) {
      uint64_t v64 = v63;
    }
    [v16 setFragmentTexture:*(Class *)((char *)&self->super.isa + v64) atIndex:v52 + 1];
    [v16 setFragmentTexture:self->_l2PQTable atIndex:v52 + 2];
    if (a5) {
      [v16 setFragmentTexture:self->_uiTexture atIndex:v52 + 3];
    }
    [v16 setFragmentBuffer:self->_uniformBuffer offset:0 atIndex:0];
    [v16 setFragmentSamplerState:self->_inputSampler atIndex:0];
    [v16 setVertexBuffer:self->_vertsBuffer offset:0 atIndex:0];
    [v16 drawPrimitives:4 vertexStart:0 vertexCount:4];
    [(HDRBackwardDisplayManagement *)self handleMetaInsertion:outputPackingColorFormat == 0 encoder:v16 widthScale:v74 payloadLength:v67];
    [v16 endEncoding];
    ++self->_frameIndex;

    goto LABEL_159;
  }
  if (enableLogInstance)
  {
    if (logInstanceID) {
      uint64_t v53 = logInstanceID;
    }
    else {
      uint64_t v53 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)uint64_t v82 = WORD1(v53);
      *(_WORD *)&v82[8] = 2080;
      *(void *)v83 = "-[HDRBackwardDisplayManagement EncodeToCommandBuffer:inputSurface:uiSurface:outputSurface:frameProperties:]";
      *(_WORD *)&v83[8] = 2048;
      *(void *)&v83[10] = 0;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : encoder=%p, out of encoder resource", buf, 0x20u);
    }
    uint64_t v16 = 0;
    prevLogInstanceIOSurfaceID ID = v53;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)uint64_t v82 = "-[HDRBackwardDisplayManagement EncodeToCommandBuffer:inputSurface:uiSurface:outputSurface:frameProperties:]";
      *(_WORD *)&v82[8] = 2048;
      *(void *)v83 = 0;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : encoder=%p, out of encoder resource", buf, 0x16u);
    }
    uint64_t v16 = 0;
  }
  int64_t v17 = -17004;
LABEL_160:

  return v17;
}

- (int64_t)encodeToCommandBuffer:(id)a3 video:(__IOSurface *)a4 videoSrcRegion:(id)a5 videoDstRegion:(id)a6 ui:(__IOSurface *)buffer output:(__IOSurface *)a8 frameProperties:(id)a9
{
  $85CD2974BE96D4886BB301820D1C36C2 var1 = a5.var1;
  $85CD2974BE96D4886BB301820D1C36C2 var0 = a5.var0;
  id v13 = a3;
  id v14 = a9;
  unsigned int Width = IOSurfaceGetWidth(a8);
  unint64_t v16 = Width | ((unint64_t)IOSurfaceGetHeight(a8) << 32);
  unint64_t v17 = v16;
  if (buffer)
  {
    unsigned int v18 = IOSurfaceGetWidth(buffer);
    unint64_t v17 = v18 | ((unint64_t)IOSurfaceGetHeight(buffer) << 32);
  }
  int64_t v19 = -[HDRBackwardDisplayManagement encodeToCommandBuffer:video:videoSrcRegion:videoDstRegion:ui:uiSrcRegion:uiDstRegion:backgroundColor:output:frameProperties:](self, "encodeToCommandBuffer:video:videoSrcRegion:videoDstRegion:ui:uiSrcRegion:uiDstRegion:backgroundColor:output:frameProperties:", v13, a4, var0, var1, *(void *)&a6.var0, *(void *)&a6.var1, buffer, 0, v17, 0, v16, 0, a8, v14);

  return v19;
}

- (int64_t)setAccessibilityMatrix:(id *)a3
{
  if (a3
    && (fabsf(a3->var0[0][0] + -1.0) >= 0.0000001
     || fabsf(a3->var0[1][1] + -1.0) >= 0.0000001
     || fabsf(a3->var0[2][2] + -1.0) >= 0.0000001
     || fabsf(a3->var0[0][1]) >= 0.0000001
     || fabsf(a3->var0[0][2]) >= 0.0000001
     || fabsf(a3->var0[1][0]) >= 0.0000001
     || fabsf(a3->var0[1][2]) >= 0.0000001
     || fabsf(a3->var0[2][0]) >= 0.0000001
     || fabsf(a3->var0[2][1]) >= 0.0000001))
  {
    self->_useAccessibilityMatrix = 1;
    long long v3 = *(_OWORD *)&a3->var0[0][0];
    long long v4 = *(_OWORD *)&a3->var0[1][1];
    self->_cachedHDRMatrix.parameter[2][2] = a3->var0[2][2];
    *(_OWORD *)&self->_cachedHDRMatrix.parameter[0][0] = v3;
    *(_OWORD *)&self->_cachedHDRMatrix.parameter[1][1] = v4;
  }
  else
  {
    self->_useAccessibilityMatrix = 0;
  }
  return -17000;
}

- (int64_t)encodeToCommandBuffer:(id)a3 video:(__IOSurface *)a4 videoSrcRegion:(id)a5 videoDstRegion:(id)a6 ui:(__IOSurface *)a7 uiSrcRegion:(id)a8 uiDstRegion:(id)a9 backgroundColor:(id *)a10 output:(__IOSurface *)a11 frameProperties:(id)a12
{
  $85CD2974BE96D4886BB301820D1C36C2 var1 = a6.var1;
  $85CD2974BE96D4886BB301820D1C36C2 var0 = a6.var0;
  $85CD2974BE96D4886BB301820D1C36C2 v14 = a5.var1;
  $85CD2974BE96D4886BB301820D1C36C2 v15 = a5.var0;
  uint64_t v146 = *MEMORY[0x263EF8340];
  $7FE4617958C733DE97CA79132AEA21A2 v139 = a6;
  id v18 = a3;
  id v134 = a12;
  uint64_t v138 = 0;
  uint64_t v137 = 0;
  v135 = v18;
  if (!v18 || !a11 || !((unint64_t)a4 | (unint64_t)a7))
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v19 = logInstanceID;
      }
      else {
        uint64_t v19 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 134219008;
      *(void *)v141 = WORD1(v19);
      *(_WORD *)&v141[8] = 2048;
      *(void *)v142 = v18;
      *(_WORD *)&v142[8] = 2048;
      *(void *)&v142[10] = a11;
      *(_WORD *)v143 = 2048;
      *(void *)&v143[2] = a4;
      __int16 v144 = 2048;
      v145 = a7;
      int v20 = &_os_log_internal;
      int v21 = " [1.419.54] #%04llx   commanBuffer=%p, output=%p, input=%p ui=%p";
      uint32_t v22 = 52;
LABEL_10:
      _os_log_impl(&dword_22224D000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
LABEL_11:
      prevLogInstanceIOSurfaceID ID = v19;
LABEL_299:
      int64_t v84 = -17006;
      goto LABEL_300;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_299;
    }
    *(_DWORD *)buf = 134218752;
    *(void *)v141 = v18;
    *(_WORD *)&v141[8] = 2048;
    *(void *)v142 = a11;
    *(_WORD *)&v142[8] = 2048;
    *(void *)&v142[10] = a4;
    *(_WORD *)v143 = 2048;
    *(void *)&v143[2] = a7;
    double v23 = &_os_log_internal;
    int v24 = " [1.419.54]   commanBuffer=%p, output=%p, input=%p ui=%p";
    uint32_t v25 = 42;
LABEL_298:
    _os_log_impl(&dword_22224D000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, v25);
    goto LABEL_299;
  }
  unsigned int Width = IOSurfaceGetWidth(a11);
  unsigned int Height = IOSurfaceGetHeight(a11);
  unint64_t v136 = __PAIR64__(Height, Width);
  if (!a4)
  {
    BOOL v118 = 0;
    unsigned int v125 = 0;
    unsigned int v129 = 0;
    goto LABEL_24;
  }
  unsigned int v129 = IOSurfaceGetWidth(a4);
  unsigned int v125 = IOSurfaceGetHeight(a4);
  unint64_t v26 = HIDWORD(*(unint64_t *)&v15);
  if (v15.var0 >= v129 && v15.var1 >= v125)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v27 = logInstanceID;
      }
      else {
        uint64_t v27 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      *(_DWORD *)buf = 134219008;
      *(void *)v141 = WORD1(v27);
      *(_WORD *)&v141[8] = 1024;
      *(_DWORD *)v142 = v15.var0;
      *(_WORD *)&v142[4] = 1024;
      *(_DWORD *)&v142[6] = v129;
      *(_WORD *)&v142[10] = 1024;
      *(_DWORD *)&v142[12] = v15.var1;
      *(_WORD *)&v142[16] = 1024;
      *(_DWORD *)v143 = v125;
      uint64_t v28 = &_os_log_internal;
      int v29 = " [1.419.54] #%04llx   region.origin.x=%d >= texWidth=%d && region.origin.y=%d >= texHeight=%d";
      uint32_t v30 = 36;
LABEL_41:
      _os_log_impl(&dword_22224D000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, v30);
LABEL_42:
      prevLogInstanceIOSurfaceID ID = v27;
      goto LABEL_204;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v141 = v15.var0;
      *(_WORD *)&v141[4] = 1024;
      *(_DWORD *)&v141[6] = v129;
      *(_WORD *)v142 = 1024;
      *(_DWORD *)&v142[2] = v15.var1;
      *(_WORD *)&v142[6] = 1024;
      unsigned int v58 = v125;
LABEL_95:
      *(_DWORD *)&v142[8] = v58;
      uint64_t v59 = &_os_log_internal;
      uint64_t v60 = " [1.419.54]   region.origin.x=%d >= texWidth=%d && region.origin.y=%d >= texHeight=%d";
      uint32_t v61 = 26;
LABEL_110:
      _os_log_impl(&dword_22224D000, v59, OS_LOG_TYPE_DEFAULT, v60, buf, v61);
      goto LABEL_204;
    }
    goto LABEL_296;
  }
  if (v15.var0)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v27 = logInstanceID;
      }
      else {
        uint64_t v27 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)v141 = WORD1(v27);
      *(_WORD *)&v141[8] = 1024;
      *(_DWORD *)v142 = v15.var0;
      uint64_t v28 = &_os_log_internal;
      int v29 = " [1.419.54] #%04llx   !isMultipleOf2(region.origin.x=%d)";
      uint32_t v30 = 18;
      goto LABEL_41;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_296;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v141 = v15.var0;
LABEL_108:
    uint64_t v59 = &_os_log_internal;
    uint64_t v60 = " [1.419.54]   !isMultipleOf2(region.origin.x=%d)";
LABEL_109:
    uint32_t v61 = 8;
    goto LABEL_110;
  }
  if (var0.var0 >= Width && var0.var1 >= Height)
  {
    if (!enableLogInstance)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v141 = var0.var0;
        *(_WORD *)&v141[4] = 1024;
        *(_DWORD *)&v141[6] = Width;
        *(_WORD *)v142 = 1024;
        *(_DWORD *)&v142[2] = var0.var1;
        *(_WORD *)&v142[6] = 1024;
        unsigned int v58 = Height;
        goto LABEL_95;
      }
LABEL_296:
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_299;
      }
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v141 = v129;
      *(_WORD *)&v141[4] = 1024;
      *(_DWORD *)&v141[6] = v125;
      *(_WORD *)v142 = 1024;
      *(_DWORD *)&v142[2] = Width;
      *(_WORD *)&v142[6] = 1024;
      *(_DWORD *)&v142[8] = Height;
      double v23 = &_os_log_internal;
      int v24 = " [1.419.54]   videoSrcWidth=%d, videoSrcHeight=%d, dstWidth=%d, dstHeight=%d";
      uint32_t v25 = 26;
      goto LABEL_298;
    }
    if (logInstanceID) {
      uint64_t v34 = logInstanceID;
    }
    else {
      uint64_t v34 = prevLogInstanceID;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_203;
    }
    *(_DWORD *)buf = 134219008;
    *(void *)v141 = WORD1(v34);
    *(_WORD *)&v141[8] = 1024;
    *(_DWORD *)v142 = var0.var0;
    *(_WORD *)&v142[4] = 1024;
    *(_DWORD *)&v142[6] = Width;
    *(_WORD *)&v142[10] = 1024;
    *(_DWORD *)&v142[12] = var0.var1;
    *(_WORD *)&v142[16] = 1024;
    *(_DWORD *)v143 = Height;
    int v35 = &_os_log_internal;
    simd_float3 v36 = " [1.419.54] #%04llx   region.origin.x=%d >= texWidth=%d && region.origin.y=%d >= texHeight=%d";
    uint32_t v37 = 36;
    goto LABEL_202;
  }
  if (var0.var0)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v34 = logInstanceID;
      }
      else {
        uint64_t v34 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_203;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)v141 = WORD1(v34);
      *(_WORD *)&v141[8] = 1024;
      *(_DWORD *)v142 = var0.var0;
      int v35 = &_os_log_internal;
      simd_float3 v36 = " [1.419.54] #%04llx   !isMultipleOf2(region.origin.x=%d)";
LABEL_167:
      uint32_t v37 = 18;
LABEL_202:
      _os_log_impl(&dword_22224D000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, v37);
LABEL_203:
      prevLogInstanceIOSurfaceID ID = v34;
      goto LABEL_204;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_296;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v141 = var0.var0;
    goto LABEL_108;
  }
  if (v15.var0 + v14.var0 > v129 || v15.var1 + v14.var1 > v125)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v85 = logInstanceID;
      }
      else {
        uint64_t v85 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        *(void *)v141 = WORD1(v85);
        *(_WORD *)&v141[8] = 1024;
        *(_DWORD *)v142 = v15.var0;
        *(_WORD *)&v142[4] = 1024;
        *(_DWORD *)&v142[6] = v14.var0;
        *(_WORD *)&v142[10] = 1024;
        *(_DWORD *)&v142[12] = v129;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx   region.origin.x=%d + region.size.width=%d > texWidth=%d", buf, 0x1Eu);
      }
      prevLogInstanceIOSurfaceID ID = v85;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_210;
      }
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v141 = v15.var0;
      *(_WORD *)&v141[4] = 1024;
      *(_DWORD *)&v141[6] = v14.var0;
      *(_WORD *)v142 = 1024;
      *(_DWORD *)&v142[2] = v129;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]   region.origin.x=%d + region.size.width=%d > texWidth=%d", buf, 0x14u);
    }
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v34 = logInstanceID;
      }
      else {
        uint64_t v34 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_203;
      }
      *(_DWORD *)buf = 134218752;
      *(void *)v141 = WORD1(v34);
      *(_WORD *)&v141[8] = 1024;
      *(_DWORD *)v142 = v26;
      *(_WORD *)&v142[4] = 1024;
      *(_DWORD *)&v142[6] = v14.var1;
      *(_WORD *)&v142[10] = 1024;
      unsigned int v89 = v125;
LABEL_201:
      *(_DWORD *)&v142[12] = v89;
      int v35 = &_os_log_internal;
      simd_float3 v36 = " [1.419.54] #%04llx   region.origin.y=%d + region.size.height=%d > texHeight=%d";
      uint32_t v37 = 30;
      goto LABEL_202;
    }
LABEL_210:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v141 = v15.var1;
      *(_WORD *)&v141[4] = 1024;
      *(_DWORD *)&v141[6] = v14.var1;
      *(_WORD *)v142 = 1024;
      unsigned int v90 = v125;
LABEL_212:
      *(_DWORD *)&v142[2] = v90;
      uint64_t v59 = &_os_log_internal;
      uint64_t v60 = " [1.419.54]   region.origin.y=%d + region.size.height=%d > texHeight=%d";
      uint32_t v61 = 20;
      goto LABEL_110;
    }
LABEL_204:
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v19 = logInstanceID;
      }
      else {
        uint64_t v19 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 134219008;
      *(void *)v141 = WORD1(v19);
      *(_WORD *)&v141[8] = 1024;
      *(_DWORD *)v142 = v129;
      *(_WORD *)&v142[4] = 1024;
      *(_DWORD *)&v142[6] = v125;
      *(_WORD *)&v142[10] = 1024;
      *(_DWORD *)&v142[12] = Width;
      *(_WORD *)&v142[16] = 1024;
      *(_DWORD *)v143 = Height;
      int v20 = &_os_log_internal;
      int v21 = " [1.419.54] #%04llx   videoSrcWidth=%d, videoSrcHeight=%d, dstWidth=%d, dstHeight=%d";
      uint32_t v22 = 36;
      goto LABEL_10;
    }
    goto LABEL_296;
  }
  if (v14.var0)
  {
    if (!enableLogInstance)
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_296;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v141 = v14.var0;
LABEL_277:
      uint64_t v59 = &_os_log_internal;
      uint64_t v60 = " [1.419.54]   !isMultipleOf2(region.size.width=%d)";
      goto LABEL_109;
    }
    if (logInstanceID) {
      uint64_t v88 = logInstanceID;
    }
    else {
      uint64_t v88 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)v141 = WORD1(v88);
      *(_WORD *)&v141[8] = 1024;
      *(_DWORD *)v142 = v14.var0;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx   !isMultipleOf2(region.size.width=%d)", buf, 0x12u);
    }
    prevLogInstanceIOSurfaceID ID = v88;
    goto LABEL_204;
  }
  if (var1.var0 + var0.var0 > Width || var1.var1 + var0.var1 > Height)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v114 = logInstanceID;
      }
      else {
        uint64_t v114 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        *(void *)v141 = WORD1(v114);
        *(_WORD *)&v141[8] = 1024;
        *(_DWORD *)v142 = var0.var0;
        *(_WORD *)&v142[4] = 1024;
        *(_DWORD *)&v142[6] = var1.var0;
        *(_WORD *)&v142[10] = 1024;
        *(_DWORD *)&v142[12] = Width;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx   region.origin.x=%d + region.size.width=%d > texWidth=%d", buf, 0x1Eu);
      }
      prevLogInstanceIOSurfaceID ID = v114;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_292;
      }
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v141 = var0.var0;
      *(_WORD *)&v141[4] = 1024;
      *(_DWORD *)&v141[6] = var1.var0;
      *(_WORD *)v142 = 1024;
      *(_DWORD *)&v142[2] = Width;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]   region.origin.x=%d + region.size.width=%d > texWidth=%d", buf, 0x14u);
    }
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v34 = logInstanceID;
      }
      else {
        uint64_t v34 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_203;
      }
      *(_DWORD *)buf = 134218752;
      *(void *)v141 = WORD1(v34);
      *(_WORD *)&v141[8] = 1024;
      *(_DWORD *)v142 = var0.var1;
      *(_WORD *)&v142[4] = 1024;
      *(_DWORD *)&v142[6] = var1.var1;
      *(_WORD *)&v142[10] = 1024;
      unsigned int v89 = Height;
      goto LABEL_201;
    }
LABEL_292:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v141 = var0.var1;
      *(_WORD *)&v141[4] = 1024;
      *(_DWORD *)&v141[6] = var1.var1;
      *(_WORD *)v142 = 1024;
      unsigned int v90 = Height;
      goto LABEL_212;
    }
    goto LABEL_204;
  }
  if (var1.var0)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v34 = logInstanceID;
      }
      else {
        uint64_t v34 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_203;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)v141 = WORD1(v34);
      *(_WORD *)&v141[8] = 1024;
      *(_DWORD *)v142 = var1.var0;
      int v35 = &_os_log_internal;
      simd_float3 v36 = " [1.419.54] #%04llx   !isMultipleOf2(region.size.width=%d)";
      goto LABEL_167;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_296;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v141 = var1.var0;
    goto LABEL_277;
  }
  BOOL v118 = [(HDRBackwardDisplayManagement *)self inputIsSDRVideoFormat:a4];
LABEL_24:
  if (a7)
  {
    int v31 = IOSurfaceGetWidth(a7);
    int v32 = IOSurfaceGetHeight(a7);
    float edrfactor = iosurface_get_edrfactor(a7);
  }
  else
  {
    int v32 = 0;
    int v31 = 0;
    float edrfactor = 1.0;
  }
  self->_float uiEDRFactor = edrfactor;
  self->_int width = v129;
  self->_height = v125;
  if (a4)
  {
    BOOL v117 = [(HDRBackwardDisplayManagement *)self inputIsSDRVideoFormat:a4];
  }
  else
  {
    BOOL v117 = 0;
    self->_int width = v31;
    self->_height = v32;
  }
  self->_int targetWidth = Width;
  self->_double targetHeight = Height;
  size_t PlaneCount = IOSurfaceGetPlaneCount(a4);
  if (a4) {
    BOOL v39 = PlaneCount == 3;
  }
  else {
    BOOL v39 = 0;
  }
  uint64_t v41 = v39 && var1.var0 != v14.var0;
  unsigned int v128 = [(HDRBackwardDisplayManagement *)self pixelNumPerThreadFullScreen:0 videoInput:a4 UI:a7 Output:a11 widthScaling:v41];
  if (a4) {
    long long v42 = a7;
  }
  else {
    long long v42 = 0;
  }
  if (a4) {
    double v43 = a4;
  }
  else {
    double v43 = a7;
  }
  v122 = v42;
  v123 = v43;
  if (v43) {
    BOOL v132 = IOSurfaceGetPlaneCount(v43) == 3;
  }
  else {
    BOOL v132 = 0;
  }
  if (!self->_metadataVertexBuffer) {
    [(HDRBackwardDisplayManagement *)self createMetadataVertexBuffer];
  }
  [(HDRBackwardDisplayManagement *)self generateMetaAndConfig:v134 inputSurface:v123 outputSurface:a11 payLoad:&v138 dmCfg:&v137];
  if (v137)
  {
    int v44 = *(_DWORD *)(v137 + 224);
    LODWORD(v121) = v44 == 2;
    HIDWORD(v121) = v44 == 3;
  }
  else
  {
    uint64_t v121 = 0;
  }
  unsigned int outputPackingColorFormat = self->_outputPackingColorFormat;
  char v120 = *(unsigned char *)(v137 + 280);
  unint64_t v45 = self->_frameIndex % 3;
  double v46 = (id *)(&self->super.isa + v45);
  objc_storeStrong((id *)&self->_uniformBuffer, v46[343]);
  objc_storeStrong((id *)&self->_vertsBuf, v46[348]);
  objc_storeStrong((id *)&self->_inverseScalingFactorTableTexture, v46[325]);
  unsigned int displayMaxBrightnessInNitsForSDR = self->_displayMaxBrightnessInNitsForSDR;
  double v48 = [v134 valueForKey:@"SDRMaxBrightnessInNits"];
  LODWORD(v49) = 1120403456;
  if (v132) {
    *(float *)&double v49 = 1.0;
  }
  v133 = v48;
  if (v48)
  {
    objc_msgSend(v48, "floatValue", v49);
    hasDisplayBrightnessFromEDIOSurfaceID ID = self->_hasDisplayBrightnessFromEDID;
    if ((int)*(float *)&v49 > (int)(float)displayMaxBrightnessInNitsForSDR)
    {
      ++_MergedGlobals_4;
      *(float *)&double v49 = (float)displayMaxBrightnessInNitsForSDR;
    }
    if (*(float *)&v49 == 0.0 && hasDisplayBrightnessFromEDID) {
      *(float *)&double v49 = (float)displayMaxBrightnessInNitsForSDR;
    }
    if ((int)*(float *)&v49 <= 99)
    {
      ++qword_26ABE1E00;
      *(float *)&double v49 = (float)displayMaxBrightnessInNitsForSDR;
    }
    *(float *)&double v49 = *(float *)&v49 / (float)displayMaxBrightnessInNitsForSDR;
  }
  unsigned int v119 = outputPackingColorFormat - 1;
  *(float *)&double v49 = *(float *)&v49 / self->_uiEDRFactor;
  -[HDRBackwardDisplayManagement updateConfigFromMetadata:uiScaleFactor:width:background:hdrVideoOnly:hdr10TV:sdrOnly:](self, "updateConfigFromMetadata:uiScaleFactor:width:background:hdrVideoOnly:hdr10TV:sdrOnly:", v137, self->_targetWidth, a10, v49);
  -[HDRBackwardDisplayManagement updateVertices:videoInput:videoDstRegion:videoSrcRegion:uiInput:uiDstRegion:uiSrcRegion:dstWidth:dstHeight:videoSrcWidth:videoSrcHeight:index:scale:](self, "updateVertices:videoInput:videoDstRegion:videoSrcRegion:uiInput:uiDstRegion:uiSrcRegion:dstWidth:dstHeight:videoSrcWidth:videoSrcHeight:index:scale:", 0, v136, v123, var0, var1, v15, v14, v122, *(void *)&a9.var0, *(void *)&a9.var1, *(void *)&a8.var0, *(void *)&a8.var1, *(void *)&self->_targetWidth, __PAIR64__(v125, v129), __PAIR64__(v128, v45));
  int v55 = v121 | HIDWORD(v121);
  if (outputPackingColorFormat)
  {
    int v55 = 0;
    int v56 = 1;
  }
  else
  {
    int v56 = v132;
  }
  if (v55 == 1 || (v56 & 1) == 0)
  {
    if (v121)
    {
      float displayMaxBrightnessInNits = (float)*(unsigned int *)(v137 + 232);
    }
    else
    {
      float displayMaxBrightnessInNits = (float)self->_displayMaxBrightnessInNits;
      if ((v121 & 0x100000000) == 0)
      {
        float displayMinBrightnessInNits = self->_displayMinBrightnessInNits;
        unsigned int v66 = self->_displayMaxBrightnessInNitsForSDR;
        LODWORD(v52) = 1128792064;
        LODWORD(v53) = 5.0;
        [(HDRBackwardDisplayManagement *)self fillScalingTable_SDR2HDR:v137 target_White:v52 target_Black:v53];
        float v63 = (float)v66;
        goto LABEL_114;
      }
    }
    float displayMinBrightnessInNits = *(float *)(v137 + 236);
    float v63 = displayMaxBrightnessInNits;
LABEL_114:
    *(float *)&double v52 = displayMaxBrightnessInNits;
    double v52 = setTargitBrightnessInMetaData(v138, v52, displayMinBrightnessInNits, v63, displayMinBrightnessInNits);
    goto LABEL_115;
  }
  if (v119 <= 1)
  {
    if (v132)
    {
      LODWORD(v53) = *(_DWORD *)(v137 + 236);
      *(float *)&double v52 = (float)*(unsigned int *)(v137 + 232);
    }
    else
    {
      LODWORD(v53) = 5.0;
      LODWORD(v52) = 1128792064;
    }
    LODWORD(v54) = 1.0;
    [(HDRBackwardDisplayManagement *)self fillScalingTable_YUVTM:v137 targetwhite:1 targetblack:!v132 satBoost:v52 scalingFactor:v53 sdrOnly:v54];
    unsigned int v126 = 0;
    BOOL v64 = v122 != 0;
    int v65 = 1;
    goto LABEL_129;
  }
LABEL_115:
  -[HDRBackwardDisplayManagement fillInverseScalingFactorTableFromDMConfig:](self, "fillInverseScalingFactorTableFromDMConfig:", v137, v52);
  BOOL v64 = v122 != 0;
  if (v122) {
    BOOL v67 = v132;
  }
  else {
    BOOL v67 = 0;
  }
  if (outputPackingColorFormat)
  {
    int v65 = 0;
    unsigned int v126 = 0;
  }
  else
  {
    if (v132)
    {
      if (v139.var0) {
        BOOL v68 = 0;
      }
      else {
        BOOL v68 = v136 == *(void *)&v139.var1;
      }
      uint64_t v69 = !v68;
    }
    else
    {
      uint64_t v69 = 0;
    }
    uint64_t v70 = [(HDRBackwardDisplayManagement *)self adjustMetaData:v138 HDRUIBlending:v67 hasLetterbox:v69];
    [(HDRBackwardDisplayManagement *)self packetizeMetadata:v138 length:v70 into:self->_frameIndex % 3 onSurface:a11];
    unsigned int v126 = v70;
    int v65 = 0;
  }
LABEL_129:
  int v130 = [(HDRBackwardDisplayManagement *)self getTVIndex:HIDWORD(v121)];
  if (v132)
  {
    LOBYTE(v116) = v120 & 1;
    [(HDRBackwardDisplayManagement *)self setupTexturesWithInput:v123 VideoSRGB:0 UI:v122 UISRGB:0 Output:a11 PixelPerThread:v128 ptvMode:v116];
    int v71 = [(HDRBackwardDisplayManagement *)self createRenderCommandEncoderWithCommandBuffer:v135 texture:self->_outputTexture widthScale:v128 loadAction:0];
    BOOL v72 = v71;
    if (v71)
    {
      [v71 setFragmentTexture:self->_inputTexture[0] atIndex:0];
      [v72 setFragmentTexture:self->_inputTexture[1] atIndex:1];
      [v72 setFragmentTexture:self->_inputTexture[2] atIndex:2];
      BOOL v73 = 0;
      unsigned int v74 = 3;
      int8x16_t v75 = v72;
LABEL_134:
      [v75 setFragmentTexture:self->_pq2LTable atIndex:v74];
      uint64_t v77 = 2592;
      if (v65) {
        uint64_t v77 = 2640;
      }
      if (!v56) {
        uint64_t v77 = 2632;
      }
      [v75 setFragmentTexture:*(Class *)((char *)&self->super.isa + v77) atIndex:v74 + 1];
      [v75 setFragmentTexture:self->_l2PQTable atIndex:v74 + 2];
      uint64_t v78 = v74 + 3;
      if (!v132)
      {
        [v75 setFragmentTexture:self->_inputTexture[0] atIndex:v78];
        LODWORD(v78) = v74 | 4;
      }
      if (v64) {
        [v75 setFragmentTexture:self->_uiTexture atIndex:v78];
      }
      [v75 setFragmentBuffer:self->_uniformBuffer offset:0 atIndex:0];
      [v75 setFragmentSamplerState:self->_inputSampler atIndex:0];
      [v75 setVertexBuffer:self->_vertsBuf offset:0 atIndex:0];
      num_Blend_Rects = self->_num_Blend_Rects;
      if (self->_num_Blend_Rects[v45])
      {
        if (v132)
        {
          [(HDRBackwardDisplayManagement *)self updateUniformUIScaleForVideo:v117 forTV:v119 < 2 videoPeakBrightnessInNits:*(unsigned int *)(v137 + 240) uiHWDegamma:v73 dovi50toHDR10TVMode:*(unsigned int *)(v137 + 276)];
          int v80 = v130;
          if (v128 == 1)
          {
            if (v120)
            {
              v81 = &self->_BKDM_3Plane_1Pixel_UIBlending_PTV[v130];
            }
            else
            {
              int v86 = *(_DWORD *)(v137 + 276);
              if (v86 == 2)
              {
                v81 = &self->_BKDM_3Plane_1Pixel_Gamma_Scaled_Inverse_HLGOOTF[v130];
              }
              else
              {
                uint64_t v87 = &self->super.isa + v130;
                if (v86 == 1) {
                  v81 = (BackwardDmShader **)(v87 + 113);
                }
                else {
                  v81 = (BackwardDmShader **)(v87 + 89);
                }
              }
            }
          }
          else if (v120)
          {
            v81 = &self->_BKDM_3Plane_2Pixel_UIBlending_PTV[v130];
          }
          else
          {
            v81 = &self->_BKDM_3Plane_2Pixel_Gamma_Scaled[v130];
          }
        }
        else
        {
          int v80 = v130;
          if (v118) {
            v81 = &self->_BKDM_SDRVideoUIBlending[v130];
          }
          else {
            v81 = &self->_BKDM_SDRUIBlending[v130];
          }
        }
        long double v91 = [(HDRBackwardDisplayManagement *)self getRenderPipelineStateForShader:*v81];
        [v75 setRenderPipelineState:v91];
        if (num_Blend_Rects[v45] < 1)
        {
          LODWORD(v83) = 0;
        }
        else
        {
          uint64_t v83 = 0;
          int v92 = 0;
          do
          {
            [v75 drawPrimitives:4 vertexStart:v83 vertexCount:4];
            v83 += 4;
            ++v92;
          }
          while (v92 < num_Blend_Rects[v45]);
        }
      }
      else
      {
        LODWORD(v83) = 0;
        int v80 = v130;
      }
      num_Video_Rects = self->_num_Video_Rects;
      if (self->_num_Video_Rects[v45])
      {
        if (v132)
        {
          if (v128 == 1)
          {
            if (v120)
            {
              p_BKDM_3Plane_1Pixel_Video_HDR10 = &self->_BKDM_3Plane_1Pixel_PTV[v80];
            }
            else
            {
              int v113 = *(_DWORD *)(v137 + 276);
              if (v113 == 2)
              {
                p_BKDM_3Plane_1Pixel_Video_HDR10 = &self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_HLGOOTF[v80];
              }
              else if (v113 == 1)
              {
                p_BKDM_3Plane_1Pixel_Video_HDR10 = &self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_YScale[v80];
              }
              else if (*(unsigned char *)(v137 + 281))
              {
                p_BKDM_3Plane_1Pixel_Video_HDR10 = &self->_BKDM_3Plane_1Pixel_Video_HDR10;
              }
              else
              {
                p_BKDM_3Plane_1Pixel_Video_HDR10 = &self->_BKDM_3Plane_1Pixel_Video_Scaled[v80];
              }
            }
          }
          else
          {
            long long v97 = &self->super.isa + v80;
            long long v98 = (BackwardDmShader **)(v97 + 175);
            p_BKDM_3Plane_1Pixel_Video_HDR10 = (BackwardDmShader **)(v97 + 5);
            if ((v120 & 1) == 0) {
              p_BKDM_3Plane_1Pixel_Video_HDR10 = v98;
            }
          }
        }
        else
        {
          v95 = &self->super.isa + v80;
          long long v96 = (BackwardDmShader **)(v95 + 187);
          p_BKDM_3Plane_1Pixel_Video_HDR10 = (BackwardDmShader **)(v95 + 199);
          if (!v73) {
            p_BKDM_3Plane_1Pixel_Video_HDR10 = v96;
          }
          if (v118) {
            p_BKDM_3Plane_1Pixel_Video_HDR10 = &self->_BKDM_SDRVideoOnly[v80];
          }
        }
        long long v99 = [(HDRBackwardDisplayManagement *)self getRenderPipelineStateForShader:*p_BKDM_3Plane_1Pixel_Video_HDR10];
        [v75 setRenderPipelineState:v99];
        if (num_Video_Rects[v45] >= 1)
        {
          uint64_t v100 = 0;
          int v101 = 0;
          do
          {
            [v75 drawPrimitives:4 vertexStart:v83 + v100 vertexCount:4];
            ++v101;
            v100 += 4;
          }
          while (v101 < num_Video_Rects[v45]);
          LODWORD(v83) = v83 + v100;
        }
      }
      num_UI_Rects = self->_num_UI_Rects;
      if (self->_num_UI_Rects[v45])
      {
        if (v132)
        {
          if (v128 == 1)
          {
            long long v103 = &self->super.isa + v80;
            long long v104 = (BackwardDmShader **)(v103 + 271);
            long long v105 = (BackwardDmShader **)(v103 + 283);
            if (*(_DWORD *)(v137 + 276) != 1) {
              long long v105 = v104;
            }
          }
          else
          {
            long long v105 = &self->_fillUI2ForHDR[v80];
          }
        }
        else if (a4 && a7)
        {
          long long v105 = &self->_fillUI1SDR24[v80];
        }
        else
        {
          long long v105 = &self->_BKDM_SDRUIOnly[v80];
        }
        long long v106 = [(HDRBackwardDisplayManagement *)self getRenderPipelineStateForShader:*v105];
        [v75 setRenderPipelineState:v106];
        if (num_UI_Rects[v45] >= 1)
        {
          int v107 = 0;
          uint64_t v83 = (int)v83;
          do
          {
            [v75 drawPrimitives:4 vertexStart:v83 vertexCount:4];
            v83 += 4;
            ++v107;
          }
          while (v107 < num_UI_Rects[v45]);
        }
      }
      num_ColorFill_Rects = self->_num_ColorFill_Rects;
      if (self->_num_ColorFill_Rects[v45])
      {
        uint64_t v109 = 2072;
        if (v128 == 1) {
          uint64_t v109 = 1976;
        }
        long long v110 = [(HDRBackwardDisplayManagement *)self getRenderPipelineStateForShader:*(Class *)((char *)&self->super.isa + 8 * v80 + v109)];
        [v75 setRenderPipelineState:v110];
        if (num_ColorFill_Rects[v45] >= 1)
        {
          int v111 = 0;
          uint64_t v112 = (int)v83;
          do
          {
            [v75 drawPrimitives:4 vertexStart:v112 vertexCount:4];
            v112 += 4;
            ++v111;
          }
          while (v111 < num_ColorFill_Rects[v45]);
        }
      }
      [(HDRBackwardDisplayManagement *)self handleMetaInsertion:outputPackingColorFormat == 0 encoder:v75 widthScale:v128 payloadLength:v126];
      [v75 endEncoding];
      ++self->_frameIndex;

      int64_t v84 = -17000;
      goto LABEL_300;
    }
  }
  else
  {
    BOOL v73 = v122 == 0;
    LOBYTE(v116) = 0;
    -[HDRBackwardDisplayManagement setupTexturesWithInput:VideoSRGB:UI:UISRGB:Output:PixelPerThread:ptvMode:](self, "setupTexturesWithInput:VideoSRGB:UI:UISRGB:Output:PixelPerThread:ptvMode:", v123, v73, v116);
    uint64_t v76 = [(HDRBackwardDisplayManagement *)self createRenderCommandEncoderWithCommandBuffer:v135 texture:self->_outputTexture widthScale:v128 loadAction:0];
    if (v76)
    {
      unsigned int v74 = 0;
      int8x16_t v75 = (void *)v76;
      goto LABEL_134;
    }
  }
  if (enableLogInstance)
  {
    if (logInstanceID) {
      uint64_t v82 = logInstanceID;
    }
    else {
      uint64_t v82 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)v141 = WORD1(v82);
      *(_WORD *)&v141[8] = 2080;
      *(void *)v142 = "-[HDRBackwardDisplayManagement encodeToCommandBuffer:video:videoSrcRegion:videoDstRegion:ui:uiSr"
                        "cRegion:uiDstRegion:backgroundColor:output:frameProperties:]";
      *(_WORD *)&v142[8] = 2048;
      *(void *)&v142[10] = 0;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : encoder=%p, out of encoder resource", buf, 0x20u);
    }
    prevLogInstanceIOSurfaceID ID = v82;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v141 = "-[HDRBackwardDisplayManagement encodeToCommandBuffer:video:videoSrcRegion:videoDstRegion:ui:uiSr"
                        "cRegion:uiDstRegion:backgroundColor:output:frameProperties:]";
      *(_WORD *)&v141[8] = 2048;
      *(void *)v142 = 0;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : encoder=%p, out of encoder resource", buf, 0x16u);
    }
  }
  int64_t v84 = -17004;
LABEL_300:

  return v84;
}

- (int)pixelNumPerThreadFullScreen:(BOOL)a3 videoInput:(__IOSurface *)a4 UI:(__IOSurface *)a5 Output:(__IOSurface *)a6 widthScaling:(BOOL)a7
{
  if (!a3) {
    return 1;
  }
  BOOL v9 = self->_width == self->_targetWidth && self->_height == self->_targetHeight;
  size_t PlaneCount = IOSurfaceGetPlaneCount(a4);
  if (a4) {
    BOOL v12 = PlaneCount == 3;
  }
  else {
    BOOL v12 = 0;
  }
  int v14 = v12 && a5 == 0;
  if ((v14 & v9) != 0) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)inputIsSDRVideoFormat:(__IOSurface *)a3
{
  OSType PixelFormat = IOSurfaceGetPixelFormat(a3);
  char v4 = vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_s32(vdupq_n_s32(PixelFormat), (int32x4_t)xmmword_2222D1240))) | ((PixelFormat & 0xFFFFFFFD) == 1885745712);
  BOOL v6 = (PixelFormat & 0xFFFFFFFD) == 0x70343230 || (PixelFormat & 0xFFFFFDEF) == 875704422;
  return (v4 | v6) & 1;
}

- (unint64_t)getPixelFormatFromSurface:(__IOSurface *)a3 DeGamma:(BOOL)a4 forceUseOnePlane:(BOOL)a5 default:(unint64_t)a6
{
  BOOL v7 = a5;
  signed int PixelFormat = IOSurfaceGetPixelFormat(a3);
  if (a4)
  {
    if (PixelFormat > 1882468913)
    {
      if (PixelFormat <= 2016686639)
      {
        if (PixelFormat > 1885745713)
        {
          if (PixelFormat != 1885745714)
          {
            if (PixelFormat == 1999843442) {
              return 555;
            }
            return a6;
          }
          return 509;
        }
        goto LABEL_11;
      }
LABEL_13:
      if (PixelFormat > 2019963439)
      {
        if (PixelFormat != 2019963440)
        {
          int v11 = 2019963442;
LABEL_32:
          if (PixelFormat == v11) {
            return 506;
          }
          return a6;
        }
      }
      else if (PixelFormat != 2016686640)
      {
        int v11 = 2016686642;
        goto LABEL_32;
      }
      return 505;
    }
    if (PixelFormat > 875704949)
    {
      if (PixelFormat <= 1647534391)
      {
        if (PixelFormat != 875704950)
        {
          if (PixelFormat == 1111970369) {
            return 81;
          }
          return a6;
        }
        return 502;
      }
      if (PixelFormat == 1647534392)
      {
        BOOL v12 = !v7;
        unint64_t v13 = 551;
        unint64_t v14 = 555;
        goto LABEL_47;
      }
      goto LABEL_39;
    }
LABEL_26:
    if (PixelFormat == 875704422 || PixelFormat == 875704438) {
      return 500;
    }
    if (PixelFormat == 875704934) {
      return 502;
    }
    return a6;
  }
  if (PixelFormat > 1882468913)
  {
    if (PixelFormat > 2016686639) {
      goto LABEL_13;
    }
    if (PixelFormat <= 1885745713)
    {
LABEL_11:
      if (PixelFormat == 1882468914) {
        return 509;
      }
      int v10 = 1885745712;
      goto LABEL_40;
    }
    if (PixelFormat == 1885745714) {
      return 509;
    }
    if (PixelFormat == 1999843442) {
      return 554;
    }
    return a6;
  }
  if (PixelFormat <= 875704949) {
    goto LABEL_26;
  }
  if (PixelFormat > 1647534391)
  {
    if (PixelFormat == 1647534392)
    {
      BOOL v12 = !v7;
      unint64_t v13 = 550;
      unint64_t v14 = 554;
LABEL_47:
      if (v12) {
        return v13;
      }
      else {
        return v14;
      }
    }
LABEL_39:
    int v10 = 1882468912;
LABEL_40:
    if (PixelFormat == v10) {
      return 508;
    }
    return a6;
  }
  if (PixelFormat == 875704950) {
    return 502;
  }
  if (PixelFormat == 1111970369) {
    return 80;
  }
  return a6;
}

- (void)setupTexturesWithInput:(__IOSurface *)a3 VideoSRGB:(BOOL)a4 UI:(__IOSurface *)a5 UISRGB:(BOOL)a6 Output:(__IOSurface *)a7 PixelPerThread:(int)a8 ptvMode:(BOOL)a9
{
  BOOL v12 = a4;
  unint64_t v15 = 0x263F12000uLL;
  if (a5)
  {
    unint64_t v16 = [(HDRBackwardDisplayManagement *)self getPixelFormatFromSurface:a5 DeGamma:a6 forceUseOnePlane:a3 == 0 default:80];
    unint64_t v17 = (void *)MEMORY[0x263F12A50];
    size_t Width = IOSurfaceGetWidth(a5);
    uint64_t v19 = [v17 texture2DDescriptorWithPixelFormat:v16 width:Width height:IOSurfaceGetHeight(a5) mipmapped:0];
    int v20 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v19 iosurface:a5 plane:0];
    uiTexture = self->_uiTexture;
    self->_uiTexture = v20;

    unint64_t v15 = 0x263F12000;
  }
  else
  {
    uint64_t v19 = self->_uiTexture;
    self->_uiTexture = 0;
  }

  size_t PlaneCount = IOSurfaceGetPlaneCount(a3);
  if (!a3 || PlaneCount == 3)
  {
    if (a3)
    {
      if (a8 == 2) {
        uint64_t v27 = 103;
      }
      else {
        uint64_t v27 = 53;
      }
      uint64_t v29 = 23;
      if (a8 == 2) {
        uint64_t v29 = 63;
      }
      uint64_t v30 = 25;
      if (a8 == 2) {
        uint64_t v30 = 65;
      }
      if (a9) {
        uint64_t v31 = v29;
      }
      else {
        uint64_t v31 = v30;
      }
      uint64_t v28 = [*(id *)(v15 + 2640) texture2DDescriptorWithPixelFormat:v31 width:self->_width / a8 height:self->_height mipmapped:0];
      uint64_t v32 = 0;
      inputTexture = self->_inputTexture;
      uint64_t v41 = v28;
      do
      {
        uint64_t v34 = [(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v28 iosurface:a3 plane:v32];
        int v35 = inputTexture[v32];
        inputTexture[v32] = (MTLTexture *)v34;

        ++v32;
        uint64_t v28 = v41;
      }
      while (v32 != 3);
    }
    else
    {
      simd_float3 v36 = self->_inputTexture[0];
      self->_inputTexture[0] = 0;

      uint32_t v37 = self->_inputTexture[1];
      self->_inputTexture[1] = 0;

      uint64_t v28 = self->_inputTexture[2];
      self->_inputTexture[2] = 0;
      uint64_t v27 = 53;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v15 + 2640), "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", -[HDRBackwardDisplayManagement getPixelFormatFromSurface:DeGamma:forceUseOnePlane:default:](self, "getPixelFormatFromSurface:DeGamma:forceUseOnePlane:default:", a3, v12, a5 == 0, 115), self->_width, self->_height, 0);
    float v40 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    double v23 = (MTLTexture *)-[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:");
    int v24 = self->_inputTexture[0];
    self->_inputTexture[0] = v23;

    uint32_t v25 = self->_inputTexture[1];
    self->_inputTexture[1] = 0;

    unint64_t v26 = self->_inputTexture[2];
    self->_inputTexture[2] = 0;

    uint64_t v27 = 53;
    uint64_t v28 = v40;
  }

  id v42 = [*(id *)(v15 + 2640) texture2DDescriptorWithPixelFormat:v27 width:self->_targetWidth / a8 height:self->_targetHeight mipmapped:0];
  [v42 setUsage:4];
  long long v38 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v42 iosurface:a7 plane:0];
  outputTexture = self->_outputTexture;
  self->_outputTexture = v38;
}

- (void)setupMetadataTextureWithOutput:(__IOSurface *)a3
{
  id v7 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:53 width:self->_targetWidth height:self->_targetHeight mipmapped:0];
  [v7 setUsage:4];
  BOOL v5 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v7 iosurface:a3 plane:0];
  outputTextureMetadata = self->_outputTextureMetadata;
  self->_outputTextureMetadata = v5;
}

- (id)createRenderCommandEncoderWithCommandBuffer:(id)a3 texture:(id)a4 widthScale:(unsigned int)a5 loadAction:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = [MEMORY[0x263F129A0] renderPassDescriptor];
  unint64_t v13 = [v12 colorAttachments];
  unint64_t v14 = [v13 objectAtIndexedSubscript:0];
  [v14 setTexture:v11];

  unint64_t v15 = [v12 colorAttachments];
  unint64_t v16 = [v15 objectAtIndexedSubscript:0];
  [v16 setLoadAction:a6];

  unint64_t v17 = [v12 colorAttachments];
  id v18 = [v17 objectAtIndexedSubscript:0];
  [v18 setStoreAction:1];

  uint64_t v19 = [v10 renderCommandEncoderWithDescriptor:v12];
  int v20 = v19;
  if (v19)
  {
    uint64_t v23 = 0;
    double v21 = (double)self->_targetWidth / (double)a5;
    double targetHeight = (double)self->_targetHeight;
    double v25 = v21;
    double v26 = -targetHeight;
    long long v27 = xmmword_2222D1250;
    [v19 setViewport:&v23];
  }

  return v20;
}

- (void)attatchInfoFrame:(id *)a3 toOutputSurface:(__IOSurface *)a4
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (IOSurfaceSetBulkAttachments2())
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v4 = logInstanceID;
      }
      else {
        uint64_t v4 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v6 = WORD1(v4);
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"retVal == 0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/BackwardDisplayManagement/HDRBackwardDisplayManagement.mm\" at line 4485\n", buf, 0xCu);
      }
      prevLogInstanceIOSurfaceID ID = v4;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"retVal == 0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/BackwardDisplayManagement/HDRBackwardDisplayManagement.mm\" at line 4485\n", buf, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiTexture, 0);
  objc_storeStrong((id *)&self->_intermediateTexture, 0);
  objc_storeStrong((id *)&self->_outputTextureMetadata, 0);
  objc_storeStrong((id *)&self->_outputTexture, 0);
  for (uint64_t i = 0; i != -3; --i)
    objc_storeStrong((id *)&self->_inputTexture[i + 2], 0);
  for (uint64_t j = 0; j != -15; --j)
    objc_storeStrong((id *)&self->_metadataTextures[2][j + 4], 0);
  for (uint64_t k = 0; k != -5; --k)
    objc_storeStrong((id *)&self->_metadataTexture[k + 4], 0);
  objc_storeStrong((id *)&self->_metadataVertexBuffer, 0);
  for (uint64_t m = 0; m != -3; --m)
    objc_storeStrong((id *)&self->_vertsBufs[m + 2], 0);
  objc_storeStrong((id *)&self->_vertsBuf, 0);
  objc_storeStrong((id *)&self->_vertsBuffer, 0);
  for (uint64_t n = 0; n != -3; --n)
    objc_storeStrong((id *)&self->_uniformBuffers[n + 2], 0);
  objc_storeStrong((id *)&self->_uniformBuffer, 0);
  objc_storeStrong((id *)&self->_yuvScalingTable, 0);
  objc_storeStrong((id *)&self->_sdrScalingTable, 0);
  for (iuint64_t i = 0; ii != -3; --ii)
    objc_storeStrong((id *)&self->_yuvScalingFactorTableTextures[ii + 2], 0);
  objc_storeStrong((id *)&self->_yuvScalingFactorTableTexture, 0);
  objc_storeStrong((id *)&self->_sdrScalingFactorTableTexture, 0);
  objc_storeStrong((id *)&self->_inverseScalingTable, 0);
  for (juint64_t j = 0; jj != -3; --jj)
    objc_storeStrong((id *)&self->_inverseScalingFactorTableTextures[jj + 2], 0);
  objc_storeStrong((id *)&self->_inverseScalingFactorTableTexture, 0);
  objc_storeStrong((id *)&self->_l2PQTable, 0);
  objc_storeStrong((id *)&self->_pq2LTable, 0);
  objc_storeStrong((id *)&self->_inputSampler, 0);
  objc_storeStrong((id *)&self->_metadataKernel2Pixel, 0);
  objc_storeStrong((id *)&self->_metadataKernel, 0);
  for (kuint64_t k = 0; kk != -12; --kk)
    objc_storeStrong((id *)&self->_fillUI2ForHDR[kk + 11], 0);
  for (muint64_t m = 0; mm != -12; --mm)
    objc_storeStrong((id *)&self->_fillUI1SDR24[mm + 11], 0);
  for (nuint64_t n = 0; nn != -12; --nn)
    objc_storeStrong((id *)&self->_fillUI1ForHDR_Inverse_YScale[nn + 11], 0);
  for (uint64_t i1 = 0; i1 != -12; --i1)
    objc_storeStrong((id *)&self->_fillUI1ForHDR[i1 + 11], 0);
  for (uint64_t i2 = 0; i2 != -12; --i2)
    objc_storeStrong((id *)&self->_colorfill2[i2 + 11], 0);
  for (uint64_t i3 = 0; i3 != -12; --i3)
    objc_storeStrong((id *)&self->_colorfill1[i3 + 11], 0);
  for (uint64_t i4 = 0; i4 != -12; --i4)
    objc_storeStrong((id *)&self->_BKDM_SDRUIBlending[i4 + 11], 0);
  for (uint64_t i5 = 0; i5 != -12; --i5)
    objc_storeStrong((id *)&self->_BKDM_SDRVideoUIBlending[i5 + 11], 0);
  for (uint64_t i6 = 0; i6 != -12; --i6)
    objc_storeStrong((id *)&self->_BKDM_SDRVideoOnly[i6 + 11], 0);
  for (uint64_t i7 = 0; i7 != -12; --i7)
    objc_storeStrong((id *)&self->_BKDM_SDRUIOnly[i7 + 11], 0);
  for (uint64_t i8 = 0; i8 != -12; --i8)
    objc_storeStrong((id *)&self->_BKDM_SDRUIOnly_ShaderDegamma[i8 + 11], 0);
  for (uint64_t i9 = 0; i9 != -12; --i9)
    objc_storeStrong((id *)&self->_BKDM_3Plane_2Pixel_Video_Scaled[i9 + 11], 0);
  for (uint64_t i10 = 0; i10 != -12; --i10)
    objc_storeStrong((id *)&self->_BKDM_3Plane_2Pixel_Gamma_Scaled[i10 + 11], 0);
  objc_storeStrong((id *)&self->_BKDM_3Plane_2Pixel_Video_HDR10, 0);
  objc_storeStrong((id *)&self->_BKDM_3Plane_1Pixel_Video_HDR10, 0);
  for (uint64_t i11 = 0; i11 != -12; --i11)
    objc_storeStrong((id *)&self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_YScale[i11 + 11], 0);
  for (uint64_t i12 = 0; i12 != -12; --i12)
    objc_storeStrong((id *)&self->_BKDM_3Plane_1Pixel_Video_Scaled_Inverse_HLGOOTF[i12 + 11], 0);
  for (uint64_t i13 = 0; i13 != -12; --i13)
    objc_storeStrong((id *)&self->_BKDM_3Plane_1Pixel_Video_Scaled[i13 + 11], 0);
  for (uint64_t i14 = 0; i14 != -12; --i14)
    objc_storeStrong((id *)&self->_BKDM_3Plane_1Pixel_Gamma_Scaled_Inverse_YScale[i14 + 11], 0);
  for (uint64_t i15 = 0; i15 != -12; --i15)
    objc_storeStrong((id *)&self->_BKDM_3Plane_1Pixel_Gamma_Scaled_Inverse_HLGOOTF[i15 + 11], 0);
  for (uint64_t i16 = 0; i16 != -12; --i16)
    objc_storeStrong((id *)&self->_BKDM_3Plane_1Pixel_Gamma_Scaled[i16 + 11], 0);
  for (uint64_t i17 = 0; i17 != -12; --i17)
    objc_storeStrong((id *)&self->_BKDM_3Plane_1Pixel_Gamma[i17 + 11], 0);
  for (uint64_t i18 = 0; i18 != -12; --i18)
    objc_storeStrong((id *)&self->_BKDM_3Plane_1Pixel_Linear[i18 + 11], 0);
  for (uint64_t i19 = 0; i19 != -12; --i19)
    objc_storeStrong((id *)&self->_BKDM_3Plane_2Pixel_Linear[i19 + 11], 0);
  for (uint64_t i20 = 0; i20 != -12; --i20)
    objc_storeStrong((id *)&self->_BKDM_3Plane_1Pixel_UIBlending_PTV[i20 + 11], 0);
  for (uint64_t i21 = 0; i21 != -12; --i21)
    objc_storeStrong((id *)&self->_BKDM_3Plane_2Pixel_UIBlending_PTV[i21 + 11], 0);
  for (uint64_t i22 = 224; i22 != 128; i22 -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i22), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i22), 0);
    i22 -= 8;
  }
  while (i22 != 32);
  objc_storeStrong((id *)&self->_BKDM_ARGB_Linear, 0);
  objc_storeStrong((id *)&self->_defaultLibrary, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end