@interface VCVirtualAVCaptureHardware
- ($2825F4736939C4A6D3AD43837233062D)highResolutionStillImageDimensionsWithFormatDict:(id)a3;
- (NSDictionary)devices;
- (id)defaultFormatForDeviceID:(id)a3;
- (id)initForDevice:(id)a3;
- (id)newDeviceFormatsFromJsonList:(id)a3;
- (id)newVirtualHardwareForDevice:(id)a3;
- (id)supportedMaxPhotoDimensionsWithFormatDict:(id)a3;
- (id)videoSupportedFrameRateRangesWithFormatDict:(id)a3;
- (opaqueCMFormatDescription)newFormatDescription:(id)a3;
- (void)dealloc;
@end

@implementation VCVirtualAVCaptureHardware

- (id)initForDevice:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCVirtualAVCaptureHardware;
  v4 = [(VCVirtualAVCaptureHardware *)&v8 init];
  v5 = v4;
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureHardware initForDevice:]();
      }
    }
    goto LABEL_10;
  }
  uint64_t v6 = [(VCVirtualAVCaptureHardware *)v4 newVirtualHardwareForDevice:a3];
  v5->_virtualHardware = (NSDictionary *)v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureHardware initForDevice:]();
      }
    }
LABEL_10:

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCVirtualAVCaptureHardware;
  [(VCVirtualAVCaptureHardware *)&v3 dealloc];
}

- (id)defaultFormatForDeviceID:(id)a3
{
  id v3 = [(NSDictionary *)self->_virtualHardware objectForKeyedSubscript:a3];

  return (id)[v3 firstObject];
}

- (NSDictionary)devices
{
  v2 = (void *)[(NSDictionary *)self->_virtualHardware copy];

  return (NSDictionary *)v2;
}

- (opaqueCMFormatDescription)newFormatDescription:(id)a3
{
  v10[1] = *(CMVideoFormatDescriptionRef *)MEMORY[0x1E4F143B8];
  v10[0] = 0;
  uint64_t v4 = (void *)[a3 objectForKeyedSubscript:kVCVirtualDeviceFormatPixelFormat];
  if (v4) {
    v5 = (char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
  }
  else {
    v5 = "<nil>";
  }
  CMVideoCodecType v6 = CStrToFourcc(v5);
  int32_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", kVCVirtualDeviceFormatCaptureWidth), "intValue");
  int32_t v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", kVCVirtualDeviceFormatCaptureHeight), "intValue");
  CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6, v7, v8, 0, v10);
  if (!v10[0] && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVirtualAVCaptureHardware newFormatDescription:]();
    }
  }
  return v10[0];
}

- (id)videoSupportedFrameRateRangesWithFormatDict:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", kVCVirtualDeviceFormatMinFrameRate), "floatValue");
  double v5 = v4;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", kVCVirtualDeviceFormatMaxFrameRate), "floatValue");
  v8[0] = [[VCVirtualAVFrameRateRange alloc] initWithMinFrameRate:v5 maxFrameRate:v6];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
}

- ($2825F4736939C4A6D3AD43837233062D)highResolutionStillImageDimensionsWithFormatDict:(id)a3
{
  id v3 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", kVCVirtualDeviceFormatPhotoDimensions), "lastObject");
  unsigned int v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", 0), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v4 | (unint64_t)(objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", 1), "intValue") << 32));
}

- (id)supportedMaxPhotoDimensionsWithFormatDict:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  $2825F4736939C4A6D3AD43837233062D v4 = [(VCVirtualAVCaptureHardware *)self highResolutionStillImageDimensionsWithFormatDict:a3];
  v5[0] = [MEMORY[0x1E4F29238] valueWithBytes:&v4 objCType:"{?=ii}"];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
}

