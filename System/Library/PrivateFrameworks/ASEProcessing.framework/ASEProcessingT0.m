@interface ASEProcessingT0
- (ASEProcessingT0)initWithConfig:(id *)a3 aseProcessing:(id)a4 productType:(unsigned int)a5;
- (float)getEnhancementStrength;
- (int64_t)processFrameWithInput:(id *)a3 Output:(id *)a4;
- (int64_t)processFrameWithInput:(id *)a3 callback:(id)a4;
- (int64_t)processFrameWithInput:(id *)a3 outputData:(id *)a4;
- (unsigned)getDestinationHeight;
- (unsigned)getDestinationWidth;
- (void)configControlHeader:(hwConfigurationUnits_t *)a3;
- (void)dealloc;
- (void)digitalZoomSelectControl_V1:(id *)a3;
- (void)digitalZoomSelectControl_V2:(hwConfigurationUnits_t *)a3;
- (void)printAseMeasurementOutput:(id *)a3;
- (void)processPixelWithInput:(id *)a3 Output:(id *)a4;
- (void)processPixelWithInput:(id *)a3 controlUnit:(hwConfigurationUnits_t *)a4;
- (void)processPixelWithInput_V1:(id *)a3 Output:(id *)a4;
- (void)processPixelWithInput_V2:(id *)a3 Output:(hwConfigurationUnits_t *)a4;
- (void)processPixelWithMeasurement_V1:(id *)a3 pixelControl:(id *)a4;
- (void)processPixelWithMeasurement_V2:(id *)a3 Output:(hwConfigurationUnits_t *)a4;
- (void)processPixelWithPixelControl_V1:(id *)a3;
- (void)processPixelWithPixelControl_V2:(hwConfigurationUnits_t *)a3;
- (void)setDestinationHeight:(unsigned int)a3;
- (void)setDestinationWidth:(unsigned int)a3;
- (void)setEnhancementStrength:(float)a3;
@end

@implementation ASEProcessingT0

- (ASEProcessingT0)initWithConfig:(id *)a3 aseProcessing:(id)a4 productType:(unsigned int)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[ASEProcessingT0 initWithConfig:aseProcessing:productType:]";
    __int16 v30 = 2048;
    v31 = (void *)a3;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] ++ %s : config=%p\n", buf, 0x16u);
  }
  if (a3)
  {
    v25.receiver = self;
    v25.super_class = (Class)ASEProcessingT0;
    v9 = [(ASEProcessingT0 *)&v25 init];
    self = v9;
    if (v9)
    {
      *(void *)&v9->_aseProcessingType = 0x50000000000;
      v9->_inputHeight = 720;
      [v8 enhancementStrength];
      self->_enhancementStrength = v10;
      self->_destinationWidth = [v8 destinationWidth];
      self->_destinationHeight = [v8 destinationHeight];
      int var0 = a3->var0;
      self->_asePlatform = 1668903027;
      self->_aseProcessingVersion = var0;
      *(void *)entry = 0;
      CFTypeRef cf = 0;
      int ServiceObject = IOSurfaceAcceleratorCreate();
      if (!ServiceObject)
      {
        int ServiceObject = IOSurfaceAcceleratorGetServiceObject();
        if (!ServiceObject)
        {
          v13 = (void *)IORegistryEntrySearchCFProperty(entry[1], "IOService", @"IOSurfaceAcceleratorCapabilitiesDict", 0, 0);
          if (v13)
          {
            id v14 = v13;
            v15 = [v14 objectForKeyedSubscript:@"IOSurfaceAcceleratorASEApiVersion"];
            int ServiceObject = [v15 intValue];
            CFRelease(v14);
          }
          else
          {
            int ServiceObject = -536870212;
          }
        }
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "int getASECapability(void)";
        __int16 v30 = 1024;
        LODWORD(v31) = ServiceObject;
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] ++ %s: ASEApiVer=%d\n", buf, 0x12u);
      }
      if (cf) {
        CFRelease(cf);
      }
      if (ServiceObject == 2) {
        unsigned int v16 = 1668903028;
      }
      else {
        unsigned int v16 = 1668903027;
      }
      self->_asePlatform = v16;
      self->_productType = a5;
      if (!isT1OrNewer(a5))
      {
        self->_aseFrameProcessing = ($56E896B721E08EE347CBB8E98692D164 *)malloc_type_malloc(0x8E0uLL, 0x10000404FD35098uLL);
        self->_aseControlUnit = (hwConfigurationUnits_t *)malloc_type_malloc(0xF70uLL, 0x100004091F9D999uLL);
      }
      self->_aseProcessingType = a3->var1;
      if (a3->var3)
      {
        unsigned int var2 = a3->var2;
        if (var2)
        {
          self->_inputWidth = var2;
          self->_inputHeight = a3->var3;
        }
      }
      *(void *)&self->_noiseMeterStepSize = 0x100000004;
      *(void *)&self->_FG_count = 0;
      *(void *)&self->_prev_H1_7 = 0;
      self->_prev_ratio_2D_1D = 0;
      v18 = (OS_dispatch_queue *)dispatch_queue_create("ASE Schedule Queue", 0);
      scheduleQueue = self->_scheduleQueue;
      self->_scheduleQueue = v18;

      v20 = (OS_dispatch_queue *)dispatch_queue_create("ASE Completion Queue", 0);
      completionQueue = self->_completionQueue;
      self->_completionQueue = v20;

      v22 = (OS_dispatch_semaphore *)dispatch_semaphore_create(3);
      scheduleSemaphone = self->_scheduleSemaphone;
      self->_scheduleSemaphone = v22;

      self->_numberOfRequestedFrames = 0;
      self->_numberOfScheduledFrames = 0;
      self->_numberOfProcessedFrames = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"((void *)0) == config\" failed in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT0.m\" at line 64 goto EXIT\n", buf, 2u);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[ASEProcessingT0 initWithConfig:aseProcessing:productType:]";
      __int16 v30 = 2048;
      v31 = 0;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] %s : config=%p", buf, 0x16u);
    }
  }
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[ASEProcessingT0 initWithConfig:aseProcessing:productType:]";
    __int16 v30 = 2048;
    v31 = self;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] -- %s : instance=%p\n", buf, 0x16u);
  }

  return self;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  aseFrameProcessing = self->_aseFrameProcessing;
  if (aseFrameProcessing)
  {
    free(aseFrameProcessing);
    self->_aseFrameProcessing = 0;
  }
  aseControlUnit = self->_aseControlUnit;
  if (aseControlUnit)
  {
    free(aseControlUnit);
    self->_aseControlUnit = 0;
  }
  scheduleQueue = self->_scheduleQueue;
  self->_scheduleQueue = 0;

  completionQueue = self->_completionQueue;
  self->_completionQueue = 0;

  scheduleSemaphone = self->_scheduleSemaphone;
  self->_scheduleSemaphone = 0;

  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    float v10 = "-[ASEProcessingT0 dealloc]";
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s \n", buf, 0xCu);
  }
  v8.receiver = self;
  v8.super_class = (Class)ASEProcessingT0;
  [(ASEProcessingT0 *)&v8 dealloc];
}

- (float)getEnhancementStrength
{
  return self->_enhancementStrength;
}

- (void)setEnhancementStrength:(float)a3
{
  self->_enhancementStrength = a3;
}

- (unsigned)getDestinationWidth
{
  return self->_destinationWidth;
}

- (void)setDestinationWidth:(unsigned int)a3
{
  self->_destinationWidth = a3;
}

- (unsigned)getDestinationHeight
{
  return self->_destinationHeight;
}

- (void)setDestinationHeight:(unsigned int)a3
{
  self->_destinationHeight = a3;
}

