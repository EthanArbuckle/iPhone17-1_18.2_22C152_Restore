@interface HDRProcessor
+ (BOOL)isNSDataNonEmpty:(id)a3 dataLength:(unint64_t *)a4 dataBytes:(char *)a5;
+ (id)supportedDestinationColorPropertySets;
+ (id)supportedDestinationPixelFormatTypes;
+ (id)supportedSourceColorPropertySets;
+ (id)supportedSourcePixelFormatTypes;
+ (int64_t)parseHDR10PlusSEI:(id)a3 outputMetadata:(id *)a4;
+ (int64_t)parseHDR10PlusSEIMessage:(id)a3 outputMetadata:(id *)a4;
+ (int64_t)parseHDR10PlusSEIWithInputSurface:(__IOSurface *)a3 outputMetadata:(id *)a4;
+ (void)dolbyIOMFBMetadata:(id *)a3 withFilteredMinPQ:(float)a4 FilteredMaxPQ:(float)a5 FilteredAvgPQ:(float)a6 EnableLevel4:(BOOL)a7 FilteredAvg:(float)a8 FilteredStdDev:(float)a9;
+ (void)dolbyIOMFBMetadata:(id *)a3 withMinBrightness:(float)a4 maxBrightness:(float)a5;
- (BOOL)allocateEngineResources;
- (BOOL)allocateResources;
- (BOOL)allocateSceneLuxB2DItpMLModel;
- (BOOL)applyDoVi81PolicyWithInput:(__IOSurface *)a3 WithRPU:(BOOL)a4;
- (BOOL)hasMetalDeviceChanged:(id)a3;
- (BOOL)isFormatSupported:(unsigned int)a3 inputFormat:(unsigned int)a4 outputFormat:(unsigned int)a5 device:(id)a6;
- (BOOL)isFormatSupportedByDISP:(unsigned int)a3 outputFormat:(unsigned int)a4;
- (BOOL)isFormatSupportedByGPU:(unsigned int)a3 outputFormat:(unsigned int)a4 device:(id)a5;
- (BOOL)isFormatSupportedByMSR:(unsigned int)a3 outputFormat:(unsigned int)a4;
- (HDRProcessor)initWithConfig:(id *)a3;
- (HDRProcessor)initWithDevice:(id)a3 config:(id *)a4;
- (__CFString)targetColorPrimaries;
- (double)targetMinNits;
- (double)targetNits;
- (float)defaultAmbientLightValue;
- (float)defaultContrastRatioValue;
- (float)defaultEDRFactorValue;
- (float)defaultMaxEDRValue;
- (id)getDispHDRProcessing;
- (id)initProcessingEngine:(id)a3 config:(id *)a4;
- (int64_t)ValidateDISPColorConfigInput:(unsigned int)a3 inputSurface:(__IOSurface *)a4;
- (int64_t)ValidateMSRColorConfigInput:(unsigned int)a3 inputSurface:(__IOSurface *)a4 outputSurface:(__IOSurface *)a5;
- (int64_t)checkInputIOSurface:(__IOSurface *)a3 forInfoFrame:(id *)a4 withRPUData:(BOOL)a5;
- (int64_t)checkInputOutputIOSurface:(__IOSurface *)a3 output:(__IOSurface *)a4 tcControl:(ToneCurve_Control *)a5 forInfoFrame:(id *)a6 withRPUData:(BOOL)a7;
- (int64_t)encodeToCommandBuffer:(id)a3 inputSurfaceLayer0:(__IOSurface *)a4 inputSurfacelayer1:(__IOSurface *)a5 outputSurface:(__IOSurface *)a6 metadata:(id)a7;
- (int64_t)extractHEVCHDRParameterFromInputIOSurface:(__IOSurface *)a3 forInfoFrame:(id *)a4;
- (int64_t)generateMSRColorConfigWithOperation:(unsigned int)a3 inputSurface:(__IOSurface *)a4 outputSurface:(__IOSurface *)a5 metadata:(id)a6 histogram:(RgbHistogram_t *)a7 config:(id *)a8;
- (int64_t)iterateDisplayConfigWithType:(int)a3 operation:(unsigned int)a4 inputSurface:(__IOSurface *)a5 options:(id)a6 config:(id)a7;
- (int64_t)processFrameInternalWithLayer0:(__IOSurface *)a3 layer1:(__IOSurface *)a4 outout:(__IOSurface *)a5 metadata:(id)a6 commandbuffer:(id)a7 operation:(unsigned int)a8 config:(id *)a9 histogram:(RgbHistogram_t *)a10 data:(id *)a11;
- (int64_t)processFrameWithLayer0:(__CVBuffer *)a3 layer1:(__CVBuffer *)a4 output:(__CVBuffer *)a5 metadata:(id)a6 commandbuffer:(id)a7 callback:(id)a8;
- (int64_t)processPixelsWithLayer0:(__IOSurface *)a3 layer1:(__IOSurface *)a4 output:(__IOSurface *)a5 metaData:(id *)a6 tcControl:(ToneCurve_Control *)a7 hdrControl:(id *)a8 hdr10InfoFrame:(id *)a9 commandbuffer:(id)a10 frameNumebr:(unint64_t)a11;
- (int64_t)updateDoVi81StateWithRPU:(BOOL)a3 hasHDR10PlusSEIData:(BOOL)a4;
- (unsigned)selectHDRUsage:(unsigned int)a3 withRPU:(BOOL)a4;
- (void)dealloc;
- (void)extractCAMetaData:(id)a3 withRPU:(BOOL)a4;
- (void)extractFrameMetadata:(__CFDictionary *)a3 intoTCControl:(ToneCurve_Control *)a4;
- (void)extractHEVCHDRParameterFromInputIOSurfaceForDovi:(__IOSurface *)a3 forInfoFrame:(id *)a4;
- (void)extractHEVCHDRParameterFromOutputIOSurface:(__IOSurface *)a3;
- (void)getAMVEStrengthValue:(id)a3;
- (void)getAMVEStrengthValueFromIOSurface:(__IOSurface *)a3;
- (void)getAmbientViewingEnvironmentType:(__IOSurface *)a3;
- (void)getDisplayPipelineCompensationType:(id)a3 gamma:(float)a4;
- (void)getSceneIllumination:(__IOSurface *)a3;
- (void)releaseResources;
- (void)setCSCMatrixInHDRControl:(id *)a3 forIndex:(unsigned int)a4;
- (void)setDefaultAmbientLightValue:(float)a3;
- (void)setDefaultContrastRatioValue:(float)a3;
- (void)setDefaultEDRFactorValue:(float)a3;
- (void)setDefaultMaxEDRValue:(float)a3;
- (void)setHDRControl:(id *)a3 withTCControl:(ToneCurve_Control *)a4 withRPU:(BOOL)a5 withMMR:(BOOL)a6 withDmData:(id *)a7 withOperation:(unsigned int)a8;
- (void)setTargetColorPrimaries:(__CFString *)a3;
- (void)setTargetMinNits:(double)a3;
- (void)setTargetNits:(double)a3;
@end

@implementation HDRProcessor

- (BOOL)allocateSceneLuxB2DItpMLModel
{
  v3 = objc_alloc_init(sceneLuxB2DItpMLModel);
  [(DolbyVisionDisplayManagement *)self->_dm initWithModelPointer:v3];

  return 1;
}

- (BOOL)isFormatSupported:(unsigned int)a3 inputFormat:(unsigned int)a4 outputFormat:(unsigned int)a5 device:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  if (a3 == 2)
  {
    BOOL v11 = [(HDRProcessor *)self isFormatSupportedByDISP:v7 outputFormat:v6];
  }
  else if (a3 == 1)
  {
    BOOL v11 = [(HDRProcessor *)self isFormatSupportedByMSR:v7 outputFormat:v6];
  }
  else
  {
    if (a3)
    {
      BOOL v12 = 0;
      goto LABEL_9;
    }
    BOOL v11 = [(HDRProcessor *)self isFormatSupportedByGPU:v7 outputFormat:v6 device:v10];
  }
  BOOL v12 = v11;
LABEL_9:

  return v12;
}

- (BOOL)isFormatSupportedByMSR:(unsigned int)a3 outputFormat:(unsigned int)a4
{
  if (a3)
  {
    int v6 = isSupportedMSRInputFormat(a3, v4);
    if (!a4) {
      return v6;
    }
  }
  else
  {
    int v6 = 1;
    if (!a4) {
      return v6;
    }
  }
  if (v6)
  {
    LOBYTE(v6) = isSupportedMSROutputFormat(a4);
  }
  return v6;
}

- (BOOL)isFormatSupportedByDISP:(unsigned int)a3 outputFormat:(unsigned int)a4
{
  if (a3) {
    return isSupportedMSRInputFormat(a3, v4);
  }
  else {
    return 1;
  }
}

- (BOOL)isFormatSupportedByGPU:(unsigned int)a3 outputFormat:(unsigned int)a4 device:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (v7)
  {
    v9 = [v7 name];
    int v10 = [v9 containsString:@"Apple"];

    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    int v10 = 1;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (v10) {
    int v10 = isSupportedGPUInputFormat(a3, 1);
  }
LABEL_7:
  if (a4)
  {
    if (v10)
    {
      LOBYTE(v10) = 1;
      if (a4 != 1380411457 && a4 != 1815162994) {
        LOBYTE(v10) = a4 == 1919365992;
      }
    }
  }

  return v10;
}

+ (id)supportedSourcePixelFormatTypes
{
  if (qword_26ABE1DC0 != -1) {
    dispatch_once(&qword_26ABE1DC0, &__block_literal_global_0);
  }
  v2 = (void *)_MergedGlobals_3;
  return v2;
}

void __47__HDRProcessor_supportedSourcePixelFormatTypes__block_invoke()
{
  v15[13] = *MEMORY[0x263EF8340];
  v14 = [NSNumber numberWithInt:1380411457];
  v15[0] = v14;
  v13 = [NSNumber numberWithInt:2033463606];
  v15[1] = v13;
  BOOL v12 = [NSNumber numberWithInt:1937126452];
  v15[2] = v12;
  v0 = [NSNumber numberWithInt:2016687156];
  v15[3] = v0;
  v1 = [NSNumber numberWithInt:2019963956];
  v15[4] = v1;
  v2 = [NSNumber numberWithInt:1983000886];
  v15[5] = v2;
  v3 = [NSNumber numberWithInt:1937125938];
  v15[6] = v3;
  int8x16_t v4 = [NSNumber numberWithInt:2016686642];
  v15[7] = v4;
  v5 = [NSNumber numberWithInt:2019963442];
  v15[8] = v5;
  int v6 = [NSNumber numberWithInt:2016686640];
  v15[9] = v6;
  id v7 = [NSNumber numberWithInt:2019963440];
  v15[10] = v7;
  v8 = [NSNumber numberWithInt:875704438];
  v15[11] = v8;
  v9 = [NSNumber numberWithInt:875704422];
  v15[12] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:13];
  BOOL v11 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = v10;
}

+ (id)supportedDestinationPixelFormatTypes
{
  if (qword_26ABE1DD0 != -1) {
    dispatch_once(&qword_26ABE1DD0, &__block_literal_global_39);
  }
  v2 = (void *)qword_26ABE1DC8;
  return v2;
}

void __52__HDRProcessor_supportedDestinationPixelFormatTypes__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v0 = [NSNumber numberWithInt:1380411457];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
  v2 = (void *)qword_26ABE1DC8;
  qword_26ABE1DC8 = v1;
}

+ (id)supportedSourceColorPropertySets
{
  if (qword_26ABE1DE0 != -1) {
    dispatch_once(&qword_26ABE1DE0, &__block_literal_global_41);
  }
  v2 = (void *)qword_26ABE1DD8;
  return v2;
}

void __48__HDRProcessor_supportedSourceColorPropertySets__block_invoke()
{
  v17[2] = *MEMORY[0x263EF8340];
  uint64_t v1 = *MEMORY[0x263F03F00];
  uint64_t v2 = *MEMORY[0x263F03FC0];
  v13[0] = *MEMORY[0x263F03ED8];
  uint64_t v0 = v13[0];
  v13[1] = v2;
  uint64_t v3 = *MEMORY[0x263F03FD0];
  v15[0] = v1;
  v15[1] = v3;
  uint64_t v14 = *MEMORY[0x263F04020];
  uint64_t v4 = v14;
  uint64_t v16 = *MEMORY[0x263F04028];
  uint64_t v5 = v16;
  int v6 = [NSDictionary dictionaryWithObjects:v15 forKeys:v13 count:3];
  v17[0] = v6;
  v11[0] = v0;
  v11[1] = v2;
  uint64_t v7 = *MEMORY[0x263F03FF8];
  v12[0] = v1;
  v12[1] = v7;
  v11[2] = v4;
  v12[2] = v5;
  v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  v17[1] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  uint64_t v10 = (void *)qword_26ABE1DD8;
  qword_26ABE1DD8 = v9;
}

+ (id)supportedDestinationColorPropertySets
{
  if (qword_26ABE1DF0 != -1) {
    dispatch_once(&qword_26ABE1DF0, &__block_literal_global_44);
  }
  uint64_t v2 = (void *)qword_26ABE1DE8;
  return v2;
}

void __53__HDRProcessor_supportedDestinationColorPropertySets__block_invoke()
{
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v1 = *MEMORY[0x263F03F20];
  uint64_t v2 = *MEMORY[0x263F03FC0];
  v11[0] = *MEMORY[0x263F03ED8];
  uint64_t v0 = v11[0];
  v11[1] = v2;
  uint64_t v3 = *MEMORY[0x263F04010];
  v13[0] = v1;
  v13[1] = v3;
  uint64_t v12 = *MEMORY[0x263F04020];
  uint64_t v4 = v12;
  void v13[2] = *MEMORY[0x263F04050];
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v13 forKeys:v11 count:3];
  v14[0] = v5;
  v9[0] = v0;
  v9[1] = v2;
  v10[0] = v1;
  v10[1] = v3;
  v9[2] = v4;
  v10[2] = *MEMORY[0x263F04028];
  int v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  v14[1] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v8 = (void *)qword_26ABE1DE8;
  qword_26ABE1DE8 = v7;
}

- (HDRProcessor)initWithConfig:(id *)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  self->_logOnce = 1;
  v40.receiver = self;
  v40.super_class = (Class)HDRProcessor;
  uint64_t v4 = [(HDRProcessor *)&v40 init];
  id v5 = v4;
  int v6 = v4 + 840760;
  if (!v4) {
    goto LABEL_30;
  }
  long long v7 = *(_OWORD *)&a3->var0;
  long long v8 = *(_OWORD *)&a3->var4;
  *((void *)v4 + 105139) = *(void *)&a3->var6;
  *(_OWORD *)(v4 + 841080) = v7;
  *(_OWORD *)(v4 + 841096) = v8;
  DWORD1(v7) = 1065353216;
  *(_OWORD *)(v4 + 841180) = xmmword_2222D0BE0;
  LODWORD(v7) = *((_DWORD *)v4 + 210273);
  *((double *)v4 + 105150) = (double)(unint64_t)v7;
  *((void *)v4 + 105152) = *((void *)v4 + 105138);
  unsigned int v9 = *((_DWORD *)v4 + 210279);
  *(_DWORD *)int v6 = v9;
  if (v9 >= 3)
  {
    if (enableLogInstance)
    {
      if (*((void *)v4 + 105146)) {
        uint64_t v17 = *((void *)v4 + 105146);
      }
      else {
        uint64_t v17 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v42 = (const char *)WORD1(v17);
        __int16 v43 = 2080;
        v44 = "-[HDRProcessor initWithConfig:]";
        __int16 v45 = 1024;
        LODWORD(v46) = v9;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : unknown HDRProcessing hw type %d, switching to GPU", buf, 0x1Cu);
      }
      prevLogInstanceID = v17;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[HDRProcessor initWithConfig:]";
      __int16 v43 = 1024;
      LODWORD(v44) = v9;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : unknown HDRProcessing hw type %d, switching to GPU", buf, 0x12u);
    }
    *(_DWORD *)int v6 = 0;
    uint64_t v10 = (uint64_t *)(v6 + 408);
    *((void *)v6 + 51) = v5;
    goto LABEL_20;
  }
  uint64_t v10 = (uint64_t *)(v4 + 841168);
  *((void *)v4 + 105146) = v4;
  if (v9 == 1)
  {
    v26 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = 0;

    v27 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = 0;

    v28 = [[DolbyVisionDisplayManagement alloc] initWithTmLutSize:513];
    v29 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v28;

    if (!*((void *)v5 + 8)) {
      goto LABEL_23;
    }
    v30 = objc_alloc_init(DolbyVisionMR);
    v31 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v30;

    if (!*((void *)v5 + 9)) {
      goto LABEL_23;
    }
    *((void *)v5 + 3) = MGGetSInt64Answer();
    v32 = (HDRConfig *)IsVirtualized();
    if ((v32 & 1) != 0
      || (Config = GetConfig(v32)) != 0
      && (v34 = GetConfig((HDRConfig *)Config), *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v34, 0xACu, 1)))
    {
      v35 = objc_alloc_init(MSRHDRProcessingByCapabilities);
LABEL_50:
      v21 = (void *)*((void *)v5 + 4);
      *((void *)v5 + 4) = v35;
      goto LABEL_21;
    }
    uint64_t v38 = *((void *)v5 + 3);
    if (v38 <= 24655)
    {
      if ((unint64_t)(v38 - 24576) > 0x34) {
        goto LABEL_66;
      }
      if (((1 << v38) & 0x17000000000000) == 0)
      {
        if (((1 << v38) & 7) == 0)
        {
          if (((1 << v38) & 0x700000000) == 0)
          {
LABEL_66:
            if ((unint64_t)(v38 - 24640) >= 2)
            {
LABEL_84:
              v35 = objc_alloc_init(MSRHDRProcessing);
              goto LABEL_50;
            }
LABEL_73:
            v35 = objc_alloc_init(MSRHDRProcessingT4);
            goto LABEL_50;
          }
LABEL_83:
          v35 = objc_alloc_init(MSRHDRProcessingT2);
          goto LABEL_50;
        }
LABEL_78:
        v35 = objc_alloc_init(MSRHDRProcessingT1);
        goto LABEL_50;
      }
LABEL_74:
      v35 = objc_alloc_init(MSRHDRProcessingT3);
      goto LABEL_50;
    }
    if (v38 <= 33039)
    {
      if (v38 != 24656)
      {
        if (v38 != 33025 && v38 != 33027) {
          goto LABEL_84;
        }
        goto LABEL_78;
      }
    }
    else
    {
      char v39 = v38 - 32;
      if ((unint64_t)(v38 - 33056) > 0x22) {
        goto LABEL_82;
      }
      if (((1 << v39) & 0x10005) != 0) {
        goto LABEL_74;
      }
      if (((1 << v39) & 0x100040000) != 0) {
        goto LABEL_73;
      }
      if (v38 != 33090)
      {
LABEL_82:
        if (v38 != 33040 && v38 != 33042) {
          goto LABEL_84;
        }
        goto LABEL_83;
      }
    }
    v35 = objc_alloc_init(MSRHDRProcessingT5);
    goto LABEL_50;
  }
  if (v9 != 2)
  {
LABEL_20:
    id v18 = MTLCreateSystemDefaultDevice();
    v19 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v18;

    uint64_t v20 = [*((id *)v5 + 1) newCommandQueue];
    v21 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v20;
LABEL_21:

    goto LABEL_22;
  }
  BOOL v11 = (void *)*((void *)v4 + 1);
  *((void *)v4 + 1) = 0;

  uint64_t v12 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = 0;

  v13 = [[DolbyVisionDisplayManagement alloc] initWithTmLutSize:513];
  uint64_t v14 = (void *)*((void *)v5 + 8);
  *((void *)v5 + 8) = v13;

  if (!*((void *)v5 + 8)) {
    goto LABEL_59;
  }
  uint64_t v15 = MGGetSInt64Answer();
  *((void *)v5 + 3) = v15;
  if (v15 > 33057)
  {
    if (v15 <= 33087)
    {
      if (v15 == 33058)
      {
        v36 = objc_alloc_init(DISPHDRProcessing);
        goto LABEL_58;
      }
      uint64_t v16 = 33074;
      goto LABEL_56;
    }
    if (v15 != 33088)
    {
      uint64_t v16 = 33090;
LABEL_56:
      if (v15 != v16) {
        goto LABEL_59;
      }
    }
LABEL_57:
    v36 = objc_alloc_init(DISPHDRProcessingT1);
LABEL_58:
    v37 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v36;

    goto LABEL_59;
  }
  if ((unint64_t)(v15 - 24640) <= 0x10 && ((1 << (v15 - 64)) & 0x10003) != 0) {
    goto LABEL_57;
  }
LABEL_59:
  if (!*((void *)v5 + 5)) {
    goto LABEL_23;
  }