- (id)newDeviceFormatsFromJsonList:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v21)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v20 = *(void *)v29;
      uint64_t v7 = *MEMORY[0x1E4F15C18];
      int32_t v8 = (long long *)MEMORY[0x1E4F1F9F8];
      uint64_t v9 = MEMORY[0x1E4F1CBF0];
      id obj = a3;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v12 = [VCVirtualAVCaptureDeviceFormat alloc];
          if (!v12)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCVirtualAVCaptureHardware newDeviceFormatsFromJsonList:]();
              }
            }
            goto LABEL_18;
          }
          v13 = v12;
          v14 = [(VCVirtualAVCaptureHardware *)self newFormatDescription:v11];
          if (!v14)
          {

            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCVirtualAVCaptureHardware newDeviceFormatsFromJsonList:]();
              }
            }
            goto LABEL_18;
          }
          v15 = v14;
          [(VCVirtualAVCaptureDeviceFormat *)v13 setMediaType:v7];
          [(VCVirtualAVCaptureDeviceFormat *)v13 setFormatDescription:v15];
          [(VCVirtualAVCaptureDeviceFormat *)v13 setVideoSupportedFrameRateRanges:[(VCVirtualAVCaptureHardware *)self videoSupportedFrameRateRangesWithFormatDict:v11]];
          objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", kVCVirtualDeviceFormatFOV), "floatValue");
          -[VCVirtualAVCaptureDeviceFormat setVideoFieldOfView:](v13, "setVideoFieldOfView:");
          -[VCVirtualAVCaptureDeviceFormat setVideoBinned:](v13, "setVideoBinned:", [v11 objectForKeyedSubscript:kVCVirtualDeviceFormatBinned] != 0);
          [(VCVirtualAVCaptureDeviceFormat *)v13 setVideoStabilizationSupported:0];
          objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", kVCVirtualDeviceFormatMaxZoom), "floatValue");
          [(VCVirtualAVCaptureDeviceFormat *)v13 setVideoMaxZoomFactor:v16];
          [(VCVirtualAVCaptureDeviceFormat *)v13 setVideoZoomFactorUpscaleThreshold:0.0];
          long long v25 = *v8;
          long long v22 = v25;
          uint64_t v26 = *((void *)v8 + 2);
          uint64_t v17 = v26;
          [(VCVirtualAVCaptureDeviceFormat *)v13 setMinExposureDuration:&v25];
          long long v23 = v22;
          uint64_t v24 = v17;
          [(VCVirtualAVCaptureDeviceFormat *)v13 setMaxExposureDuration:&v23];
          objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", kVCVirtualDeviceFormatISOMin), "floatValue");
          -[VCVirtualAVCaptureDeviceFormat setMinISO:](v13, "setMinISO:");
          objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", kVCVirtualDeviceFormatISOMax), "floatValue");
          -[VCVirtualAVCaptureDeviceFormat setMaxISO:](v13, "setMaxISO:");
          [(VCVirtualAVCaptureDeviceFormat *)v13 setGlobalToneMappingSupported:0];
          -[VCVirtualAVCaptureDeviceFormat setVideoHDRSupported:](v13, "setVideoHDRSupported:", [v11 objectForKeyedSubscript:kVCVirtualDeviceFormatHDR] != 0);
          [(VCVirtualAVCaptureDeviceFormat *)v13 setHighResolutionStillImageDimensions:[(VCVirtualAVCaptureHardware *)self highResolutionStillImageDimensionsWithFormatDict:v11]];
          -[VCVirtualAVCaptureDeviceFormat setHighPhotoQualitySupported:](v13, "setHighPhotoQualitySupported:", [v11 objectForKeyedSubscript:kVCVirtualDeviceFormatHighPhotoQuality] != 0);
          -[VCVirtualAVCaptureDeviceFormat setHighestPhotoQualitySupported:](v13, "setHighestPhotoQualitySupported:", [v11 objectForKeyedSubscript:kVCVirtualDeviceFormatSupportsHighestPhotoQuality] != 0);
          -[VCVirtualAVCaptureDeviceFormat setPortraitEffectSupported:](v13, "setPortraitEffectSupported:", [v11 objectForKeyedSubscript:kVCVirtualDeviceFormatPortrait] != 0);
          -[VCVirtualAVCaptureDeviceFormat setAutoFocusSystem:](v13, "setAutoFocusSystem:", [v11 objectForKeyedSubscript:kVCVirtualDeviceFormatAFSystem]);
          [(VCVirtualAVCaptureDeviceFormat *)v13 setSupportedColorSpaces:v9];
          [(VCVirtualAVCaptureDeviceFormat *)v13 setVideoMinZoomFactorForDepthDataDelivery:0.0];
          [(VCVirtualAVCaptureDeviceFormat *)v13 setVideoMaxZoomFactorForDepthDataDelivery:0.0];
          [(VCVirtualAVCaptureDeviceFormat *)v13 setSupportedVideoZoomFactorsForDepthDataDelivery:v9];
          [(VCVirtualAVCaptureDeviceFormat *)v13 setSupportedDepthDataFormats:v9];
          [(VCVirtualAVCaptureDeviceFormat *)v13 setUnsupportedCaptureOutputClasses:v9];
          [(VCVirtualAVCaptureDeviceFormat *)v13 setSupportedMaxPhotoDimensions:[(VCVirtualAVCaptureHardware *)self supportedMaxPhotoDimensionsWithFormatDict:v11]];
          [(VCVirtualAVCaptureDeviceFormat *)v13 setSecondaryNativeResolutionZoomFactors:v9];
          -[VCVirtualAVCaptureDeviceFormat setCenterStageSupported:](v13, "setCenterStageSupported:", [v11 objectForKeyedSubscript:kVCVirtualDeviceFormatCenterStage] != 0);
          CFRelease(v15);
          [v21 addObject:v13];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v27 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureHardware newDeviceFormatsFromJsonList:]();
      }
    }