- (int64_t)processFrameWithInput:(id *)a3 Output:(id *)a4
{
  v22[49] = *MEMORY[0x263EF8340];
  if (logLevel >= 4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v22[0]) = 136315650;
      *(void *)((char *)v22 + 4) = "-[ASEProcessingT0 processFrameWithInput:Output:]";
      WORD2(v22[1]) = 2048;
      *(void *)((char *)&v22[1] + 6) = a3;
      HIWORD(v22[2]) = 2048;
      v22[3] = a4;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : aseMeasurementOutput=%p, aseFrameProcessingControl=%p\n", (uint8_t *)v22, 0x20u);
    }
    if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int aseProcessingType = self->_aseProcessingType;
      objc_super v8 = getASEProcessingType(aseProcessingType);
      unsigned int inputWidth = self->_inputWidth;
      unsigned int inputHeight = self->_inputHeight;
      double enhancementStrength = self->_enhancementStrength;
      LODWORD(v22[0]) = 136316418;
      *(void *)((char *)v22 + 4) = "-[ASEProcessingT0 processFrameWithInput:Output:]";
      WORD2(v22[1]) = 1024;
      *(_DWORD *)((char *)&v22[1] + 6) = aseProcessingType;
      WORD1(v22[2]) = 2080;
      *(void *)((char *)&v22[2] + 4) = v8;
      WORD2(v22[3]) = 1024;
      *(_DWORD *)((char *)&v22[3] + 6) = inputWidth;
      WORD1(v22[4]) = 1024;
      HIDWORD(v22[4]) = inputHeight;
      LOWORD(v22[5]) = 2048;
      *(double *)((char *)&v22[5] + 2) = enhancementStrength;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s : aseProcessingType=%d [%s], width=%d, height=%d, strength=%f\n", (uint8_t *)v22, 0x32u);
    }
  }
  if (self->_aseProcessingType - 9 <= 0xFFFFFFF7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22[0]) = 0;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"_aseProcessingType < kASEProcessingTypeLivePhoto || _aseProcessingType > kASEProcessingTypeEnhanceOnly\" failed in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT0.m\" at line 196 goto EXIT\n", (uint8_t *)v22, 2u);
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    double v12 = self->_enhancementStrength;
    unsigned int v13 = self->_aseProcessingType;
    unsigned int v14 = self->_inputWidth;
    unsigned int v15 = self->_inputHeight;
    LODWORD(v22[0]) = 136316162;
    *(void *)((char *)v22 + 4) = "-[ASEProcessingT0 processFrameWithInput:Output:]";
    WORD2(v22[1]) = 1024;
    *(_DWORD *)((char *)&v22[1] + 6) = v13;
    WORD1(v22[2]) = 2048;
    *(double *)((char *)&v22[2] + 4) = v12;
    WORD2(v22[3]) = 1024;
    *(_DWORD *)((char *)&v22[3] + 6) = v14;
    WORD1(v22[4]) = 1024;
    HIDWORD(v22[4]) = v15;
    unsigned int v16 = &_os_log_internal;
    v17 = " [1.37.0] %s : unknownProcessingType=%d, strength=%f, wxh=%dx%d";
    uint32_t v18 = 40;
    goto LABEL_18;
  }
  if (!a4)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
LABEL_19:
      int64_t v20 = -18002;
      goto LABEL_20;
    }
    LODWORD(v22[0]) = 136315650;
    *(void *)((char *)v22 + 4) = "-[ASEProcessingT0 processFrameWithInput:Output:]";
    WORD2(v22[1]) = 2048;
    *(void *)((char *)&v22[1] + 6) = a3;
    HIWORD(v22[2]) = 2048;
    v22[3] = 0;
    unsigned int v16 = &_os_log_internal;
    v17 = " [1.37.0] %s : aseMeasurementOutput=%p, aseFrameProcessingControl=%p";
    uint32_t v18 = 32;
LABEL_18:
    _os_log_impl(&dword_2107A5000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)v22, v18);
    goto LABEL_19;
  }
  *(void *)((char *)&v22[46] + 4) = 0;
  *(_OWORD *)((char *)&v22[42] + 4) = 0u;
  *(_OWORD *)((char *)&v22[44] + 4) = 0u;
  *(_OWORD *)((char *)&v22[38] + 4) = 0u;
  *(_OWORD *)((char *)&v22[40] + 4) = 0u;
  *(_OWORD *)((char *)&v22[34] + 4) = 0u;
  *(_OWORD *)((char *)&v22[36] + 4) = 0u;
  *(_OWORD *)((char *)&v22[32] + 4) = 0u;
  *(_OWORD *)((char *)&v22[30] + 4) = 0u;
  *(_OWORD *)((char *)&v22[28] + 4) = 0u;
  *(_OWORD *)((char *)&v22[26] + 4) = 0u;
  *(_OWORD *)((char *)&v22[24] + 4) = 0u;
  *(_OWORD *)((char *)&v22[22] + 4) = 0u;
  *(_OWORD *)((char *)&v22[20] + 4) = 0u;
  *(_OWORD *)((char *)&v22[18] + 4) = 0u;
  *(_OWORD *)((char *)&v22[16] + 4) = 0u;
  *(_OWORD *)((char *)&v22[14] + 4) = 0u;
  *(_OWORD *)((char *)&v22[12] + 4) = 0u;
  *(_OWORD *)((char *)&v22[10] + 4) = 0u;
  *(_OWORD *)((char *)&v22[8] + 4) = 0u;
  *(_OWORD *)((char *)&v22[6] + 4) = 0u;
  *(_OWORD *)((char *)&v22[4] + 4) = 0u;
  *(_OWORD *)((char *)&v22[2] + 4) = 0u;
  *(_OWORD *)((char *)v22 + 4) = 0u;
  LODWORD(v22[0]) = 1;
  if (a3) {
    memcpy(v22, a3, 0x17CuLL);
  }
  v19 = &self->_aseFrameProcessing[self->_numberOfRequestedFrames & 3];
  bzero(v19, 0x238uLL);
  ++self->_numberOfRequestedFrames;
  [(ASEProcessingT0 *)self processPixelWithInput:v22 Output:v19];
  memcpy(a4, v19, sizeof($56E896B721E08EE347CBB8E98692D164));
  ++self->_numberOfProcessedFrames;
  int64_t v20 = -18000;
LABEL_20:
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v22[0]) = 136315394;
    *(void *)((char *)v22 + 4) = "-[ASEProcessingT0 processFrameWithInput:Output:]";
    WORD2(v22[1]) = 2048;
    *(void *)((char *)&v22[1] + 6) = v20;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] -- %s : retVal=%ld\n", (uint8_t *)v22, 0x16u);
  }
  return v20;
}

- (int64_t)processFrameWithInput:(id *)a3 outputData:(id *)a4
{
  v27[49] = *MEMORY[0x263EF8340];
  unsigned int v7 = logLevel;
  if (logLevel >= 4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v27[0]) = 136315650;
      *(void *)((char *)v27 + 4) = "-[ASEProcessingT0 processFrameWithInput:outputData:]";
      WORD2(v27[1]) = 2048;
      *(void *)((char *)&v27[1] + 6) = a3;
      HIWORD(v27[2]) = 2048;
      v27[3] = a4;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : aseMeasurementOutput=%p, aseFrameProcessingControl=%p\n", (uint8_t *)v27, 0x20u);
    }
    unsigned int v7 = logLevel;
  }
  if (v7 >= 2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int aseProcessingType = self->_aseProcessingType;
      v9 = getASEProcessingType(aseProcessingType);
      unsigned int inputWidth = self->_inputWidth;
      unsigned int inputHeight = self->_inputHeight;
      double enhancementStrength = self->_enhancementStrength;
      unsigned int destinationWidth = self->_destinationWidth;
      unsigned int destinationHeight = self->_destinationHeight;
      LODWORD(v27[0]) = 136316930;
      *(void *)((char *)v27 + 4) = "-[ASEProcessingT0 processFrameWithInput:outputData:]";
      WORD2(v27[1]) = 1024;
      *(_DWORD *)((char *)&v27[1] + 6) = aseProcessingType;
      WORD1(v27[2]) = 2080;
      *(void *)((char *)&v27[2] + 4) = v9;
      WORD2(v27[3]) = 1024;
      *(_DWORD *)((char *)&v27[3] + 6) = inputWidth;
      WORD1(v27[4]) = 1024;
      HIDWORD(v27[4]) = inputHeight;
      LOWORD(v27[5]) = 2048;
      *(double *)((char *)&v27[5] + 2) = enhancementStrength;
      WORD1(v27[6]) = 1024;
      HIDWORD(v27[6]) = destinationWidth;
      LOWORD(v27[7]) = 1024;
      *(_DWORD *)((char *)&v27[7] + 2) = destinationHeight;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s : aseProcessingType=%d [%s], width=%d, height=%d, strength=%f, destinationWidth=%d, destinationHeight=%d\n", (uint8_t *)v27, 0x3Eu);
    }
    if (logLevel >= 2) {
      +[ASEProcessing shouldEnhanceWidth:self->_inputWidth height:self->_inputHeight destinationWidth:self->_destinationWidth destinationHeight:self->_destinationHeight];
    }
  }
  if (self->_aseProcessingType - 9 <= 0xFFFFFFF7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27[0]) = 0;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"_aseProcessingType < kASEProcessingTypeLivePhoto || _aseProcessingType > kASEProcessingTypeEnhanceOnly\" failed in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT0.m\" at line 248 goto EXIT\n", (uint8_t *)v27, 2u);
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    double v15 = self->_enhancementStrength;
    unsigned int v16 = self->_aseProcessingType;
    unsigned int v17 = self->_inputWidth;
    unsigned int v18 = self->_inputHeight;
    LODWORD(v27[0]) = 136316162;
    *(void *)((char *)v27 + 4) = "-[ASEProcessingT0 processFrameWithInput:outputData:]";
    WORD2(v27[1]) = 1024;
    *(_DWORD *)((char *)&v27[1] + 6) = v16;
    WORD1(v27[2]) = 2048;
    *(double *)((char *)&v27[2] + 4) = v15;
    WORD2(v27[3]) = 1024;
    *(_DWORD *)((char *)&v27[3] + 6) = v17;
    WORD1(v27[4]) = 1024;
    HIDWORD(v27[4]) = v18;
    v19 = &_os_log_internal;
    int64_t v20 = " [1.37.0] %s : unknownProcessingType=%d, strength=%f, wxh=%dx%d";
    uint32_t v21 = 40;
    goto LABEL_21;
  }
  if (!a4)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