LABEL_22:
  if ([v5 allocateResources])
  {
LABEL_23:
    if (enableLogInstance)
    {
      if (*v10) {
        uint64_t v22 = *v10;
      }
      else {
        uint64_t v22 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v42 = (const char *)WORD1(v22);
        __int16 v43 = 2080;
        v44 = "-[HDRProcessor initWithConfig:]";
        __int16 v45 = 2048;
        id v46 = v5;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : Initialization Failed, self=%p\n", buf, 0x20u);
      }
      prevLogInstanceID = v22;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[HDRProcessor initWithConfig:]";
      __int16 v43 = 2048;
      v44 = (const char *)v5;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : Initialization Failed, self=%p\n", buf, 0x16u);
    }
    [v5 releaseResources];
    v24 = 0;
    goto LABEL_43;
  }
LABEL_30:
  if (enableLogInstance)
  {
    if (*((void *)v6 + 51)) {
      uint64_t v23 = *((void *)v6 + 51);
    }
    else {
      uint64_t v23 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v42 = (const char *)WORD1(v23);
      __int16 v43 = 2080;
      v44 = "-[HDRProcessor initWithConfig:]";
      __int16 v45 = 2048;
      id v46 = v5;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx    %s : instance=%p\n", buf, 0x20u);
    }
    prevLogInstanceID = v23;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[HDRProcessor initWithConfig:]";
    __int16 v43 = 2048;
    v44 = (const char *)v5;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]    %s : instance=%p\n", buf, 0x16u);
  }
  v24 = (HDRProcessor *)v5;
LABEL_43:

  return v24;
}

- (HDRProcessor)initWithDevice:(id)a3 config:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  self->_logOnce = 1;
  v24.receiver = self;
  v24.super_class = (Class)HDRProcessor;
  long long v7 = [(HDRProcessor *)&v24 init];
  long long v8 = v7;
  unsigned int v9 = v7 + 840760;
  if (!v7)
  {
    if (enableLogInstance)
    {
      if (MEMORY[0xCD5D0]) {
        uint64_t v14 = MEMORY[0xCD5D0];
      }
      else {
        uint64_t v14 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v26 = (const char *)WORD1(v14);
        __int16 v27 = 2080;
        v28 = "-[HDRProcessor initWithDevice:config:]";
        __int16 v29 = 2048;
        v30 = 0;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : Initialization Failed, self = %p\n", buf, 0x20u);
      }
      prevLogInstanceID = v14;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 136315394;
      v26 = "-[HDRProcessor initWithDevice:config:]";
      __int16 v27 = 2048;
      v28 = 0;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : Initialization Failed, self = %p\n", buf, 0x16u);
    }
LABEL_18:
    if (enableLogInstance)
    {
      if (*((void *)v9 + 51)) {
        uint64_t v20 = *((void *)v9 + 51);
      }
      else {
        uint64_t v20 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v26 = (const char *)WORD1(v20);
        __int16 v27 = 2080;
        v28 = "-[HDRProcessor initWithDevice:config:]";
        __int16 v29 = 2048;
        v30 = v8;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx    %s : instance=%p\n", buf, 0x20u);
      }
      prevLogInstanceID = v20;
LABEL_27:
      v21 = v8;
      goto LABEL_28;
    }
LABEL_25:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[HDRProcessor initWithDevice:config:]";
      __int16 v27 = 2048;
      v28 = (const char *)v8;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]    %s : instance=%p\n", buf, 0x16u);
    }
    goto LABEL_27;
  }
  long long v10 = *(_OWORD *)&a4->var0;
  long long v11 = *(_OWORD *)&a4->var4;
  *((void *)v7 + 105139) = *(void *)&a4->var6;
  *(_OWORD *)(v7 + 841080) = v10;
  *(_OWORD *)(v7 + 841096) = v11;
  DWORD1(v10) = 1065353216;
  *(_OWORD *)(v7 + 841180) = xmmword_2222D0BE0;
  LODWORD(v10) = *((_DWORD *)v7 + 210273);
  *((double *)v7 + 105150) = (double)(unint64_t)v10;
  *((void *)v7 + 105152) = *((void *)v7 + 105138);
  *(_DWORD *)unsigned int v9 = 0;
  *((void *)v7 + 105146) = v7;
  if (*((void *)v7 + 1)) {
    goto LABEL_18;
  }
  if (v6)
  {
    id v12 = v6;
    v13 = (void *)v8[1];
    v8[1] = v12;
  }
  else
  {
    id v15 = MTLCreateSystemDefaultDevice();
    uint64_t v16 = (void *)v8[1];
    v8[1] = v15;

    uint64_t v17 = (void *)v8[1];
    if (!v17)
    {
      uint64_t v19 = -17005;
      goto LABEL_30;
    }
    uint64_t v18 = [v17 newCommandQueue];
    v13 = (void *)v8[2];
    v8[2] = v18;
  }

  if (([v8 allocateResources] & 1) == 0) {
    goto LABEL_18;
  }
  uint64_t v19 = -17004;
LABEL_30:
  if (enableLogInstance)
  {
    if (*((void *)v9 + 51)) {
      uint64_t v23 = *((void *)v9 + 51);
    }
    else {
      uint64_t v23 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v26 = (const char *)WORD1(v23);
      __int16 v27 = 2080;
      v28 = "-[HDRProcessor initWithDevice:config:]";
      __int16 v29 = 2048;
      v30 = (void *)v19;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx    %s : failed with error %ld\n", buf, 0x20u);
    }
    prevLogInstanceID = v23;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[HDRProcessor initWithDevice:config:]";
    __int16 v27 = 2048;
    v28 = (const char *)v19;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]    %s : failed with error %ld\n", buf, 0x16u);
  }
  [v8 releaseResources];
  v21 = 0;
LABEL_28:

  return v21;
}

- (id)initProcessingEngine:(id)a3 config:(id *)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  self->_logOnce = 1;
  v41.receiver = self;
  v41.super_class = (Class)HDRProcessor;
  long long v7 = [(HDRProcessor *)&v41 init];
  long long v8 = v7;
  unsigned int v9 = v7 + 841092;
  if (!v7) {
    goto LABEL_45;
  }
  long long v10 = *(_OWORD *)&a4->var0;
  long long v11 = *(_OWORD *)&a4->var4;
  *((void *)v7 + 105139) = *(void *)&a4->var6;
  *(_OWORD *)(v7 + 841080) = v10;
  *(_OWORD *)(v7 + 841096) = v11;
  DWORD1(v10) = 1065353216;
  *(_OWORD *)(v7 + 841180) = xmmword_2222D0BE0;
  LODWORD(v10) = *(_DWORD *)v9;
  *((double *)v7 + 105150) = (double)(unint64_t)v10;
  *((void *)v7 + 105152) = *((void *)v7 + 105138);
  *((void *)v7 + 105146) = v7;
  if (!*((void *)v7 + 1))
  {
    if (v6)
    {
      id v12 = v6;
      v13 = (void *)*((void *)v8 + 1);
      *((void *)v8 + 1) = v12;
    }
    else
    {
      id v14 = MTLCreateSystemDefaultDevice();
      id v15 = (void *)*((void *)v8 + 1);
      *((void *)v8 + 1) = v14;

      uint64_t v16 = (void *)*((void *)v8 + 1);
      if (!v16)
      {
LABEL_38:
        if (enableLogInstance)
        {
          if (*(void *)(v9 + 76)) {
            uint64_t v36 = *(void *)(v9 + 76);
          }
          else {
            uint64_t v36 = prevLogInstanceID;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218498;
            __int16 v43 = (const char *)WORD1(v36);
            __int16 v44 = 2080;
            __int16 v45 = "-[HDRProcessor initProcessingEngine:config:]";
            __int16 v46 = 2048;
            uint64_t v47 = v8;
            _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : Initialization Failed, self=%p\n", buf, 0x20u);
          }
          prevLogInstanceID = v36;
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v43 = "-[HDRProcessor initProcessingEngine:config:]";
          __int16 v44 = 2048;
          __int16 v45 = v8;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : Initialization Failed, self=%p\n", buf, 0x16u);
        }
        [v8 releaseResources];
        uint64_t v38 = 0;
        goto LABEL_58;
      }
      uint64_t v17 = [v16 newCommandQueue];
      v13 = (void *)*((void *)v8 + 2);
      *((void *)v8 + 2) = v17;
    }
  }
  id v18 = [[DolbyVisionDisplayManagement alloc] initTmEngine:513 device:*((void *)v8 + 1)];
  uint64_t v19 = (void *)*((void *)v8 + 8);
  *((void *)v8 + 8) = v18;

  if (!*((void *)v8 + 8)) {
    goto LABEL_38;
  }
  uint64_t v20 = objc_alloc_init(DolbyVisionMR);
  v21 = (void *)*((void *)v8 + 9);
  *((void *)v8 + 9) = v20;

  if (!*((void *)v8 + 9)) {
    goto LABEL_38;
  }
  uint64_t v22 = (HDRConfig *)MGGetSInt64Answer();
  *((void *)v8 + 3) = v22;
  if (v22 != (HDRConfig *)32784)
  {
    Config = GetConfig(v22);
    if (Config)
    {
      objc_super v24 = GetConfig((HDRConfig *)Config);
      if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v24, 0x9Eu, 1)) {
        [v8 allocateSceneLuxB2DItpMLModel];
      }
    }
  }
  v25 = (HDRConfig *)IsVirtualized();
  if ((v25 & 1) != 0
    || (v26 = GetConfig(v25)) != 0
    && (__int16 v27 = GetConfig((HDRConfig *)v26), *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v27, 0xACu, 1)))
  {
    v28 = objc_alloc_init(MSRHDRProcessingByCapabilities);
    goto LABEL_18;
  }
  uint64_t v33 = *((void *)v8 + 3);
  if (v33 > 24655)
  {
    if (v33 <= 33039)
    {
      if (v33 != 24656)
      {
        if (v33 != 33025 && v33 != 33027) {
          goto LABEL_75;
        }
LABEL_69:
        v28 = objc_alloc_init(MSRHDRProcessingT1);
        goto LABEL_18;
      }
    }
    else
    {
      char v40 = v33 - 32;
      if ((unint64_t)(v33 - 33056) > 0x22) {
        goto LABEL_73;
      }
      if (((1 << v40) & 0x10005) != 0) {
        goto LABEL_65;
      }
      if (((1 << v40) & 0x100040000) != 0) {
        goto LABEL_63;
      }
      if (v33 != 33090)
      {
LABEL_73:
        if (v33 != 33040 && v33 != 33042) {
          goto LABEL_75;
        }
LABEL_74:
        v28 = objc_alloc_init(MSRHDRProcessingT2);
        goto LABEL_18;
      }
    }
    v28 = objc_alloc_init(MSRHDRProcessingT5);
    goto LABEL_18;
  }
  if ((unint64_t)(v33 - 24576) > 0x34) {
    goto LABEL_30;
  }
  if (((1 << v33) & 0x17000000000000) != 0)
  {
LABEL_65:
    v28 = objc_alloc_init(MSRHDRProcessingT3);
    goto LABEL_18;
  }
  if (((1 << v33) & 7) != 0) {
    goto LABEL_69;
  }
  if (((1 << v33) & 0x700000000) != 0) {
    goto LABEL_74;
  }
LABEL_30:
  if ((unint64_t)(v33 - 24640) < 2)
  {
LABEL_63:
    v28 = objc_alloc_init(MSRHDRProcessingT4);
    goto LABEL_18;
  }
LABEL_75:
  v28 = objc_alloc_init(MSRHDRProcessing);
LABEL_18:
  __int16 v29 = (void *)*((void *)v8 + 4);
  *((void *)v8 + 4) = v28;

  uint64_t v30 = *((void *)v8 + 3);
  if (v30 > 33057)
  {
    if (v30 <= 33087)
    {
      if (v30 == 33058)
      {
        v34 = objc_alloc_init(DISPHDRProcessing);
        goto LABEL_36;
      }
      uint64_t v31 = 33074;
      goto LABEL_34;
    }
    if (v30 != 33088)
    {
      uint64_t v31 = 33090;
LABEL_34:
      if (v30 != v31) {
        goto LABEL_37;
      }
    }
LABEL_35:
    v34 = objc_alloc_init(DISPHDRProcessingT1);
LABEL_36:
    v35 = (void *)*((void *)v8 + 5);
    *((void *)v8 + 5) = v34;

    goto LABEL_37;
  }
  unint64_t v32 = v30 - 24640;
  if (v32 <= 0x10 && ((1 << v32) & 0x10003) != 0) {
    goto LABEL_35;
  }
LABEL_37:
  if ([v8 allocateEngineResources]) {
    goto LABEL_38;
  }
LABEL_45:
  if (enableLogInstance)
  {
    if (*(void *)(v9 + 76)) {
      uint64_t v37 = *(void *)(v9 + 76);
    }
    else {
      uint64_t v37 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v43 = (const char *)WORD1(v37);
      __int16 v44 = 2080;
      __int16 v45 = "-[HDRProcessor initProcessingEngine:config:]";
      __int16 v46 = 2048;
      uint64_t v47 = v8;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx    %s : instance=%p\n", buf, 0x20u);
    }
    prevLogInstanceID = v37;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v43 = "-[HDRProcessor initProcessingEngine:config:]";
    __int16 v44 = 2048;
    __int16 v45 = v8;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]    %s : instance=%p\n", buf, 0x16u);
  }
  uint64_t v38 = v8;
LABEL_58:

  return v38;
}

- (BOOL)allocateResources
{
}

- (BOOL)allocateEngineResources
{
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  [(HDRProcessor *)self releaseResources];
  if (enableLogInstance)
  {
    if (self->logInstanceID) {
      unint64_t logInstanceID = self->logInstanceID;
    }
    else {
      unint64_t logInstanceID = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      id v6 = (const char *)WORD1(logInstanceID);
      __int16 v7 = 2080;
      long long v8 = (HDRProcessor *)"-[HDRProcessor dealloc]";
      __int16 v9 = 2048;
      long long v10 = self;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx -- %s: HDRProcessor exit! instance=%p\n", buf, 0x20u);
    }
    prevLogInstanceID = logInstanceID;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[HDRProcessor dealloc]";
    __int16 v7 = 2048;
    long long v8 = self;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] -- %s: HDRProcessor exit! instance=%p\n", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)HDRProcessor;
  [(HDRProcessor *)&v4 dealloc];
}

- (void)releaseResources
{
  p_hdr10PlusMetaDataParser = &self->_hdr10PlusMetaDataParser;
  composer = self->_composer;
  self->_composer = 0;

  resampler = self->_resampler;
  self->_resampler = 0;

  dm = self->_dm;
  self->_dm = 0;

  commandQueue = self->_commandQueue;
  self->_commandQueue = 0;

  device = self->_device;
  self->_device = 0;

  msr = self->_msr;
  self->_msr = 0;

  disp = self->_disp;
  self->_disp = 0;

  mr = self->_mr;
  self->_mr = 0;

  parser = self->_parser;
  if (parser)
  {
    MEMORY[0x223C97C80](parser, 0x1091C40370D15ABLL);
    self->_parser = 0;
  }
  if (*p_hdr10PlusMetaDataParser)
  {
    MEMORY[0x223C97C80](*p_hdr10PlusMetaDataParser, 0x1091C40A2BD7073);
    *p_hdr10PlusMetaDataParser = 0;
  }
  v13 = p_hdr10PlusMetaDataParser[60];
  if (v13) {
    CFRelease(v13);
  }
  id v14 = p_hdr10PlusMetaDataParser[59];
  if (v14) {
    CFRelease(v14);
  }
  id v15 = p_hdr10PlusMetaDataParser[61];
  p_hdr10PlusMetaDataParser[61] = 0;

  uint64_t v16 = p_hdr10PlusMetaDataParser[62];
  p_hdr10PlusMetaDataParser[62] = 0;

  uint64_t v17 = p_hdr10PlusMetaDataParser[63];
  p_hdr10PlusMetaDataParser[63] = 0;

  id v18 = p_hdr10PlusMetaDataParser[64];
  if (v18)
  {
    CFRelease(v18);
  }
}

- (int64_t)processFrameWithLayer0:(__CVBuffer *)a3 layer1:(__CVBuffer *)a4 output:(__CVBuffer *)a5 metadata:(id)a6 commandbuffer:(id)a7 callback:(id)a8
{
  id v13 = a6;
  id v14 = a8;
  CFRetain(a3);
  if (a4) {
    CFRetain(a4);
  }
  CFRetain(a5);
  ++self->_numberOfRequestedFrames;
  scheduleQueue = self->_scheduleQueue;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __85__HDRProcessor_processFrameWithLayer0_layer1_output_metadata_commandbuffer_callback___block_invoke;
  v19[3] = &unk_264605BA8;
  uint64_t v23 = a4;
  objc_super v24 = a5;
  v19[4] = self;
  id v20 = v13;
  id v21 = v14;
  uint64_t v22 = a3;
  id v16 = v14;
  id v17 = v13;
  dispatch_async(scheduleQueue, v19);

  return -17000;
}

void __85__HDRProcessor_processFrameWithLayer0_layer1_output_metadata_commandbuffer_callback___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 841152), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) commandBuffer];
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(a1 + 56));
  IOSurfaceRef v4 = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(a1 + 64));
  [*(id *)(a1 + 32) processFrameInternalWithLayer0:IOSurface layer1:v4 outout:CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(a1 + 72)) metadata:*(void *)(a1 + 40) commandbuffer:v2 operation:0 config:0 histogram:0 data:0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __85__HDRProcessor_processFrameWithLayer0_layer1_output_metadata_commandbuffer_callback___block_invoke_2;
  v7[3] = &unk_264605B80;
  v7[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v8 = v6;
  uint64_t v9 = *(void *)(a1 + 72);
  [v2 addScheduledHandler:v7];
  [v2 commit];
}

void __85__HDRProcessor_processFrameWithLayer0_layer1_output_metadata_commandbuffer_callback___block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 841144);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__HDRProcessor_processFrameWithLayer0_layer1_output_metadata_commandbuffer_callback___block_invoke_3;
  block[3] = &unk_264605B58;
  block[4] = v2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(v3, block);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 841152));
}

void __85__HDRProcessor_processFrameWithLayer0_layer1_output_metadata_commandbuffer_callback___block_invoke_3(void *a1)
{
  ++*(void *)(a1[4] + 841064);
  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v2 = (const void *)a1[6];
  CFRelease(v2);
}

- (BOOL)hasMetalDeviceChanged:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MTLDevice *)self->_device registryID];
  long long v6 = [v4 device];
  uint64_t v7 = [v6 registryID];

  if (v7 != v5)
  {
    if (enableLogInstance)
    {
      if (self->logInstanceID) {
        unint64_t logInstanceID = self->logInstanceID;
      }
      else {
        unint64_t logInstanceID = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134218242;
        uint64_t v11 = (const char *)WORD1(logInstanceID);
        __int16 v12 = 2080;
        id v13 = "-[HDRProcessor hasMetalDeviceChanged:]";
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx    %s : metalDevice has changed!\n", (uint8_t *)&v10, 0x16u);
      }
      prevLogInstanceID = logInstanceID;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[HDRProcessor hasMetalDeviceChanged:]";
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]    %s : metalDevice has changed!\n", (uint8_t *)&v10, 0xCu);
    }
  }

  return v7 != v5;
}

- (int64_t)encodeToCommandBuffer:(id)a3 inputSurfaceLayer0:(__IOSurface *)a4 inputSurfacelayer1:(__IOSurface *)a5 outputSurface:(__IOSurface *)a6 metadata:(id)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  p_hardwareType = &self->_hardwareType;
  id v13 = a3;
  uint64_t v14 = (__IOSurface *)a7;
  id v15 = v14;
  if (a4 && a6 && v14)
  {
    unsigned int *p_hardwareType = 0;
    chromVectorWeight = 1077936128;
    if ([(HDRProcessor *)self hasMetalDeviceChanged:v13])
    {
      if (enableLogInstance)
      {
        if (*((void *)p_hardwareType + 51)) {
          uint64_t v16 = *((void *)p_hardwareType + 51);
        }
        else {
          uint64_t v16 = prevLogInstanceID;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v22 = (const char *)WORD1(v16);
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx failed due to metalDevice change!", buf, 0xCu);
        }
        prevLogInstanceID = v16;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v18 = -17000;
          goto LABEL_36;
        }
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] failed due to metalDevice change!", buf, 2u);
      }
      int64_t v18 = -17000;
    }
    else
    {
      ++*((void *)p_hardwareType + 36);
      int64_t v18 = [(HDRProcessor *)self processFrameInternalWithLayer0:a4 layer1:a5 outout:a6 metadata:v15 commandbuffer:v13 operation:0 config:0 histogram:0 data:0];
      if (v18 == -17000)
      {
        ++g_frame_idx;
        int64_t v18 = -17000;
        goto LABEL_38;
      }
    }
  }
  else
  {
    if (enableLogInstance)
    {
      if (*((void *)p_hardwareType + 51)) {
        uint64_t v17 = *((void *)p_hardwareType + 51);
      }
      else {
        uint64_t v17 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219266;
        uint64_t v22 = (const char *)WORD1(v17);
        __int16 v23 = 2080;
        objc_super v24 = (__IOSurface *)"-[HDRProcessor encodeToCommandBuffer:inputSurfaceLayer0:inputSurfacelayer1:outputSurface:metadata:]";
        __int16 v25 = 2048;
        v26 = a4;
        __int16 v27 = 2048;
        v28 = a5;
        __int16 v29 = 2048;
        uint64_t v30 = a6;
        __int16 v31 = 2048;
        unint64_t v32 = v15;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : layer0=%p, layer1=%p, output=%p, metatdata=%p", buf, 0x3Eu);
      }
      prevLogInstanceID = v17;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v18 = -17006;
        goto LABEL_36;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v22 = "-[HDRProcessor encodeToCommandBuffer:inputSurfaceLayer0:inputSurfacelayer1:outputSurface:metadata:]";
      __int16 v23 = 2048;
      objc_super v24 = a4;
      __int16 v25 = 2048;
      v26 = a5;
      __int16 v27 = 2048;
      v28 = a6;
      __int16 v29 = 2048;
      uint64_t v30 = v15;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : layer0=%p, layer1=%p, output=%p, metatdata=%p", buf, 0x34u);
    }
    int64_t v18 = -17006;
  }
  if (enableLogInstance)
  {
    if (*((void *)p_hardwareType + 51)) {
      uint64_t v19 = *((void *)p_hardwareType + 51);
    }
    else {
      uint64_t v19 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v22 = (const char *)WORD1(v19);
      __int16 v23 = 2080;
      objc_super v24 = (__IOSurface *)"-[HDRProcessor encodeToCommandBuffer:inputSurfaceLayer0:inputSurfacelayer1:outputSurface:metadata:]";
      __int16 v25 = 1024;
      LODWORD(v26) = v18;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : failed with error %d\n", buf, 0x1Cu);
    }
    prevLogInstanceID = v19;
    goto LABEL_38;
  }