LABEL_18:

    return 0;
  }
  return v21;
}

- (id)newVirtualHardwareForDevice:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureHardware newVirtualHardwareForDevice:]();
      }
    }
    goto LABEL_25;
  }
  id v5 = +[VCDefaults copyStringValueForKey:@"virtualCaptureFormatJSONPath"];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureHardware newVirtualHardwareForDevice:]();
      }
    }
LABEL_25:
    uint64_t v17 = 0;
    uint64_t v6 = 0;
    goto LABEL_18;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureHardware newVirtualHardwareForDevice:]();
      }
    }
    goto LABEL_17;
  }
  int32_t v8 = (void *)[MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:0];
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureHardware newVirtualHardwareForDevice:].cold.4();
      }
    }
LABEL_17:
    uint64_t v17 = 0;
    goto LABEL_18;
  }
  uint64_t v9 = v8;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v15 = -[VCVirtualAVCaptureHardware newDeviceFormatsFromJsonList:](self, "newDeviceFormatsFromJsonList:", [v9 objectForKeyedSubscript:v14]);
        if (!v15)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCVirtualAVCaptureHardware newVirtualHardwareForDevice:].cold.5();
            }
          }
          goto LABEL_17;
        }
        float v16 = v15;
        [v4 setValue:v15 forKey:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v19 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  uint64_t v17 = (void *)[v4 copy];
LABEL_18:

  return v17;
}

- (void)initForDevice:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to init self", v2, v3, v4, v5, v6);
}

- (void)initForDevice:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create virtual hardware", v2, v3, v4, v5, v6);
}

- (void)newFormatDescription:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create format description", v2, v3, v4, v5, v6);
}

- (void)newDeviceFormatsFromJsonList:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate device format list", v2, v3, v4, v5, v6);
}

- (void)newDeviceFormatsFromJsonList:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate virtual device format", v2, v3, v4, v5, v6);
}

- (void)newDeviceFormatsFromJsonList:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create format description", v2, v3, v4, v5, v6);
}

- (void)newVirtualHardwareForDevice:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate hardware dictionary", v2, v3, v4, v5, v6);
}

- (void)newVirtualHardwareForDevice:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrieve virtual device resource path from bundle", v2, v3, v4, v5, v6);
}

- (void)newVirtualHardwareForDevice:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrieve virtual device data from resource path=%@");
}

- (void)newVirtualHardwareForDevice:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to get hardware JSON", v2, v3, v4, v5, v6);
}

- (void)newVirtualHardwareForDevice:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to get device formats for device:%@");
}

@end