LABEL_22:
      int64_t v24 = -18002;
      goto LABEL_23;
    }
    LODWORD(v27[0]) = 136315650;
    *(void *)((char *)v27 + 4) = "-[ASEProcessingT0 processFrameWithInput:outputData:]";
    WORD2(v27[1]) = 2048;
    *(void *)((char *)&v27[1] + 6) = a3;
    HIWORD(v27[2]) = 2048;
    v27[3] = 0;
    v19 = &_os_log_internal;
    int64_t v20 = " [1.37.0] %s : aseMeasurementOutput=%p, aseFrameProcessingControl=%p";
    uint32_t v21 = 32;
LABEL_21:
    _os_log_impl(&dword_2107A5000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)v27, v21);
    goto LABEL_22;
  }
  *(void *)((char *)&v27[46] + 4) = 0;
  *(_OWORD *)((char *)&v27[42] + 4) = 0u;
  *(_OWORD *)((char *)&v27[44] + 4) = 0u;
  *(_OWORD *)((char *)&v27[38] + 4) = 0u;
  *(_OWORD *)((char *)&v27[40] + 4) = 0u;
  *(_OWORD *)((char *)&v27[34] + 4) = 0u;
  *(_OWORD *)((char *)&v27[36] + 4) = 0u;
  *(_OWORD *)((char *)&v27[32] + 4) = 0u;
  *(_OWORD *)((char *)&v27[30] + 4) = 0u;
  *(_OWORD *)((char *)&v27[28] + 4) = 0u;
  *(_OWORD *)((char *)&v27[26] + 4) = 0u;
  *(_OWORD *)((char *)&v27[24] + 4) = 0u;
  *(_OWORD *)((char *)&v27[22] + 4) = 0u;
  *(_OWORD *)((char *)&v27[20] + 4) = 0u;
  *(_OWORD *)((char *)&v27[18] + 4) = 0u;
  *(_OWORD *)((char *)&v27[16] + 4) = 0u;
  *(_OWORD *)((char *)&v27[14] + 4) = 0u;
  *(_OWORD *)((char *)&v27[12] + 4) = 0u;
  *(_OWORD *)((char *)&v27[10] + 4) = 0u;
  *(_OWORD *)((char *)&v27[8] + 4) = 0u;
  *(_OWORD *)((char *)&v27[6] + 4) = 0u;
  *(_OWORD *)((char *)&v27[4] + 4) = 0u;
  *(_OWORD *)((char *)&v27[2] + 4) = 0u;
  *(_OWORD *)((char *)v27 + 4) = 0u;
  LODWORD(v27[0]) = 1;
  if (a3) {
    memcpy(v27, a3, 0x17CuLL);
  }
  v22 = &self->_aseControlUnit[self->_numberOfRequestedFrames & 3];
  bzero(v22, 0x3DCuLL);
  ++self->_numberOfRequestedFrames;
  [(ASEProcessingT0 *)self processPixelWithInput:v27 controlUnit:v22];
  id v23 = [MEMORY[0x263EFF8F8] dataWithBytes:v22 length:988];
  *a4 = v23;
  ++self->_numberOfProcessedFrames;

  int64_t v24 = -18000;
LABEL_23:
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t numberOfProcessedFrames = self->_numberOfProcessedFrames;
    LODWORD(v27[0]) = 136315650;
    *(void *)((char *)v27 + 4) = "-[ASEProcessingT0 processFrameWithInput:outputData:]";
    WORD2(v27[1]) = 2048;
    *(void *)((char *)&v27[1] + 6) = numberOfProcessedFrames;
    HIWORD(v27[2]) = 2048;
    v27[3] = v24;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] -- %s : frame=%ld, retVal=%ld\n", (uint8_t *)v27, 0x20u);
  }
  return v24;
}

- (int64_t)processFrameWithInput:(id *)a3 callback:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = (void *)MEMORY[0x216672F60](v6);
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ASEProcessingT0 processFrameWithInput:callback:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = v7;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : aseMeasurementOutput=%p, completionCallback=%p\n", buf, 0x20u);
  }
  if (v6)
  {
    memset(buf, 0, sizeof(buf));
    if (a3)
    {
      unsigned int var0 = a3->var0;
      memcpy(buf, &a3->var1, sizeof(buf));
    }
    else
    {
      unsigned int var0 = 1;
    }
    float v10 = (void *)MEMORY[0x216672F60](v6);
    ++self->_numberOfRequestedFrames;
    scheduleQueue = self->_scheduleQueue;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __50__ASEProcessingT0_processFrameWithInput_callback___block_invoke;
    v14[3] = &unk_2641390B0;
    v14[4] = self;
    unsigned int v16 = var0;
    memcpy(v17, buf, sizeof(v17));
    id v15 = v10;
    id v12 = v10;
    dispatch_async(scheduleQueue, v14);

    int64_t v9 = -18000;
  }
  else
  {
    int64_t v9 = -18002;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[ASEProcessingT0 processFrameWithInput:callback:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = -18002;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = a3;
      *(_WORD *)&buf[32] = 2048;
      *(void *)&buf[34] = 0;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] %s : bad argument, retVal=%ld, aseMeasurementOutput=%p, completionCallback=%p\n", buf, 0x2Au);
    }
  }
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ASEProcessingT0 processFrameWithInput:callback:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] -- %s : retVal=%ld\n", buf, 0x16u);
  }

  return v9;
}

void __50__ASEProcessingT0_processFrameWithInput_callback___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 72), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 128) + 568 * ((*(void *)(v2 + 16))++ & 3);
  [*(id *)(a1 + 32) processPixelWithInput:a1 + 48 Output:v3];
  ++*(void *)(*(void *)(a1 + 32) + 24);
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__ASEProcessingT0_processFrameWithInput_callback___block_invoke_2;
  v5[3] = &unk_264139088;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = v3;
  dispatch_async(v4, v5);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 72));
}