LABEL_36:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v22 = "-[HDRProcessor encodeToCommandBuffer:inputSurfaceLayer0:inputSurfacelayer1:outputSurface:metadata:]";
    __int16 v23 = 1024;
    LODWORD(v24) = v18;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : failed with error %d\n", buf, 0x12u);
  }
LABEL_38:

  return v18;
}

- (int64_t)generateMSRColorConfigWithOperation:(unsigned int)a3 inputSurface:(__IOSurface *)a4 outputSurface:(__IOSurface *)a5 metadata:(id)a6 histogram:(RgbHistogram_t *)a7 config:(id *)a8
{
  uint64_t v12 = *(void *)&a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  p_hardwareType = &self->_hardwareType;
  id v15 = (id *)a6;
  uint64_t v16 = v15;
  if (a4 && a5 && v15 && a8)
  {
    unsigned int *p_hardwareType = 1;
    chromVectorWeight = 1081291571;
    int64_t v17 = [(HDRProcessor *)self ValidateMSRColorConfigInput:v12 inputSurface:a4 outputSurface:a5];
    if (v17 == -17000) {
      int64_t v17 = [(HDRProcessor *)self processFrameInternalWithLayer0:a4 layer1:0 outout:a5 metadata:v16 commandbuffer:0 operation:v12 config:0 histogram:a7 data:a8];
    }
    ++g_frame_idx;
  }
  else
  {
    if (enableLogInstance)
    {
      if (*((void *)p_hardwareType + 51)) {
        uint64_t v18 = *((void *)p_hardwareType + 51);
      }
      else {
        uint64_t v18 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219522;
        id v21 = (const char *)WORD1(v18);
        __int16 v22 = 2080;
        __int16 v23 = (__IOSurface *)"-[HDRProcessor generateMSRColorConfigWithOperation:inputSurface:outputSurface:metadata:histogram:config:]";
        __int16 v24 = 2048;
        __int16 v25 = a4;
        __int16 v26 = 2048;
        __int16 v27 = a5;
        __int16 v28 = 2048;
        __int16 v29 = v16;
        __int16 v30 = 2048;
        __int16 v31 = a8;
        __int16 v32 = 2048;
        uint64_t v33 = a7;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx     %s: layer0=%p, output=%p, metatdata=%p, config=%p, histogram=%p", buf, 0x48u);
      }
      prevLogInstanceID = v18;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      id v21 = "-[HDRProcessor generateMSRColorConfigWithOperation:inputSurface:outputSurface:metadata:histogram:config:]";
      __int16 v22 = 2048;
      __int16 v23 = a4;
      __int16 v24 = 2048;
      __int16 v25 = a5;
      __int16 v26 = 2048;
      __int16 v27 = (__IOSurface *)v16;
      __int16 v28 = 2048;
      __int16 v29 = a8;
      __int16 v30 = 2048;
      __int16 v31 = a7;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]     %s: layer0=%p, output=%p, metatdata=%p, config=%p, histogram=%p", buf, 0x3Eu);
    }
    int64_t v17 = -17006;
  }

  return v17;
}

- (int64_t)iterateDisplayConfigWithType:(int)a3 operation:(unsigned int)a4 inputSurface:(__IOSurface *)a5 options:(id)a6 config:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  p_hardwareType = &self->_hardwareType;
  id v13 = (__IOSurface *)a6;
  id v14 = a7;
  id v15 = v14;
  unsigned int *p_hardwareType = 2;
  if (a5 && v13 && v14)
  {
    int64_t v16 = [(HDRProcessor *)self ValidateDISPColorConfigInput:v9 inputSurface:a5];
    if (v16 == -17000)
    {
      int64_t v16 = [(HDRProcessor *)self processFrameInternalWithLayer0:a5 layer1:0 outout:0 metadata:v13 commandbuffer:0 operation:v9 config:0 histogram:0 data:0];
      if (v16 == -17000)
      {
        [(DISPHDRProcessing *)self->_disp iterateDISPColorConfig:v10 config:v15];
        int64_t v16 = -17000;
      }
    }
  }
  else
  {
    if (enableLogInstance)
    {
      if (*((void *)p_hardwareType + 51)) {
        uint64_t v17 = *((void *)p_hardwareType + 51);
      }
      else {
        uint64_t v17 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = (void *)MEMORY[0x223C980D0](v15);
        *(_DWORD *)buf = 134219010;
        __int16 v22 = (const char *)WORD1(v17);
        __int16 v23 = 2080;
        __int16 v24 = (__IOSurface *)"-[HDRProcessor iterateDisplayConfigWithType:operation:inputSurface:options:config:]";
        __int16 v25 = 2048;
        __int16 v26 = a5;
        __int16 v27 = 2048;
        __int16 v28 = v13;
        __int16 v29 = 2048;
        __int16 v30 = v18;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s: input=%p, options=%p, configCallback=%p", buf, 0x34u);
      }
      prevLogInstanceID = v17;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = (__IOSurface *)MEMORY[0x223C980D0](v15);
      *(_DWORD *)buf = 136315906;
      __int16 v22 = "-[HDRProcessor iterateDisplayConfigWithType:operation:inputSurface:options:config:]";
      __int16 v23 = 2048;
      __int16 v24 = a5;
      __int16 v25 = 2048;
      __int16 v26 = v13;
      __int16 v27 = 2048;
      __int16 v28 = v19;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s: input=%p, options=%p, configCallback=%p", buf, 0x2Au);
    }
    int64_t v16 = -17006;
  }

  return v16;
}

+ (void)dolbyIOMFBMetadata:(id *)a3 withMinBrightness:(float)a4 maxBrightness:(float)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a3)
  {
    +[MSRHDRProcessing dolbyIOMFBMetadata:withMinBrightness:maxBrightness:](MSRHDRProcessing, "dolbyIOMFBMetadata:withMinBrightness:maxBrightness:");
  }
  else if (enableLogInstance)
  {
    if (logInstanceID) {
      uint64_t v5 = logInstanceID;
    }
    else {
      uint64_t v5 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134218498;
      uint64_t v7 = (const char *)WORD1(v5);
      __int16 v8 = 2080;
      uint64_t v9 = "+[HDRProcessor dolbyIOMFBMetadata:withMinBrightness:maxBrightness:]";
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx     %s: metatdata= %p, bailout!!!\n", (uint8_t *)&v6, 0x20u);
    }
    prevLogInstanceID = v5;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "+[HDRProcessor dolbyIOMFBMetadata:withMinBrightness:maxBrightness:]";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]     %s: metatdata= %p, bailout!!!\n", (uint8_t *)&v6, 0x16u);
  }
}

+ (int64_t)parseHDR10PlusSEI:(id)a3 outputMetadata:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = v5;
  if (!a4)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v8 = logInstanceID;
      }
      else {
        uint64_t v8 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      int v16 = 134218498;
      uint64_t v17 = (const char *)WORD1(v8);
      __int16 v18 = 2080;
      uint64_t v19 = "+[HDRProcessor parseHDR10PlusSEI:outputMetadata:]";
      __int16 v20 = 2048;
      uint64_t v21 = 0;
      uint64_t v9 = &_os_log_internal;
      __int16 v10 = " [1.419.54] #%04llx     %s: output=%p, bailout!!!\n";
      uint32_t v11 = 32;
      goto LABEL_16;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    int v16 = 136315394;
    uint64_t v17 = "+[HDRProcessor parseHDR10PlusSEI:outputMetadata:]";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    uint64_t v12 = &_os_log_internal;
    id v13 = " [1.419.54]     %s: output=%p, bailout!!!\n";
    uint32_t v14 = 22;
LABEL_22:
    _os_log_impl(&dword_22224D000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v14);
    goto LABEL_23;
  }
  if (!v5)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v8 = logInstanceID;
      }
      else {
        uint64_t v8 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      int v16 = 134218242;
      uint64_t v17 = (const char *)WORD1(v8);
      __int16 v18 = 2080;
      uint64_t v19 = "+[HDRProcessor parseHDR10PlusSEI:outputMetadata:]";
      uint64_t v9 = &_os_log_internal;
      __int16 v10 = " [1.419.54] #%04llx     %s: missing SEI";
      uint32_t v11 = 22;
LABEL_16:
      _os_log_impl(&dword_22224D000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, v11);
LABEL_17:
      prevLogInstanceID = v8;
LABEL_23:
      int64_t v7 = -17006;
      goto LABEL_24;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    int v16 = 136315138;
    uint64_t v17 = "+[HDRProcessor parseHDR10PlusSEI:outputMetadata:]";
    uint64_t v12 = &_os_log_internal;
    id v13 = " [1.419.54]     %s: missing SEI";
    uint32_t v14 = 12;
    goto LABEL_22;
  }
  int64_t v7 = +[HDRProcessor parseHDR10PlusSEIMessage:v5 outputMetadata:a4];
LABEL_24:

  return v7;
}

+ (int64_t)parseHDR10PlusSEIWithInputSurface:(__IOSurface *)a3 outputMetadata:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!a4)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v7 = logInstanceID;
      }
      else {
        uint64_t v7 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      int v12 = 134218498;
      id v13 = (const char *)WORD1(v7);
      __int16 v14 = 2080;
      id v15 = "+[HDRProcessor parseHDR10PlusSEIWithInputSurface:outputMetadata:]";
      __int16 v16 = 2048;
      uint64_t v17 = 0;
      uint64_t v8 = &_os_log_internal;
      uint64_t v9 = " [1.419.54] #%04llx     %s: output=%p, bailout!!!\n";
      goto LABEL_18;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return -17006;
    }
    int v12 = 136315394;
    id v13 = "+[HDRProcessor parseHDR10PlusSEIWithInputSurface:outputMetadata:]";
    __int16 v14 = 2048;
    id v15 = 0;
    __int16 v10 = &_os_log_internal;
    uint32_t v11 = " [1.419.54]     %s: output=%p, bailout!!!\n";
LABEL_24:
    _os_log_impl(&dword_22224D000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0x16u);
    return -17006;
  }
  if (!a3)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v7 = logInstanceID;
      }
      else {
        uint64_t v7 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      int v12 = 134218498;
      id v13 = (const char *)WORD1(v7);
      __int16 v14 = 2080;
      id v15 = "+[HDRProcessor parseHDR10PlusSEIWithInputSurface:outputMetadata:]";
      __int16 v16 = 2048;
      uint64_t v17 = 0;
      uint64_t v8 = &_os_log_internal;
      uint64_t v9 = " [1.419.54] #%04llx     %s: input=%p";
LABEL_18:
      _os_log_impl(&dword_22224D000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0x20u);
LABEL_19:
      prevLogInstanceID = v7;
      return -17006;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return -17006;
    }
    int v12 = 136315394;
    id v13 = "+[HDRProcessor parseHDR10PlusSEIWithInputSurface:outputMetadata:]";
    __int16 v14 = 2048;
    id v15 = 0;
    __int16 v10 = &_os_log_internal;
    uint32_t v11 = " [1.419.54]     %s: input=%p";
    goto LABEL_24;
  }
  CFTypeRef v5 = IOSurfaceCopyValue(a3, @"HDR10PlusData");
  return +[HDRProcessor parseHDR10PlusSEIMessage:v5 outputMetadata:a4];
}

- (int64_t)ValidateMSRColorConfigInput:(unsigned int)a3 inputSurface:(__IOSurface *)a4 outputSurface:(__IOSurface *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t PixelFormat = IOSurfaceGetPixelFormat(a4);
  uint64_t v9 = IOSurfaceGetPixelFormat(a5);
  int FourCCforType = getFourCCforType(PixelFormat);
  unsigned int v11 = getFourCCforType(v9);
  if ((a3 & 4) != 0)
  {
    int64_t v13 = -17006;
    if (a3 == 4 && isSupportedMSRColorConversion(FourCCforType, v11)) {
      int64_t v13 = -17000;
    }
  }
  else
  {
    switch(a3)
    {
      case 1u:
        if (isSupportedMSRInputFormat(FourCCforType, v12)) {
          int64_t v13 = -17000;
        }
        else {
          int64_t v13 = -17006;
        }
        break;
      case 3u:
        if (isSupportedMSRInputFormat(FourCCforType, v12))
        {
          int64_t v13 = -17000;
          break;
        }
LABEL_20:
        int64_t v13 = -17006;
        break;
      case 2u:
        int64_t v13 = -17000;
        if (FourCCforType > 1647534391)
        {
          if (FourCCforType == 1647534392) {
            break;
          }
          int v14 = 1815162994;
        }
        else
        {
          if (FourCCforType == 1378955371) {
            break;
          }
          int v14 = 1380411457;
        }
        if (FourCCforType != v14) {
          goto LABEL_20;
        }
        break;
      default:
        goto LABEL_20;
    }
  }
  if (!isSupportedMSROutputFormat(v11)) {
    int64_t v13 = -17006;
  }
  if (v13 != -17000)
  {
    if (enableLogInstance)
    {
      if (self->logInstanceID) {
        unint64_t logInstanceID = self->logInstanceID;
      }
      else {
        unint64_t logInstanceID = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 134222594;
        uint64_t v18 = (const char *)WORD1(logInstanceID);
        __int16 v19 = 2080;
        *(void *)__int16 v20 = "-[HDRProcessor ValidateMSRColorConfigInput:inputSurface:outputSurface:]";
        *(_WORD *)&v20[8] = 1024;
        *(_DWORD *)uint64_t v21 = a3;
        *(_WORD *)&v21[4] = 1024;
        *(_DWORD *)uint64_t v22 = BYTE3(PixelFormat);
        *(_WORD *)&v22[4] = 1024;
        *(_DWORD *)__int16 v23 = BYTE2(PixelFormat);
        *(_WORD *)&v23[4] = 1024;
        *(_DWORD *)__int16 v24 = BYTE1(PixelFormat);
        *(_WORD *)&v24[4] = 1024;
        *(_DWORD *)__int16 v25 = PixelFormat;
        *(_WORD *)&v25[4] = 1024;
        *(_DWORD *)__int16 v26 = HIBYTE(FourCCforType);
        *(_WORD *)&v26[4] = 1024;
        *(_DWORD *)__int16 v27 = BYTE2(FourCCforType);
        *(_WORD *)&v27[4] = 1024;
        *(_DWORD *)__int16 v28 = BYTE1(FourCCforType);
        *(_WORD *)&v28[4] = 1024;
        *(_DWORD *)__int16 v29 = FourCCforType;
        *(_WORD *)&v29[4] = 1024;
        *(_DWORD *)__int16 v30 = BYTE3(v9);
        *(_WORD *)&v30[4] = 1024;
        *(_DWORD *)uint64_t v31 = BYTE2(v9);
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)__int16 v32 = BYTE1(v9);
        *(_WORD *)&v32[4] = 1024;
        *(_DWORD *)uint64_t v33 = v9;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)uint64_t v34 = HIBYTE(v11);
        *(_WORD *)&v34[4] = 1024;
        *(_DWORD *)v35 = BYTE2(v11);
        *(_WORD *)&v35[4] = 1024;
        int v36 = BYTE1(v11);
        __int16 v37 = 1024;
        int v38 = v11;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx    %s : Error: Unsupported MSR input: operation=0x%x, input=%c%c%c%c [%c%c%c%c], output=%c%c%c%c [%c%c%c%c]", (uint8_t *)&v17, 0x7Cu);
      }
      prevLogInstanceID = logInstanceID;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136319490;
      uint64_t v18 = "-[HDRProcessor ValidateMSRColorConfigInput:inputSurface:outputSurface:]";
      __int16 v19 = 1024;
      *(_DWORD *)__int16 v20 = a3;
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)&v20[6] = BYTE3(PixelFormat);
      *(_WORD *)uint64_t v21 = 1024;
      *(_DWORD *)&v21[2] = BYTE2(PixelFormat);
      *(_WORD *)uint64_t v22 = 1024;
      *(_DWORD *)&v22[2] = BYTE1(PixelFormat);
      *(_WORD *)__int16 v23 = 1024;
      *(_DWORD *)&v23[2] = PixelFormat;
      *(_WORD *)__int16 v24 = 1024;
      *(_DWORD *)&v24[2] = HIBYTE(FourCCforType);
      *(_WORD *)__int16 v25 = 1024;
      *(_DWORD *)&v25[2] = BYTE2(FourCCforType);
      *(_WORD *)__int16 v26 = 1024;
      *(_DWORD *)&v26[2] = BYTE1(FourCCforType);
      *(_WORD *)__int16 v27 = 1024;
      *(_DWORD *)&v27[2] = FourCCforType;
      *(_WORD *)__int16 v28 = 1024;
      *(_DWORD *)&v28[2] = BYTE3(v9);
      *(_WORD *)__int16 v29 = 1024;
      *(_DWORD *)&v29[2] = BYTE2(v9);
      *(_WORD *)__int16 v30 = 1024;
      *(_DWORD *)&v30[2] = BYTE1(v9);
      *(_WORD *)uint64_t v31 = 1024;
      *(_DWORD *)&v31[2] = v9;
      *(_WORD *)__int16 v32 = 1024;
      *(_DWORD *)&v32[2] = HIBYTE(v11);
      *(_WORD *)uint64_t v33 = 1024;
      *(_DWORD *)&v33[2] = BYTE2(v11);
      *(_WORD *)uint64_t v34 = 1024;
      *(_DWORD *)&v34[2] = BYTE1(v11);
      *(_WORD *)v35 = 1024;
      *(_DWORD *)&v35[2] = v11;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]    %s : Error: Unsupported MSR input: operation=0x%x, input=%c%c%c%c [%c%c%c%c], output=%c%c%c%c [%c%c%c%c]", (uint8_t *)&v17, 0x72u);
    }
  }
  return v13;
}

- (int64_t)ValidateDISPColorConfigInput:(unsigned int)a3 inputSurface:(__IOSurface *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t PixelFormat = IOSurfaceGetPixelFormat(a4);
  unsigned int v7 = PixelFormat;
  unsigned int FourCCforType = getFourCCforType(PixelFormat);
  unsigned int v10 = FourCCforType;
  if (a3 == 1 || a3 == 3)
  {
    if (isSupportedMSRInputFormat(FourCCforType, v9)) {
      return -17000;
    }
  }
  else if (a3 == 2)
  {
    int64_t result = -17000;
    if (v10 == 1380411457 || v10 == 1815162994) {
      return result;
    }
  }
  if (enableLogInstance)
  {
    if (self->logInstanceID) {
      unint64_t logInstanceID = self->logInstanceID;
    }
    else {
      unint64_t logInstanceID = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134220546;
      int v14 = (const char *)WORD1(logInstanceID);
      __int16 v15 = 2080;
      *(void *)__int16 v16 = "-[HDRProcessor ValidateDISPColorConfigInput:inputSurface:]";
      *(_WORD *)&v16[8] = 1024;
      *(_DWORD *)int v17 = a3;
      *(_WORD *)&v17[4] = 1024;
      *(_DWORD *)uint64_t v18 = HIBYTE(v7);
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)__int16 v19 = BYTE2(v7);
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)__int16 v20 = BYTE1(v7);
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)uint64_t v21 = v7;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)uint64_t v22 = HIBYTE(v10);
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)__int16 v23 = BYTE2(v10);
      *(_WORD *)&v23[4] = 1024;
      int v24 = BYTE1(v10);
      __int16 v25 = 1024;
      int v26 = v10;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : Error: Unsupported input: operation=0x%x, input=%c%c%c%c [%c%c%c%c]", (uint8_t *)&v13, 0x4Cu);
    }
    prevLogInstanceID = logInstanceID;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136317442;
    int v14 = "-[HDRProcessor ValidateDISPColorConfigInput:inputSurface:]";
    __int16 v15 = 1024;
    *(_DWORD *)__int16 v16 = a3;
    *(_WORD *)&v16[4] = 1024;
    *(_DWORD *)&v16[6] = HIBYTE(v7);
    *(_WORD *)int v17 = 1024;
    *(_DWORD *)&v17[2] = BYTE2(v7);
    *(_WORD *)uint64_t v18 = 1024;
    *(_DWORD *)&v18[2] = BYTE1(v7);
    *(_WORD *)__int16 v19 = 1024;
    *(_DWORD *)&v19[2] = v7;
    *(_WORD *)__int16 v20 = 1024;
    *(_DWORD *)&v20[2] = HIBYTE(v10);
    *(_WORD *)uint64_t v21 = 1024;
    *(_DWORD *)&v21[2] = BYTE2(v10);
    *(_WORD *)uint64_t v22 = 1024;
    *(_DWORD *)&v22[2] = BYTE1(v10);
    *(_WORD *)__int16 v23 = 1024;
    *(_DWORD *)&v23[2] = v10;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : Error: Unsupported input: operation=0x%x, input=%c%c%c%c [%c%c%c%c]", (uint8_t *)&v13, 0x42u);
  }
  return -17006;
}

- (BOOL)applyDoVi81PolicyWithInput:(__IOSurface *)a3 WithRPU:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CFStringRef v6 = (const __CFString *)IOSurfaceCopyValue(a3, @"DolbyCompatibilityID");
  if (v6)
  {
    IntValue = (HDRConfig *)CFStringGetIntValue(v6);
    if (IntValue == 1)
    {
      p_hdrMode = &self->_hdrMode;
      p_hdrMode[1] = 2;
      Config = GetConfig(IntValue);
      if (Config)
      {
        unsigned int v10 = GetConfig((HDRConfig *)Config);
        BOOL v11 = *(_DWORD *)HDRConfig::GetConfigEntryValue((uint64_t)v10, 0x3Bu, 0) != 1;
      }
      else
      {
        BOOL v11 = 1;
      }
      if (p_hdrMode[7] != 2 || !v11)
      {
        if (*p_hdrMode != 1)
        {
          if (enableLogInstance)
          {
            if (*(void *)(p_hdrMode + 101)) {
              uint64_t v13 = *(void *)(p_hdrMode + 101);
            }
            else {
              uint64_t v13 = prevLogInstanceID;
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              int v15 = 134217984;
              uint64_t v16 = WORD1(v13);
              _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"_hdrMode == kHDRContentDolbyVision\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/HDRProcessorMetal.mm\" at line 1734\n", (uint8_t *)&v15, 0xCu);
            }
            prevLogInstanceID = v13;
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v15) = 0;
            _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"_hdrMode == kHDRContentDolbyVision\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/HDRProcessorMetal.mm\" at line 1734\n", (uint8_t *)&v15, 2u);
          }
        }
      }
      else
      {
        a4 = 0;
        unsigned int *p_hdrMode = 2;
      }
    }
  }
  return a4;
}

- (int64_t)updateDoVi81StateWithRPU:(BOOL)a3 hasHDR10PlusSEIData:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  p_hdrMode = &self->_hdrMode;
  Config = GetConfig((HDRConfig *)self);
  if (Config)
  {
    uint64_t v8 = GetConfig((HDRConfig *)Config);
    unsigned int v9 = *(_DWORD *)HDRConfig::GetConfigEntryValue((uint64_t)v8, 0x3Bu, 0);
    if (!v5) {
      goto LABEL_11;
    }
  }
  else
  {
    unsigned int v9 = 0;
    if (!v5) {
      goto LABEL_11;
    }
  }
  if (v4 || p_hdrMode[7] == 2)
  {
    if (v9 == 2 || v9 == 1 || (unsigned int v9 = p_hdrMode[7], v9 == 2))
    {
      unsigned int *p_hdrMode = v9;
    }
    else if (*p_hdrMode != 1)
    {
      if (enableLogInstance)
      {
        if (*(void *)(p_hdrMode + 101)) {
          uint64_t v15 = *(void *)(p_hdrMode + 101);
        }
        else {
          uint64_t v15 = prevLogInstanceID;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 134217984;
          uint64_t v17 = (const char *)WORD1(v15);
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"_hdrMode == kHDRContentDolbyVision\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/HDRProcessorMetal.mm\" at line 1765\n", (uint8_t *)&v16, 0xCu);
        }
        prevLogInstanceID = v15;
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"_hdrMode == kHDRContentDolbyVision\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/HDRProcessorMetal.mm\" at line 1765\n", (uint8_t *)&v16, 2u);
      }
    }
    return -17000;
  }
LABEL_11:
  unsigned int v10 = *p_hdrMode;
  if (*p_hdrMode != 2)
  {
    if (v10 != 1 || p_hdrMode[7] == 2 || !v5) {
      goto LABEL_17;
    }
    return -17000;
  }
  if (p_hdrMode[7] == 2) {
    return -17000;
  }
LABEL_17:
  if (enableLogInstance)
  {
    if (*(void *)(p_hdrMode + 101)) {
      uint64_t v11 = *(void *)(p_hdrMode + 101);
    }
    else {
      uint64_t v11 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = p_hdrMode[7];
      int v16 = 134219266;
      uint64_t v17 = (const char *)WORD1(v11);
      __int16 v18 = 2080;
      *(void *)__int16 v19 = "-[HDRProcessor updateDoVi81StateWithRPU:hasHDR10PlusSEIData:]";
      *(_WORD *)&v19[8] = 1024;
      *(_DWORD *)__int16 v20 = v10;
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)uint64_t v21 = v12;
      *(_WORD *)&v21[4] = 1024;
      BOOL v22 = v5;
      __int16 v23 = 1024;
      BOOL v24 = v4;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : Error: Unsupported DoVi81 state: _hdrMode = %d, _displayType = %d, hasRPUData = %d, hasHDR10PlusSEIData = %d", (uint8_t *)&v16, 0x2Eu);
    }
    prevLogInstanceID = v11;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = p_hdrMode[7];
    int v16 = 136316162;
    uint64_t v17 = "-[HDRProcessor updateDoVi81StateWithRPU:hasHDR10PlusSEIData:]";
    __int16 v18 = 1024;
    *(_DWORD *)__int16 v19 = v10;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&unsigned char v19[6] = v13;
    *(_WORD *)__int16 v20 = 1024;
    *(_DWORD *)&v20[2] = v5;
    *(_WORD *)uint64_t v21 = 1024;
    *(_DWORD *)&v21[2] = v4;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : Error: Unsupported DoVi81 state: _hdrMode = %d, _displayType = %d, hasRPUData = %d, hasHDR10PlusSEIData = %d", (uint8_t *)&v16, 0x24u);
  }
  return -17006;
}

- (int64_t)processFrameInternalWithLayer0:(__IOSurface *)a3 layer1:(__IOSurface *)a4 outout:(__IOSurface *)a5 metadata:(id)a6 commandbuffer:(id)a7 operation:(unsigned int)a8 config:(id *)a9 histogram:(RgbHistogram_t *)a10 data:(id *)a11
{
  uint64_t v156 = *MEMORY[0x263EF8340];
  p_hdr10PlusMetaDataParser = &self->_hdr10PlusMetaDataParser;
  id v16 = a6;
  id v142 = a7;
  UpdateConfigFromDefaultsWrite((HDRConfig *)*((unsigned int *)p_hdr10PlusMetaDataParser + 102));
  v138 = a4;
  BOOL v17 = IsGpuOnlySystem();
  if (!v17)
  {
    Config = GetConfig((HDRConfig *)v17);
    if (Config)
    {
      __int16 v19 = GetConfig((HDRConfig *)Config);
      HDRConfig::GetConfigEntryValue((uint64_t)v19, 0x18u, 0);
    }
  }
  id v20 = v16;

  cf = v20;
  v134 = [v20 valueForKey:@"DolbyVisionRPUData"];
  uint64_t v21 = [v134 length];
  id v141 = v134;
  uint64_t v22 = [v141 bytes];
  if (v22) {
    BOOL v23 = v21 == 0;
  }
  else {
    BOOL v23 = 1;
  }
  uint64_t v24 = !v23;
  uint64_t v25 = p_hdr10PlusMetaDataParser[51];
  BOOL v135 = *((_DWORD *)p_hdr10PlusMetaDataParser + 28) == 1
      && [(MSRHDRProcessing *)self->_msr isMMREnabled];
  uint64_t v150 = 0;
  uint64_t v151 = 0;
  [(HDRProcessor *)self extractCAMetaData:cf withRPU:v24];
  int v145 = v25 & 1;
  edrMetaData = self->_edrMetaData;
  v148 = &self->_edrMetaData[v25 & 1];
  p_targetMaxLinear = &v148->tcControl.targetMaxLinear;
  -[HDRProcessor extractFrameMetadata:intoTCControl:](self, "extractFrameMetadata:intoTCControl:", cf);
  BOOL v147 = [(HDRProcessor *)self applyDoVi81PolicyWithInput:a3 WithRPU:v24];
  unsigned int v26 = *((_DWORD *)p_hdr10PlusMetaDataParser + 36);
  p_infoFrameData = &v148->infoFrameData;
  int64_t v27 = -[HDRProcessor checkInputOutputIOSurface:output:tcControl:forInfoFrame:withRPUData:](self, "checkInputOutputIOSurface:output:tcControl:forInfoFrame:withRPUData:", a3, a5, &v148->tcControl);
  if (v27 != -17000)
  {
    if (!enableLogInstance)
    {
      int64_t v37 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      if (v37)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] checkInputOutputIOSurface() failed!", buf, 2u);
      }
      int v38 = 0;
      uint64_t v39 = 0;
      goto LABEL_203;
    }
    if (p_hdr10PlusMetaDataParser[65]) {
      uint64_t v36 = (uint64_t)p_hdr10PlusMetaDataParser[65];
    }
    else {
      uint64_t v36 = prevLogInstanceID;
    }
    int64_t v37 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (v37)
    {
      *(_DWORD *)buf = 134217984;
      v153 = (char *)WORD1(v36);
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx checkInputOutputIOSurface() failed!", buf, 0xCu);
    }
    int v38 = 0;
    uint64_t v39 = 0;
LABEL_32:
    prevLogInstanceID = v36;
    goto LABEL_203;
  }
  CFTypeRef v139 = IOSurfaceCopyValue(a3, @"HDR10PlusData");
  uint64_t ConfigEntryValue = +[HDRProcessor isNSDataNonEmpty:v139 dataLength:&v151 dataBytes:&v150];
  uint64_t v29 = ConfigEntryValue;
  unsigned int v30 = (v26 > 7) | (0x47u >> v26);
  p_hdr10PlusMetaDataIsValid = &edrMetaData[v145].tcControl.hdr10PlusMetaDataIsValid;
  BOOL *p_hdr10PlusMetaDataIsValid = 0;
  if (!(v30 & 1 | ((ConfigEntryValue & 1) == 0)))
  {
    uint64_t ConfigEntryValue = (uint64_t)GetConfig((HDRConfig *)ConfigEntryValue);
    if (ConfigEntryValue)
    {
      __int16 v32 = GetConfig((HDRConfig *)ConfigEntryValue);
      uint64_t ConfigEntryValue = HDRConfig::GetConfigEntryValue((uint64_t)v32, 0x5Eu, 0);
      if (*(unsigned char *)ConfigEntryValue)
      {
        ((void (*)(HDR10PlusMetaData_RBSP *, uint64_t, uint64_t))*(*p_hdr10PlusMetaDataParser)->var0)(*p_hdr10PlusMetaDataParser, v150, v151);
        uint64_t ConfigEntryValue = HDR10PlusMetaData_RBSP::parse_hdr10plus_sei((uint64_t)*p_hdr10PlusMetaDataParser, (uint64_t)&edrMetaData[v145].tcControl.hdr10PlusMetaData);
        if (ConfigEntryValue)
        {
          if (enableLogInstance)
          {
            if (p_hdr10PlusMetaDataParser[65]) {
              uint64_t v33 = (uint64_t)p_hdr10PlusMetaDataParser[65];
            }
            else {
              uint64_t v33 = prevLogInstanceID;
            }
            uint64_t v34 = &_os_log_internal;
            id v35 = &_os_log_internal;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v153 = (char *)WORD1(v33);
              __int16 v154 = 2080;
              *(void *)v155 = "-[HDRProcessor processFrameInternalWithLayer0:layer1:outout:metadata:commandbuffer:opera"
                                "tion:config:histogram:data:]";
              _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx     %s: illegal HDR10Plus SEI, fall back to HDR10", buf, 0x16u);
            }

            prevLogInstanceID = v33;
          }
          else
          {
            char v40 = &_os_log_internal;
            id v41 = &_os_log_internal;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v153 = "-[HDRProcessor processFrameInternalWithLayer0:layer1:outout:metadata:commandbuffer:operation:config"
                     ":histogram:data:]";
              _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]     %s: illegal HDR10Plus SEI, fall back to HDR10", buf, 0xCu);
            }
          }
        }
        else
        {
          BOOL *p_hdr10PlusMetaDataIsValid = 1;
        }
      }
    }
  }
  v42 = (HDRConfig *)GetConfig((HDRConfig *)ConfigEntryValue);
  if (v42
    && (__int16 v43 = GetConfig(v42), v42 = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v43, 0x1Du, 0), *(unsigned char *)v42))
  {
    __int16 v44 = [(DolbyVisionDisplayManagement *)self->_dm getHistBasedToneMapping];
    LODWORD(v45) = 1045220557;
    [v44 getHistStatFromLayer:a3 HDRMode:*((unsigned int *)p_hdr10PlusMetaDataParser + 29) transferFunction:*((unsigned int *)p_hdr10PlusMetaDataParser + 84) temporalMode:2 iirAlpha:p_hdr10PlusMetaDataParser[51] frameNumber:v45];
    v42 = (HDRConfig *)[v44 isDataValid];
  }
  else
  {
    __int16 v44 = 0;
  }
  __int16 v46 = GetConfig(v42);
  if (v46 && (uint64_t v47 = GetConfig((HDRConfig *)v46), *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v47, 0xBu, 0)))
  {
    uint64_t v48 = [(DolbyVisionDisplayManagement *)self->_dm getHistBasedToneMapping];

    uint64_t v39 = v48;
    [v48 debugHistDataFromLayer:a3];
  }
  else
  {
    uint64_t v39 = v44;
  }
  [(HDRProcessor *)self getAmbientViewingEnvironmentType:a3];
  [(HDRProcessor *)self getAMVEStrengthValueFromIOSurface:a3];
  if (*((_DWORD *)p_hdr10PlusMetaDataParser + 29) != 1
    || p_hdr10PlusMetaDataParser[42] != (HDR10PlusMetaData_RBSP *)18
    || *((_DWORD *)p_hdr10PlusMetaDataParser + 71) != 1
    || (*((_DWORD *)p_hdr10PlusMetaDataParser + 36) - 5) < 0xFFFFFFFE
    || *((float *)p_hdr10PlusMetaDataParser + 73) == 1.0)
  {
    *((unsigned char *)p_hdr10PlusMetaDataParser + 288) = 0;
  }
  [(HDRProcessor *)self getSceneIllumination:a3];
  if (*((_DWORD *)p_hdr10PlusMetaDataParser + 30) == 2)
  {
    int64_t v27 = [(HDRProcessor *)self updateDoVi81StateWithRPU:v147 hasHDR10PlusSEIData:v29];
    if (v27 != -17000)
    {
      if (!enableLogInstance)
      {
        int64_t v37 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
        if (v37)
        {
          *(_DWORD *)buf = 136315394;
          v153 = "-[HDRProcessor processFrameInternalWithLayer0:layer1:outout:metadata:commandbuffer:operation:config:histogram:data:]";
          __int16 v154 = 2048;
          *(void *)v155 = v27;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]     %s : Error: Unsupported config! retVal = %d", buf, 0x16u);
        }
        int v38 = 0;
        goto LABEL_203;
      }
      if (p_hdr10PlusMetaDataParser[65]) {
        uint64_t v36 = (uint64_t)p_hdr10PlusMetaDataParser[65];
      }
      else {
        uint64_t v36 = prevLogInstanceID;
      }
      int64_t v37 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      if (v37)
      {
        *(_DWORD *)buf = 134218498;
        v153 = (char *)WORD1(v36);
        __int16 v154 = 2080;
        *(void *)v155 = "-[HDRProcessor processFrameInternalWithLayer0:layer1:outout:metadata:commandbuffer:operation:c"
                          "onfig:histogram:data:]";
        *(_WORD *)&v155[8] = 2048;
        *(void *)&v155[10] = v27;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx     %s : Error: Unsupported config! retVal = %d", buf, 0x20u);
      }
      int v38 = 0;
      goto LABEL_32;
    }
  }
  uint64_t v49 = [(HDRProcessor *)self selectHDRUsage:a8 withRPU:v147];
  int v50 = v49;
  uint64_t p_dmData = (uint64_t)&v148->dmData;
  if (v49 > 0xF || ((1 << v49) & 0xC01C) == 0)
  {
    BOOL v136 = 0;
LABEL_115:
    EDRMetaData_RBSP::set_rpu_data_forHDRx(self->_parser, (char *)v148, p_dmData, v50);
    v73 = p_hdr10PlusMetaDataParser[48];
    int v38 = 0;
    if (((unint64_t)&v73[-5].var12 + 7) >> 3 <= 0x464) {
      edrMetaData[v145].dmData.source_max_PQ = PQIn12Bit((float)(int)v73);
    }
    goto LABEL_126;
  }
  ((void (*)(EDRMetaData_RBSP *, uint64_t, uint64_t, uint64_t))*self->_parser->var0)(self->_parser, v22, v21, v49);
  if (EDRMetaData_RBSP::parse_rpu_data((uint64_t)self->_parser, v148, p_dmData))
  {
    int v38 = 0;
    int64_t v27 = -17003;
    goto LABEL_219;
  }
  float v52 = powf((float)(unint64_t)p_hdr10PlusMetaDataParser[20] * 0.0001, 0.1593);
  float v54 = powf((float)((float)(v52 * 18.852) + 0.83594) / (float)((float)(v52 * 18.688) + 1.0), 78.844);
  int v56 = v145;
  v55 = self->_edrMetaData;
  uint64_t v57 = (uint64_t)&edrMetaData[v145].dmData;
  *(_WORD *)(v57 + 648) = (int)(float)(v54 * 4095.0);
  *(_DWORD *)(v57 + 652) = *((_DWORD *)p_hdr10PlusMetaDataParser + 66);
  if (v147)
  {
    BOOL v58 = v135;
    BOOL v59 = v148->composerData.mapping_idc[0][0][1][0] == 1 || v148->composerData.mapping_idc[0][0][2][0] == 1;
  }
  else
  {
    BOOL v59 = 0;
    BOOL v58 = v135;
  }
  p_L254 = &edrMetaData[v145].dmData.L254;
  if (p_L254->valid) {
    uint64_t v61 = edrMetaData[v145].dmData.L254.dm_version_index + 2;
  }
  else {
    uint64_t v61 = 3;
  }
  BOOL v136 = v59;
  if (!v58
    && v59
    && (*((_DWORD *)p_hdr10PlusMetaDataParser + 30) == 2
     || (uint64_t v53 = (uint64_t)GetConfig((HDRConfig *)v53)) != 0
     && (v63 = GetConfig((HDRConfig *)v53),
         uint64_t v53 = HDRConfig::GetConfigEntryValue((uint64_t)v63, 0x51u, 0),
         int v56 = v145,
         v55 = self->_edrMetaData,
         *(unsigned char *)v53)))
  {
    if (*((unsigned char *)p_hdr10PlusMetaDataParser + 396)) {
      double v64 = (double)(unint64_t)p_hdr10PlusMetaDataParser[48];
    }
    else {
      double v64 = 0.0;
    }
    float v65 = v64;
    if (*((unsigned char *)p_hdr10PlusMetaDataParser + 397)) {
      float v66 = *((float *)p_hdr10PlusMetaDataParser + 98);
    }
    else {
      float v66 = 0.0;
    }
    if (v65 == 0.0) {
      float v67 = 1000.0;
    }
    else {
      float v67 = v65;
    }
    if (v66 == 0.0) {
      float v68 = 0.001;
    }
    else {
      float v68 = v66;
    }
    LODWORD(v133) = p_hdr10PlusMetaDataParser[51];
    uint64_t v53 = [(DolbyVisionMR *)self->_mr metadataReconstruction:v148 dmData:p_dmData maxDisplayBrightnessNits:self->_displayPrimaries targetMaxNits:*((unsigned int *)p_hdr10PlusMetaDataParser + 80) targetMinNits:*((unsigned int *)p_hdr10PlusMetaDataParser + 82) displayPrimaries:*((unsigned int *)p_hdr10PlusMetaDataParser + 86) baseMax:(double)(unint64_t)p_hdr10PlusMetaDataParser[20] baseMin:*p_targetMaxLinear videoFullRangeFlag:v55[v56].tcControl.targetMinLinear colourPrimaries:v67 matrixCoeffs:v68 numFrames:v133];
    if (v53)
    {
      char v62 = 1;
    }
    else if (p_L254->valid)
    {
      char v62 = 0;
      uint64_t v61 = v55[v56].dmData.L254.dm_version_index + 2;
    }
    else
    {
      char v62 = 0;
      uint64_t v61 = 3;
    }
  }
  else
  {
    char v62 = 0;
  }
  v69 = GetConfig((HDRConfig *)v53);
  if (v69
    && (v70 = GetConfig((HDRConfig *)v69), *((_DWORD *)v70 + 1829))
    && (v70[3656] & 0x80) != 0
    && *((_DWORD *)p_hdr10PlusMetaDataParser + 30) == 2)
  {
    v71 = GetConfig((HDRConfig *)v70);
    if (v71)
    {
      v72 = GetConfig((HDRConfig *)v71);
      if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v72, 0x53u, 0)) {
        goto LABEL_110;
      }
    }
  }
  else if (v62)
  {
LABEL_110:
    *((_DWORD *)p_hdr10PlusMetaDataParser + 29) = 2;
    if (!p_hdr10PlusMetaDataParser[48]) {
      p_hdr10PlusMetaDataParser[48] = (HDR10PlusMetaData_RBSP *)1000;
    }
    if (*((float *)p_hdr10PlusMetaDataParser + 98) == 0.0) {
      *((_DWORD *)p_hdr10PlusMetaDataParser + 98) = 981668463;
    }
    int v50 = [(HDRProcessor *)self selectHDRUsage:a8 withRPU:0];
    BOOL v147 = 0;
    goto LABEL_115;
  }
  [(DolbyVisionDisplayManagement *)self->_dm setInputDmVersion:v61];
  int v38 = [(DolbyVisionDisplayManagement *)self->_dm getDolbyVisionDM4];
  [v38 initDmAlgVerInCm:v61];
  v74 = p_hdr10PlusMetaDataParser[71];
  if ((HDR10PlusMetaData_RBSP *)*MEMORY[0x263F03F08] == v74)
  {
    uint64_t v75 = 1;
  }
  else
  {
    uint64_t v75 = 12;
    if ((HDR10PlusMetaData_RBSP *)*MEMORY[0x263F03F20] != v74)
    {
      if ((HDR10PlusMetaData_RBSP *)*MEMORY[0x263F03F00] == v74) {
        uint64_t v75 = 9;
      }
      else {
        uint64_t v75 = 12;
      }
    }
  }
  [v38 initOutputColorPrimaries:v75];
  p_hdr10PlusMetaDataParser[48] = (HDR10PlusMetaData_RBSP *)(int)(PQ12Bit2LinFloat(edrMetaData[v145].dmData.source_max_PQ)
                                                                + 0.5);
  *((float *)p_hdr10PlusMetaDataParser + 98) = PQ12Bit2LinFloat(edrMetaData[v145].dmData.source_min_PQ);