uint64_t __50__ASEProcessingT0_processFrameWithInput_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)processPixelWithInput:(id *)a3 Output:(id *)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    uint64_t v8 = (uint64_t)"-[ASEProcessingT0 processPixelWithInput:Output:]";
    __int16 v9 = 2048;
    float v10 = a3;
    __int16 v11 = 2048;
    id v12 = a4;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : aseMeasurementOutput=%p, aseFrameProcessingControl=%p\n", (uint8_t *)&v7, 0x20u);
  }
  a4->var0.var0.unsigned int var0 = self->_aseProcessingVersion;
  [(ASEProcessingT0 *)self processPixelWithInput_V1:a3 Output:a4];
  a4->var0.var0.var1 = 556;
  if (logLevel >= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = 556;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] aseFrameProcessingControl->control.size (V1) is %lu\n", (uint8_t *)&v7, 0xCu);
    }
    if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      uint64_t v8 = (uint64_t)"-[ASEProcessingT0 processPixelWithInput:Output:]";
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s \n", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)processPixelWithInput:(id *)a3 controlUnit:(hwConfigurationUnits_t *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315650;
    *(void *)id v15 = "-[ASEProcessingT0 processPixelWithInput:controlUnit:]";
    *(_WORD *)&v15[8] = 2048;
    unsigned int v16 = a3;
    __int16 v17 = 2048;
    unsigned int v18 = a4;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : aseMeasurementOutput=%p, aseControlUnit=%p\n", (uint8_t *)&v14, 0x20u);
  }
  a4->var2.var0.var0.var0.unsigned int var0 = self->_aseProcessingVersion;
  a4->var2.var0.var0.var0.unsigned int var1 = 556;
  a4->unsigned int var1 = (MSRHcuEntryHeader_t)0x2386672616DLL;
  unsigned int asePlatform = self->_asePlatform;
  if (asePlatform == 1668903028)
  {
    [(ASEProcessingT0 *)self processPixelWithInput_V2:a3 Output:a4];
    a4->unsigned int var0 = (MSRHcuHeader_t)0x3AC00000005;
    if (logLevel < 3) {
      return;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    unsigned int var0 = a4->var0.var0;
    unsigned int var1 = a4->var0.var1;
    int v14 = 67109376;
    *(_DWORD *)id v15 = var0;
    *(_WORD *)&v15[4] = 1024;
    *(_DWORD *)&v15[6] = var1;
    uint64_t v8 = &_os_log_internal;
    __int16 v9 = " [1.37.0] aseControlUnit->hcuCount %d, aseControlUnit->hcuSize %d, \n";
    uint32_t v10 = 14;
    goto LABEL_15;
  }
  if (asePlatform == 1668903027)
  {
    -[ASEProcessingT0 processPixelWithInput_V1:Output:](self, "processPixelWithInput_V1:Output:", a3);
    a4->unsigned int var0 = (MSRHcuHeader_t)0x23800000001;
    if (logLevel < 3) {
      return;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    int v14 = 134217984;
    *(void *)id v15 = 556;
    uint64_t v8 = &_os_log_internal;
    __int16 v9 = " [1.37.0] aseFrameProcessingControl->control.size (V1) is %lu\n";
    uint32_t v10 = 12;
    goto LABEL_15;
  }
  if (logLevel < 3) {
    return;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = self->_asePlatform;
    int v14 = 67109120;
    *(_DWORD *)id v15 = v13;
    uint64_t v8 = &_os_log_internal;
    __int16 v9 = " [1.37.0] ERROR: Not supported, _asePlatform = %d\n";
    uint32_t v10 = 8;
LABEL_15:
    _os_log_impl(&dword_2107A5000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v10);
  }
LABEL_16:
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    *(void *)id v15 = "-[ASEProcessingT0 processPixelWithInput:controlUnit:]";
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s \n", (uint8_t *)&v14, 0xCu);
  }
}

- (void)processPixelWithInput_V1:(id *)a3 Output:(id *)a4
{
  unsigned int aseProcessingType = self->_aseProcessingType;
  if (aseProcessingType > 7) {
    goto LABEL_10;
  }
  int v5 = 1 << aseProcessingType;
  if ((v5 & 0xE6) != 0)
  {
    a4->var0.var0.unsigned int var2 = 0;
    [(ASEProcessingT0 *)self processPixelWithPixelControl_V1:&a4->var0.var0.var3];
    return;
  }
  if ((v5 & 0x18) == 0) {
LABEL_10:
  }
    -[ASEProcessingT0 processPixelWithInput_V1:Output:]();
  a4->var0.var0.unsigned int var2 = 1;
  p_var3 = &a4->var0.var0.var3;
  [(ASEProcessingT0 *)self processPixelWithMeasurement_V1:a3 pixelControl:p_var3];
}

- (void)processPixelWithPixelControl_V1:(id *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    __int16 v9 = "-[ASEProcessingT0 processPixelWithPixelControl_V1:]";
    __int16 v10 = 2048;
    __int16 v11 = a3;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : pixelControl=%p\n", (uint8_t *)&v8, 0x16u);
  }
  switch(self->_aseProcessingType)
  {
    case 1u:
      id v6 = &FixedSettingLivePhoto;
      goto LABEL_7;
    case 2u:
      float enhancementStrength = self->_enhancementStrength;
      LODWORD(v3) = 1.0;
      if (enhancementStrength > 1.0 || (double v3 = 0.0, enhancementStrength < 0.0)) {
        self->_float enhancementStrength = *(float *)&v3;
      }
      -[ASEProcessingT0 digitalZoomSelectControl_V1:](self, "digitalZoomSelectControl_V1:", a3, v3);
      goto LABEL_8;
    case 5u:
    case 6u:
    case 7u:
      id v6 = &FixedSettingGraphics;
LABEL_7:
      memcpy(a3, v6, sizeof($893F7654C3BDFA9CF242F846BC62AD68));
LABEL_8:
      if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        __int16 v9 = "-[ASEProcessingT0 processPixelWithPixelControl_V1:]";
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s \n", (uint8_t *)&v8, 0xCu);
      }
      return;
    default:
      -[ASEProcessingT0 processPixelWithPixelControl_V1:]();
  }
}

- (void)digitalZoomSelectControl_V1:(id *)a3
{
  float enhancementStrength = self->_enhancementStrength;
  if (enhancementStrength == 0.0)
  {
    v4 = &FixedSettingDigitalZoom_NoEnh;
  }
  else
  {
    double v5 = enhancementStrength;
    if (v5 <= 0.051)
    {
      v4 = &FixedSettingDigitalZoom_weak00;
    }
    else if (v5 <= 0.101)
    {
      v4 = &FixedSettingDigitalZoom_weak01;
    }
    else if (v5 <= 0.151)
    {
      v4 = &FixedSettingDigitalZoom_weak02;
    }
    else if (v5 <= 0.201)
    {
      v4 = &FixedSettingDigitalZoom_weak05;
    }
    else if (v5 <= 0.251)
    {
      v4 = &FixedSettingDigitalZoom_weak08;
    }
    else if (v5 <= 0.301)
    {
      v4 = &FixedSettingDigitalZoom_weak10;
    }
    else if (v5 <= 0.351)
    {
      v4 = &FixedSettingDigitalZoom_weak12;
    }
    else if (v5 <= 0.401)
    {
      v4 = &FixedSettingDigitalZoom_weak15;
    }
    else if (v5 <= 0.451)
    {
      v4 = &FixedSettingDigitalZoom_weak18;
    }
    else if (v5 <= 0.501)
    {
      v4 = &FixedSettingDigitalZoom;
    }
    else if (v5 <= 0.551)
    {
      v4 = &FixedSettingDigitalZoom_strong02;
    }
    else if (v5 <= 0.601)
    {
      v4 = &FixedSettingDigitalZoom_strong05;
    }
    else if (v5 <= 0.651)
    {
      v4 = &FixedSettingDigitalZoom_strong06;
    }
    else if (v5 <= 0.701)
    {
      v4 = &FixedSettingDigitalZoom_strong08;
    }
    else if (v5 <= 0.751)
    {
      v4 = &FixedSettingDigitalZoom_strong10;
    }
    else if (v5 <= 0.801)
    {
      v4 = &FixedSettingDigitalZoom_strong12;
    }
    else if (v5 <= 0.851)
    {
      v4 = &FixedSettingDigitalZoom_strong15;
    }
    else if (v5 <= 0.901)
    {
      v4 = &FixedSettingDigitalZoom_strong18;
    }
    else if (v5 <= 0.951)
    {
      v4 = &FixedSettingDigitalZoom_strong2;
    }
    else
    {
      v4 = &FixedSettingDigitalZoom_FullEnh;
    }
  }
  memcpy(a3, v4, sizeof($893F7654C3BDFA9CF242F846BC62AD68));
}