LABEL_126:
  CFRelease(cf);
  if (v139) {
    CFRelease(v139);
  }
  uint64_t PixelFormat = IOSurfaceGetPixelFormat(a5);
  *((_DWORD *)p_hdr10PlusMetaDataParser + 76) = PixelFormat;
  unsigned int FourCCforType = (HDRConfig *)getFourCCforType(PixelFormat);
  *((_DWORD *)p_hdr10PlusMetaDataParser + 78) = FourCCforType;
  int v79 = v145;
  v78 = self->_edrMetaData;
  uint64_t p_tcControl = (uint64_t)&edrMetaData[v145].tcControl;
  *(_DWORD *)(p_tcControl + 108) = *((_DWORD *)p_hdr10PlusMetaDataParser + 76);
  *(_DWORD *)(p_tcControl + 112) = FourCCforType;
  *(int32x2_t *)(p_tcControl + 68) = vrev64_s32((int32x2_t)p_hdr10PlusMetaDataParser[17]);
  v81 = GetConfig(FourCCforType);
  if (v81)
  {
    v82 = GetConfig((HDRConfig *)v81);
    if (*((_DWORD *)v82 + 1741))
    {
      if ((v82[3480] & 0x80) != 0)
      {
        v83 = (HDRConfig *)GetConfig((HDRConfig *)v82);
        if (v83)
        {
          v84 = GetConfig(v83);
          v83 = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v84, 0x4Fu, 0);
          int v79 = v145;
          v78 = self->_edrMetaData;
          if (*(_DWORD *)v83 == 9)
          {
            v85 = (HDR10PlusMetaData_RBSP **)MEMORY[0x263F03F00];
LABEL_137:
            p_hdr10PlusMetaDataParser[71] = *v85;
            goto LABEL_138;
          }
        }
        v86 = GetConfig(v83);
        if (v86)
        {
          v87 = GetConfig((HDRConfig *)v86);
          int v79 = v145;
          v78 = self->_edrMetaData;
          if (*(_DWORD *)HDRConfig::GetConfigEntryValue((uint64_t)v87, 0x4Fu, 0) == 12)
          {
            v85 = (HDR10PlusMetaData_RBSP **)MEMORY[0x263F03F20];
            goto LABEL_137;
          }
        }
      }
    }
  }
LABEL_138:
  v88 = p_hdr10PlusMetaDataParser[71];
  *(void *)&v78[v79].tcControl.contrastRatio = *(HDR10PlusMetaData_RBSP **)((char *)p_hdr10PlusMetaDataParser + 172);
  uint64_t p_contrastRatio = (uint64_t)&v78[v79].tcControl.contrastRatio;
  *(void *)(p_contrastRatio + 48) = v88;
  *(_DWORD *)(p_contrastRatio + 8) = *((_DWORD *)p_hdr10PlusMetaDataParser + 48);
  *(int32x2_t *)(p_contrastRatio + 56) = vrev64_s32(vmovn_s64(*(int64x2_t *)(p_hdr10PlusMetaDataParser + 45)));
  *(_DWORD *)(p_contrastRatio + 64) = p_hdr10PlusMetaDataParser[47];
  *(_DWORD *)(p_contrastRatio + 108) = 0;
  v90 = (_DWORD *)(p_contrastRatio + 108);
  ProtectionOptions = (HDRConfig *)IOSurfaceGetProtectionOptions();
  v92 = &edrMetaData[v145];
  v94 = (char *)&v92->tcControl + 152;
  char v93 = *((unsigned char *)&v92->tcControl + 152);
  v92->tcControl.isDRM = ProtectionOptions != 0;
  *((unsigned char *)&v92->tcControl + 152) = v93 & 0xFE;
  v95 = (HDRConfig *)GetConfig(ProtectionOptions);
  if (v95)
  {
    v96 = GetConfig(v95);
    v95 = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v96, 0x23u, 0);
    if (*(unsigned char *)v95)
    {
      if (*((_DWORD *)p_hdr10PlusMetaDataParser + 36) == 2 && !*((_DWORD *)p_hdr10PlusMetaDataParser + 28)) {
        *v94 |= 1u;
      }
    }
  }
  if (*v94) {
    goto LABEL_151;
  }
  v97 = GetConfig(v95);
  if (v97)
  {
    v98 = GetConfig((HDRConfig *)v97);
    v99 = (unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v98, 0x2Eu, 0);
    if (a8 == 1 || *v99) {
      goto LABEL_151;
    }
  }
  else if (a8 == 1)
  {
    goto LABEL_151;
  }
  if (a8 - 1 < 4 || v92->tcControl.operationFromDict != 1)
  {
    *v94 &= ~2u;
    goto LABEL_152;
  }
LABEL_151:
  *v94 |= 2u;
  edrMetaData[v145].tcControl.AmbientInNits = -1.0;
LABEL_152:
  p_hdrControl = &v148->hdrControl;
  v101 = (HDRConfig *)[(HDRProcessor *)self setHDRControl:&v148->hdrControl withTCControl:p_targetMaxLinear withRPU:v147 withMMR:v136 withDmData:p_dmData withOperation:a8];
  if (v148->hdrControl.hdrContent != 1 || edrMetaData[v145].hdrControl.displayType != 2) {
    goto LABEL_168;
  }
  v101 = (HDRConfig *)GetConfig(v101);
  if (!v101)
  {
    if (!edrMetaData[v145].hdrControl.gpuTmRefMode) {
      goto LABEL_166;
    }
LABEL_161:
    _DWORD *v90 = 3;
    goto LABEL_168;
  }
  v102 = GetConfig(v101);
  v101 = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v102, 0x16u, 0);
  if (edrMetaData[v145].hdrControl.gpuTmRefMode) {
    goto LABEL_161;
  }
  int v103 = *(_DWORD *)v101;
  if (*(_DWORD *)v101 >= 3u)
  {
    _DWORD *v90 = 1;
  }
  else
  {
    _DWORD *v90 = v103;
    if ((v103 - 1) > 1) {
      goto LABEL_168;
    }
  }
  if (!*((_DWORD *)p_hdr10PlusMetaDataParser + 28))
  {
    double *p_targetMaxLinear = 1000.0;
    goto LABEL_168;
  }
  if (edrMetaData[v145].hdrControl.operation != 3 || *p_targetMaxLinear != 1000.0) {
LABEL_166:
  }
    _DWORD *v90 = 0;
LABEL_168:
  if (*((unsigned char *)p_hdr10PlusMetaDataParser + 528))
  {
    *((unsigned char *)p_hdr10PlusMetaDataParser + 528) = 0;
    if (enableLogInstance)
    {
      if (p_hdr10PlusMetaDataParser[65]) {
        uint64_t v104 = (uint64_t)p_hdr10PlusMetaDataParser[65];
      }
      else {
        uint64_t v104 = prevLogInstanceID;
      }
      v105 = &_os_log_internal;
      id v106 = &_os_log_internal;
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        v107 = contentTypeName[p_hdrControl->hdrContent];
        *(_DWORD *)buf = 134218242;
        v153 = (char *)WORD1(v104);
        __int16 v154 = 2080;
        *(void *)v155 = v107;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx ContentType: %s", buf, 0x16u);
      }

      prevLogInstanceID = v104;
      uint64_t p_dmData = (uint64_t)&v148->dmData;
    }
    else
    {
      v108 = &_os_log_internal;
      id v109 = &_os_log_internal;
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      {
        v110 = contentTypeName[p_hdrControl->hdrContent];
        *(_DWORD *)buf = 136315138;
        v153 = v110;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] ContentType: %s", buf, 0xCu);
      }
    }
  }
  v111 = GetConfig(v101);
  if (v111)
  {
    v112 = GetConfig((HDRConfig *)v111);
    if (*((_DWORD *)v112 + 2775))
    {
      if ((v112[5548] & 0x80) != 0)
      {
        v113 = GetConfig((HDRConfig *)v112);
        if (v113)
        {
          v114 = GetConfig((HDRConfig *)v113);
          float v115 = *(double *)HDRConfig::GetConfigEntryValue((uint64_t)v114, 0x7Eu, 0);
        }
        else
        {
          float v115 = 0.0;
        }
        *(float *)uint64_t p_contrastRatio = v115;
      }
    }
  }
  int v116 = *((_DWORD *)p_hdr10PlusMetaDataParser + 28);
  if (v116 == 1)
  {
    if (a11)
    {
      int64_t v37 = [(MSRHDRProcessing *)self->_msr processFrameByMSRWithComposerData:v148 DM:self->_dm DMData:p_dmData tcControl:p_targetMaxLinear hdrControl:p_hdrControl hdr10InfoFrame:p_infoFrameData layer0:a3 layer1:v138 output:a5 frameNumebr:p_hdr10PlusMetaDataParser[51] computedNumber:&self->_numberOfComputedFrames config:a11];
    }
    else if (enableLogInstance)
    {
      if (p_hdr10PlusMetaDataParser[65]) {
        uint64_t v117 = (uint64_t)p_hdr10PlusMetaDataParser[65];
      }
      else {
        uint64_t v117 = prevLogInstanceID;
      }
      v118 = &_os_log_internal;
      id v119 = &_os_log_internal;
      if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v153 = (char *)WORD1(v117);
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/HDRProcessorMetal.mm\" at line 2355\n", buf, 0xCu);
      }

      prevLogInstanceID = v117;
    }
    else
    {
      v120 = &_os_log_internal;
      id v121 = &_os_log_internal;
      if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/HDRProcessorMetal.mm\" at line 2355\n", buf, 2u);
      }
    }
  }
  else
  {
    if (v116 != 2)
    {
      int64_t v37 = [(HDRProcessor *)self processPixelsWithLayer0:a3 layer1:v138 output:a5 metaData:v148 tcControl:p_targetMaxLinear hdrControl:p_hdrControl hdr10InfoFrame:p_infoFrameData commandbuffer:v142 frameNumebr:p_hdr10PlusMetaDataParser[51]];
      int64_t v27 = v37;
      goto LABEL_203;
    }
    int64_t v37 = [(DISPHDRProcessing *)self->_disp processFrameByDISPWithComposerData:v148 DM:self->_dm DMData:p_dmData tcControl:p_targetMaxLinear hdrControl:p_hdrControl hdr10InfoFrame:p_infoFrameData layer0:a3 layer1:v138 frameNumebr:p_hdr10PlusMetaDataParser[51]];
  }
  int64_t v27 = -17000;
LABEL_203:
  unint64_t v122 = (unint64_t)&p_hdr10PlusMetaDataParser[51]->var0 + 1;
  p_hdr10PlusMetaDataParser[51] = (HDR10PlusMetaData_RBSP *)v122;
  if (v122 >= 0x80)
  {
    v123 = GetConfig((HDRConfig *)v37);
    if (v123)
    {
      v124 = GetConfig((HDRConfig *)v123);
      if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v124, 0x4Cu, 0)) {
        p_hdr10PlusMetaDataParser[51] = 0;
      }
    }
  }
  if (v27 == -17000)
  {
    int64_t v27 = -17000;
  }
  else if (enableLogInstance)
  {
    if (p_hdr10PlusMetaDataParser[65]) {
      uint64_t v125 = (uint64_t)p_hdr10PlusMetaDataParser[65];
    }
    else {
      uint64_t v125 = prevLogInstanceID;
    }
    v126 = &_os_log_internal;
    id v127 = &_os_log_internal;
    if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
    {
      v128 = p_hdr10PlusMetaDataParser[51];
      *(_DWORD *)buf = 134218754;
      v153 = (char *)WORD1(v125);
      __int16 v154 = 2080;
      *(void *)v155 = "-[HDRProcessor processFrameInternalWithLayer0:layer1:outout:metadata:commandbuffer:operation:con"
                        "fig:histogram:data:]";
      *(_WORD *)&v155[8] = 1024;
      *(_DWORD *)&v155[10] = v27;
      *(_WORD *)&v155[14] = 2048;
      *(void *)&v155[16] = v128;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx -- %s : Failed with error %d, _numberOfScheduledFrames=%ld\n", buf, 0x26u);
    }

    prevLogInstanceID = v125;
  }
  else
  {
    v129 = &_os_log_internal;
    id v130 = &_os_log_internal;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v131 = p_hdr10PlusMetaDataParser[51];
      *(_DWORD *)buf = 136315650;
      v153 = "-[HDRProcessor processFrameInternalWithLayer0:layer1:outout:metadata:commandbuffer:operation:config:histogram:data:]";
      __int16 v154 = 1024;
      *(_DWORD *)v155 = v27;
      *(_WORD *)&v155[4] = 2048;
      *(void *)&v155[6] = v131;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] -- %s : Failed with error %d, _numberOfScheduledFrames=%ld\n", buf, 0x1Cu);
    }
  }
LABEL_219:

  return v27;
}

- (int64_t)processPixelsWithLayer0:(__IOSurface *)a3 layer1:(__IOSurface *)a4 output:(__IOSurface *)a5 metaData:(id *)a6 tcControl:(ToneCurve_Control *)a7 hdrControl:(id *)a8 hdr10InfoFrame:(id *)a9 commandbuffer:(id)a10 frameNumebr:(unint64_t)a11
{
  p_usage = &self->_configurationParameters.usage;
  id v19 = a10;
  p_var1 = &a6->var1;
  CVPixelBufferRef v29 = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  if (*p_usage == 3)
  {
    int64_t v21 = -17000;
    if (a4)
    {
LABEL_10:
      [(DolbyVisionDisplayManagement *)self->_dm encodeToCommandBuffer:v19 Input:a3 Output:a5 MetaData:p_var1];
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v25 = a8;
    unsigned int v26 = a7;
    IOSurfaceRef IOSurface = a4;
    if (a6->var0.var9)
    {
      CVPixelBufferPoolCreatePixelBuffer(0, *((CVPixelBufferPoolRef *)p_usage + 4), &pixelBufferOut);
      IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(pixelBufferOut);
      [(SpatialResampler *)self->_resampler encodeToCommandBuffer:v19 input:a4 output:IOSurface];
    }
    BOOL v23 = a5;
    if (a4)
    {
      CVPixelBufferPoolCreatePixelBuffer(0, *((CVPixelBufferPoolRef *)p_usage + 5), &v29);
      BOOL v23 = CVPixelBufferGetIOSurface(v29);
    }
    int64_t v21 = [(DolbyVisionComposer *)self->_composer encodeToCommandBuffer:v19 BL:a3 EL:IOSurface Output:v23 ComposerData:a6 DM:self->_dm DMData:&a6->var1 tcControl:v26 hdrControl:v25 hdr10InfoFrame:a9 frameNumber:a11];
    a3 = v23;
    if (a4) {
      goto LABEL_10;
    }
  }
  if (*p_usage == 3) {
    goto LABEL_10;
  }
LABEL_11:
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __125__HDRProcessor_processPixelsWithLayer0_layer1_output_metaData_tcControl_hdrControl_hdr10InfoFrame_commandbuffer_frameNumebr___block_invoke;
  v27[3] = &unk_264605BD0;
  v27[4] = self;
  [v19 addScheduledHandler:v27];

  return v21;
}

uint64_t __125__HDRProcessor_processPixelsWithLayer0_layer1_output_metaData_tcControl_hdrControl_hdr10InfoFrame_commandbuffer_frameNumebr___block_invoke(uint64_t result)
{
  return result;
}

- (int64_t)checkInputIOSurface:(__IOSurface *)a3 forInfoFrame:(id *)a4 withRPUData:(BOOL)a5
{
  p_hdrMode = &self->_hdrMode;
  if (a5)
  {
    [(HDRProcessor *)self extractHEVCHDRParameterFromInputIOSurfaceForDovi:a3 forInfoFrame:a4];
    int64_t v7 = -17000;
  }
  else
  {
    int64_t v7 = [(HDRProcessor *)self extractHEVCHDRParameterFromInputIOSurface:a3 forInfoFrame:a4];
  }
  if (*p_hdrMode == 1)
  {
    if (*(void *)(p_hdrMode + 55) == 18) {
      p_hdrMode[1] = 3;
    }
    uint64_t PixelFormat = IOSurfaceGetPixelFormat(a3);
    if (getFourCCforType(PixelFormat) == 1111970369) {
      return -17007;
    }
  }
  return v7;
}

- (int64_t)checkInputOutputIOSurface:(__IOSurface *)a3 output:(__IOSurface *)a4 tcControl:(ToneCurve_Control *)a5 forInfoFrame:(id *)a6 withRPUData:(BOOL)a7
{
  int64_t v11 = [(HDRProcessor *)self checkInputIOSurface:a3 forInfoFrame:a6 withRPUData:a7];
  if (v11 == -17000)
  {
    if (a4)
    {
      [(HDRProcessor *)self checkOutputIOSurface:a4];
      int64_t v11 = -17000;
      if (a5->orientation)
      {
        size_t WidthOfPlane = IOSurfaceGetWidthOfPlane(a3, 0);
        size_t HeightOfPlane = IOSurfaceGetHeightOfPlane(a3, 0);
        size_t v14 = IOSurfaceGetWidthOfPlane(a4, 0);
        size_t v15 = IOSurfaceGetHeightOfPlane(a4, 0);
        BOOL v16 = HeightOfPlane == v15 && WidthOfPlane == v14;
        int64_t v17 = -17006;
        if (v16) {
          int64_t v18 = -17000;
        }
        else {
          int64_t v18 = -17006;
        }
        if (HeightOfPlane == v14 && WidthOfPlane == v15) {
          int64_t v17 = -17000;
        }
        if ((a5->orientation & 4) != 0) {
          return v17;
        }
        else {
          return v18;
        }
      }
    }
    else
    {
      return -17000;
    }
  }
  return v11;
}

- (void)getDisplayPipelineCompensationType:(id)a3 gamma:(float)a4
{
  unsigned int v10 = (NSDictionary *)a3;
  CFStringRef v6 = [(NSDictionary *)v10 valueForKey:@"HDRProcessingDisplayPipelineCompensationType"];
  float FloatFromDictionayForKey = getFloatFromDictionayForKey(v10, &cfstr_Hdrprocessingd_24.isa, a4);
  p_displayCompensationType = &self->_displayCompensationType;
  if ([v6 isEqualToString:@"HDRProcessingDisplayPipelineCompensationTypePurePower"])
  {
    int v9 = 1;
  }
  else if ([v6 isEqualToString:@"HDRProcessingDisplayPipelineCompensationTypeHeadRoomDependent"])
  {
    int v9 = 2;
  }
  else
  {
    if ([v6 isEqualToString:@"HDRProcessingDisplayPipelineCompensationTypeNone"])
    {
      *(void *)p_displayCompensationType = 0x3F80000000000000;
      goto LABEL_9;
    }
    int v9 = 3;
  }
  unsigned int *p_displayCompensationType = v9;
  *((float *)p_displayCompensationType + 1) = FloatFromDictionayForKey;
LABEL_9:
}

- (void)getAMVEStrengthValue:(id)a3
{
  p_enableAmveStrength = &self->_enableAmveStrength;
  id v19 = (HDRConfig *)a3;
  BOOL *p_enableAmveStrength = 1;
  Config = GetConfig(v19);
  if (Config && (BOOL v5 = GetConfig((HDRConfig *)Config), *((_DWORD *)v5 + 3567)) && (v5[7132] & 0x80) != 0)
  {
    size_t v15 = GetConfig((HDRConfig *)v5);
    if (v15)
    {
      BOOL v16 = GetConfig((HDRConfig *)v15);
      BOOL v6 = *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v16, 0xA2u, 0) != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
    BOOL *p_enableAmveStrength = v6;
  }
  else
  {
    BOOL v6 = *p_enableAmveStrength;
  }
  *((_DWORD *)p_enableAmveStrength + 1) = 1065353216;
  if (v6)
  {
    int64_t v7 = [(HDRConfig *)v19 valueForKey:@"AVEStrength"];
    uint64_t v8 = v7;
    if (v7)
    {
      int64_t v7 = (void *)[v7 floatValue];
      *((_DWORD *)p_enableAmveStrength + 1) = v9;
    }
    unsigned int v10 = GetConfig((HDRConfig *)v7);
    if (v10 && (int64_t v11 = GetConfig((HDRConfig *)v10), *((_DWORD *)v11 + 3589)) && (v11[7176] & 0x80) != 0)
    {
      int64_t v17 = GetConfig((HDRConfig *)v11);
      if (v17)
      {
        int64_t v18 = GetConfig((HDRConfig *)v17);
        float v12 = *(float *)HDRConfig::GetConfigEntryValue((uint64_t)v18, 0xA3u, 0);
      }
      else
      {
        float v12 = 0.0;
      }
      *((float *)p_enableAmveStrength + 1) = v12;
    }
    else
    {
      float v12 = *((float *)p_enableAmveStrength + 1);
    }
    float v13 = 1.0;
    BOOL v14 = v12 >= 1.0 || v12 < 0.0;
    if (v12 < 1.0 && v12 < 0.0) {
      float v13 = 0.0;
    }
    if (v14) {
      float v12 = v13;
    }
    *((float *)p_enableAmveStrength + 1) = v12;
  }
}

- (void)getAMVEStrengthValueFromIOSurface:(__IOSurface *)a3
{
  p_enableAmveStrength = &self->_enableAmveStrength;
  if (self->_enableAmveStrength)
  {
    CFNumberRef v5 = (const __CFNumber *)IOSurfaceCopyValue(a3, @"AVEStrength");
    if (v5)
    {
      CFNumberRef v6 = v5;
      CFNumberGetValue(v5, kCFNumberFloatType, &self->_amveStrengthValue);
      CFRelease(v6);
    }
    Config = GetConfig(v5);
    if (Config)
    {
      uint64_t v8 = GetConfig((HDRConfig *)Config);
      if (*((_DWORD *)v8 + 3589))
      {
        if ((v8[7176] & 0x80) != 0)
        {
          int v9 = GetConfig((HDRConfig *)v8);
          if (v9)
          {
            unsigned int v10 = GetConfig((HDRConfig *)v9);
            int v11 = *(_DWORD *)HDRConfig::GetConfigEntryValue((uint64_t)v10, 0xA3u, 0);
          }
          else
          {
            int v11 = 0;
          }
          *((_DWORD *)p_enableAmveStrength + 1) = v11;
        }
      }
    }
    float v12 = *((float *)p_enableAmveStrength + 1);
    float v13 = 1.0;
    BOOL v14 = v12 >= 1.0 || v12 < 0.0;
    if (v12 < 1.0 && v12 < 0.0) {
      float v13 = 0.0;
    }
    if (v14) {
      float v12 = v13;
    }
    *((float *)p_enableAmveStrength + 1) = v12;
  }
}

- (void)getAmbientViewingEnvironmentType:(__IOSurface *)a3
{
  p_ambientViewingEnvironmentIlluminance = &self->_ambientViewingEnvironmentIlluminance;
  CFDataRef v4 = (const __CFData *)IOSurfaceCopyValue(a3, @"AmbientViewingEnvironment");
  if (v4)
  {
    CFDataRef v5 = v4;
    CFDataGetLength(v4);
    unsigned int v6 = bswap32(*(_DWORD *)CFDataGetBytePtr(v5));
    CFRelease(v5);
  }
  else
  {
    unsigned int v6 = 0;
  }
  unsigned int v7 = *p_ambientViewingEnvironmentIlluminance;
  if (v6 > *p_ambientViewingEnvironmentIlluminance) {
    unsigned int v7 = v6;
  }
  unsigned int *p_ambientViewingEnvironmentIlluminance = v7;
  p_ambientViewingEnvironmentIlluminance[1] = v7 > 0x27100;
  Config = GetConfig(v4);
  if (Config)
  {
    int v9 = GetConfig((HDRConfig *)Config);
    if (*((_DWORD *)v9 + 2225))
    {
      if ((v9[4448] & 0x80) != 0)
      {
        unsigned int v10 = GetConfig((HDRConfig *)v9);
        if (v10)
        {
          int v11 = GetConfig((HDRConfig *)v10);
          unsigned int v12 = *(_DWORD *)HDRConfig::GetConfigEntryValue((uint64_t)v11, 0x65u, 0);
        }
        else
        {
          unsigned int v12 = 0;
        }
        p_ambientViewingEnvironmentIlluminance[1] = v12;
      }
    }
  }
}

- (void)getSceneIllumination:(__IOSurface *)a3
{
  unsigned int valuePtr = 0;
  p_sceneLux = &self->_sceneLux;
  if (self->_sceneLux < 0.0)
  {
    self = (HDRProcessor *)IOSurfaceCopyValue(a3, @"SceneIllumination");
    if (self)
    {
      CFDataRef v4 = self;
      CFNumberGetValue((CFNumberRef)self, kCFNumberSInt32Type, &valuePtr);
      float *p_sceneLux = (float)valuePtr / 1000.0;
      CFRelease(v4);
    }
  }
  Config = GetConfig((HDRConfig *)self);
  if (Config)
  {
    unsigned int v6 = GetConfig((HDRConfig *)Config);
    if (*((_DWORD *)v6 + 3413))
    {
      if ((v6[6824] & 0x80) != 0)
      {
        unsigned int v7 = GetConfig((HDRConfig *)v6);
        if (v7)
        {
          uint64_t v8 = GetConfig((HDRConfig *)v7);
          float v9 = (float)*(unsigned int *)HDRConfig::GetConfigEntryValue((uint64_t)v8, 0x9Bu, 0);
        }
        else
        {
          float v9 = 0.0;
        }
        float *p_sceneLux = v9 / 1000.0;
      }
    }
  }
}

- (void)extractCAMetaData:(id)a3 withRPU:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v90 = *MEMORY[0x263EF8340];
  p_callerApiVersion = &self->_callerApiVersion;
  unsigned int v7 = (NSDictionary *)a3;
  uint64_t v8 = v7;
  if (v4) {
    int v9 = 1;
  }
  else {
    int v9 = 2;
  }
  *((_DWORD *)p_callerApiVersion + 3) = v9;
  *((_DWORD *)p_callerApiVersion + 4) = v4;
  p_callerApiVersion[3] = 10;
  *((_DWORD *)p_callerApiVersion + 10) = 0;
  p_callerApiVersion[4] = (int64_t)vdup_n_s32(0x461C4000u);
  *((_OWORD *)p_callerApiVersion + 3) = xmmword_2222D0BF0;
  *((_OWORD *)p_callerApiVersion + 4) = xmmword_2222D0C00;
  p_callerApiVersion[10] = 0x3F0000003E75C28FLL;
  *((_OWORD *)p_callerApiVersion + 6) = xmmword_2222D0C10;
  *((_OWORD *)p_callerApiVersion + 7) = xmmword_2222D0C20;
  *((_OWORD *)p_callerApiVersion + 8) = xmmword_2222D0C30;
  *((_OWORD *)p_callerApiVersion + 9) = xmmword_2222D0C40;
  unsigned int v10 = [(NSDictionary *)v7 valueForKey:@"HDRProcessingSourceContentKey"];
  unsigned int v12 = v10;
  if (v10)
  {
    int v13 = *((_DWORD *)p_callerApiVersion + 3);
    BOOL v14 = [(NSDictionary *)v10 valueForKey:@"HDRProcessingSourceContentTypeKey"];
    size_t v15 = v14;
    if (v14)
    {
      if ([v14 isEqualToString:@"HDRProcessingSourceContentTypeDolbyVision"])
      {
        int v13 = 1;
      }
      else if ([v15 isEqualToString:@"HDRProcessingSourceContentTypeHDR10"])
      {
        int v13 = 2;
      }
      else if ([v15 isEqualToString:@"HDRProcessingSourceContentTypeHLG"])
      {
        int v13 = 3;
      }
      else if ([v15 isEqualToString:@"HDRProcessingSourceContentTypeSDR"])
      {
        int v13 = 4;
      }
    }

    *((_DWORD *)p_callerApiVersion + 3) = v13;
    p_callerApiVersion[3] = getIntFromDictionayForKey(v12, &cfstr_Khdrprocessing.isa, 10);
    *((float *)p_callerApiVersion + 8) = getFloatFromDictionayForKey(v12, &cfstr_Khdrprocessing_0.isa, 10000.0);
    *((float *)p_callerApiVersion + 9) = getFloatFromDictionayForKey(v12, &cfstr_Khdrprocessing_1.isa, 10000.0);
  }
  LODWORD(v11) = 1074580685;
  [(HDRProcessor *)self getDisplayPipelineCompensationType:v8 gamma:v11];
  Config = GetConfig((HDRConfig *)[(HDRProcessor *)self getAMVEStrengthValue:v8]);
  if (Config)
  {
    int64_t v17 = GetConfig((HDRConfig *)Config);
    uint64_t ConfigEntryValue = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v17, 0, 0);
    if (*(unsigned char *)ConfigEntryValue)
    {
      id v19 = GetConfig(ConfigEntryValue);
      if (v19)
      {
        id v19 = GetConfig((HDRConfig *)v19);
        if (*((_DWORD *)v19 + 2643))
        {
          if ((v19[5284] & 0x80) != 0)
          {
            id v20 = GetConfig((HDRConfig *)v19);
            if (v20)
            {
              int64_t v21 = GetConfig((HDRConfig *)v20);
              int v22 = *(_DWORD *)HDRConfig::GetConfigEntryValue((uint64_t)v21, 0x78u, 0);
            }
            else
            {
              int v22 = 0;
            }
            float v23 = (float)v22;
            *((float *)p_callerApiVersion + 8) = (float)v22;
            if (enableLogInstance)
            {
              if (p_callerApiVersion[52]) {
                uint64_t v24 = p_callerApiVersion[52];
              }
              else {
                uint64_t v24 = prevLogInstanceID;
              }
              id v19 = (__int16 *)os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
              if (v19)
              {
                int v86 = 134218240;
                *(void *)&double v87 = WORD1(v24);
                __int16 v88 = 2048;
                double v89 = v23;
                _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx sdrMaxBrightnessInNits was forced to %f!", (uint8_t *)&v86, 0x16u);
              }
              prevLogInstanceID = v24;
            }
            else
            {
              id v19 = (__int16 *)os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
              if (v19)
              {
                int v86 = 134217984;
                double v87 = v23;
                _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] sdrMaxBrightnessInNits was forced to %f!", (uint8_t *)&v86, 0xCu);
              }
            }
          }
        }
      }
      uint64_t v25 = GetConfig((HDRConfig *)v19);
      if (v25)
      {
        unsigned int v26 = GetConfig((HDRConfig *)v25);
        if (*((_DWORD *)v26 + 2665))
        {
          if ((v26[5328] & 0x80) != 0)
          {
            int64_t v27 = GetConfig((HDRConfig *)v26);
            if (v27)
            {
              __int16 v28 = GetConfig((HDRConfig *)v27);
              int v29 = *(_DWORD *)HDRConfig::GetConfigEntryValue((uint64_t)v28, 0x79u, 0);
            }
            else
            {
              int v29 = 0;
            }
            float v30 = (float)v29;
            *((float *)p_callerApiVersion + 9) = (float)v29;
            if (enableLogInstance)
            {
              if (p_callerApiVersion[52]) {
                uint64_t v31 = p_callerApiVersion[52];
              }
              else {
                uint64_t v31 = prevLogInstanceID;
              }
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
              {
                int v86 = 134218240;
                *(void *)&double v87 = WORD1(v31);
                __int16 v88 = 2048;
                double v89 = v30;
                _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx hdrMaxBrightnessInNits was forced to %f!", (uint8_t *)&v86, 0x16u);
              }
              prevLogInstanceID = v31;
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              int v86 = 134217984;
              double v87 = v30;
              _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] hdrMaxBrightnessInNits was forced to %f!", (uint8_t *)&v86, 0xCu);
            }
          }
        }
      }
    }
  }
  *((_DWORD *)p_callerApiVersion + 43) = -1;
  __int16 v32 = [(NSDictionary *)v8 valueForKey:@"HDRProcessingDisplayKey"];
  uint64_t v33 = (NSDictionary *)v32;
  if (v32)
  {
    int IntFromDictionayForKey = getIntFromDictionayForKey(v8, &cfstr_Apiinterfaceve.isa, 0);
    int64_t *p_callerApiVersion = IntFromDictionayForKey;
    id v35 = [(NSDictionary *)v33 valueForKey:@"HDRProcessingDestinationDisplayTypeKey"];
    uint64_t v36 = v35;
    if (IntFromDictionayForKey <= 0 && v35)
    {
      if (([v35 isEqualToString:@"HDRProcessingDestinationDisplayTypeDolbyVisionTV"] & 1) == 0)
      {
        if (([v36 isEqualToString:@"HDRProcessingDestinationDisplayTypeLowLatencyDolbyVisionTV"] & 1) == 0)
        {
          if (([v36 isEqualToString:@"HDRProcessingDestinationDisplayTypeHDR10TV"] & 1) == 0)
          {
            if (([v36 isEqualToString:@"HDRProcessingDestinationDisplayTypeInternalPanel"] & 1) == 0)
            {
              if ([v36 isEqualToString:@"HDRProcessingDestinationDisplayTypeInternalPanelLCD"])
              {
LABEL_55:
                int v37 = 4;
                goto LABEL_66;
              }
              if ([v36 isEqualToString:@"HDRProcessingDestinationDisplayTypeInternalPanelMac"])
              {
                int v37 = 5;
                goto LABEL_66;
              }
              if ([v36 isEqualToString:@"HDRProcessingDestinationDisplayTypeSDRTV"])
              {
                int v37 = 6;
                goto LABEL_66;
              }
              BOOL v84 = [v36 isEqualToString:@"HDRProcessingDestinationDisplayTypeReferenceDisplay"] == 0;
              int v85 = 7;
              goto LABEL_125;
            }
            goto LABEL_65;
          }
          goto LABEL_63;
        }
        goto LABEL_61;
      }
    }
    else
    {
      int v37 = 0;
      if (IntFromDictionayForKey < 1 || !v35)
      {
LABEL_66:

        *((_DWORD *)p_callerApiVersion + 10) = v37;
        p_callerApiVersion[6] = getIntFromDictionayForKey(v33, &cfstr_Diagonaldispla.isa, 42);
        p_callerApiVersion[7] = getIntFromDictionayForKey(v33, &cfstr_Maximumdisplay.isa, 1000);
        *((float *)p_callerApiVersion + 16) = getFloatFromDictionayForKey(v33, &cfstr_Minimumdisplay.isa, 0.005);
        *((float *)p_callerApiVersion + 17) = getFloatFromDictionayForKey(v33, &cfstr_Displaycontras.isa, -1.0);
        *((float *)p_callerApiVersion + 18) = getFloatFromDictionayForKey(v33, &cfstr_Displayaverage.isa, 1.0);
        uint64_t v39 = GetConfig(v38);
        if (v39)
        {
          char v40 = GetConfig((HDRConfig *)v39);
          id v41 = (_DWORD *)HDRConfig::GetConfigEntryValue((uint64_t)v40, 0x26u, 0);
          if (*(float *)v41 != 0.0) {
            *((_DWORD *)p_callerApiVersion + 18) = *v41;
          }
        }
        *((float *)p_callerApiVersion + 19) = getFloatFromDictionayForKey(v33, &cfstr_Displayaverage_0.isa, 0.26);
        *((float *)p_callerApiVersion + 20) = getFloatFromDictionayForKey(v33, &cfstr_Displayaverage_1.isa, 0.24);
        *((float *)p_callerApiVersion + 21) = getFloatFromDictionayForKey(v33, &cfstr_Displayaverage_2.isa, 0.5);
        *((float *)p_callerApiVersion + 22) = getFloatFromDictionayForKey(v33, &cfstr_Displaysustain.isa, 1200.0);
        *((_DWORD *)p_callerApiVersion + 40) = ((getIntFromDictionayForKey(v33, &cfstr_Displaydolbyvi.isa, 32) >> 4)+ 6) & 7;
        v42 = [(NSDictionary *)v33 valueForKey:@"DisplayChromaticityRx"];
        __int16 v43 = v42;
        if (v42)
        {
          [v42 floatValue];
          double v45 = v44;
          int v46 = 1;
        }
        else
        {
          int v46 = 0;
          double v45 = 0.68;
        }
        uint64_t v47 = [(NSDictionary *)v33 valueForKey:@"DisplayChromaticityRy"];

        uint64_t v48 = v47;
        if (v47)
        {
          [v47 floatValue];
          double v50 = v49;
          ++v46;
        }
        else
        {
          double v50 = 0.32;
        }
        v51 = [(NSDictionary *)v33 valueForKey:@"DisplayChromaticityGx"];

        float v52 = v51;
        if (v51)
        {
          [v51 floatValue];
          double v54 = v53;
          ++v46;
        }
        else
        {
          double v54 = 0.265;
        }
        v55 = [(NSDictionary *)v33 valueForKey:@"DisplayChromaticityGy"];

        int v56 = v55;
        if (v55)
        {
          [v55 floatValue];
          double v58 = v57;
          ++v46;
        }
        else
        {
          double v58 = 0.69;
        }
        BOOL v59 = [(NSDictionary *)v33 valueForKey:@"DisplayChromaticityBx"];

        v60 = v59;
        if (v59)
        {
          [v59 floatValue];
          double v62 = v61;
          ++v46;
        }
        else
        {
          double v62 = 0.15;
        }
        v63 = [(NSDictionary *)v33 valueForKey:@"DisplayChromaticityBy"];

        double v64 = v63;
        if (v63)
        {
          [v63 floatValue];
          double v66 = v65;
          ++v46;
        }
        else
        {
          double v66 = 0.06;
        }
        float v67 = [(NSDictionary *)v33 valueForKey:@"DisplayChromaticityWx"];

        float v68 = v67;
        if (v67)
        {
          [v67 floatValue];
          double v70 = v69;
          ++v46;
        }
        else
        {
          double v70 = 0.3127;
        }
        v71 = [(NSDictionary *)v33 valueForKey:@"DisplayChromaticityWy"];

        if (v71)
        {
          [v71 floatValue];
          double v73 = v72;
          ++v46;
        }
        else
        {
          double v73 = 0.329;
        }
        v74 = [(NSDictionary *)v33 valueForKey:@"HDRProcessingEdrRangeTypeKey"];
        if ([v74 isEqualToString:@"HDRProcessingEdrRangeTypeNormalized"])
        {
          int v75 = 1;
        }
        else
        {
          if (![v74 isEqualToString:@"HDRProcessingEdrRangeTypeNonNormalized"])
          {
LABEL_98:
            if (v46 == 8)
            {
              *((double *)p_callerApiVersion + 12) = v45;
              *((double *)p_callerApiVersion + 13) = v50;
              *((double *)p_callerApiVersion + 14) = v54;
              *((double *)p_callerApiVersion + 15) = v58;
              *((double *)p_callerApiVersion + 16) = v62;
              *((double *)p_callerApiVersion + 17) = v66;
              *((double *)p_callerApiVersion + 18) = v70;
              *((double *)p_callerApiVersion + 19) = v73;
            }

            goto LABEL_101;
          }
          int v75 = 2;
        }
        *((_DWORD *)p_callerApiVersion + 43) = v75;
        goto LABEL_98;
      }
      if (([v35 isEqualToString:@"HDRProcessingDestinationDisplayTypeDolbyVisionTV"] & 1) == 0)
      {
        if (([v36 isEqualToString:@"HDRProcessingDestinationDisplayTypeLowLatencyDolbyVisionTV"] & 1) == 0)
        {
          if (([v36 isEqualToString:@"HDRProcessingDestinationDisplayTypeHDR10TV"] & 1) == 0)
          {
            if (([v36 isEqualToString:@"HDRProcessingDestinationDisplayTypeInternalPanelOLED"] & 1) == 0)
            {
              if ([v36 isEqualToString:@"HDRProcessingDestinationDisplayTypeInternalPanel2DBL"])
              {
                int v37 = 7;
                goto LABEL_66;
              }
              if ([v36 isEqualToString:@"HDRProcessingDestinationDisplayTypeInternalPanel0DBL"]) {
                goto LABEL_55;
              }
              BOOL v84 = [v36 isEqualToString:@"HDRProcessingDestinationDisplayTypeSDRTV"] == 0;
              int v85 = 6;
LABEL_125:
              if (v84) {
                int v37 = 0;
              }
              else {
                int v37 = v85;
              }
              goto LABEL_66;
            }
LABEL_65:
            int v37 = 3;
            goto LABEL_66;
          }
LABEL_63:
          int v37 = 2;
          goto LABEL_66;
        }
LABEL_61:
        int v37 = 1;
        goto LABEL_66;
      }
    }
    int v37 = 0;
    goto LABEL_66;
  }