- (void)processPixelWithMeasurement_V1:(id *)a3 pixelControl:(id *)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v10 = "-[ASEProcessingT0 processPixelWithMeasurement_V1:pixelControl:]";
    __int16 v11 = 2048;
    *(void *)uint64_t v12 = a3;
    *(_WORD *)&v12[8] = 2048;
    unsigned int v13 = a4;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : aseMeasurementOutput=%p, pixelControl=%p\n", buf, 0x20u);
  }
  [(ASEProcessingT0 *)self printAseMeasurementOutput:a3];
  calculate_control_setting_V1((int *)a3, (char *)&a4->var0, self->_inputWidth, self->_inputHeight, self->_numberOfProcessedFrames, (int *)&self->_noiseMeterStepSize, (int *)&self->_FD_state, (int *)&self->_FG_count, &self->_NFG_count, &self->_prev_H1_7, &self->_prev_V1_7, &self->_prev_ratio_2D_1D, self->_productType);
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int destinationWidth = self->_destinationWidth;
    unsigned int destinationHeight = self->_destinationHeight;
    *(_DWORD *)buf = 136315650;
    __int16 v10 = "-[ASEProcessingT0 processPixelWithMeasurement_V1:pixelControl:]";
    __int16 v11 = 1024;
    *(_DWORD *)uint64_t v12 = destinationWidth;
    *(_WORD *)&v12[4] = 1024;
    *(_DWORD *)&v12[6] = destinationHeight;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s : _destinationWidth =%d, _destinationHeight=%d\n", buf, 0x18u);
  }
}

- (void)processPixelWithInput_V2:(id *)a3 Output:(hwConfigurationUnits_t *)a4
{
  unsigned int aseProcessingType = self->_aseProcessingType;
  if (aseProcessingType > 7) {
    goto LABEL_10;
  }
  int v5 = 1 << aseProcessingType;
  if ((v5 & 0xE6) != 0)
  {
    a4->var2.var0.var0.var0.unsigned int var2 = 0;
    [(ASEProcessingT0 *)self processPixelWithPixelControl_V2:a4];
    return;
  }
  if ((v5 & 0x18) == 0) {
LABEL_10:
  }
    -[ASEProcessingT0 processPixelWithInput_V2:Output:]();
  a4->var2.var0.var0.var0.unsigned int var2 = 1;
  -[ASEProcessingT0 processPixelWithMeasurement_V2:Output:](self, "processPixelWithMeasurement_V2:Output:", a3);
}

- (void)configControlHeader:(hwConfigurationUnits_t *)a3
{
  a3->var3 = (MSRHcuEntryHeader_t)0x46672616ELL;
  a3->var5 = (MSRHcuEntryHeader_t)0x146672616FLL;
  a3->var7 = (MSRHcuEntryHeader_t)0x12066726170;
  a3->var9 = (MSRHcuEntryHeader_t)0x3C66726171;
}

- (void)processPixelWithPixelControl_V2:(hwConfigurationUnits_t *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    __int16 v11 = "-[ASEProcessingT0 processPixelWithPixelControl_V2:]";
    __int16 v12 = 2048;
    unsigned int v13 = a3;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : aseControlUnit=%p\n", (uint8_t *)&v10, 0x16u);
  }
  [(ASEProcessingT0 *)self configControlHeader:a3];
  switch(self->_aseProcessingType)
  {
    case 1u:
      memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingLivePhoto_V2, sizeof(a3->var2.var0.var0.var0.var3));
      a3->var4.unsigned int var0 = 0;
      *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingLivePhoto_V2;
      LODWORD(a3->var6.var0.var4) = dword_267755748;
      memcpy(&a3->var8, &blendLogic_FixedSettingLivePhoto_V2, sizeof(a3->var8));
      p_var10 = &a3->var10;
      int v7 = &objectProtection_FixedSettingLivePhoto_V2;
      goto LABEL_7;
    case 2u:
      float enhancementStrength = self->_enhancementStrength;
      LODWORD(v5) = 1.0;
      if (enhancementStrength > 1.0 || (double v5 = 0.0, enhancementStrength < 0.0)) {
        self->_float enhancementStrength = *(float *)&v5;
      }
      -[ASEProcessingT0 digitalZoomSelectControl_V2:](self, "digitalZoomSelectControl_V2:", a3, v5);
      goto LABEL_8;
    case 5u:
    case 6u:
    case 7u:
      memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingGraphics_V2, sizeof(a3->var2.var0.var0.var0.var3));
      a3->var4.unsigned int var0 = 0;
      *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingGraphics_V2;
      LODWORD(a3->var6.var0.var4) = dword_26775A6B0;
      memcpy(&a3->var8, &blendLogic_FixedSettingGraphics_V2, sizeof(a3->var8));
      p_var10 = &a3->var10;
      int v7 = &objectProtection_FixedSettingGraphics_V2;
LABEL_7:
      long long v8 = v7[1];
      *(_OWORD *)&a3->var10.var0.unsigned int var0 = *v7;
      *(_OWORD *)&a3->var10.var0.var4 = v8;
      *(_OWORD *)&a3->var10.var1.var3 = v7[2];
      *(_OWORD *)&p_var10->var2.unsigned int var1 = *(long long *)((char *)v7 + 44);
LABEL_8:
      if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        __int16 v11 = "-[ASEProcessingT0 processPixelWithPixelControl_V2:]";
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s \n", (uint8_t *)&v10, 0xCu);
      }
      return;
    default:
      -[ASEProcessingT0 processPixelWithPixelControl_V2:]();
  }
}

- (void)digitalZoomSelectControl_V2:(hwConfigurationUnits_t *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    double enhancementStrength = self->_enhancementStrength;
    int v15 = 136315650;
    unsigned int v16 = "-[ASEProcessingT0 digitalZoomSelectControl_V2:]";
    __int16 v17 = 2048;
    unsigned int v18 = a3;
    __int16 v19 = 2048;
    double v20 = enhancementStrength;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : aseControlUnit=%p, strength=%f\n", (uint8_t *)&v15, 0x20u);
  }
  [(ASEProcessingT0 *)self configControlHeader:a3];
  float v6 = self->_enhancementStrength;
  if (v6 == 0.0)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_NoEnh_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_NoEnh_V2;
    LODWORD(a3->var6.var0.var4) = dword_267755AE4;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_NoEnh_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_NoEnh_V2;
LABEL_44:
    long long v13 = v8[1];
    *(_OWORD *)&a3->var10.var0.unsigned int var0 = *v8;
    *(_OWORD *)&a3->var10.var0.var4 = v13;
    *(_OWORD *)&a3->var10.var1.var3 = v8[2];
    *(_OWORD *)&p_var10->var2.unsigned int var1 = *(long long *)((char *)v8 + 44);
    return;
  }
  double v9 = v6;
  if (v9 <= 0.051)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_005_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_005_V2;
    LODWORD(a3->var6.var0.var4) = dword_267755E80;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_005_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_005_V2;
    goto LABEL_44;
  }
  if (v9 <= 0.101)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_010_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_010_V2;
    LODWORD(a3->var6.var0.var4) = dword_26775621C;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_010_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_010_V2;
    goto LABEL_44;
  }
  if (v9 <= 0.151)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_015_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_015_V2;
    LODWORD(a3->var6.var0.var4) = dword_2677565B8;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_015_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_015_V2;
    goto LABEL_44;
  }
  if (v9 <= 0.201)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_020_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_020_V2;
    LODWORD(a3->var6.var0.var4) = dword_267756954;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_020_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_020_V2;
    goto LABEL_44;
  }
  if (v9 <= 0.251)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_025_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_025_V2;
    LODWORD(a3->var6.var0.var4) = dword_267756CF0;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_025_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_025_V2;
    goto LABEL_44;
  }
  if (v9 <= 0.301)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_030_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_030_V2;
    LODWORD(a3->var6.var0.var4) = dword_26775708C;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_030_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_030_V2;
    goto LABEL_44;
  }
  if (v9 <= 0.351)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_035_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_035_V2;
    LODWORD(a3->var6.var0.var4) = dword_267757428;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_035_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_035_V2;
    goto LABEL_44;
  }
  if (v9 <= 0.401)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_040_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_040_V2;
    LODWORD(a3->var6.var0.var4) = dword_2677577C4;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_040_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_040_V2;
    goto LABEL_44;
  }
  if (v9 <= 0.451)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_045_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_045_V2;
    LODWORD(a3->var6.var0.var4) = dword_267757B60;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_045_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_045_V2;
    goto LABEL_44;
  }
  if (v9 <= 0.501)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_050_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_050_V2;
    LODWORD(a3->var6.var0.var4) = dword_267757EFC;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_050_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_050_V2;
    goto LABEL_44;
  }
  if (v9 <= 0.551)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_055_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_055_V2;
    LODWORD(a3->var6.var0.var4) = dword_267758298;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_055_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_055_V2;
    goto LABEL_44;
  }
  if (v9 <= 0.601)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_060_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_060_V2;
    LODWORD(a3->var6.var0.var4) = dword_267758634;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_060_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_060_V2;
    goto LABEL_44;
  }
  if (v9 <= 0.651)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_065_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_065_V2;
    LODWORD(a3->var6.var0.var4) = dword_2677589D0;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_065_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_065_V2;
    goto LABEL_44;
  }
  if (v9 <= 0.701)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_070_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_070_V2;
    LODWORD(a3->var6.var0.var4) = dword_267758D6C;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_070_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_070_V2;
    goto LABEL_44;
  }
  if (v9 <= 0.751)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_075_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_075_V2;
    LODWORD(a3->var6.var0.var4) = dword_267759108;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_075_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_075_V2;
    goto LABEL_44;
  }
  if (v9 <= 0.801)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_080_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_080_V2;
    LODWORD(a3->var6.var0.var4) = dword_2677594A4;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_080_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_080_V2;
    goto LABEL_44;
  }
  if (v9 <= 0.851)
  {
    memcpy(&a3->var2.var0.var0.var0.var3, &FixedSettingDigitalZoom_085_V2, sizeof(a3->var2.var0.var0.var0.var3));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_085_V2;
    LODWORD(a3->var6.var0.var4) = dword_267759840;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_085_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_085_V2;
    goto LABEL_44;
  }
  p_var3 = &a3->var2.var0.var0.var0.var3;
  if (v9 <= 0.901)
  {
    memcpy(p_var3, &FixedSettingDigitalZoom_090_V2, sizeof($EBF5A85915A922C03E3C2F10C35C43F8));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&a3->var6.var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_090_V2;
    LODWORD(a3->var6.var0.var4) = dword_267759BDC;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_090_V2, sizeof(a3->var8));
    p_var10 = &a3->var10;
    long long v8 = &objectProtection_FixedSettingDigitalZoom_090_V2;
    goto LABEL_44;
  }
  p_var6 = &a3->var6;
  if (v9 <= 0.951)
  {
    memcpy(p_var3, &FixedSettingDigitalZoom_095_V2, sizeof($EBF5A85915A922C03E3C2F10C35C43F8));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&p_var6->var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_095_V2;
    LODWORD(a3->var6.var0.var4) = dword_267759F78;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_095_V2, sizeof(a3->var8));
    __int16 v12 = &objectProtection_FixedSettingDigitalZoom_095_V2;
  }
  else
  {
    memcpy(p_var3, &FixedSettingDigitalZoom_FullEnh_V2, sizeof($EBF5A85915A922C03E3C2F10C35C43F8));
    a3->var4.unsigned int var0 = 0;
    *(_OWORD *)&p_var6->var0.unsigned int var0 = downSample_FixedSettingDigitalZoom_FullEnh_V2;
    LODWORD(a3->var6.var0.var4) = dword_26775A314;
    memcpy(&a3->var8, &blendLogic_FixedSettingDigitalZoom_FullEnh_V2, sizeof(a3->var8));
    __int16 v12 = &objectProtection_FixedSettingDigitalZoom_FullEnh_V2;
  }
  long long v14 = v12[1];
  *(_OWORD *)&a3->var10.var0.unsigned int var0 = *v12;
  *(_OWORD *)&a3->var10.var0.var4 = v14;
  *(_OWORD *)&a3->var10.var1.var3 = v12[2];
  *(_OWORD *)&a3->var10.var2.unsigned int var1 = *(long long *)((char *)v12 + 44);
}

- (void)processPixelWithMeasurement_V2:(id *)a3 Output:(hwConfigurationUnits_t *)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v10 = "-[ASEProcessingT0 processPixelWithMeasurement_V2:Output:]";
    __int16 v11 = 2048;
    *(void *)__int16 v12 = a3;
    *(_WORD *)&v12[8] = 2048;
    long long v13 = a4;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : aseMeasurementOutput=%p, aseControlUnit=%p\n", buf, 0x20u);
  }
  [(ASEProcessingT0 *)self printAseMeasurementOutput:a3];
  [(ASEProcessingT0 *)self configControlHeader:a4];
  calculate_control_setting_V2((int *)a3, (uint64_t)a4, self->_inputWidth, self->_inputHeight, self->_numberOfProcessedFrames, &self->_noiseMeterStepSize, (int *)&self->_FD_state, (int *)&self->_FG_count, &self->_NFG_count, &self->_prev_H1_7, &self->_prev_V1_7, &self->_prev_ratio_2D_1D, self->_productType);
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int destinationWidth = self->_destinationWidth;
    unsigned int destinationHeight = self->_destinationHeight;
    *(_DWORD *)buf = 136315650;
    int v10 = "-[ASEProcessingT0 processPixelWithMeasurement_V2:Output:]";
    __int16 v11 = 1024;
    *(_DWORD *)__int16 v12 = destinationWidth;
    *(_WORD *)&v12[4] = 1024;
    *(_DWORD *)&v12[6] = destinationHeight;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s : _destinationWidth =%d, _destinationHeight=%d\n", buf, 0x18u);
  }
}