LABEL_101:
  uint64_t v76 = (uint64_t)GetConfig(v32);
  if (v76)
  {
    uint64_t v76 = (uint64_t)GetConfig((HDRConfig *)v76);
    if (*(_DWORD *)(v76 + 8988))
    {
      if ((*(unsigned char *)(v76 + 8984) & 0x80) != 0)
      {
        uint64_t v76 = (uint64_t)GetConfig((HDRConfig *)v76);
        if (v76)
        {
          v77 = GetConfig((HDRConfig *)v76);
          uint64_t v76 = HDRConfig::GetConfigEntryValue((uint64_t)v77, 0x66u, 0);
          int v78 = *(_DWORD *)v76;
        }
        else
        {
          int v78 = 0;
        }
        *((_DWORD *)p_callerApiVersion + 10) = v78;
      }
    }
  }
  int v79 = GetConfig((HDRConfig *)v76);
  if (v79)
  {
    v80 = GetConfig((HDRConfig *)v79);
    if (*((_DWORD *)v80 + 2335))
    {
      if ((v80[4668] & 0x80) != 0)
      {
        v81 = GetConfig((HDRConfig *)v80);
        if (v81)
        {
          v82 = GetConfig((HDRConfig *)v81);
          int v83 = *(_DWORD *)HDRConfig::GetConfigEntryValue((uint64_t)v82, 0x6Au, 0);
        }
        else
        {
          int v83 = 0;
        }
        *((_DWORD *)p_callerApiVersion + 43) = v83;
      }
    }
  }
}

- (int64_t)extractHEVCHDRParameterFromInputIOSurface:(__IOSurface *)a3 forInfoFrame:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  int v31 = 0;
  memset(v30, 0, sizeof(v30));
  p_hardwareType = &self->_hardwareType;
  long long v29 = 0u;
  self->_ambientViewingEnvironmentIlluminance = 0;
  self->_sceneLux = -1.0;
  uint64_t PixelFormat = IOSurfaceGetPixelFormat(a3);
  p_hardwareType[47] = PixelFormat;
  int FourCCforType = getFourCCforType(PixelFormat);
  p_hardwareType[49] = FourCCforType;
  int v9 = isFormatYUV(FourCCforType);
  *((void *)p_hardwareType + 30) = v9 ^ 1u;
  uint64_t v10 = 13;
  if (v9) {
    uint64_t v10 = 16;
  }
  *((void *)p_hardwareType + 28) = v10;
  int BulkAttachments = IOSurfaceGetBulkAttachments();
  unsigned int v12 = p_hardwareType[1];
  if (!BulkAttachments)
  {
    if (v12 == 1) {
      goto LABEL_19;
    }
    uint64_t v15 = IOSurfaceGetPixelFormat(a3);
    int v16 = getFourCCforType(v15);
    unsigned int v17 = isFullRangeFromSurfaceFormat(v16);
    LOWORD(v30[0]) = v17;
    if ((vmaxv_u16((uint16x4_t)vceq_s16((int16x4_t)(*(void *)&vdup_n_s16(0) & 0xFF00FF00FF00FFLL), (int16x4_t)0xE000C00090001)) & 1) == 0)return -17012; {
    *(_DWORD *)((char *)v30 + 2) = 0;
    }
    HIWORD(v30[0]) = 0;
    uint64_t v18 = *((void *)p_hardwareType + 30);
    *((void *)p_hardwareType + 26) = v17;
    *((void *)p_hardwareType + 27) = extractInputColorPrimaries((unsigned __int16 *)v30, v18);
    unsigned int v19 = WORD2(v30[0]);
    if (WORD2(v30[0]) == 18)
    {
      p_hardwareType[1] = 3;
      long long v29 = 0uLL;
    }
    *(_OWORD *)&v30[1] = v29;
    v30[3] = 0;
    p_hardwareType[42] = 0;
    if (v19 <= 0x12 && ((1 << v19) & 0x52102) != 0)
    {
      unsigned int v23 = v19;
    }
    else if (enableLogInstance)
    {
      if (*((void *)p_hardwareType + 51)) {
        uint64_t v28 = *((void *)p_hardwareType + 51);
      }
      else {
        uint64_t v28 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        *(void *)uint64_t v33 = WORD1(v28);
        *(_WORD *)&v33[8] = 1024;
        unsigned int v34 = v19;
        __int16 v35 = 1024;
        int v36 = 16;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx   warning: unknown transfer_characteristics=%d, sets to PQ=%d", buf, 0x18u);
      }
      prevLogInstanceID = v28;
      unsigned int v23 = 16;
    }
    else
    {
      unsigned int v23 = 16;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)uint64_t v33 = v19;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&unsigned char v33[6] = 16;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]   warning: unknown transfer_characteristics=%d, sets to PQ=%d", buf, 0xEu);
      }
    }
    *((void *)p_hardwareType + 28) = v23;
    unsigned int v24 = HIWORD(v30[0]);
    if (HIWORD(v30[0]) > 0xCu || (unsigned int v25 = HIWORD(v30[0]), ((1 << SBYTE6(v30[0])) & 0x1202) == 0))
    {
      unsigned int v25 = WORD1(v30[0]);
      if (WORD1(v30[0]) > 0xCu || ((1 << SBYTE2(v30[0])) & 0x1202) == 0)
      {
        if (enableLogInstance)
        {
          if (*((void *)p_hardwareType + 51)) {
            uint64_t v27 = *((void *)p_hardwareType + 51);
          }
          else {
            uint64_t v27 = prevLogInstanceID;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218496;
            *(void *)uint64_t v33 = WORD1(v27);
            *(_WORD *)&v33[8] = 1024;
            unsigned int v34 = v24;
            __int16 v35 = 1024;
            int v36 = 1;
            _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx   warning: unknown matrix_coeffs=%d, sets to Rec709=%d", buf, 0x18u);
          }
          prevLogInstanceID = v27;
          unsigned int v25 = 1;
        }
        else
        {
          unsigned int v25 = 1;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)uint64_t v33 = v24;
            *(_WORD *)&v33[4] = 1024;
            *(_DWORD *)&unsigned char v33[6] = 1;
            _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]   warning: unknown matrix_coeffs=%d, sets to Rec709=%d", buf, 0xEu);
          }
        }
      }
    }
    *((void *)p_hardwareType + 29) = v25;
    if (LODWORD(v30[3]))
    {
      if (LODWORD(v30[3]) >> 4 >= 0x271) {
        uint64_t v26 = LODWORD(v30[3]) / 0x2710;
      }
      else {
        uint64_t v26 = 1000;
      }
      *((void *)p_hardwareType + 34) = v26;
      float v21 = (float)HIDWORD(v30[3]) / 10000.0;
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  if (v12 != 4)
  {
    if (v12 == 3)
    {
      long long v13 = xmmword_2222D0C50;
      long long v14 = xmmword_2222D0C60;
    }
    else
    {
      if (v12 != 2) {
        goto LABEL_19;
      }
      long long v13 = xmmword_2222D0C50;
      long long v14 = xmmword_2222D0C70;
    }
    *((_OWORD *)p_hardwareType + 13) = v13;
    *((_OWORD *)p_hardwareType + 14) = v14;
LABEL_16:
    uint64_t v20 = 1000;
    goto LABEL_17;
  }
  *((_OWORD *)p_hardwareType + 13) = xmmword_2222D09C0;
  *((int64x2_t *)p_hardwareType + 14) = vdupq_n_s64(1uLL);
  uint64_t v20 = 100;
LABEL_17:
  *((void *)p_hardwareType + 34) = v20;
  float v21 = 0.005;
LABEL_18:
  *((float *)p_hardwareType + 70) = v21;
LABEL_19:
  if (*p_hardwareType == 1 && *((void *)p_hardwareType + 28) == 1) {
    return -17012;
  }
  *(_OWORD *)&a4->var0.var0 = *(_OWORD *)&v30[1];
  *(void *)&a4->var0.var8 = v30[3];
  a4->var1 = 0;
  return -17000;
}

- (void)extractHEVCHDRParameterFromInputIOSurfaceForDovi:(__IOSurface *)a3 forInfoFrame:(id *)a4
{
  long long v21 = 0uLL;
  int v23 = 0;
  p_ambientViewingEnvironmentIlluminance = &self->_ambientViewingEnvironmentIlluminance;
  uint64_t v22 = 0;
  self->_ambientViewingEnvironmentIlluminance = 0;
  self->_sceneLux = -1.0;
  uint64_t PixelFormat = IOSurfaceGetPixelFormat(a3);
  p_ambientViewingEnvironmentIlluminance[5] = PixelFormat;
  int FourCCforType = getFourCCforType(PixelFormat);
  p_ambientViewingEnvironmentIlluminance[7] = FourCCforType;
  int v8 = isFormatYUV(FourCCforType);
  *((void *)p_ambientViewingEnvironmentIlluminance + 9) = v8 ^ 1u;
  uint64_t v9 = 13;
  if (v8) {
    uint64_t v9 = 16;
  }
  *((void *)p_ambientViewingEnvironmentIlluminance + 7) = v9;
  if (IOSurfaceGetBulkAttachments())
  {
    *((_OWORD *)p_ambientViewingEnvironmentIlluminance + 3) = xmmword_2222D0C80;
  }
  else
  {
    unsigned int v10 = p_ambientViewingEnvironmentIlluminance[7];
    BOOL v12 = v10 == 2019963440 || v10 == 1885745714;
    unsigned __int16 v17 = v12;
    __int16 v18 = 0;
    unsigned __int16 v19 = 0;
    unsigned __int16 v20 = 0;
    long long v21 = 0u;
    uint64_t v22 = 0;
    int v23 = 0;
    unsigned int *p_ambientViewingEnvironmentIlluminance = 0;
    *((void *)p_ambientViewingEnvironmentIlluminance + 5) = v12;
    uint64_t v13 = extractInputColorPrimaries(&v17, *((void *)p_ambientViewingEnvironmentIlluminance + 9));
    uint64_t v14 = v19;
    *((void *)p_ambientViewingEnvironmentIlluminance + 6) = v13;
    *((void *)p_ambientViewingEnvironmentIlluminance + 7) = v14;
    if (v22)
    {
      *((void *)p_ambientViewingEnvironmentIlluminance + 13) = v22 / 0x2710uLL;
      *((unsigned char *)p_ambientViewingEnvironmentIlluminance + 116) = 1;
    }
    if (HIDWORD(v22))
    {
      *((float *)p_ambientViewingEnvironmentIlluminance + 28) = (float)(HIDWORD(v22) / 0x2710);
      *((unsigned char *)p_ambientViewingEnvironmentIlluminance + 117) = 1;
    }
    unsigned int v15 = v20;
    if (v20 > 0xCu || ((1 << v20) & 0x1202) == 0)
    {
      if (v18 == 9) {
        int v16 = 9;
      }
      else {
        int v16 = 1;
      }
      if (v18 == 12) {
        unsigned int v15 = 12;
      }
      else {
        unsigned int v15 = v16;
      }
    }
    *((void *)p_ambientViewingEnvironmentIlluminance + 8) = v15;
  }
  *(void *)&a4->var0.var0 = 0;
  *(void *)&a4->var0.var4 = 0;
  a4->var1 = 0;
  *(void *)&a4->var0.var8 = 0;
}

- (void)extractHEVCHDRParameterFromOutputIOSurface:(__IOSurface *)a3
{
  p_outputColorSpace = &self->_outputColorSpace;
  uint64_t PixelFormat = IOSurfaceGetPixelFormat(a3);
  int FourCCforType = getFourCCforType(PixelFormat);
  int v6 = isFormatYUV(FourCCforType);
  unint64_t *p_outputColorSpace = v6 ^ 1u;
  uint64_t v7 = 13;
  if (v6) {
    uint64_t v7 = 16;
  }
  p_outputColorSpace[2] = v7;
  if (IOSurfaceGetBulkAttachments())
  {
    uint64_t v8 = 13;
    if (FourCCforType <= 1953903151)
    {
      if ((FourCCforType - 1886680624) > 4 || ((1 << (FourCCforType - 48)) & 0x15) == 0) {
        goto LABEL_25;
      }
      goto LABEL_15;
    }
    if (FourCCforType > 1953903667)
    {
      if (FourCCforType == 1953969204) {
        goto LABEL_15;
      }
      unsigned __int16 v9 = 13364;
    }
    else
    {
      if (FourCCforType == 1953903152) {
        goto LABEL_15;
      }
      unsigned __int16 v9 = 12850;
    }
    if (FourCCforType != (v9 | 0x74760000))
    {
LABEL_25:
      p_outputColorSpace[2] = v8;
      return;
    }
LABEL_15:
    uint64_t v8 = 16;
    goto LABEL_25;
  }
  unint64_t v10 = p_outputColorSpace[26];
  uint64_t v11 = 9;
  if (*MEMORY[0x263F03F00] != v10) {
    uint64_t v11 = 1;
  }
  if (*MEMORY[0x263F03F20] == v10 || *MEMORY[0x263F03F08] == v10) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v11;
  }
  p_outputColorSpace[1] = v13;
}

- (void)setHDRControl:(id *)a3 withTCControl:(ToneCurve_Control *)a4 withRPU:(BOOL)a5 withMMR:(BOOL)a6 withDmData:(id *)a7 withOperation:(unsigned int)a8
{
  BOOL v8 = a6;
  unsigned int v9 = a5;
  BOOL v12 = self;
  p_unsigned int hardwareType = &self->_hardwareType;
  *(void *)&a3->var28 = 0;
  *(_OWORD *)&a3->var20[8] = 0u;
  *(_OWORD *)&a3->var24 = 0u;
  *(_OWORD *)a3->var20 = 0u;
  *(_OWORD *)&a3->var20[4] = 0u;
  *(_OWORD *)&a3->var19[1] = 0u;
  *(_OWORD *)&a3->var19[5] = 0u;
  *(_OWORD *)&a3->unsigned int var12 = 0u;
  *(_OWORD *)&a3->var16 = 0u;
  *(_OWORD *)&a3->var4 = 0u;
  *(_OWORD *)&a3->var8 = 0u;
  *(_OWORD *)&a3->var0 = 0u;
  unsigned int hardwareType = self->_hardwareType;
  a3->var1 = self->_hdrProfile;
  a3->var2 = hardwareType;
  a3->unsigned int var10 = self->_displayType;
  *(int32x2_t *)&a3->var11 = vmovn_s64(*(int64x2_t *)&self->_displayDiagonalSize);
  a3->var13 = self->_minDisplayBrightnessNits;
  a3->var7 = self->_inputFormatRaw;
  unint64_t bitDepth = self->_bitDepth;
  a3->var8 = self->_inputFormat;
  a3->var9 = bitDepth;
  unsigned int operationFlags = a4->operationFlags;
  a3->var3 = a8;
  a3->var4 = operationFlags;
  if (a8 == 4)
  {
    int colorSpace = self->_colorSpace;
    unint64_t outputColorSpace = self->_outputColorSpace;
    if (colorSpace)
    {
      if (colorSpace == 2)
      {
        if (outputColorSpace <= 2)
        {
          unsigned __int16 v19 = &unk_2222D10D4;
          goto LABEL_11;
        }
      }
      else if (colorSpace == 1 && outputColorSpace < 3)
      {
        unsigned __int16 v19 = &unk_2222D10BC;
LABEL_11:
        unsigned int v20 = v19[(int)outputColorSpace];
        goto LABEL_13;
      }
    }
    else if (outputColorSpace < 3)
    {
      unsigned __int16 v19 = &unk_2222D10C8;
      goto LABEL_11;
    }
  }
  unsigned int v20 = 0;
LABEL_13:
  a3->var5 = v20;
  unint64_t colourPrimaries = self->_colourPrimaries;
  unint64_t transferFunction = self->_transferFunction;
  a3->var17 = transferFunction;
  unsigned int matrixCoeffs = self->_matrixCoeffs;
  a3->var15 = colourPrimaries;
  a3->var16 = matrixCoeffs;
  if (a8 == 4) {
    unsigned int var12 = self->_colorSpace;
  }
  else {
    unsigned int var12 = a7->var12;
  }
  a3->var18 = var12;
  unint64_t maxMasteringNits = self->_maxMasteringNits;
  if (maxMasteringNits >= 0x2710) {
    LODWORD(maxMasteringNits) = 10000;
  }
  a3->var21 = maxMasteringNits;
  float minMasteringNits = self->_minMasteringNits;
  float v27 = 10000.0;
  if (minMasteringNits <= 10000.0)
  {
    if (minMasteringNits >= 0.005) {
      float v27 = self->_minMasteringNits;
    }
    else {
      float v27 = 0.005;
    }
  }
  a3->var22 = v27;
  if (!a5 || a8 == 4 || transferFunction == 18)
  {
    a3->var14 = self->_videoFullRangeFlag;
    self = (HDRProcessor *)-[HDRProcessor setCSCMatrixInHDRControl:forIndex:](self, "setCSCMatrixInHDRControl:forIndex:", a3);
    LODWORD(transferFunction) = p_hardwareType[56];
  }
  a3->var25 = p_hardwareType[41];
  a3->var23 = p_hardwareType[39];
  LODWORD(a3->var24) = p_hardwareType[40];
  unsigned int v28 = p_hardwareType[1];
  a3->var0 = v28;
  a3->var28 = transferFunction;
  if (v28 == 1 && *p_hardwareType == 1)
  {
    self = (HDRProcessor *)[(MSRHDRProcessing *)v12->_msr isMMREnabled];
    if (self)
    {
      if (v8 && p_hardwareType[2] == 2) {
        a3->var26 = 1;
      }
    }
  }
  a3->var29 = 0;
  Config = GetConfig((HDRConfig *)self);
  if (Config)
  {
    float v30 = GetConfig((HDRConfig *)Config);
    if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v30, 0x17u, 0))
    {
      if (p_hardwareType[8] == 2 && !*p_hardwareType) {
        a3->var29 = 1;
      }
    }
  }
  a3->var30 = 0;
  BOOL v31 = IsGpuOnlySystem();
  BOOL v32 = 0;
  if (!v31)
  {
    uint64_t v33 = GetConfig((HDRConfig *)v31);
    if (v33)
    {
      unsigned int v34 = GetConfig((HDRConfig *)v33);
      BOOL v32 = *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v34, 0x18u, 0) != 0;
    }
    else
    {
      BOOL v32 = 0;
    }
  }
  a3->var30 = v32;
  if (a3->var0 == 1 && a3->var17 == 18)
  {
    if ((unsigned int var10 = a3->var10, var10 == 7) && (*((unsigned char *)a4 + 152) & 2) != 0
      || var10 == 8
      || var10 == 6
      || var10 == 2 && !a3->var29)
    {
      a3->var0 = 3;
    }
  }
  a3->var6 = v9;
  a3->var27 = p_hardwareType[43];
  LODWORD(a4->sceneLux) = p_hardwareType[46];
  a4->enableAmveStrength = *((unsigned char *)p_hardwareType + 176);
  LODWORD(a4->amveStrengthValue) = p_hardwareType[45];
}

- (void)setCSCMatrixInHDRControl:(id *)a3 forIndex:(unsigned int)a4
{
  uint64_t v4 = 0;
  CFDataRef v5 = (char *)&R2020_Yuv2RgbFull;
  unsigned int var14 = a3->var14;
  unsigned int var15 = a3->var15;
  if (!var14) {
    CFDataRef v5 = (char *)&R2020_Yuv2RgbNarrow;
  }
  BOOL v8 = (char *)&R709_Yuv2RgbFull;
  if (!var14) {
    BOOL v8 = (char *)&R709_Yuv2RgbNarrow;
  }
  if (a4 != 9) {
    CFDataRef v5 = v8;
  }
  do
  {
    a3->var19[v4] = *(float *)&v5[v4 * 4];
    ++v4;
  }
  while (v4 != 9);
  uint64_t v9 = 0;
  unint64_t v10 = (char *)&R709_Rgb2LMS;
  if (var15 == 12) {
    unint64_t v10 = (char *)&P3_Rgb2LMS;
  }
  if (var15 == 9) {
    uint64_t v11 = (char *)&R2020_Rgb2LMS;
  }
  else {
    uint64_t v11 = v10;
  }
  do
  {
    a3->var20[v9] = *(float *)&v11[v9 * 4];
    ++v9;
  }
  while (v9 != 9);
}

- (unsigned)selectHDRUsage:(unsigned int)a3 withRPU:(BOOL)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  p_hdrMode = &self->_hdrMode;
  if (a3 == 4)
  {
    if (a4)
    {
      unsigned int displayType = self->_displayType;
      if (displayType)
      {
        if (displayType != 7 && displayType != 2) {
          goto LABEL_47;
        }
LABEL_9:
        unsigned int result = 15;
        goto LABEL_74;
      }
      goto LABEL_25;
    }
    unsigned int v10 = *p_hdrMode;
    if (*p_hdrMode == 3)
    {
      unsigned int v15 = self->_displayType;
      if (!v15)
      {
        unsigned int result = 18;
        goto LABEL_74;
      }
      if (v15 == 7 || v15 == 2)
      {
        unsigned int result = 19;
        goto LABEL_74;
      }
    }
    else
    {
      if (v10 != 2)
      {
        if (v10 != 1) {
          goto LABEL_47;
        }
        unsigned int v11 = self->_displayType;
        if (v11)
        {
          if (v11 != 7 && v11 != 2) {
            goto LABEL_47;
          }
          goto LABEL_9;
        }
LABEL_25:
        unsigned int result = 14;
        goto LABEL_74;
      }
      unsigned int v17 = self->_displayType;
      if (!v17)
      {
        unsigned int result = 16;
        goto LABEL_74;
      }
      if (v17 == 7 || v17 == 2)
      {
        unsigned int result = 17;
        goto LABEL_74;
      }
    }
LABEL_47:
    if (enableLogInstance)
    {
      if (self->logInstanceID) {
        unint64_t logInstanceID = self->logInstanceID;
      }
      else {
        unint64_t logInstanceID = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v20 = *p_hdrMode;
        int v26 = 134218496;
        *(void *)float v27 = WORD1(logInstanceID);
        *(_WORD *)&v27[8] = 1024;
        int v28 = 0;
        __int16 v29 = 1024;
        int v30 = v20;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Incorrect mode usage : %d _hdrMode = %d", (uint8_t *)&v26, 0x18u);
      }
      prevLogInstanceID = logInstanceID;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
LABEL_63:
        BOOL v23 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
        unsigned int result = 0;
        if (v23)
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/HDRProcessorMetal.mm\" at line 3608\n", (uint8_t *)&v26, 2u);
          unsigned int result = 0;
        }
        goto LABEL_74;
      }
      unsigned int v21 = *p_hdrMode;
      int v26 = 67109376;
      *(_DWORD *)float v27 = 0;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&unsigned char v27[6] = v21;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Incorrect mode usage : %d _hdrMode = %d", (uint8_t *)&v26, 0xEu);
    }
    if (enableLogInstance)
    {
      if (*(void *)(p_hdrMode + 101)) {
        uint64_t v22 = *(void *)(p_hdrMode + 101);
      }
      else {
        uint64_t v22 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 134217984;
        *(void *)float v27 = WORD1(v22);
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/HDRProcessorMetal.mm\" at line 3608\n", (uint8_t *)&v26, 0xCu);
      }
      unsigned int result = 0;
      prevLogInstanceID = v22;
      goto LABEL_74;
    }
    goto LABEL_63;
  }
  unsigned int v8 = *p_hdrMode;
  if (*p_hdrMode == 1)
  {
    unsigned int v9 = self->_displayType;
    if (v9 > 8)
    {
      if (enableLogInstance)
      {
        if (self->logInstanceID) {
          unint64_t v25 = self->logInstanceID;
        }
        else {
          unint64_t v25 = prevLogInstanceID;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 134218496;
          *(void *)float v27 = WORD1(v25);
          *(_WORD *)&v27[8] = 1024;
          int v28 = 2;
          __int16 v29 = 1024;
          int v30 = 1;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Incorrect mode usage : %d _hdrMode = %d", (uint8_t *)&v26, 0x18u);
        }
        prevLogInstanceID = v25;
        unsigned int v12 = 2;
      }
      else
      {
        unsigned int v12 = 2;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 67109376;
          *(_DWORD *)float v27 = 2;
          *(_WORD *)&v27[4] = 1024;
          *(_DWORD *)&unsigned char v27[6] = 1;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Incorrect mode usage : %d _hdrMode = %d", (uint8_t *)&v26, 0xEu);
        }
      }
    }
    else
    {
      if (v9 != 2)
      {
        unsigned int result = 2;
        goto LABEL_74;
      }
      unsigned int v12 = 4;
    }
    unsigned int v8 = *p_hdrMode;
  }
  else
  {
    unsigned int v12 = 2;
  }
  if (v8 == 2)
  {
    uint64_t v13 = (int)p_hdrMode[7];
    if (v13 >= 9)
    {
      if (enableLogInstance)
      {
        if (*(void *)(p_hdrMode + 101)) {
          uint64_t v14 = *(void *)(p_hdrMode + 101);
        }
        else {
          uint64_t v14 = prevLogInstanceID;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 134218496;
          *(void *)float v27 = WORD1(v14);
          *(_WORD *)&v27[8] = 1024;
          int v28 = 7;
          __int16 v29 = 1024;
          int v30 = 2;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Incorrect mode usage : %d _hdrMode = %d", (uint8_t *)&v26, 0x18u);
        }
        prevLogInstanceID = v14;
        unsigned int v12 = 7;
      }
      else
      {
        unsigned int v12 = 7;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 67109376;
          *(_DWORD *)float v27 = 7;
          *(_WORD *)&v27[4] = 1024;
          *(_DWORD *)&unsigned char v27[6] = 2;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Incorrect mode usage : %d _hdrMode = %d", (uint8_t *)&v26, 0xEu);
        }
      }
    }
    else
    {
      unsigned int v12 = dword_2222D10E0[v13];
    }
  }
  if (*p_hdrMode == 3) {
    unsigned int result = 12;
  }
  else {
    unsigned int result = v12;
  }
  if (*p_hdrMode == 4)
  {
    uint64_t v24 = (int)p_hdrMode[7];
    if (v24 > 6) {
      unsigned int result = 9;
    }
    else {
      unsigned int result = dword_2222D1104[v24];
    }
  }
LABEL_74:
  p_hdrMode[81] = result;
  return result;
}

- (void)extractFrameMetadata:(__CFDictionary *)a3 intoTCControl:(ToneCurve_Control *)a4
{
  p_minDisplayBrightnessNits = &self->_minDisplayBrightnessNits;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a3, @"MaximumExtendedDynamicRangeColorComponentValue");
  if (Value)
  {
    float valuePtr = 0.0;
    CFNumberGetValue(Value, kCFNumberFloatType, &valuePtr);
    float v8 = valuePtr;
  }
  else
  {
    float v8 = p_minDisplayBrightnessNits[91];
  }
  a4->maxEDRCFNumberRef Value = v8;
  CFNumberRef v9 = (const __CFNumber *)CFDictionaryGetValue(a3, @"HDRProcessingOperationEnum");
  if (v9)
  {
    float valuePtr = 0.0;
    CFNumberGetValue(v9, kCFNumberIntType, &valuePtr);
    unsigned int v10 = LODWORD(valuePtr);
  }
  else
  {
    unsigned int v10 = 5;
  }
  a4->operationFromDict = v10;
  CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(a3, @"HDRProcessingOperationFlags");
  if (v11)
  {
    float valuePtr = 0.0;
    CFNumberGetValue(v11, kCFNumberIntType, &valuePtr);
    unsigned int v12 = LODWORD(valuePtr);
  }
  else
  {
    unsigned int v12 = 0;
  }
  a4->unsigned int operationFlags = v12;
  CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(a3, @"EDRFactor");
  if (v13)
  {
    float valuePtr = 0.0;
    CFNumberGetValue(v13, kCFNumberFloatType, &valuePtr);
    float v14 = valuePtr;
  }
  else
  {
    float v14 = p_minDisplayBrightnessNits[92];
  }
  a4->float EDRFactor = v14;
  CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue(a3, @"AmbientLightInNits");
  if (v15)
  {
    float valuePtr = 0.0;
    CFNumberGetValue(v15, kCFNumberFloatType, &valuePtr);
    float v16 = valuePtr;
  }
  else
  {
    float v16 = p_minDisplayBrightnessNits[93];
  }
  a4->AmbientInNits = v16;
  CFBooleanRef v17 = (const __CFBoolean *)CFDictionaryGetValue(a3, @"HDRProcessingDisplaySupportsAmbientAdaptationKey");
  if (v17) {
    BOOL v18 = CFBooleanGetValue(v17) == 0;
  }
  else {
    BOOL v18 = 1;
  }
  a4->HDRProcessingFullAmbientAdaptation = v18;
  a4->HDRProcessingDisplayAdjustsBlackLevel = 1;
  CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(a3, @"HDRProcessingDisplayAdjustsBlackLevelKey");
  if (v19)
  {
    float valuePtr = 0.0;
    CFNumberGetValue(v19, kCFNumberIntType, &valuePtr);
    *(float *)&a4->HDRProcessingDisplayAdjustsBlackLevel = valuePtr;
  }
  CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(a3, @"CurrentMaxPanelNits");
  if (v20)
  {
    float valuePtr = 0.0;
    CFNumberGetValue(v20, kCFNumberFloatType, &valuePtr);
    double v21 = valuePtr;
  }
  else
  {
    double v21 = *((double *)p_minDisplayBrightnessNits + 48);
  }
  a4->double targetMaxLinear = v21;
  CFNumberRef v22 = (const __CFNumber *)CFDictionaryGetValue(a3, @"CurrentMinPanelNits");
  if (v22)
  {
    float valuePtr = 0.0;
    CFNumberRef v22 = (const __CFNumber *)CFNumberGetValue(v22, kCFNumberFloatType, &valuePtr);
    float v23 = valuePtr;
  }
  else
  {
    float v23 = *p_minDisplayBrightnessNits;
  }
  a4->targetMinLinear = v23;
  Config = (HDRConfig *)GetConfig(v22);
  if (Config)
  {
    unint64_t v25 = GetConfig(Config);
    Config = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v25, 0x80u, 0);
    if (*(double *)Config > 0.00001) {
      a4->double targetMaxLinear = *(double *)Config;
    }
  }
  uint64_t ConfigEntryValue = (HDRConfig *)GetConfig(Config);
  if (ConfigEntryValue)
  {
    float v27 = GetConfig(ConfigEntryValue);
    uint64_t ConfigEntryValue = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v27, 0x6Bu, 0);
    if (*(double *)ConfigEntryValue > 0.00001)
    {
      float v28 = *(double *)ConfigEntryValue;
      a4->float EDRFactor = v28;
    }
  }
  __int16 v29 = (HDRConfig *)GetConfig(ConfigEntryValue);
  if (v29
    && (int v30 = GetConfig(v29),
        __int16 v29 = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v30, 0x73u, 0),
        *(double *)v29 > 0.00001))
  {
    maxEDRCFNumberRef Value = *(double *)v29;
    a4->maxEDRCFNumberRef Value = maxEDRValue;
  }
  else
  {
    maxEDRCFNumberRef Value = a4->maxEDRValue;
  }
  if (maxEDRValue >= 1.0)
  {
    double v34 = maxEDRValue;
    double targetMaxLinear = a4->targetMaxLinear;
    double v33 = a4->targetMaxLinear / v34;
  }
  else
  {
    double targetMaxLinear = a4->targetMaxLinear;
    double v33 = a4->targetMaxLinear;
  }
  float v35 = v33;
  a4->diffuseInNits = v35;
  float v36 = targetMaxLinear;
  a4->Tmax_nits = v36;
  double v37 = fmax(targetMaxLinear, 40.0);
  a4->double targetMaxLinear = v37;
  a4->maxForwardTargetInNits = v37;
  int v38 = GetConfig(v29);
  if (v38)
  {
    uint64_t v39 = GetConfig((HDRConfig *)v38);
    if (*((_DWORD *)v39 + 2841))
    {
      if ((v39[5680] & 0x80) != 0)
      {
        char v40 = GetConfig((HDRConfig *)v39);
        if (v40)
        {
          id v41 = GetConfig((HDRConfig *)v40);
          double v42 = *(double *)HDRConfig::GetConfigEntryValue((uint64_t)v41, 0x81u, 0);
          if (v42 > 0.00001) {
            a4->targetMinLinear = v42;
          }
        }
      }
    }
  }
  CFNumberRef v43 = (const __CFNumber *)CFDictionaryGetValue(a3, @"HDRProcessingOrientationKey");
  if (v43)
  {
    float valuePtr = 0.0;
    CFNumberRef v43 = (const __CFNumber *)CFNumberGetValue(v43, kCFNumberIntType, &valuePtr);
    unsigned int v44 = LOBYTE(valuePtr) & 7;
  }
  else
  {
    unsigned int v44 = 0;
  }
  a4->orientation = v44;
  double v45 = GetConfig(v43);
  if (v45)
  {
    int v46 = GetConfig((HDRConfig *)v45);
    if (*((_DWORD *)v46 + 2203))
    {
      if ((v46[4404] & 0x80) != 0)
      {
        uint64_t v47 = GetConfig((HDRConfig *)v46);
        if (v47)
        {
          uint64_t v48 = GetConfig((HDRConfig *)v47);
          float v49 = *(float *)HDRConfig::GetConfigEntryValue((uint64_t)v48, 0x64u, 0);
        }
        else
        {
          float v49 = 0.0;
        }
        a4->AmbientInNits = v49;
      }
    }
  }
  float v50 = a4->maxEDRValue;
  if (v50 < 1.0)
  {
    syslog(27, "HDR Processor error: Invalid MaximumExtendedDynamicRangeColorComponentValue : %f\n", v50);
    a4->maxEDRCFNumberRef Value = 1.0;
  }
  float EDRFactor = a4->EDRFactor;
  if (EDRFactor > 1.0 || EDRFactor <= 0.0)
  {
    syslog(27, "HDR Processor error: Invalid EDRFactor : %f\n", EDRFactor);
    a4->float EDRFactor = 1.0;
  }
}

+ (BOOL)isNSDataNonEmpty:(id)a3 dataLength:(unint64_t *)a4 dataBytes:(char *)a5
{
  id v7 = a3;
  *a4 = [v7 length];
  id v8 = v7;
  CFNumberRef v9 = (char *)[v8 bytes];
  *a5 = v9;
  if (v9) {
    BOOL v10 = *a4 != 0;
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

+ (void)dolbyIOMFBMetadata:(id *)a3 withFilteredMinPQ:(float)a4 FilteredMaxPQ:(float)a5 FilteredAvgPQ:(float)a6 EnableLevel4:(BOOL)a7 FilteredAvg:(float)a8 FilteredStdDev:(float)a9
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3)
  {
    +[MSRHDRProcessing dolbyIOMFBMetadata:withFilteredMinPQ:FilteredMaxPQ:FilteredAvgPQ:EnableLevel4:FilteredAvg:FilteredStdDev:](MSRHDRProcessing, "dolbyIOMFBMetadata:withFilteredMinPQ:FilteredMaxPQ:FilteredAvgPQ:EnableLevel4:FilteredAvg:FilteredStdDev:");
  }
  else if (enableLogInstance)
  {
    if (logInstanceID) {
      uint64_t v9 = logInstanceID;
    }
    else {
      uint64_t v9 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218498;
      CFNumberRef v11 = (const char *)WORD1(v9);
      __int16 v12 = 2080;
      CFNumberRef v13 = "+[HDRProcessor dolbyIOMFBMetadata:withFilteredMinPQ:FilteredMaxPQ:FilteredAvgPQ:EnableLevel4:FilteredAvg:FilteredStdDev:]";
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx     %s: metatdata= %p, bailout!!!\n", (uint8_t *)&v10, 0x20u);
    }
    prevLogInstanceID = v9;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    CFNumberRef v11 = "+[HDRProcessor dolbyIOMFBMetadata:withFilteredMinPQ:FilteredMaxPQ:FilteredAvgPQ:EnableLevel4:FilteredAvg:FilteredStdDev:]";
    __int16 v12 = 2048;
    CFNumberRef v13 = 0;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]     %s: metatdata= %p, bailout!!!\n", (uint8_t *)&v10, 0x16u);
  }
}

+ (int64_t)parseHDR10PlusSEIMessage:(id)a3 outputMetadata:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  *(_OWORD *)((char *)&a4->var1.var0.var5[2] + 1) = 0u;
  *(_OWORD *)&a4->var1.var0.var2[5] = 0u;
  *(_OWORD *)&a4->var1.var0.var3 = 0u;
  *(_OWORD *)&a4->var0 = 0u;
  *(_OWORD *)&a4->var1.var0.var2[1] = 0u;
  __int16 v12 = 0;
  uint64_t v13 = 0;
  if (!+[HDRProcessor isNSDataNonEmpty:a3 dataLength:&v13 dataBytes:&v12])
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
        LODWORD(v19.var0) = 134218242;
        *(void ***)((char *)&v19.var0 + 4) = (void **)WORD1(v6);
        WORD2(v19.var1) = 2080;
        *(unint64_t *)((char *)&v19.var1 + 6) = (unint64_t)"+[HDRProcessor parseHDR10PlusSEIMessage:outputMetadata:]";
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx     %s: illegal SEI", (uint8_t *)&v19, 0x16u);
      }
      prevLogInstanceID = v6;
      return -17003;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v19.var0) = 136315138;
      *(void ***)((char *)&v19.var0 + 4) = (void **)"+[HDRProcessor parseHDR10PlusSEIMessage:outputMetadata:]";
      id v7 = &_os_log_internal;
      id v8 = (uint8_t *)&v19;
LABEL_24:
      _os_log_impl(&dword_22224D000, v7, OS_LOG_TYPE_DEFAULT, " [1.419.54]     %s: illegal SEI", v8, 0xCu);
    }
    return -17003;
  }
  HDR10PlusMetaData_RBSP::HDR10PlusMetaData_RBSP(&v19);
  commonRBSP::setRBSP((commonRBSP *)&v19, v12, v13);
  if (HDR10PlusMetaData_RBSP::parse_hdr10plus_sei((uint64_t)&v19, (uint64_t)v18))
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v5 = logInstanceID;
      }
      else {
        uint64_t v5 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v15 = (const char *)WORD1(v5);
        __int16 v16 = 2080;
        CFBooleanRef v17 = "+[HDRProcessor parseHDR10PlusSEIMessage:outputMetadata:]";
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx     %s: illegal SEI", buf, 0x16u);
      }
      prevLogInstanceID = v5;
      return -17003;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "+[HDRProcessor parseHDR10PlusSEIMessage:outputMetadata:]";
      id v7 = &_os_log_internal;
      id v8 = buf;
      goto LABEL_24;
    }
    return -17003;
  }
  Config = GetConfig((HDRConfig *)+[MSRHDRProcessing HDR10PlusIOMFBMetadata:a4 withHDR10PlusData:v18]);
  if (Config)
  {
    int v10 = GetConfig((HDRConfig *)Config);
    HDRConfig::GetConfigEntryValue((uint64_t)v10, 0x40u, 0);
  }
  return -17000;
}

- (id)getDispHDRProcessing
{
  return self->_disp;
}

- (float)defaultMaxEDRValue
{
  return self->_defaultMaxEDRValue;
}

- (void)setDefaultMaxEDRValue:(float)a3
{
  self->_defaultMaxEDRCFNumberRef Value = a3;
}

- (float)defaultEDRFactorValue
{
  return self->_defaultEDRFactorValue;
}

- (void)setDefaultEDRFactorValue:(float)a3
{
  self->_defaultEDRFactorCFNumberRef Value = a3;
}

- (float)defaultAmbientLightValue
{
  return self->_defaultAmbientLightValue;
}

- (void)setDefaultAmbientLightValue:(float)a3
{
  self->_defaultAmbientLightCFNumberRef Value = a3;
}

- (float)defaultContrastRatioValue
{
  return self->_defaultContrastRatioValue;
}

- (void)setDefaultContrastRatioValue:(float)a3
{
  self->_defaultContrastRatioCFNumberRef Value = a3;
}

- (double)targetNits
{
  return self->_targetNits;
}

- (void)setTargetNits:(double)a3
{
  self->_targetNits = a3;
}

- (double)targetMinNits
{
  return self->_targetMinNits;
}

- (void)setTargetMinNits:(double)a3
{
  self->_targetMinNits = a3;
}

- (__CFString)targetColorPrimaries
{
  return self->_targetColorPrimaries;
}

- (void)setTargetColorPrimaries:(__CFString *)a3
{
  self->_targetColorPrimaries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleSemaphone, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_scheduleQueue, 0);
  objc_storeStrong((id *)&self->_mr, 0);
  objc_storeStrong((id *)&self->_dm, 0);
  objc_storeStrong((id *)&self->_resampler, 0);
  objc_storeStrong((id *)&self->_composer, 0);
  objc_storeStrong((id *)&self->_disp, 0);
  objc_storeStrong((id *)&self->_msr, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end