- (void)printAseMeasurementOutput:(id *)a3
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  if (logLevel >= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t numberOfProcessedFrames = self->_numberOfProcessedFrames;
      int v101 = 134217984;
      *(void *)v102 = numberOfProcessedFrames;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Frame %ld aseMeasurementOutput:\n", (uint8_t *)&v101, 0xCu);
    }
    if (logLevel >= 3)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int var0 = a3->var0;
        int v101 = 67109120;
        *(_DWORD *)v102 = var0;
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] totalValid = %010d\n", (uint8_t *)&v101, 8u);
      }
      if (logLevel >= 3)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int var1 = a3->var1;
          int v101 = 67109120;
          *(_DWORD *)v102 = var1;
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] totalValidValue = %010d\n", (uint8_t *)&v101, 8u);
        }
        if (logLevel >= 3)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int var2 = a3->var2;
            int v101 = 67109120;
            *(_DWORD *)v102 = var2;
            _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] totalValidActivity = %010d\n", (uint8_t *)&v101, 8u);
          }
          if (logLevel >= 3)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int var3 = a3->var3;
              int v101 = 67109120;
              *(_DWORD *)v102 = var3;
              _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] maxAbsH0 = %010d\n", (uint8_t *)&v101, 8u);
            }
            if (logLevel >= 3)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int var4 = a3->var4;
                int v101 = 67109120;
                *(_DWORD *)v102 = var4;
                _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] maxAbsH1 = %010d\n", (uint8_t *)&v101, 8u);
              }
              if (logLevel >= 3)
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned int var5 = a3->var5;
                  int v101 = 67109120;
                  *(_DWORD *)v102 = var5;
                  _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] maxAbsH2 = %010d\n", (uint8_t *)&v101, 8u);
                }
                if (logLevel >= 3)
                {
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int var6 = a3->var6;
                    int v101 = 67109120;
                    *(_DWORD *)v102 = var6;
                    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] maxAbsV0 = %010d\n", (uint8_t *)&v101, 8u);
                  }
                  if (logLevel >= 3)
                  {
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                    {
                      unsigned int var7 = a3->var7;
                      int v101 = 67109120;
                      *(_DWORD *)v102 = var7;
                      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] maxAbsV1 = %010d\n", (uint8_t *)&v101, 8u);
                    }
                    if (logLevel >= 3)
                    {
                      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                      {
                        unsigned int var8 = a3->var8;
                        int v101 = 67109120;
                        *(_DWORD *)v102 = var8;
                        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] maxAbsV2 = %010d\n", (uint8_t *)&v101, 8u);
                      }
                      if (logLevel >= 3)
                      {
                        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                        {
                          unsigned int var9 = a3->var9;
                          int v101 = 67109120;
                          *(_DWORD *)v102 = var9;
                          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] maxAbsHV0 = %010d\n", (uint8_t *)&v101, 8u);
                        }
                        if (logLevel >= 3)
                        {
                          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                          {
                            unsigned int var10 = a3->var10;
                            int v101 = 67109120;
                            *(_DWORD *)v102 = var10;
                            _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] maxAbsHV1 = %010d\n", (uint8_t *)&v101, 8u);
                          }
                          if (logLevel >= 3)
                          {
                            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                            {
                              unsigned int var11 = a3->var11;
                              int v101 = 67109120;
                              *(_DWORD *)v102 = var11;
                              _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] maxAbsHV2 = %010d\n", (uint8_t *)&v101, 8u);
                            }
                            if (logLevel >= 3)
                            {
                              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                              {
                                unsigned int var12 = a3->var12;
                                int v101 = 67109120;
                                *(_DWORD *)v102 = var12;
                                _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] sumAbsHV0 = %010d\n", (uint8_t *)&v101, 8u);
                              }
                              if (logLevel >= 3)
                              {
                                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                                {
                                  unsigned int var13 = a3->var13;
                                  int v101 = 67109120;
                                  *(_DWORD *)v102 = var13;
                                  _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] sumAbsHV1 = %010d\n", (uint8_t *)&v101, 8u);
                                }
                                if (logLevel >= 3)
                                {
                                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                                  {
                                    unsigned int var14 = a3->var14;
                                    int v101 = 67109120;
                                    *(_DWORD *)v102 = var14;
                                    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] sumAbsHV2 = %010d\n", (uint8_t *)&v101, 8u);
                                  }
                                  if (logLevel >= 3)
                                  {
                                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                                    {
                                      unsigned int v21 = a3->var15[0];
                                      unsigned int v22 = a3->var15[1];
                                      unsigned int v23 = a3->var15[2];
                                      unsigned int v24 = a3->var15[3];
                                      unsigned int v25 = a3->var15[4];
                                      unsigned int v26 = a3->var15[5];
                                      unsigned int v27 = a3->var15[6];
                                      unsigned int v28 = a3->var15[7];
                                      int v101 = 67110912;
                                      *(_DWORD *)v102 = v21;
                                      *(_WORD *)&v102[4] = 1024;
                                      *(_DWORD *)&v102[6] = v22;
                                      __int16 v103 = 1024;
                                      unsigned int v104 = v23;
                                      __int16 v105 = 1024;
                                      unsigned int v106 = v24;
                                      __int16 v107 = 1024;
                                      unsigned int v108 = v25;
                                      __int16 v109 = 1024;
                                      unsigned int v110 = v26;
                                      __int16 v111 = 1024;
                                      unsigned int v112 = v27;
                                      __int16 v113 = 1024;
                                      unsigned int v114 = v28;
                                      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] histOutH1[ 0 -  7] = %010d, %010d, %010d, %010d, %010d, %010d, %010d, %010d\n", (uint8_t *)&v101, 0x32u);
                                    }
                                    if (logLevel >= 3)
                                    {
                                      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                                      {
                                        unsigned int v29 = a3->var16[0];
                                        unsigned int v30 = a3->var16[1];
                                        unsigned int v31 = a3->var16[2];
                                        unsigned int v32 = a3->var16[3];
                                        unsigned int v33 = a3->var16[4];
                                        unsigned int v34 = a3->var16[5];
                                        unsigned int v35 = a3->var16[6];
                                        unsigned int v36 = a3->var16[7];
                                        int v101 = 67110912;
                                        *(_DWORD *)v102 = v29;
                                        *(_WORD *)&v102[4] = 1024;
                                        *(_DWORD *)&v102[6] = v30;
                                        __int16 v103 = 1024;
                                        unsigned int v104 = v31;
                                        __int16 v105 = 1024;
                                        unsigned int v106 = v32;
                                        __int16 v107 = 1024;
                                        unsigned int v108 = v33;
                                        __int16 v109 = 1024;
                                        unsigned int v110 = v34;
                                        __int16 v111 = 1024;
                                        unsigned int v112 = v35;
                                        __int16 v113 = 1024;
                                        unsigned int v114 = v36;
                                        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] histOutH2[ 0 -  7] = %010d, %010d, %010d, %010d, %010d, %010d, %010d, %010d\n", (uint8_t *)&v101, 0x32u);
                                      }
                                      if (logLevel >= 3)
                                      {
                                        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                                        {
                                          unsigned int v37 = a3->var17[0];
                                          unsigned int v38 = a3->var17[1];
                                          unsigned int v39 = a3->var17[2];
                                          unsigned int v40 = a3->var17[3];
                                          unsigned int v41 = a3->var17[4];
                                          unsigned int v42 = a3->var17[5];
                                          unsigned int v43 = a3->var17[6];
                                          unsigned int v44 = a3->var17[7];
                                          int v101 = 67110912;
                                          *(_DWORD *)v102 = v37;
                                          *(_WORD *)&v102[4] = 1024;
                                          *(_DWORD *)&v102[6] = v38;
                                          __int16 v103 = 1024;
                                          unsigned int v104 = v39;
                                          __int16 v105 = 1024;
                                          unsigned int v106 = v40;
                                          __int16 v107 = 1024;
                                          unsigned int v108 = v41;
                                          __int16 v109 = 1024;
                                          unsigned int v110 = v42;
                                          __int16 v111 = 1024;
                                          unsigned int v112 = v43;
                                          __int16 v113 = 1024;
                                          unsigned int v114 = v44;
                                          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] histOutV1[ 0 -  7] = %010d, %010d, %010d, %010d, %010d, %010d, %010d, %010d\n", (uint8_t *)&v101, 0x32u);
                                        }
                                        if (logLevel >= 3)
                                        {
                                          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                                          {
                                            unsigned int v45 = a3->var18[0];
                                            unsigned int v46 = a3->var18[1];
                                            unsigned int v47 = a3->var18[2];
                                            unsigned int v48 = a3->var18[3];
                                            unsigned int v49 = a3->var18[4];
                                            unsigned int v50 = a3->var18[5];
                                            unsigned int v51 = a3->var18[6];
                                            unsigned int v52 = a3->var18[7];
                                            int v101 = 67110912;
                                            *(_DWORD *)v102 = v45;
                                            *(_WORD *)&v102[4] = 1024;
                                            *(_DWORD *)&v102[6] = v46;
                                            __int16 v103 = 1024;
                                            unsigned int v104 = v47;
                                            __int16 v105 = 1024;
                                            unsigned int v106 = v48;
                                            __int16 v107 = 1024;
                                            unsigned int v108 = v49;
                                            __int16 v109 = 1024;
                                            unsigned int v110 = v50;
                                            __int16 v111 = 1024;
                                            unsigned int v112 = v51;
                                            __int16 v113 = 1024;
                                            unsigned int v114 = v52;
                                            _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] histOutV2[ 0 -  7] = %010d, %010d, %010d, %010d, %010d, %010d, %010d, %010d\n", (uint8_t *)&v101, 0x32u);
                                          }
                                          if (logLevel >= 3)
                                          {
                                            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                                            {
                                              unsigned int v53 = a3->var19[0];
                                              unsigned int v54 = a3->var19[1];
                                              unsigned int v55 = a3->var19[2];
                                              unsigned int v56 = a3->var19[3];
                                              unsigned int v57 = a3->var19[4];
                                              unsigned int v58 = a3->var19[5];
                                              unsigned int v59 = a3->var19[6];
                                              unsigned int v60 = a3->var19[7];
                                              int v101 = 67110912;
                                              *(_DWORD *)v102 = v53;
                                              *(_WORD *)&v102[4] = 1024;
                                              *(_DWORD *)&v102[6] = v54;
                                              __int16 v103 = 1024;
                                              unsigned int v104 = v55;
                                              __int16 v105 = 1024;
                                              unsigned int v106 = v56;
                                              __int16 v107 = 1024;
                                              unsigned int v108 = v57;
                                              __int16 v109 = 1024;
                                              unsigned int v110 = v58;
                                              __int16 v111 = 1024;
                                              unsigned int v112 = v59;
                                              __int16 v113 = 1024;
                                              unsigned int v114 = v60;
                                              _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] histOutHV0[0 -  7] = %010d, %010d, %010d, %010d, %010d, %010d, %010d, %010d\n", (uint8_t *)&v101, 0x32u);
                                            }
                                            if (logLevel >= 3)
                                            {
                                              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                                              {
                                                unsigned int v61 = a3->var19[8];
                                                unsigned int v62 = a3->var19[9];
                                                unsigned int v63 = a3->var19[10];
                                                unsigned int v64 = a3->var19[11];
                                                unsigned int v65 = a3->var19[12];
                                                unsigned int v66 = a3->var19[13];
                                                unsigned int v67 = a3->var19[14];
                                                unsigned int v68 = a3->var19[15];
                                                int v101 = 67110912;
                                                *(_DWORD *)v102 = v61;
                                                *(_WORD *)&v102[4] = 1024;
                                                *(_DWORD *)&v102[6] = v62;
                                                __int16 v103 = 1024;
                                                unsigned int v104 = v63;
                                                __int16 v105 = 1024;
                                                unsigned int v106 = v64;
                                                __int16 v107 = 1024;
                                                unsigned int v108 = v65;
                                                __int16 v109 = 1024;
                                                unsigned int v110 = v66;
                                                __int16 v111 = 1024;
                                                unsigned int v112 = v67;
                                                __int16 v113 = 1024;
                                                unsigned int v114 = v68;
                                                _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] histOutHV0[9 - 15] = %010d, %010d, %010d, %010d, %010d, %010d, %010d, %010d\n", (uint8_t *)&v101, 0x32u);
                                              }
                                              if (logLevel >= 3)
                                              {
                                                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                                                {
                                                  unsigned int v69 = a3->var20[0];
                                                  unsigned int v70 = a3->var20[1];
                                                  unsigned int v71 = a3->var20[2];
                                                  unsigned int v72 = a3->var20[3];
                                                  unsigned int v73 = a3->var20[4];
                                                  unsigned int v74 = a3->var20[5];
                                                  unsigned int v75 = a3->var20[6];
                                                  unsigned int v76 = a3->var20[7];
                                                  int v101 = 67110912;
                                                  *(_DWORD *)v102 = v69;
                                                  *(_WORD *)&v102[4] = 1024;
                                                  *(_DWORD *)&v102[6] = v70;
                                                  __int16 v103 = 1024;
                                                  unsigned int v104 = v71;
                                                  __int16 v105 = 1024;
                                                  unsigned int v106 = v72;
                                                  __int16 v107 = 1024;
                                                  unsigned int v108 = v73;
                                                  __int16 v109 = 1024;
                                                  unsigned int v110 = v74;
                                                  __int16 v111 = 1024;
                                                  unsigned int v112 = v75;
                                                  __int16 v113 = 1024;
                                                  unsigned int v114 = v76;
                                                  _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] histOutHV1[0 -  7] = %010d, %010d, %010d, %010d, %010d, %010d, %010d, %010d\n", (uint8_t *)&v101, 0x32u);
                                                }
                                                if (logLevel >= 3)
                                                {
                                                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    unsigned int v77 = a3->var20[8];
                                                    unsigned int v78 = a3->var20[9];
                                                    unsigned int v79 = a3->var20[10];
                                                    unsigned int v80 = a3->var20[11];
                                                    unsigned int v81 = a3->var20[12];
                                                    unsigned int v82 = a3->var20[13];
                                                    unsigned int v83 = a3->var20[14];
                                                    unsigned int v84 = a3->var20[15];
                                                    int v101 = 67110912;
                                                    *(_DWORD *)v102 = v77;
                                                    *(_WORD *)&v102[4] = 1024;
                                                    *(_DWORD *)&v102[6] = v78;
                                                    __int16 v103 = 1024;
                                                    unsigned int v104 = v79;
                                                    __int16 v105 = 1024;
                                                    unsigned int v106 = v80;
                                                    __int16 v107 = 1024;
                                                    unsigned int v108 = v81;
                                                    __int16 v109 = 1024;
                                                    unsigned int v110 = v82;
                                                    __int16 v111 = 1024;
                                                    unsigned int v112 = v83;
                                                    __int16 v113 = 1024;
                                                    unsigned int v114 = v84;
                                                    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] histOutHV1[7 - 15] = %010d, %010d, %010d, %010d, %010d, %010d, %010d, %010d\n", (uint8_t *)&v101, 0x32u);
                                                  }
                                                  if (logLevel >= 3)
                                                  {
                                                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      unsigned int v85 = a3->var21[0];
                                                      unsigned int v86 = a3->var21[1];
                                                      unsigned int v87 = a3->var21[2];
                                                      unsigned int v88 = a3->var21[3];
                                                      unsigned int v89 = a3->var21[4];
                                                      unsigned int v90 = a3->var21[5];
                                                      unsigned int v91 = a3->var21[6];
                                                      unsigned int v92 = a3->var21[7];
                                                      int v101 = 67110912;
                                                      *(_DWORD *)v102 = v85;
                                                      *(_WORD *)&v102[4] = 1024;
                                                      *(_DWORD *)&v102[6] = v86;
                                                      __int16 v103 = 1024;
                                                      unsigned int v104 = v87;
                                                      __int16 v105 = 1024;
                                                      unsigned int v106 = v88;
                                                      __int16 v107 = 1024;
                                                      unsigned int v108 = v89;
                                                      __int16 v109 = 1024;
                                                      unsigned int v110 = v90;
                                                      __int16 v111 = 1024;
                                                      unsigned int v112 = v91;
                                                      __int16 v113 = 1024;
                                                      unsigned int v114 = v92;
                                                      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] histOutHV2[0 -  7] = %010d, %010d, %010d, %010d, %010d, %010d, %010d, %010d\n", (uint8_t *)&v101, 0x32u);
                                                    }
                                                    if (logLevel >= 3
                                                      && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      unsigned int v93 = a3->var21[8];
                                                      unsigned int v94 = a3->var21[9];
                                                      unsigned int v95 = a3->var21[10];
                                                      unsigned int v96 = a3->var21[11];
                                                      unsigned int v97 = a3->var21[12];
                                                      unsigned int v98 = a3->var21[13];
                                                      unsigned int v99 = a3->var21[14];
                                                      unsigned int v100 = a3->var21[15];
                                                      int v101 = 67110912;
                                                      *(_DWORD *)v102 = v93;
                                                      *(_WORD *)&v102[4] = 1024;
                                                      *(_DWORD *)&v102[6] = v94;
                                                      __int16 v103 = 1024;
                                                      unsigned int v104 = v95;
                                                      __int16 v105 = 1024;
                                                      unsigned int v106 = v96;
                                                      __int16 v107 = 1024;
                                                      unsigned int v108 = v97;
                                                      __int16 v109 = 1024;
                                                      unsigned int v110 = v98;
                                                      __int16 v111 = 1024;
                                                      unsigned int v112 = v99;
                                                      __int16 v113 = 1024;
                                                      unsigned int v114 = v100;
                                                      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] histOutHV2[0 - 15] = %010d, %010d, %010d, %010d, %010d, %010d, %010d, %010d\n", (uint8_t *)&v101, 0x32u);
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleSemaphone, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_scheduleQueue, 0);
}

- (void)processPixelWithInput_V1:Output:.cold.1()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
    OUTLINED_FUNCTION_0(&dword_2107A5000, &_os_log_internal, v0, " [1.37.0] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT0.m\" at line 432\n", v1, v2, v3, v4, 0);
  }
  __assert_rtn("-[ASEProcessingT0 processPixelWithInput_V1:Output:]", "ASEProcessingT0.m", 432, "0");
}

- (void)processPixelWithPixelControl_V1:.cold.1()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
    OUTLINED_FUNCTION_0(&dword_2107A5000, &_os_log_internal, v0, " [1.37.0] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT0.m\" at line 466\n", v1, v2, v3, v4, 0);
  }
  __assert_rtn("-[ASEProcessingT0 processPixelWithPixelControl_V1:]", "ASEProcessingT0.m", 466, "0");
}

- (void)processPixelWithInput_V2:Output:.cold.1()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
    OUTLINED_FUNCTION_0(&dword_2107A5000, &_os_log_internal, v0, " [1.37.0] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT0.m\" at line 578\n", v1, v2, v3, v4, 0);
  }
  __assert_rtn("-[ASEProcessingT0 processPixelWithInput_V2:Output:]", "ASEProcessingT0.m", 578, "0");
}

- (void)processPixelWithPixelControl_V2:.cold.1()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
    OUTLINED_FUNCTION_0(&dword_2107A5000, &_os_log_internal, v0, " [1.37.0] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT0.m\" at line 642\n", v1, v2, v3, v4, 0);
  }
  __assert_rtn("-[ASEProcessingT0 processPixelWithPixelControl_V2:]", "ASEProcessingT0.m", 642, "0");
}

@end