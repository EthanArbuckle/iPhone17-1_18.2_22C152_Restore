@interface MSRHDRProcessing
+ (void)HDR10PlusIOMFBMetadata:(id *)a3 withHDR10PlusData:(id *)a4;
+ (void)dolbyIOMFBMetadata:(id *)a3 withFilteredMinPQ:(float)a4 FilteredMaxPQ:(float)a5 FilteredAvgPQ:(float)a6 EnableLevel4:(BOOL)a7 FilteredAvg:(float)a8 FilteredStdDev:(float)a9;
+ (void)dolbyIOMFBMetadata:(id *)a3 withMinBrightness:(float)a4 maxBrightness:(float)a5;
- (BOOL)dovi_tm_configChanged:(id *)a3 HDRControl:(id *)a4 DM:(id)a5 LLDoVi:(BOOL)a6 EdrAdaptationParam:(_EdrAdaptationParam *)a7 AmbAdaptationParam:(_AmbAdaptationParam *)a8 tcCtrl:(ToneCurve_Control *)a9;
- (BOOL)hasAMVEConfigChanged:(id *)a3 tcCtrl:(ToneCurve_Control *)a4;
- (BOOL)isMMREnabled;
- (BOOL)processFrameByMSRWithComposerData:(id *)a3 DM:(id)a4 DMData:(id *)a5 tcControl:(ToneCurve_Control *)a6 hdrControl:(id *)a7 hdr10InfoFrame:(id *)a8 layer0:(__IOSurface *)a9 layer1:(__IOSurface *)a10 output:(__IOSurface *)a11 frameNumebr:(unint64_t)a12 computedNumber:(unint64_t *)a13 config:(id *)a14;
- (MSRHDRProcessing)init;
- (float)getDolby84DegammaScale;
- (float)getDolby84PostDegammaScale;
- (int)getColorConfigSignatureString:(char *)a3 length:(int)a4 tcControl:(ToneCurve_Control *)a5 hdrControl:(id *)a6;
- (int)getLumaShiftBits;
- (int)getRgb2LmsScale2P;
- (unint64_t)getDegammaLutSize;
- (unint64_t)getRegammaLutSize;
- (unint64_t)getTmLutSize;
- (unsigned)getMatrixScale2P:(const float *)a3;
- (unsigned)getMatrixScale2P:(const float *)a3 OutputScale:(float)a4;
- (unsigned)polynomialTableScale;
- (unsigned)setLms2RgbScale2P:(const float *)a3 OutputScale:(float)a4;
- (void)attachDoViMetadataPacketTo:(__IOSurface *)a3 withDMData:(id *)a4 withDMConfig:(id *)a5 withHdrControl:(id *)a6 withMSRHDRContext:(MSRHDRContext *)a7;
- (void)attachHDRMetaDataToOutputSurface:(__IOSurface *)a3 withDMData:(id *)a4 withDMConfig:(id *)a5 withHdrControl:(id *)a6 withTcControl:(ToneCurve_Control *)a7 withMSRHDRContext:(MSRHDRContext *)a8 withInfoFrame:(id *)a9;
- (void)attachInfoFrameTo:(__IOSurface *)a3 withDMData:(id *)a4 withTcControl:(ToneCurve_Control *)a5 withInfoFrame:(id *)a6;
- (void)checkNewFrameForDump;
- (void)createAdaptationLut;
- (void)createCustomScalingTables;
- (void)dealloc;
- (void)decideStageStatus:(BOOL *)a3 MSRHDRContext:(MSRHDRContext *)a4 DMConfig:(id *)a5;
- (void)dovi_createLUTFromDMConfig:(id *)a3 DM:(id)a4 HDRControl:(id *)a5 LLDoVi:(BOOL)a6 TMParam:(_DoViTMParam *)a7 EdrAdaptationParam:(_EdrAdaptationParam *)a8 AmbAdaptationParam:(_AmbAdaptationParam *)a9 HlgOOTFCombined:(BOOL)a10 HlgOOTFOnly:(BOOL)a11 IsDoVi84:(BOOL)a12 IsInternalDisplay:(BOOL)a13 tcCtrl:(ToneCurve_Control *)a14;
- (void)dovi_getTmLutInput:(unint64_t)a3 lutInput:(float *)a4;
- (void)dovi_tm_createLUTFromDMConfig:(id *)a3 HDRControl:(id *)a4 DM:(id)a5 LLDoVi:(BOOL)a6 TMParam:(_DoViTMParam *)a7 EdrAdaptationParam:(_EdrAdaptationParam *)a8 AmbAdaptationParam:(_AmbAdaptationParam *)a9 HlgOOTFCombined:(BOOL)a10 HlgOOTFOnly:(BOOL)a11 IsDoVi84:(BOOL)a12 IsInternalDisplay:(BOOL)a13 tcCtrl:(ToneCurve_Control *)a14;
- (void)dovi_tm_reserveConfig:(id *)a3 HDRControl:(id *)a4 DM:(id)a5 LLDoVi:(BOOL)a6 EdrAdaptationParam:(_EdrAdaptationParam *)a7 AmbAdaptationParam:(_AmbAdaptationParam *)a8 tcCtrl:(ToneCurve_Control *)a9;
- (void)dovi_tm_updateLUT:(int64_t)a3 ScalingFactorBuffer:(float *)a4 ScalingFactorBufferSize:(unint64_t)a5 Sat2FactorBuffer:(float *)a6 Sat2FactorBufferSize:(unint64_t)a7 dmConfig:(id *)a8 HlgOOTFCombined:(BOOL)a9;
- (void)getDegammaLutInput:(float *)a3;
- (void)getRegammaLutInput:(float *)a3;
- (void)handleDoViToHDR10TV:(id *)a3 TCControl:(ToneCurve_Control *)a4 DMData:(id *)a5;
- (void)hdr10_createLUTFromDMConfig:(id *)a3 DM:(id)a4 TCControl:(ToneCurve_Control *)a5 HDRControl:(id *)a6 TMParam:(_HDR10TMParam *)a7 EdrAdaptationParam:(_EdrAdaptationParam *)a8 AmbAdaptationParam:(_AmbAdaptationParam *)a9;
- (void)hdr10_getTmLutInput:(unint64_t)a3 lutInput:(float *)a4;
- (void)hdr10_tm_createLUTFromDMConfig:(id *)a3 TMParam:(_HDR10TMParam *)a4 EdrAdaptationParam:(_EdrAdaptationParam *)a5 AmbAdaptationParam:(_AmbAdaptationParam *)a6 DM:(id)a7;
- (void)hdr10_tm_updateLUT:(int64_t)a3 ScalingFactorBuffer:(float *)a4 LumaMixFactorBuffer:(float *)a5;
- (void)hlg_createLUTFromDMConfig:(id *)a3 DM:(id)a4 HDRControl:(id *)a5 TMParam:(_HLGTMParam *)a6 EdrAdaptationParam:(_EdrAdaptationParam *)a7 AmbAdaptationParam:(_AmbAdaptationParam *)a8 TMMode:(int)a9;
- (void)hlg_getTmLutInput:(unint64_t)a3 lutInput:(float *)a4;
- (void)hlg_tm_createLUTFromDMConfig:(id *)a3 DM:(id)a4 TMParam:(_HLGTMParam *)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7 TMMode:(int)a8;
- (void)hlg_tm_reserveConfig:(id *)a3 HDRControl:(id *)a4 TMParam:(_HLGTMParam *)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7;
- (void)hlg_tm_updateLUT:(int64_t)a3 ScalingFactorBuffer:(float *)a4;
- (void)initDMConfigCache;
- (void)populateMSRColorConfig:(id *)a3 DMConfig:(id *)a4 DMData:(id *)a5 tcControl:(ToneCurve_Control *)a6 hdrControl:(id *)a7 MSRHDRContext:(MSRHDRContext *)a8;
- (void)populateMSRColorConfigHeader:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10;
- (void)populateMSRColorConfigStageB01_01:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10;
- (void)populateMSRColorConfigStageB01_02:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10;
- (void)populateMSRColorConfigStageB01_03:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10;
- (void)populateMSRColorConfigStageB01_04:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10;
- (void)populateMSRColorConfigStageB01_05:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10;
- (void)populateMSRColorConfigStageB01_06:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10;
- (void)populateMSRColorConfigStageB02:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10;
- (void)populateMSRColorConfigStageB02HDR10:(id *)a3 DMConfig:(id *)a4;
- (void)populateMSRColorConfigStageB02HLG:(id *)a3 hdrControl:(id *)a4;
- (void)populateMSRColorConfigStageB03:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10;
- (void)populateMSRColorConfigStageB04_01:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10;
- (void)populateMSRColorConfigStageB04_02:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10;
- (void)populateMSRColorConfigStageB04_03:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10;
- (void)populateMSRColorConfigStageB04_04:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10;
- (void)populateMSRColorConfigStageB04_05:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10;
- (void)runPostFrameDumpActions:(id *)a3;
- (void)setDegammaBuffer:(int64_t)a3 Buffer:(float *)a4 TableSize:(unint64_t)a5 Type:(int)a6 scalerForSrgbBeyondMax:(float)a7;
- (void)setRegammaBuffer:(int64_t)a3 LutInput:(float *)a4 Buffer:(float *)a5 TableSize:(unint64_t)a6 Type:(int)a7 DPCParam:(_DpcParam *)a8;
- (void)setSat2FactorTable:(float *)a3 TableSize:(unint64_t)a4 DMConfig:(id *)a5 LLDoVi:(BOOL)a6;
- (void)setupHardwareConfigUnit;
- (void)setupMSRColorConfig;
- (void)setupMSRHDRContext:(id *)a3 TCControl:(ToneCurve_Control *)a4 DMData:(id *)a5 input:(__IOSurface *)a6 output:(__IOSurface *)a7;
- (void)setupMSRMappingTableWithMetadata:(id *)a3;
- (void)setupMSRPolynomialTableForHDR10;
- (void)setupMSRPolynomialTableForHDR10:(unsigned __int16 *)a3 TableLength:(unsigned int)a4;
- (void)updateAMVEConfig:(id *)a3 tcCtrl:(ToneCurve_Control *)a4;
- (void)updateDegammaLUT:(MSRHDRContext *)a3 AdditionalScaler:(float)a4;
- (void)updateDegammaTable:(int64_t)a3 Table:(float *)a4 TableSize:(unint64_t)a5 Type:(int)a6 Scaler:(float)a7;
- (void)updatePolynomialTables:(unsigned __int16 *)a3 TableSize:(unint64_t)a4;
- (void)updateRegammaLUT:(MSRHDRContext *)a3;
- (void)updateRegammaTable:(int64_t)a3 Table:(float *)a4 TableSize:(unint64_t)a5;
@end

@implementation MSRHDRProcessing

- (MSRHDRProcessing)init
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)MSRHDRProcessing;
  v2 = [(ProcessingEngine *)&v17 init];
  if (v2)
  {
    v3 = [[MSRColorConfigMemoryPool alloc] initWithCapacity:16 Size:48384];
    msrCUPool = v2->_msrCUPool;
    v2->_msrCUPool = v3;

    if (sDumpContext) {
      BOOL v5 = dword_26ABE767C == 0;
    }
    else {
      BOOL v5 = 0;
    }
    char v6 = v5;
    v2->_dump = v6;
    v2->_reshapeLUTCreated = 0;
    v2->_degamma.type = 0;
    v2->_regamma.type = 0;
    v2->_max_fp16 = 7.91;
    v2->_computedFrames = 0;
    chromVectorWeight = 1081291571;
    [(MSRHDRProcessing *)v2 initDMConfigCache];
    [(MSRHDRProcessing *)v2 createCustomScalingTables];
    [(MSRHDRProcessing *)v2 createAdaptationLut];
    *(void *)entry = 0;
    CFTypeRef cf = 0;
    int ServiceObject = IOSurfaceAcceleratorCreate();
    if (!ServiceObject)
    {
      int ServiceObject = IOSurfaceAcceleratorGetServiceObject();
      if (!ServiceObject)
      {
        v8 = (void *)IORegistryEntrySearchCFProperty(entry[1], "IOService", @"IOSurfaceAcceleratorCapabilitiesDict", 0, 0);
        if (v8)
        {
          id v9 = v8;
          v10 = [v9 objectForKeyedSubscript:@"IOSurfaceAcceleratorHCUApiVersion"];
          int ServiceObject = [v10 intValue];
          CFRelease(v9);
        }
        else
        {
          int ServiceObject = -536870212;
        }
      }
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
        v21 = (const char *)WORD1(v11);
        __int16 v22 = 2080;
        v23 = "int getHDRCapability()";
        __int16 v24 = 1024;
        LODWORD(v25) = ServiceObject;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx ++ %s: MSRApiVer=%d\n", buf, 0x1Cu);
      }
      prevLogInstanceID = v11;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "int getHDRCapability()";
      __int16 v22 = 1024;
      LODWORD(v23) = ServiceObject;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] ++ %s: MSRApiVer=%d\n", buf, 0x12u);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (ServiceObject == 2) {
      int v12 = 1869769064;
    }
    else {
      int v12 = 1869769063;
    }
    v2->_unsigned int msrPlatform = v12;
  }
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
      unsigned int msrPlatform = v2->_msrPlatform;
      *(_DWORD *)buf = 134218754;
      v21 = (const char *)WORD1(v13);
      __int16 v22 = 2080;
      v23 = "-[MSRHDRProcessing init]";
      __int16 v24 = 2048;
      v25 = v2;
      __int16 v26 = 1024;
      unsigned int v27 = msrPlatform;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx ++ %s : MSR created! instance=%p, platform=0x%x\n", buf, 0x26u);
    }
    prevLogInstanceID = v13;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = v2->_msrPlatform;
    *(_DWORD *)buf = 136315650;
    v21 = "-[MSRHDRProcessing init]";
    __int16 v22 = 2048;
    v23 = (const char *)v2;
    __int16 v24 = 1024;
    LODWORD(v25) = v15;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] ++ %s : MSR created! instance=%p, platform=0x%x\n", buf, 0x1Cu);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = 0x10u;
  do
  {
    v4 = *(FILE **)&sDumpContext[v3];
    if (v4)
    {
      fclose(v4);
      *(void *)&sDumpContext[v3] = 0;
    }
    v3 += 24;
  }
  while (v3 != 112);
  msrCUPool = self->_msrCUPool;
  self->_msrCUPool = 0;

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
      *(_DWORD *)buf = 134218498;
      id v9 = (const char *)WORD1(v6);
      __int16 v10 = 2080;
      uint64_t v11 = (MSRHDRProcessing *)"-[MSRHDRProcessing dealloc]";
      __int16 v12 = 2048;
      uint64_t v13 = self;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx -- %s: MSR exit! instance=%p\n", buf, 0x20u);
    }
    prevLogInstanceID = v6;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[MSRHDRProcessing dealloc]";
    __int16 v10 = 2048;
    uint64_t v11 = self;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] -- %s: MSR exit! instance=%p\n", buf, 0x16u);
  }
  v7.receiver = self;
  v7.super_class = (Class)MSRHDRProcessing;
  [(ProcessingEngine *)&v7 dealloc];
}

- (void)checkNewFrameForDump
{
  char v2 = sDumpContext;
  if (sDumpContext)
  {
    unsigned int frameNumber = self->super._frameNumber;
    char v2 = dword_26ABE767C <= frameNumber && frameNumber <= dword_26ABE7680;
  }
  self->_dump = v2;
}

- (void)initDMConfigCache
{
  self->super._prev.tm.var0.dovi.slope = -12346.0;
}

- (void)createCustomScalingTables
{
  char v2 = self;
  vScaleCoefficents = self->_vScaleCoefficents;
  bzero(self->_vScaleCoefficents, 0x480uLL);
  char v2 = (MSRHDRProcessing *)((char *)v2 + 65076);
  bzero(v2, 0x780uLL);
  (*vScaleCoefficents)[96] = 0.25;
  (*vScaleCoefficents)[128] = 0.75;
  (*vScaleCoefficents)[144] = 0.25;
  (*vScaleCoefficents)[112] = 0.75;
  v2->super._prev.tm.tmParam.tmCurveParam.param.spl.splCs[2][2] = 1.0;
  *(_DWORD *)&v2->super._anon_90[304] = 1001390080;
  *(_DWORD *)&v2->super._anon_90[432] = 1018953728;
  v2->super._prev.tm.tmParam.Tmin_nits = -0.12793;
  v2->super._prev.tm.tmParam.tmCurveParam.param.spl.MsC[0] = 0.59961;
  v2->super._prev.tm.tmParam.tmCurveParam.param.spl.polyCs[1][2] = 0.59961;
  v2->super._prev.tm.tmParam.tmCurveParam.param.ebz.arrPsC[3][13] = -0.12793;
  v2->super._prev.tm.tmParam.tmCurveParam.param.ebz.bezierAnchors[0][11] = 0.022949;
  v2->super._prev.tm.tmParam.tmCurveParam.param.ebz.bezierAnchors[2][13] = 0.0053711;
}

- (void)createAdaptationLut
{
  uint64_t v2 = 0;
  float32x4_t v3 = (float32x4_t)vdupq_n_s32(0x3A828C14u);
  int32x4_t v4 = (int32x4_t)xmmword_2222D1810;
  float64x2_t v5 = (float64x2_t)vdupq_n_s64(0x3F747AE147AE147BuLL);
  __asm { FMOV            V3.4S, #1.0 }
  v11.i64[0] = 0x400000004;
  v11.i64[1] = 0x400000004;
  do
  {
    float32x4_t v12 = vmulq_f32(vcvtq_f32_s32(v4), v3);
    uint64_t v13 = &self->_ambientHeadroomAdaptationLut[v2];
    *(float32x4_t *)uint64_t v13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)v12.f32), v5)), vaddq_f64(vcvt_hight_f64_f32(v12), v5));
    *((_OWORD *)v13 + 250) = _Q3;
    int32x4_t v4 = vaddq_s32(v4, v11);
    v2 += 4;
  }
  while (v2 != 1000);
}

- (unint64_t)getDegammaLutSize
{
  return 514;
}

- (void)updateDegammaLUT:(MSRHDRContext *)a3 AdditionalScaler:(float)a4
{
  uint64_t v6 = self;
  uint64_t v33 = *MEMORY[0x263EF8340];
  unsigned int inputTransferFunction = a3->inputTransferFunction;
  switch(inputTransferFunction)
  {
    case 0xDu:
      int v8 = 0;
      int v9 = 0;
      char v10 = 0;
      uint64_t v11 = 1;
      break;
    case 8u:
      int v8 = 0;
      int v9 = 0;
      uint64_t v11 = 4;
      char v10 = 1;
      break;
    case 0x12u:
      int v8 = 0;
      char v10 = 0;
      uint64_t v11 = 3;
      int v9 = 1;
      break;
    case 0x10u:
      int v9 = 0;
      char v10 = 0;
      uint64_t v11 = 2;
      int v8 = 1;
      break;
    default:
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v12 = logInstanceID;
        }
        else {
          uint64_t v12 = prevLogInstanceID;
        }
        self = (MSRHDRProcessing *)os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
        if (self)
        {
          int v27 = 134218498;
          uint64_t v28 = (const char *)WORD1(v12);
          __int16 v29 = 2080;
          v30 = "-[MSRHDRProcessing updateDegammaLUT:AdditionalScaler:]";
          __int16 v31 = 1024;
          int v32 = 0;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx  %s : Not supported type=%d\n", (uint8_t *)&v27, 0x1Cu);
        }
        int v8 = 0;
        int v9 = 0;
        char v10 = 0;
        uint64_t v11 = 0;
        prevLogInstanceID = v12;
      }
      else
      {
        self = (MSRHDRProcessing *)os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
        if (self)
        {
          int v27 = 136315394;
          uint64_t v28 = "-[MSRHDRProcessing updateDegammaLUT:AdditionalScaler:]";
          __int16 v29 = 1024;
          LODWORD(v30) = 0;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]  %s : Not supported type=%d\n", (uint8_t *)&v27, 0x12u);
        }
        int v8 = 0;
        int v9 = 0;
        char v10 = 0;
        uint64_t v11 = 0;
      }
      break;
  }
  Config = GetConfig((HDRConfig *)self);
  if (Config
    && (uint64_t v14 = GetConfig((HDRConfig *)Config), *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v14, 0x2Fu, 0))
    || v6->_degamma.type != v11
    || inputTransferFunction == 13 && v6->_max_fp16 != v6->super._prev.degamma.max_fp16
    || v6->super._prev.degamma.additional_scaler != a4
    || a3->processingType != v6->super._prev.processingType)
  {
    uint64_t v15 = [(MSRHDRProcessing *)v6 getDegammaLutSize];
    v16 = malloc_type_malloc(4 * v15, 0x32746348uLL);
    if (v16)
    {
      v18 = v16;
      if (inputTransferFunction == 13) {
        v6->super._prev.degamma.max_fp16 = v6->_max_fp16;
      }
      v6->_degamma.type = v11;
      v6->super._prev.degamma.additional_scaler = a4;
      int processingType = a3->processingType;
      v6->super._prev.int processingType = processingType;
      float v20 = v6->_max_fp16 * 1.125;
      if (v20 >= 0.03928) {
        float v21 = powf((float)(v20 * 0.94787) + 0.052133, 2.4);
      }
      else {
        float v21 = v20 * 0.077399;
      }
      if (a3->inputColorSpace <= 1 && processingType == 5) {
        char v22 = isSupportedMSRColorConversion(a3->inputFormat, a3->outputFormat);
      }
      else {
        char v22 = 0;
      }
      float v23 = 100.0 / v21;
      if (v8)
      {
        if (processingType == 1) {
          float v24 = a4 * 0.0001;
        }
        else {
          float v24 = 0.01;
        }
      }
      else if (inputTransferFunction == 13)
      {
        if (v22)
        {
          float v24 = 0.5;
          float v23 = 0.59019;
        }
        else
        {
          if (v6->_msrHC.inputIsSRGBEncodedEdr) {
            float v24 = 1.0;
          }
          else {
            float v24 = 1.5625;
          }
          if (!v6->_msrHC.inputIsSRGBEncodedEdr) {
            float v23 = 1.5625;
          }
        }
      }
      else if (v9)
      {
        float v24 = 1.0;
        if (v6->_msrHC.processingType == 4
          && ((*(_WORD *)&v6->super._anon_90[472] & 0x80) == 0 || (debugDM4DisableConf & 0x80) != 0))
        {
          [(MSRHDRProcessing *)v6 getDolby84DegammaScale];
          float v24 = *(float *)&v17;
        }
      }
      else if (v10)
      {
        float v24 = 100.0;
      }
      else if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v26 = logInstanceID;
        }
        else {
          uint64_t v26 = prevLogInstanceID;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 134218240;
          uint64_t v28 = (const char *)WORD1(v26);
          __int16 v29 = 1024;
          LODWORD(v30) = v11;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Not supported type=%d\n", (uint8_t *)&v27, 0x12u);
        }
        prevLogInstanceID = v26;
        float v24 = 1.0;
      }
      else
      {
        float v24 = 1.0;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 67109120;
          LODWORD(v28) = v11;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Not supported type=%d\n", (uint8_t *)&v27, 8u);
        }
      }
      *(float *)&double v17 = v23;
      [(MSRHDRProcessing *)v6 setDegammaBuffer:2 Buffer:v18 TableSize:v15 Type:v11 scalerForSrgbBeyondMax:v17];
      *(float *)&double v25 = v24;
      [(MSRHDRProcessing *)v6 updateDegammaTable:2 Table:v18 TableSize:v15 Type:v11 Scaler:v25];
      free(v18);
    }
  }
}

- (float)getDolby84DegammaScale
{
  return 10.0;
}

- (void)getDegammaLutInput:(float *)a3
{
  uint64_t v3 = 0;
  int64x2_t v4 = (int64x2_t)xmmword_2222D09C0;
  uint64x2_t v5 = (uint64x2_t)vdupq_n_s64(0x201uLL);
  int64x2_t v6 = vdupq_n_s64(2uLL);
  do
  {
    if (vmovn_s64((int64x2_t)vcgtq_u64(v5, (uint64x2_t)v4)).u8[0]) {
      a3[v3] = (float)v3 * 0.0019531;
    }
    if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x201uLL), *(uint64x2_t *)&v4)).i32[1]) {
      a3[v3 + 1] = (float)(v3 + 1) * 0.0019531;
    }
    v3 += 2;
    int64x2_t v4 = vaddq_s64(v4, v6);
  }
  while (v3 != 514);
  a3[513] = 1.125;
}

- (void)setDegammaBuffer:(int64_t)a3 Buffer:(float *)a4 TableSize:(unint64_t)a5 Type:(int)a6 scalerForSrgbBeyondMax:(float)a7
{
  if (a3 == 2)
  {
    uint64_t v12 = (float *)malloc_type_malloc(4 * [(MSRHDRProcessing *)self getDegammaLutSize], 0x100004052888210uLL);
    if (v12)
    {
      uint64_t v13 = v12;
      [(MSRHDRProcessing *)self getDegammaLutInput:v12];
      switch(a6)
      {
        case 1:
          if (a5)
          {
            uint64_t v14 = 0;
            float max_fp16 = self->_max_fp16;
            do
            {
              float v16 = v13[v14];
              float v17 = 100.0 / a7;
              if (v16 < 1.0)
              {
                float v18 = max_fp16 * v16;
                if ((float)(max_fp16 * v16) >= 0.03928) {
                  float v17 = powf((float)(v18 * 0.94787) + 0.052133, 2.4);
                }
                else {
                  float v17 = v18 * 0.077399;
                }
              }
              a4[v14++] = v17;
            }
            while (a5 > v14);
          }
          break;
        case 2:
          if (a5)
          {
            v19 = v13;
            do
            {
              float v20 = *v19++;
              float v21 = fminf(v20, 1.125);
              BOOL v22 = v21 < 0.00000073096;
              if (v21 < 0.00000073096) {
                float v21 = -(float)(v21 + -0.0000014619);
              }
              float v23 = flt_2222D1868[v22];
              float v24 = powf(v21, 0.012683);
              float v25 = fmax((float)((float)(v24 + -0.83594) / (float)((float)(v24 * -18.688) + 18.852)), 0.0);
              *a4++ = v23 * powf(v25, 6.2774);
              --a5;
            }
            while (a5);
          }
          break;
        case 3:
          if (a5)
          {
            uint64_t v26 = v13;
            do
            {
              float v27 = fminf(*v26, 1.125);
              if (v27 <= 0.5) {
                float v28 = (float)(v27 * v27) / 3.0;
              }
              else {
                float v28 = (exp((v27 + -0.55991073) / 0.17883277) + 0.28466892) / 12.0;
              }
              *a4++ = v28;
              ++v26;
              --a5;
            }
            while (a5);
          }
          break;
        case 4:
          memcpy(a4, v13, 4 * a5);
          break;
        default:
          break;
      }
      free(v13);
    }
  }
}

- (void)updateDegammaTable:(int64_t)a3 Table:(float *)a4 TableSize:(unint64_t)a5 Type:(int)a6 Scaler:(float)a7
{
  if (a3 == 2)
  {
    if (self->_msrPlatform == 1869769064)
    {
      if (a5)
      {
        p_degamma = &self->_degamma;
        do
        {
          p_degamma->var0.degmmaC.lutForCModel[0] = *a4 * a7;
          p_degamma = ($FB8DFEDDEC39CFDCB3D4990D8C702B86 *)((char *)p_degamma + 4);
          float v8 = *a4++;
          p_degamma->var0.degmmaS.lutForCModel[1280] = v8 * a7;
          --a5;
        }
        while (a5);
      }
    }
    else if (a5)
    {
      uint64_t v9 = 0;
      char v10 = &self->_degamma.var0.degmmaS.lutForCModel[514];
      do
      {
        self->_degamma.var0.degmmaC.lutForCModel[v9] = a4[v9] * a7;
        uint64_t v11 = 0x3FFFFFFFFFFFF9FALL;
        do
        {
          float v12 = a4[v9] * a7;
          float v13 = -v12;
          if (v12 >= 0.0) {
            float v13 = a4[v9] * a7;
          }
          LODWORD(v10[v11 + 1542]) = ((float)(v13 * 16777000.0) + 0.5) & 0x7FFFFFFF | ((v12 < 0.0) << 31);
          v11 += 514;
        }
        while (v11 * 4);
        ++v9;
        ++v10;
      }
      while (v9 != a5);
    }
  }
}

- (unint64_t)getRegammaLutSize
{
  return 706;
}

- (void)getRegammaLutInput:(float *)a3
{
  int v3 = 0;
  int v4 = 0;
  int v5 = 0;
  unsigned int v6 = 1024;
  do
  {
    if (v3) {
      uint64_t v7 = 32;
    }
    else {
      uint64_t v7 = 64;
    }
    if (v3) {
      char v8 = 5;
    }
    else {
      char v8 = 6;
    }
    unsigned int v9 = v6 >> v8;
    int v10 = v5;
    int v11 = v4;
    uint64_t v12 = v7;
    do
    {
      a3[v11++] = (float)(v10 & 0x7FFFFFF8) * 9.3132e-10;
      v10 += v9;
      --v12;
    }
    while (v12);
    v4 += v7;
    v5 += v6;
    v6 <<= v3++ != 0;
  }
  while (v3 != 21);
  *((void *)a3 + 352) = 0x3F9000003F800000;
}

- (void)updateRegammaLUT:(MSRHDRContext *)a3
{
  p_regamma = &self->_regamma;
  p_dpcParam = &self->_regamma.dpcParam;
  unsigned int outputTransferFunction = a3->outputTransferFunction;
  if (outputTransferFunction == 16)
  {
    uint64_t v7 = 2;
  }
  else
  {
    if (outputTransferFunction == 8) {
      unsigned int v8 = 3;
    }
    else {
      unsigned int v8 = 1;
    }
    if (a3->dpcParam.on) {
      uint64_t v7 = v8;
    }
    else {
      uint64_t v7 = 1;
    }
  }
  unsigned int v9 = &a3->dpcParam;
  Config = GetConfig((HDRConfig *)self);
  if (Config
    && (int v11 = GetConfig((HDRConfig *)Config), *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v11, 0x2Fu, 0))
    || p_regamma->type != v7
    || (*(void *)&p_dpcParam->alpha == *(void *)&v9->alpha
      ? (BOOL v12 = *(void *)&p_dpcParam->rangeMax == *(void *)&v9->rangeMax)
      : (BOOL v12 = 0),
        v12 ? (BOOL v13 = *(unsigned int *)&p_dpcParam->on == (unint64_t)*(unsigned int *)&v9->on) : (BOOL v13 = 0),
        !v13))
  {
    unint64_t v14 = [(MSRHDRProcessing *)self getRegammaLutSize];
    uint64_t v15 = malloc_type_malloc(4 * v14, 0x8E90928BuLL);
    float v16 = malloc_type_malloc(4 * v14, 0x33F9DA0EuLL);
    float v17 = v16;
    if (v15 && v16)
    {
      p_regamma->type = v7;
      long long v18 = *(_OWORD *)&v9->alpha;
      *(_DWORD *)&p_dpcParam->on = *(_DWORD *)&v9->on;
      *(_OWORD *)&p_dpcParam->alpha = v18;
      [(MSRHDRProcessing *)self getRegammaLutInput:v16];
      [(MSRHDRProcessing *)self setRegammaBuffer:11 LutInput:v17 Buffer:v15 TableSize:v14 Type:v7 DPCParam:v9];
      [(MSRHDRProcessing *)self updateRegammaTable:11 Table:v15 TableSize:v14];
      free(v15);
LABEL_25:
      free(v17);
      return;
    }
    if (v15) {
      free(v15);
    }
    if (v17) {
      goto LABEL_25;
    }
  }
}

- (void)setRegammaBuffer:(int64_t)a3 LutInput:(float *)a4 Buffer:(float *)a5 TableSize:(unint64_t)a6 Type:(int)a7 DPCParam:(_DpcParam *)a8
{
  if (a3 != 4 && a6)
  {
    uint64_t v12 = 0;
    BOOL v13 = &self->super._anon_90[448];
    while (1)
    {
      if (a7 == 1)
      {
        applyDPCompensationS((uint64_t)v13, a4[v12]);
        double v19 = v18;
        if (v19 >= 0.00304025)
        {
          float v22 = v19 * 1.13712;
          double v20 = powf(v22, 0.41667) + -0.055;
        }
        else
        {
          double v20 = v19 * 12.92;
        }
        float v17 = v20;
        goto LABEL_15;
      }
      if (a7 == 3) {
        break;
      }
      if (a7 == 2)
      {
        applyDPCompensationS((uint64_t)v13, a4[v12]);
        float v15 = v14 * 10000.0;
        if (v15 >= 0.0)
        {
          float v21 = powf(v15 * 0.0001, 0.1593);
          float v17 = powf((float)((float)(v21 * 18.852) + 0.83594) / (float)((float)(v21 * 18.688) + 1.0), 78.844);
        }
        else
        {
          float v16 = powf(v15 * -0.0001, 0.1593);
          float v17 = 0.0000014619
              - powf((float)((float)(v16 * 18.852) + 0.83594) / (float)((float)(v16 * 18.688) + 1.0), 78.844);
        }
        goto LABEL_15;
      }
LABEL_16:
      if (a6 <= ++v12) {
        return;
      }
    }
    applyDPCompensationS((uint64_t)v13, a4[v12]);
LABEL_15:
    a5[v12] = v17;
    goto LABEL_16;
  }
}

- (void)updateRegammaTable:(int64_t)a3 Table:(float *)a4 TableSize:(unint64_t)a5
{
  if (a3 != 4)
  {
    [(MSRHDRProcessing *)self getRegammaLutSize];
    if (a5)
    {
      uint64_t v8 = 0;
      lut = self->_regamma.lut;
      do
      {
        self->_regamma.lutForCModel[v8] = a4[v8];
        uint64_t v10 = 0x3FFFFFFFFFFFF7BALL;
        do
        {
          (*lut)[v10 + 2118] = a4[v8];
          v10 += 706;
        }
        while (v10 * 4);
        ++v8;
        lut = (float (*)[706])((char *)lut + 4);
      }
      while (v8 != a5);
    }
  }
}

- (void)setupMSRColorConfig
{
  *(void *)&self->_msrCC.version = 0x811C00000000;
}

- (void)handleDoViToHDR10TV:(id *)a3 TCControl:(ToneCurve_Control *)a4 DMData:(id *)a5
{
  if (a3->var0 == 1)
  {
    if (a5->var16 - 3075 < 0xA) {
      unsigned int v5 = 1;
    }
    else {
      unsigned int v5 = 3;
    }
    if (a3->var17 != 16) {
      unsigned int v5 = 1;
    }
  }
  else
  {
    unsigned int v5 = 1;
  }
  if (a3->var3 == 3 && a3->var10 == 2 && a4->targetMaxLinear == 1000.0) {
    self->_msrHC.operation = v5;
  }
}

- (void)setupMSRHDRContext:(id *)a3 TCControl:(ToneCurve_Control *)a4 DMData:(id *)a5 input:(__IOSurface *)a6 output:(__IOSurface *)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  p_msrHC = &self->_msrHC;
  self->_msrHC.int contentType = a3->var0;
  self->_msrHC.unsigned int displayType = a3->var10;
  self->_msrHC.int processingType = a4->tmData.processingType;
  *(void *)&self->_msrHC.operation = *(void *)&a3->var3;
  self->_msrHC.convertType = a3->var5;
  self->_msrHC.inputFormatRaw = IOSurfaceGetPixelFormat(a6);
  p_msrHC->outputFormatRaw = IOSurfaceGetPixelFormat(a7);
  p_msrHC->int inputFormat = getFourCCforType(p_msrHC->inputFormatRaw);
  p_msrHC->outputFormat = getFourCCforType(p_msrHC->outputFormatRaw);
  int8x8_t v14 = *(int8x8_t *)&a3->var17;
  *(int8x8_t *)&long long v15 = vext_s8(v14, *(int8x8_t *)&a4->targetColorSpace, 4uLL);
  v14.i32[1] = HIDWORD(*(void *)&a4->targetColorSpace);
  *((int8x8_t *)&v15 + 1) = v14;
  *(_OWORD *)&p_msrHC->inputColorSpace = v15;
  p_msrHC->originalInputTransferFunction = a3->var28;
  *(_WORD *)&p_msrHC->enableReshaping = 0;
  p_msrHC->enableConverting = 0;
  int inputFormat = p_msrHC->inputFormat;
  if (inputFormat > 1647534391)
  {
    if (inputFormat == 1815162994) {
      goto LABEL_7;
    }
    int v17 = 1647534392;
  }
  else
  {
    if (inputFormat == 1378955371) {
      goto LABEL_7;
    }
    int v17 = 1380411457;
  }
  if (inputFormat != v17) {
    goto LABEL_23;
  }
LABEL_7:
  p_msrHC->inputColorSpace = 1;
  if ((p_msrHC->operation & 4) != 0)
  {
    if (p_msrHC->processingType != 5)
    {
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v19 = logInstanceID;
        }
        else {
          uint64_t v19 = prevLogInstanceID;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v30 = 134217984;
          uint64_t v31 = WORD1(v19);
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"_msrHC.processingType == kHDRProcessingTypeConvert\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 713\n", (uint8_t *)&v30, 0xCu);
        }
        prevLogInstanceID = v19;
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"_msrHC.processingType == kHDRProcessingTypeConvert\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 713\n", (uint8_t *)&v30, 2u);
      }
    }
    int contentType = 4;
    goto LABEL_22;
  }
  if (inputFormat == 1380411457)
  {
    int contentType = p_msrHC->contentType;
    if (p_msrHC->contentType == 2) {
LABEL_22:
    }
      p_msrHC->operation = contentType;
  }
LABEL_23:
  [(MSRHDRProcessing *)self handleDoViToHDR10TV:a3 TCControl:a4 DMData:a5];
  unsigned int displayType = p_msrHC->displayType;
  if (displayType == 6 || displayType == 1) {
    chromVectorWeight = 1077936128;
  }
  p_msrHC->inputWidth = IOSurfaceGetWidth(a6);
  p_msrHC->inputHeight = IOSurfaceGetHeight(a6);
  p_msrHC->outputWidth = IOSurfaceGetWidth(a7);
  Height = (HDRConfig *)IOSurfaceGetHeight(a7);
  p_msrHC->outputHeight = (unint64_t)Height;
  uint64_t Config = (uint64_t)GetConfig(Height);
  if (Config)
  {
    uint64_t Config = (uint64_t)GetConfig((HDRConfig *)Config);
    if (*(_DWORD *)(Config + 8988))
    {
      if ((*(unsigned char *)(Config + 8984) & 0x80) != 0)
      {
        uint64_t Config = (uint64_t)GetConfig((HDRConfig *)Config);
        if (Config)
        {
          float v23 = GetConfig((HDRConfig *)Config);
          uint64_t Config = HDRConfig::GetConfigEntryValue((uint64_t)v23, 0x66u, 0);
        }
      }
    }
  }
  uint64_t ConfigEntryValue = (uint64_t)GetConfig((HDRConfig *)Config);
  if (ConfigEntryValue)
  {
    uint64_t ConfigEntryValue = (uint64_t)GetConfig((HDRConfig *)ConfigEntryValue);
    if (*(_DWORD *)(ConfigEntryValue + 10484))
    {
      if ((*(unsigned char *)(ConfigEntryValue + 10480) & 0x80) != 0)
      {
        uint64_t ConfigEntryValue = (uint64_t)GetConfig((HDRConfig *)ConfigEntryValue);
        if (ConfigEntryValue)
        {
          float v25 = GetConfig((HDRConfig *)ConfigEntryValue);
          uint64_t ConfigEntryValue = HDRConfig::GetConfigEntryValue((uint64_t)v25, 0x77u, 0);
        }
      }
    }
  }
  uint64_t v26 = GetConfig((HDRConfig *)ConfigEntryValue);
  if (v26)
  {
    float v27 = GetConfig((HDRConfig *)v26);
    if (*((_DWORD *)v27 + 2841))
    {
      if ((v27[5680] & 0x80) != 0)
      {
        float v28 = GetConfig((HDRConfig *)v27);
        if (v28)
        {
          __int16 v29 = GetConfig((HDRConfig *)v28);
          HDRConfig::GetConfigEntryValue((uint64_t)v29, 0x81u, 0);
        }
      }
    }
  }
}

- (BOOL)processFrameByMSRWithComposerData:(id *)a3 DM:(id)a4 DMData:(id *)a5 tcControl:(ToneCurve_Control *)a6 hdrControl:(id *)a7 hdr10InfoFrame:(id *)a8 layer0:(__IOSurface *)a9 layer1:(__IOSurface *)a10 output:(__IOSurface *)a11 frameNumebr:(unint64_t)a12 computedNumber:(unint64_t *)a13 config:(id *)a14
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v19 = a4;
  double v20 = [(MSRColorConfigMemoryPool *)self->_msrCUPool getAlloc];
  float v21 = v20;
  if (v20)
  {
    id v30 = v20;
    float v22 = ($8B3AF0B2D3B5851A45F6848E97B3F83F *)[v30 mutableBytes];
    self->_msrCU = v22;
    bzero(v22, 0xBD00uLL);
    [(MSRHDRProcessing *)self setupHardwareConfigUnit];
    p_msrHC = &self->_msrHC;
    *(_OWORD *)&self->_msrHC.int contentType = 0u;
    *(_OWORD *)&self->_msrHC.operationFlags = 0u;
    *(_OWORD *)&self->_msrHC.int inputFormat = 0u;
    *(_OWORD *)&self->_msrHC.unsigned int inputTransferFunction = 0u;
    *(_OWORD *)&self->_msrHC.inputHeight = 0u;
    *(_OWORD *)&self->_msrHC.outputHeight = 0u;
    *(_OWORD *)&self->_msrHC.dpcParam.alphaPrime = 0u;
    *(void *)&self->_msrHC.originalInputTransferFunction = 0;
    bzero(&self->_msrCC, 0x9008uLL);
    *(_OWORD *)self->super._anon_90 = 0u;
    *(_OWORD *)&self->super._anon_90[480] = 0u;
    *(_OWORD *)&self->super._anon_90[496] = 0u;
    *(_OWORD *)&self->super._anon_90[448] = 0u;
    *(_OWORD *)&self->super._anon_90[464] = 0u;
    *(_OWORD *)&self->super._anon_90[416] = 0u;
    *(_OWORD *)&self->super._anon_90[432] = 0u;
    *(_OWORD *)&self->super._anon_90[384] = 0u;
    *(_OWORD *)&self->super._anon_90[400] = 0u;
    *(_OWORD *)&self->super._anon_90[352] = 0u;
    *(_OWORD *)&self->super._anon_90[368] = 0u;
    *(_OWORD *)&self->super._anon_90[320] = 0u;
    *(_OWORD *)&self->super._anon_90[336] = 0u;
    *(_OWORD *)&self->super._anon_90[288] = 0u;
    *(_OWORD *)&self->super._anon_90[304] = 0u;
    *(_OWORD *)&self->super._anon_90[256] = 0u;
    *(_OWORD *)&self->super._anon_90[272] = 0u;
    *(_OWORD *)&self->super._anon_90[224] = 0u;
    *(_OWORD *)&self->super._anon_90[240] = 0u;
    *(_OWORD *)&self->super._anon_90[192] = 0u;
    *(_OWORD *)&self->super._anon_90[208] = 0u;
    *(_OWORD *)&self->super._anon_90[160] = 0u;
    *(_OWORD *)&self->super._anon_90[176] = 0u;
    *(_OWORD *)&self->super._anon_90[128] = 0u;
    *(_OWORD *)&self->super._anon_90[144] = 0u;
    *(_OWORD *)&self->super._anon_90[96] = 0u;
    *(_OWORD *)&self->super._anon_90[112] = 0u;
    *(_OWORD *)&self->super._anon_90[64] = 0u;
    *(_OWORD *)&self->super._anon_90[80] = 0u;
    *(_OWORD *)&self->super._anon_90[32] = 0u;
    *(_OWORD *)&self->super._anon_90[48] = 0u;
    *(_OWORD *)&self->super._anon_90[16] = 0u;
    *(_DWORD *)&self->super._anon_90[252] = -971227136;
    self->super._unsigned int frameNumber = a12;
    uint64_t Config = GetConfig(v24);
    if (Config)
    {
      uint64_t v26 = GetConfig((HDRConfig *)Config);
      byte_26ABE76A8 = *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v26, 2u, 0);
      if (byte_26ABE76A8)
      {
        dword_26ABE76AC = ccDumpStart;
        unk_26ABE76B0 = ccDumpStart + ccDumpNumber - 1;
      }
    }
    else
    {
      byte_26ABE76A8 = 0;
    }
    msrCU = self->_msrCU;
    [(ProcessingEngine *)self setupToneMappingWithDmData:a5 tcControl:a6 hdrControl:a7 dmConfig:self->super._anon_90 DM:v19 hdr10InfoFrame:a8];
    [(MSRHDRProcessing *)self setupMSRColorConfig];
    [(MSRHDRProcessing *)self setupMSRHDRContext:a7 TCControl:a6 DMData:a5 input:a9 output:a11];
    if (p_msrHC->contentType - 2 < 2 || p_msrHC->contentType == 1 && self->_msrHC.originalInputTransferFunction == 18) {
      [(MSRHDRProcessing *)self setupMSRPolynomialTableForHDR10];
    }
    else {
      [(MSRHDRProcessing *)self setupMSRMappingTableWithMetadata:a3];
    }
    [(MSRHDRProcessing *)self runPreFrameDumpActions:&self->_msrHC tcControl:a6 hdrControl:a7];
    [(MSRHDRProcessing *)self populateMSRColorConfig:&self->_msrCC DMConfig:self->super._anon_90 DMData:a5 tcControl:a6 hdrControl:a7 MSRHDRContext:&self->_msrHC];
    [(MSRHDRProcessing *)self attachHDRMetaDataToOutputSurface:a11 withDMData:a5 withDMConfig:self->super._anon_90 withHdrControl:a7 withTcControl:a6 withMSRHDRContext:&self->_msrHC withInfoFrame:a8];
    memcpy(&msrCU->var2, &self->_msrCC, sizeof(msrCU->var2));
    *a13 = self->_computedFrames;
    [(MSRHDRProcessing *)self runPostFrameDumpActions:&self->_msrCC];
    *a14 = [(MSRColorConfigMemoryPool *)self->_msrCUPool generateColorConfig:v30 msrCU:self->_msrCU];
    self->_msrCU = 0;
  }
  else if (enableLogInstance)
  {
    if (logInstanceID) {
      uint64_t v27 = logInstanceID;
    }
    else {
      uint64_t v27 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v33 = (const char *)WORD1(v27);
      __int16 v34 = 2080;
      uint64_t v35 = (uint64_t)"-[MSRHDRProcessing processFrameByMSRWithComposerData:DM:DMData:tcControl:hdrControl:hdr10InfoFrame:"
                     "layer0:layer1:output:frameNumebr:computedNumber:config:]";
      __int16 v36 = 2048;
      uint64_t v37 = 48384;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx    %s: ERROR: Failed to allocate memory! size = %lu bytes", buf, 0x20u);
    }
    prevLogInstanceID = v27;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v33 = "-[MSRHDRProcessing processFrameByMSRWithComposerData:DM:DMData:tcControl:hdrControl:hdr10InfoFrame:layer0:laye"
          "r1:output:frameNumebr:computedNumber:config:]";
    __int16 v34 = 2048;
    uint64_t v35 = 48384;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]    %s: ERROR: Failed to allocate memory! size = %lu bytes", buf, 0x16u);
  }

  return v21 != 0;
}

- (void)setupHardwareConfigUnit
{
  *(_OWORD *)&self->_msrCU->var0.var0 = xmmword_2222D46B0;
}

- (unsigned)polynomialTableScale
{
  return 4;
}

- (void)setupMSRPolynomialTableForHDR10:(unsigned __int16 *)a3 TableLength:(unsigned int)a4
{
  unsigned int v6 = [(MSRHDRProcessing *)self polynomialTableScale];
  int v7 = 0;
  for (uint64_t i = 0; i != 3; ++i)
  {
    if (a4)
    {
      int v9 = 0;
      uint64_t v10 = &a3[v7];
      uint64_t v11 = a4;
      do
      {
        *v10++ = v9;
        v9 += v6;
        --v11;
      }
      while (v11);
    }
    v7 += a4;
  }
}

- (void)setupMSRPolynomialTableForHDR10
{
  int v3 = malloc_type_malloc(0x1800uLL, 0xE347DA2BuLL);
  [(MSRHDRProcessing *)self setupMSRPolynomialTableForHDR10:v3 TableLength:1024];
  [(MSRHDRProcessing *)self updatePolynomialTables:v3 TableSize:1024];
  free(v3);
}

- (void)setupMSRMappingTableWithMetadata:(id *)a3
{
  unsigned int v5 = a3->var0 + 8;
  unsigned int v6 = malloc_type_malloc(6 << (LOBYTE(a3->var0) + 8), 0x628590CBuLL);
  int v7 = 0;
  unsigned int v8 = a3->var0 + 8;
  do
  {
    createPolynomialTableForComponent((int *)a3, v7, (uint64_t)v6 + 2 * (v7 << v8));
    ++v7;
  }
  while (v7 != 3);
  [(MSRHDRProcessing *)self updatePolynomialTables:v6 TableSize:(1 << v5)];
  free(v6);
}

- (void)updatePolynomialTables:(unsigned __int16 *)a3 TableSize:(unint64_t)a4
{
  uint64_t v4 = 0;
  self->_reshapeLUTCreated = 1;
  self->_reshapeLUTSize = a4;
  do
  {
    if (a4)
    {
      reshapeLUT = self->_reshapeLUT;
      unsigned int v6 = a3;
      unint64_t v7 = a4;
      do
      {
        __int16 v8 = *v6++;
        *(_WORD *)reshapeLUT = v8;
        reshapeLUT = (unsigned __int16 (*)[1024])((char *)reshapeLUT + 2);
        --v7;
      }
      while (v7);
    }
    ++v4;
    self = (MSRHDRProcessing *)((char *)self + 2048);
    a3 += a4;
  }
  while (v4 != 3);
}

- (BOOL)isMMREnabled
{
  uint64_t Config = GetConfig((HDRConfig *)self);
  if (Config && (uint64_t v4 = GetConfig((HDRConfig *)Config), *((_DWORD *)v4 + 1279)) && (v4[2556] & 0x80) != 0)
  {
    unsigned int v6 = GetConfig((HDRConfig *)v4);
    if (!v6) {
      return (char)v6;
    }
    unint64_t v7 = GetConfig((HDRConfig *)v6);
    int mmrEnable = *(unsigned __int8 *)HDRConfig::GetConfigEntryValue((uint64_t)v7, 0x3Au, 0);
  }
  else
  {
    int mmrEnable = self->_mmrEnable;
  }
  LOBYTE(v6) = mmrEnable != 0;
  return (char)v6;
}

- (void)setSat2FactorTable:(float *)a3 TableSize:(unint64_t)a4 DMConfig:(id *)a5 LLDoVi:(BOOL)a6
{
  *(void *)&a3[a4 - 2] = *(void *)&a3[a4 - 4];
}

- (BOOL)hasAMVEConfigChanged:(id *)a3 tcCtrl:(ToneCurve_Control *)a4
{
  return a4->enableAmveStrength != a3->var0 || a4->amveStrengthValue != a3->var1;
}

- (void)updateAMVEConfig:(id *)a3 tcCtrl:(ToneCurve_Control *)a4
{
  a3->var0 = a4->enableAmveStrength;
  a3->var1 = a4->amveStrengthValue;
}

- (void)hdr10_createLUTFromDMConfig:(id *)a3 DM:(id)a4 TCControl:(ToneCurve_Control *)a5 HDRControl:(id *)a6 TMParam:(_HDR10TMParam *)a7 EdrAdaptationParam:(_EdrAdaptationParam *)a8 AmbAdaptationParam:(_AmbAdaptationParam *)a9
{
  id v14 = a4;
  if ([(ProcessingEngine *)self hdr10_tm_configChanged:a7 HDRControl:a6 EdrAdaptationParam:a8 AmbAdaptationParam:a9])
  {
    [(MSRHDRProcessing *)self hdr10_tm_createLUTFromDMConfig:a3 TMParam:a7 EdrAdaptationParam:a8 AmbAdaptationParam:a9 DM:v14];
    [(MSRHDRProcessing *)self hdr10_tm_updateLUT:6 ScalingFactorBuffer:self->_scalingFactorTableBuffer LumaMixFactorBuffer:self->_lumaMixFactorTableBuffer];
    [(ProcessingEngine *)self hdr10_tm_reserveConfig:a7 HDRControl:a6 EdrAdaptationParam:a8 AmbAdaptationParam:a9];
    ++self->_computedFrames;
  }
}

- (unint64_t)getTmLutSize
{
  return 513;
}

- (void)hdr10_getTmLutInput:(unint64_t)a3 lutInput:(float *)a4
{
  if (a3)
  {
    uint64_t v4 = 0;
    do
    {
      float v5 = (float)v4;
      if (!v4) {
        float v5 = 0.25;
      }
      a4[v4++] = v5 / (float)(a3 - 1);
    }
    while (a3 > v4);
  }
}

- (void)dovi_getTmLutInput:(unint64_t)a3 lutInput:(float *)a4
{
  if (a3)
  {
    uint64_t v4 = 0;
    do
    {
      a4[v4] = (float)v4 / (float)(a3 - 1);
      ++v4;
    }
    while (a3 > v4);
  }
}

- (void)hdr10_tm_createLUTFromDMConfig:(id *)a3 TMParam:(_HDR10TMParam *)a4 EdrAdaptationParam:(_EdrAdaptationParam *)a5 AmbAdaptationParam:(_AmbAdaptationParam *)a6 DM:(id)a7
{
  id v14 = [a7 getDolbyVisionDM4];
  size_t v12 = [(MSRHDRProcessing *)self getTmLutSize];
  BOOL v13 = malloc_type_calloc(v12, 4uLL, 0x100004052888210uLL);
  if (v13)
  {
    [(MSRHDRProcessing *)self hdr10_getTmLutInput:v12 lutInput:v13];
    hdr10_setScalingFactorTableS_L_NormIn((uint64_t)self->_scalingFactorTableBuffer, (uint64_t)v13, v12, a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a3, v14);
    hdr10_setLumaMixFactorTableS_L_NormIn((uint64_t)self->_lumaMixFactorTableBuffer, (uint64_t)v13, v12, (uint64_t)a4);
    free(v13);
  }
}

- (void)hdr10_tm_updateLUT:(int64_t)a3 ScalingFactorBuffer:(float *)a4 LumaMixFactorBuffer:(float *)a5
{
  if (a3 == 6)
  {
    unint64_t v5 = 0;
    self->_tmMode = 1;
    self->_tonemappingTableSize = 513;
    do
    {
      float v6 = a4[v5];
      if (v6 >= 0.0)
      {
        unsigned __int8 v7 = 0;
      }
      else
      {
        float v6 = -v6;
        unsigned __int8 v7 = 1;
      }
      unsigned int v8 = ((float)(v6 * 2097200.0) + 0.5) & 0x7FFFFFFF | (v7 << 31);
      int v9 = (unsigned int *)((char *)&self->_tonemapLUT + 4 * v5);
      *int v9 = v8;
      v9[513] = ((float)(a5[v5++] * 32768.0) + 0.5) & 0x7FFFFFFF;
    }
    while (v5 < self->_tonemappingTableSize);
  }
}

- (void)hlg_getTmLutInput:(unint64_t)a3 lutInput:(float *)a4
{
  if (a3)
  {
    uint64_t v4 = 0;
    do
    {
      float v5 = (float)v4;
      if (!v4) {
        float v5 = 0.15;
      }
      a4[v4++] = v5 / (float)(a3 - 1);
    }
    while (a3 > v4);
  }
}

- (void)hlg_createLUTFromDMConfig:(id *)a3 DM:(id)a4 HDRControl:(id *)a5 TMParam:(_HLGTMParam *)a6 EdrAdaptationParam:(_EdrAdaptationParam *)a7 AmbAdaptationParam:(_AmbAdaptationParam *)a8 TMMode:(int)a9
{
  id v15 = a4;
  if ([(ProcessingEngine *)self hlg_tm_configChanged:a3 HDRControl:a5 TMParam:a6 EdrAdaptationParam:a7 AmbAdaptationParam:a8])
  {
    [(MSRHDRProcessing *)self hlg_tm_createLUTFromDMConfig:a3 DM:v15 TMParam:a6 EdrAdaptationParam:a7 AmbAdaptationParam:a8 TMMode:a9];
    [(MSRHDRProcessing *)self hlg_tm_updateLUT:6 ScalingFactorBuffer:self->_scalingFactorTableBuffer];
    [(MSRHDRProcessing *)self hlg_tm_reserveConfig:a3 HDRControl:a5 TMParam:a6 EdrAdaptationParam:a7 AmbAdaptationParam:a8];
    ++self->_computedFrames;
  }
}

- (void)hlg_tm_reserveConfig:(id *)a3 HDRControl:(id *)a4 TMParam:(_HLGTMParam *)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7
{
  self->super._prev.int contentType = a4->var0;
  updateHlgTonemapConfig((uint64_t)&self->super._prev.tm, a3, (uint64_t)a5, (long long *)&a6->on, (uint64_t)a7);
}

- (void)hlg_tm_createLUTFromDMConfig:(id *)a3 DM:(id)a4 TMParam:(_HLGTMParam *)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7 TMMode:(int)a8
{
  id v16 = [a4 getDolbyVisionDM4];
  size_t v14 = [(MSRHDRProcessing *)self getTmLutSize];
  id v15 = malloc_type_calloc(v14, 4uLL, 0x100004052888210uLL);
  if (v15)
  {
    [(MSRHDRProcessing *)self hlg_getTmLutInput:v14 lutInput:v15];
    hlg_setScalingFactorTable((uint64_t)self->_scalingFactorTableBuffer, (uint64_t)v15, v14, (uint64_t)a3, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, v16);
    free(v15);
  }
}

- (void)hlg_tm_updateLUT:(int64_t)a3 ScalingFactorBuffer:(float *)a4
{
  if (a3 == 6)
  {
    unint64_t v4 = 0;
    self->_tmMode = 1;
    self->_tonemappingTableSize = 513;
    do
    {
      float v5 = a4[v4];
      BOOL v6 = v5 < 0.0;
      if (v5 < 0.0) {
        float v5 = -v5;
      }
      self->_tonemapLUT.lut[0][v4++] = ((float)(v5 * 16777000.0) + 0.5) & 0x7FFFFFFF | (v6 << 31);
    }
    while (v4 < self->_tonemappingTableSize);
  }
}

- (void)dovi_createLUTFromDMConfig:(id *)a3 DM:(id)a4 HDRControl:(id *)a5 LLDoVi:(BOOL)a6 TMParam:(_DoViTMParam *)a7 EdrAdaptationParam:(_EdrAdaptationParam *)a8 AmbAdaptationParam:(_AmbAdaptationParam *)a9 HlgOOTFCombined:(BOOL)a10 HlgOOTFOnly:(BOOL)a11 IsDoVi84:(BOOL)a12 IsInternalDisplay:(BOOL)a13 tcCtrl:(ToneCurve_Control *)a14
{
  BOOL v15 = a6;
  id v22 = a4;
  if (-[MSRHDRProcessing dovi_tm_configChanged:HDRControl:DM:LLDoVi:EdrAdaptationParam:AmbAdaptationParam:tcCtrl:](self, "dovi_tm_configChanged:HDRControl:DM:LLDoVi:EdrAdaptationParam:AmbAdaptationParam:tcCtrl:", a3, a5, a14))
  {
    BYTE3(v20) = a13;
    BYTE2(v20) = a12;
    LOWORD(v20) = __PAIR16__(a11, a10);
    -[MSRHDRProcessing dovi_tm_createLUTFromDMConfig:HDRControl:DM:LLDoVi:TMParam:EdrAdaptationParam:AmbAdaptationParam:HlgOOTFCombined:HlgOOTFOnly:IsDoVi84:IsInternalDisplay:tcCtrl:](self, "dovi_tm_createLUTFromDMConfig:HDRControl:DM:LLDoVi:TMParam:EdrAdaptationParam:AmbAdaptationParam:HlgOOTFCombined:HlgOOTFOnly:IsDoVi84:IsInternalDisplay:tcCtrl:", a3, a5, v22, v15, a7, a8, a9, v20, a14);
    LOBYTE(v19) = a10;
    [(MSRHDRProcessing *)self dovi_tm_updateLUT:6 ScalingFactorBuffer:self->_scalingFactorTableBuffer ScalingFactorBufferSize:513 Sat2FactorBuffer:self->_sat2FactorTableBuffer Sat2FactorBufferSize:513 dmConfig:a3 HlgOOTFCombined:v19];
    [(MSRHDRProcessing *)self dovi_tm_reserveConfig:a3 HDRControl:a5 DM:v22 LLDoVi:v15 EdrAdaptationParam:a8 AmbAdaptationParam:a9 tcCtrl:a14];
    ++self->_computedFrames;
  }
}

- (BOOL)dovi_tm_configChanged:(id *)a3 HDRControl:(id *)a4 DM:(id)a5 LLDoVi:(BOOL)a6 EdrAdaptationParam:(_EdrAdaptationParam *)a7 AmbAdaptationParam:(_AmbAdaptationParam *)a8 tcCtrl:(ToneCurve_Control *)a9
{
  BOOL v15 = (HDRConfig *)a5;
  uint64_t Config = GetConfig(v15);
  if (Config
    && (int v17 = GetConfig((HDRConfig *)Config), *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v17, 0x31u, 0))
    || a4->var0 != self->super._prev.contentType
    || [(MSRHDRProcessing *)self hasAMVEConfigChanged:&self->super._prev.amve tcCtrl:a9])
  {
    char v18 = 1;
  }
  else if (LODWORD(a3[1].var49) == 4)
  {
    uint64_t v20 = [(HDRConfig *)v15 getDolbyVisionDM4];
    char v18 = [v20 hasDM4TonemapConfigChanged:a3 TonemapConfig:&self->super._prev.tm EdrAdaptationParam:a7 AmbAdaptationParam:a8];
  }
  else
  {
    char v18 = hasDoviTonemapConfigChanged((uint64_t)&self->super._prev.tm, (uint64_t)a3, a6, (uint64_t)a7, (uint64_t)a8);
  }

  return v18;
}

- (void)dovi_tm_reserveConfig:(id *)a3 HDRControl:(id *)a4 DM:(id)a5 LLDoVi:(BOOL)a6 EdrAdaptationParam:(_EdrAdaptationParam *)a7 AmbAdaptationParam:(_AmbAdaptationParam *)a8 tcCtrl:(ToneCurve_Control *)a9
{
  id v16 = a5;
  self->super._prev.int contentType = a4->var0;
  [(MSRHDRProcessing *)self updateAMVEConfig:&self->super._prev.amve tcCtrl:a9];
  if (LODWORD(a3[1].var49) == 4)
  {
    BOOL v15 = [v16 getDolbyVisionDM4];
    [v15 updateDM4TonemapConfig:&self->super._prev.tm DMConfig:a3 EdrAdaptationParam:a7 AmbAdaptationParam:a8];
  }
  else
  {
    updateDoViTonemapConfig((uint64_t)&self->super._prev.tm, a3, a6, (long long *)&a7->on, (uint64_t)a8);
  }
}

- (void)dovi_tm_createLUTFromDMConfig:(id *)a3 HDRControl:(id *)a4 DM:(id)a5 LLDoVi:(BOOL)a6 TMParam:(_DoViTMParam *)a7 EdrAdaptationParam:(_EdrAdaptationParam *)a8 AmbAdaptationParam:(_AmbAdaptationParam *)a9 HlgOOTFCombined:(BOOL)a10 HlgOOTFOnly:(BOOL)a11 IsDoVi84:(BOOL)a12 IsInternalDisplay:(BOOL)a13 tcCtrl:(ToneCurve_Control *)a14
{
  BOOL v21 = a6;
  id v24 = a5;
  if (a11) {
    size_t v17 = [(MSRHDRProcessing *)self getTmLutSize];
  }
  else {
    size_t v17 = 513;
  }
  char v18 = malloc_type_calloc(v17, 4uLL, 0x100004052888210uLL);
  if (v18)
  {
    if (a11) {
      [(MSRHDRProcessing *)self dovi_ootf_getTmLutInput:v17 lutInput:v18];
    }
    else {
      [(MSRHDRProcessing *)self dovi_getTmLutInput:v17 lutInput:v18];
    }
    BYTE2(v20) = a12;
    LOWORD(v20) = __PAIR16__(a11, a10);
    objc_msgSend(v24, "dovi_setScalingFactorTable:lutInput:tableSize:config:hdrCtrl:tmParam:edrAdaptationParam:ambAdaptationParam:hlgOOTFCombined:hlgOOTFOnly:isDoVi84:tcCtrl:", self->_scalingFactorTableBuffer, v18, v17, a3, a4, a7, a8, a9, v20, a14);
    sat2FactorTableBuffer = self->_sat2FactorTableBuffer;
    objc_msgSend(v24, "dovi_setSat2FactorTable:tableSize:config:llDovi:applyDoVi84SatAdjustment:", sat2FactorTableBuffer, 512, a3, v21, (a12 && a13) & a10);
    *((void *)sat2FactorTableBuffer + 512) = *((void *)sat2FactorTableBuffer + 511);
    free(v18);
  }
}

- (void)dovi_tm_updateLUT:(int64_t)a3 ScalingFactorBuffer:(float *)a4 ScalingFactorBufferSize:(unint64_t)a5 Sat2FactorBuffer:(float *)a6 Sat2FactorBufferSize:(unint64_t)a7 dmConfig:(id *)a8 HlgOOTFCombined:(BOOL)a9
{
  if (a3 != 6) {
    return;
  }
  self->_tonemappingTableSize = a5;
  if (a8[1].var50 < 0 && (debugDM4DisableConf & 0x80) == 0)
  {
    [(MSRHDRProcessing *)self hlg_tm_updateLUT:6 ScalingFactorBuffer:self->_scalingFactorTableBuffer];
    return;
  }
  self->_tmMode = 0;
  if (LODWORD(a8[1].var49) == 4) {
    float v12 = 1.0;
  }
  else {
    float v12 = 0.0;
  }
  if (a5)
  {
    unint64_t v13 = 0;
    float v14 = 1.0 / (float)(a5 - 1);
    p_tonemapLUT = &self->_tonemapLUT;
    id v16 = a6 + 1;
    do
    {
      if (v13) {
        float v17 = v14 * (float)v13;
      }
      else {
        float v17 = v12;
      }
      float v18 = *a4 * v17;
      float v19 = -v18;
      if (v18 >= 0.0) {
        float v19 = *a4 * v17;
      }
      p_tonemapLUT->lut[0][0] = ((float)(v19 * 16777000.0) + 0.5) & 0x7FFFFFFF | ((v18 < 0.0) << 31);
      if (HIBYTE(a8[1].var52))
      {
        float v20 = a4[513];
        BOOL v21 = v20 < 0.0;
        int v22 = (v20 < 0.0) << 31;
        float v23 = -v20;
      }
      else
      {
        float v24 = *a4 + -1.0;
        if (BYTE2(a8[1].var52))
        {
          float v25 = (float)((float)(v24 * v17) + 1.0) * getMesopicCrushForDM3((uint64_t)a8, v17 * *a4);
          int v22 = (v25 < 0.0) << 31;
          float v20 = -v25;
          if (v25 >= 0.0) {
            float v20 = v25;
          }
          goto LABEL_25;
        }
        float v20 = (float)(v24 * v17) + 1.0;
        BOOL v21 = v20 < 0.0;
        int v22 = (v20 < 0.0) << 31;
        float v23 = -v20;
      }
      if (v21) {
        float v20 = v23;
      }
LABEL_25:
      p_tonemapLUT->lut[2][0] = ((float)(v20 * 16777000.0) + 0.5) & 0x7FFFFFFF | v22;
      float v26 = *(v16 - 1);
      if (v26 >= 0.0)
      {
        unsigned __int8 v27 = 0;
      }
      else
      {
        float v26 = -v26;
        unsigned __int8 v27 = 1;
      }
      p_tonemapLUT->lut[1][0] = ((float)(v26 * 16777000.0) + 0.5) & 0x7FFFFFFF | (v27 << 31);
      float v28 = *v16;
      v16 += 2;
      float v29 = v28 * a8->var59;
      float v30 = -v29;
      if (v29 >= 0.0) {
        float v30 = v29;
      }
      p_tonemapLUT->lut[3][0] = ((float)(v30 * 16777000.0) + 0.5) & 0x7FFFFFFF | ((v29 < 0.0) << 31);
      ++v13;
      ++a4;
      p_tonemapLUT = ($F729E77DB08220B7E78EE05276008581 *)((char *)p_tonemapLUT + 4);
    }
    while (v13 < self->_tonemappingTableSize);
  }
}

- (unsigned)setLms2RgbScale2P:(const float *)a3 OutputScale:(float)a4
{
  float v4 = (float)(fabsf(*a3) + fabsf(a3[1])) + fabsf(a3[2]);
  float v5 = (float)(fabsf(a3[3]) + fabsf(a3[4])) + fabsf(a3[5]);
  float v6 = (float)(fabsf(a3[6]) + fabsf(a3[7])) + fabsf(a3[8]);
  if (v4 < v5) {
    float v4 = v5;
  }
  if (v4 < v6) {
    float v4 = v6;
  }
  unsigned int v7 = log2f(32768.0 / (float)(v4 * a4));
  if (v7 >= 0xE) {
    return 14;
  }
  else {
    return v7;
  }
}

- (unsigned)getMatrixScale2P:(const float *)a3 OutputScale:(float)a4
{
  uint64_t v4 = 0;
  float v5 = 0.0;
  do
  {
    float v6 = fabsf(a3[v4]);
    if (v5 < v6) {
      float v5 = v6;
    }
    ++v4;
  }
  while (v4 != 9);
  unsigned int v7 = log2f(32768.0 / (float)(v5 * a4));
  if (v7 >= 0xF) {
    return 15;
  }
  else {
    return v7;
  }
}

- (unsigned)getMatrixScale2P:(const float *)a3
{
  LODWORD(v3) = 1.0;
  return [(MSRHDRProcessing *)self getMatrixScale2P:a3 OutputScale:v3];
}

- (void)decideStageStatus:(BOOL *)a3 MSRHDRContext:(MSRHDRContext *)a4 DMConfig:(id *)a5
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  *(_WORD *)&a4->enableReshaping = 0;
  unsigned int operation = a4->operation;
  if (operation == 1)
  {
    signed int inputFormat = a4->inputFormat;
    if (inputFormat > 1936077875)
    {
      if (inputFormat > 2016686641)
      {
        if (inputFormat > 2019963441)
        {
          if (inputFormat == 2019963442 || inputFormat == 2033463606) {
            goto LABEL_52;
          }
          unsigned __int16 v15 = 13364;
        }
        else
        {
          if (inputFormat == 2016686642 || inputFormat == 2016687156) {
            goto LABEL_52;
          }
          unsigned __int16 v15 = 12848;
        }
        int v11 = v15 | 0x78660000;
      }
      else
      {
        if (inputFormat <= 1937126451)
        {
          if (inputFormat != 1936077876 && inputFormat != 1937125936)
          {
            int v11 = 1937125938;
            goto LABEL_51;
          }
LABEL_52:
          if (a4->inputTransferFunction == 16)
          {
            signed int outputFormat = a4->outputFormat;
            if (outputFormat > 1953903151)
            {
              if (outputFormat != 1953903152 && outputFormat != 1953903668 && outputFormat != 1953903154) {
                goto LABEL_63;
              }
            }
            else
            {
              unsigned int v24 = outputFormat - 1886680624;
              if (v24 > 4 || ((1 << v24) & 0x15) == 0) {
                goto LABEL_63;
              }
            }
            if (a4->outputTransferFunction == 16)
            {
              BOOL v12 = 1;
              goto LABEL_62;
            }
          }
LABEL_63:
          BOOL v25 = 0;
          a4->enableToneMapping = 1;
          if (inputFormat != 1380411457 && inputFormat != 1919365992) {
            BOOL v25 = getBitDepthFromSurfaceFormat(inputFormat) < 0x10;
          }
          a4->enableReshaping = v25;
          a4->unsigned int operation = 3;
          goto LABEL_67;
        }
        if (inputFormat == 1937126452 || inputFormat == 1983000886) {
          goto LABEL_52;
        }
        int v11 = 2016686640;
      }
LABEL_51:
      if (inputFormat != v11) {
        goto LABEL_63;
      }
      goto LABEL_52;
    }
    if (inputFormat <= 1885746227)
    {
      if (inputFormat <= 1882469427)
      {
        if (inputFormat == 1882468912) {
          goto LABEL_52;
        }
        int v11 = 1882468914;
        goto LABEL_51;
      }
      if (inputFormat == 1882469428 || inputFormat == 1885745712) {
        goto LABEL_52;
      }
      unsigned __int16 v14 = 12850;
    }
    else
    {
      if (inputFormat > 1936077359)
      {
        if (inputFormat == 1936077360) {
          goto LABEL_52;
        }
        int v11 = 1936077362;
        goto LABEL_51;
      }
      if ((inputFormat - 1886680624) <= 4 && ((1 << (inputFormat - 48)) & 0x15) != 0) {
        goto LABEL_52;
      }
      unsigned __int16 v14 = 13364;
    }
    int v11 = v14 | 0x70660000;
    goto LABEL_51;
  }
  if (operation == 2)
  {
    a4->enableToneMapping = 1;
    goto LABEL_67;
  }
  if ((operation & 4) != 0)
  {
    a4->enableReshaping = isFormatYUV(a4->inputFormat);
    a4->unsigned int operation = 4;
    a4->enableConverting = 1;
    goto LABEL_67;
  }
  if (operation != 3)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v16 = logInstanceID;
      }
      else {
        uint64_t v16 = prevLogInstanceID;
      }
      float v17 = &_os_log_internal;
      id v18 = &_os_log_internal;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v19 = a4->operation;
        int v77 = 134218240;
        uint64_t v78 = WORD1(v16);
        __int16 v79 = 1024;
        unsigned int v80 = v19;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx     ERROR: Not supported operation %d !!!", (uint8_t *)&v77, 0x12u);
      }

      prevLogInstanceID = v16;
    }
    else
    {
      float v20 = &_os_log_internal;
      id v21 = &_os_log_internal;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v22 = a4->operation;
        int v77 = 67109120;
        LODWORD(v78) = v22;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]     ERROR: Not supported operation %d !!!", (uint8_t *)&v77, 8u);
      }
    }
    goto LABEL_67;
  }
  BOOL v12 = 0;
  a4->enableToneMapping = 1;
  unsigned int v13 = a4->inputFormat;
  if (v13 != 1380411457 && v13 != 1919365992) {
    BOOL v12 = getBitDepthFromSurfaceFormat(v13) < 0x10;
  }
LABEL_62:
  a4->enableReshaping = v12;
LABEL_67:
  unsigned int outputTransferFunction = a4->outputTransferFunction;
  BOOL v28 = outputTransferFunction - 1 < 0x12 && ((0x29001u >> (outputTransferFunction - 1)) & 1) != 0
     || outputTransferFunction == 8 && a4->dpcParam.on;
  uint64_t v29 = a4->outputFormat;
  BOOL v31 = v29 != 1919365992 && v29 != 1380411457;
  switch(a4->operation)
  {
    case 1u:
      unsigned int inputColorSpace = a4->inputColorSpace;
      *a3 = 1;
      if (inputColorSpace == 2)
      {
        a3[1] = 1;
        *(_DWORD *)(a3 + 2) = 0;
        *((_WORD *)a3 + 3) = 0;
        *((_DWORD *)a3 + 2) = 16843009;
        *((_WORD *)a3 + 6) = 1;
      }
      else
      {
        *(void *)(a3 + 6) = 0;
        *(void *)(a3 + 1) = 0;
      }
      goto LABEL_209;
    case 2u:
      *(void *)a3 = 0x1000001010001;
      *((_WORD *)a3 + 4) = 0;
      a3[10] = 1;
      if (v31 || !v28) {
        BOOL enableFp16Regamma = v28 && v31;
      }
      else {
        BOOL enableFp16Regamma = self->_enableFp16Regamma;
      }
      a3[11] = enableFp16Regamma;
      uint64_t v29 = isFormatYUV(v29);
      a3[12] = v29;
      goto LABEL_208;
    case 3u:
      goto LABEL_109;
    case 4u:
      if (!a4->enableConverting || a4->enableToneMapping)
      {
        if (enableLogInstance)
        {
          if (logInstanceID) {
            uint64_t v37 = logInstanceID;
          }
          else {
            uint64_t v37 = prevLogInstanceID;
          }
          uint64_t v38 = &_os_log_internal;
          id v39 = &_os_log_internal;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            int v77 = 134217984;
            uint64_t v78 = WORD1(v37);
            _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"msrHC->enableConverting && !msrHC->enableToneMapping\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 2268\n", (uint8_t *)&v77, 0xCu);
          }

          prevLogInstanceID = v37;
        }
        else
        {
          v50 = &_os_log_internal;
          id v51 = &_os_log_internal;
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v77) = 0;
            _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"msrHC->enableConverting && !msrHC->enableToneMapping\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 2268\n", (uint8_t *)&v77, 2u);
          }
        }
      }
      unsigned int v52 = a4->inputColorSpace;
      if (v52 && v52 != 2 && v52 != 1
        || a4->processingType != 5
        || (uint64_t v29 = isSupportedMSRColorConversion(a4->inputFormat, a4->outputFormat), (v29 & 1) == 0))
      {
        if (enableLogInstance)
        {
          if (logInstanceID) {
            uint64_t v53 = logInstanceID;
          }
          else {
            uint64_t v53 = prevLogInstanceID;
          }
          v54 = &_os_log_internal;
          id v55 = &_os_log_internal;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            int v77 = 134217984;
            uint64_t v78 = WORD1(v53);
            _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"isConversionInputRgb(msrHC) || isConversionInputYuv(msrHC) || isConversionInputIpt(msrHC)\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 2269\n", (uint8_t *)&v77, 0xCu);
          }

          prevLogInstanceID = v53;
        }
        else
        {
          v56 = &_os_log_internal;
          id v57 = &_os_log_internal;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v77) = 0;
            _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"isConversionInputRgb(msrHC) || isConversionInputYuv(msrHC) || isConversionInputIpt(msrHC)\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 2269\n", (uint8_t *)&v77, 2u);
          }
        }
      }
      unsigned int operationFlags = a4->operationFlags;
      *a3 = 1;
      unsigned int v59 = a4->inputColorSpace;
      if (v59 == 2)
      {
        if (a4->processingType == 5)
        {
          uint64_t v29 = isSupportedMSRColorConversion(a4->inputFormat, a4->outputFormat);
          if (v29) {
            a3[1] = 1;
          }
        }
      }
      else if (!v59 && a4->processingType == 5)
      {
        uint64_t v29 = isSupportedMSRColorConversion(a4->inputFormat, a4->outputFormat);
        if (v29)
        {
          *(_WORD *)(a3 + 1) = 257;
          a3[3] = 1;
        }
        else
        {
          *((_WORD *)a3 + 1) = 257;
        }
        if (a4->inputTransferFunction == 18)
        {
          uint64_t v29 = isSupportedMSRColorConversion(a4->inputFormat, a4->outputFormat);
          if (v29)
          {
            unsigned int outputColorSpace = a4->outputColorSpace;
            if (outputColorSpace || a4->outputTransferFunction != 18)
            {
              BOOL v60 = (operationFlags & 1) == 0;
              a3[6] = v60;
LABEL_154:
              a3[10] = v60;
              a3[11] = v60;
              if (outputColorSpace == 2)
              {
                if (a4->processingType != 5) {
                  goto LABEL_162;
                }
                uint64_t v29 = isSupportedMSRColorConversion(a4->inputFormat, a4->outputFormat);
                if (!v29) {
                  goto LABEL_162;
                }
              }
              else
              {
                if (outputColorSpace) {
                  goto LABEL_162;
                }
                if (a4->processingType != 5) {
                  goto LABEL_162;
                }
                uint64_t v29 = isSupportedMSRColorConversion(a4->inputFormat, a4->outputFormat);
                if ((v29 & 1) == 0) {
                  goto LABEL_162;
                }
              }
              a3[12] = v60;
LABEL_162:
              a3[13] = v60;
              goto LABEL_209;
            }
          }
        }
LABEL_153:
        a3[4] = 1;
        BOOL v60 = (operationFlags & 1) == 0;
        a3[9] = v60;
        unsigned int outputColorSpace = a4->outputColorSpace;
        goto LABEL_154;
      }
      *((_WORD *)a3 + 1) = 257;
      goto LABEL_153;
    default:
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v33 = logInstanceID;
        }
        else {
          uint64_t v33 = prevLogInstanceID;
        }
        __int16 v34 = &_os_log_internal;
        id v35 = &_os_log_internal;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          int v77 = 134217984;
          uint64_t v78 = WORD1(v33);
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"(msrHC->operation == ((HDRProcessingOperation)(kHDRProcessingReshape | kHDRProcessingToneMap)))\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 2293\n", (uint8_t *)&v77, 0xCu);
        }

        prevLogInstanceID = v33;
      }
      else
      {
        v40 = &_os_log_internal;
        id v41 = &_os_log_internal;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v77) = 0;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"(msrHC->operation == ((HDRProcessingOperation)(kHDRProcessingReshape | kHDRProcessingToneMap)))\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 2293\n", (uint8_t *)&v77, 2u);
        }
      }
LABEL_109:
      unsigned int contentType = a4->contentType;
      if (a4->contentType == 3)
      {
        if (a4->inputColorSpace)
        {
          signed int v46 = a4->inputFormat;
          if (v46 > 1647534391)
          {
            if (v46 == 1815162994) {
              goto LABEL_173;
            }
            int v47 = 1647534392;
          }
          else
          {
            if (v46 == 1378955371) {
              goto LABEL_173;
            }
            int v47 = 1380411457;
          }
          if (v46 != v47) {
            goto LABEL_201;
          }
        }
LABEL_173:
        unsigned int displayType = a4->displayType;
        if (displayType > 7 || displayType == 5) {
          goto LABEL_201;
        }
        *a3 = 1;
        a3[1] = isFormatYUV(a4->inputFormat);
        *(void *)(a3 + 2) = 0x100000001;
        a3[10] = 1;
        BOOL enableHwOOTF = self->super._enableHwOOTF;
        if (enableHwOOTF)
        {
          BOOL enableHwOotfForHLG = self->super._enableHwOotfForHLG;
LABEL_177:
          BOOL enableHwOOTF = enableHwOotfForHLG;
        }
LABEL_178:
        a3[14] = enableHwOOTF;
        goto LABEL_201;
      }
      if (contentType != 2)
      {
        if (contentType != 1) {
          goto LABEL_201;
        }
        unsigned int v43 = a4->inputColorSpace;
        if (v43)
        {
          if (v43 == 2)
          {
            unsigned int v44 = a4->displayType;
            if (v44 <= 7 && v44 != 5)
            {
              float var49 = a5[1].var49;
              if (SLODWORD(var49) <= 3)
              {
                *(_WORD *)a3 = 257;
                *(_DWORD *)(a3 + 2) = 0;
                *(_DWORD *)(a3 + 6) = 16842753;
LABEL_169:
                a3[10] = 1;
                goto LABEL_201;
              }
              if (LODWORD(var49) != 4)
              {
                if (enableLogInstance)
                {
                  if (logInstanceID) {
                    uint64_t v66 = logInstanceID;
                  }
                  else {
                    uint64_t v66 = prevLogInstanceID;
                  }
                  v67 = &_os_log_internal;
                  id v68 = &_os_log_internal;
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                  {
                    int v77 = 134217984;
                    uint64_t v78 = WORD1(v66);
                    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"dm_config_ptr->dmVersion == 4\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 2313\n", (uint8_t *)&v77, 0xCu);
                  }

                  prevLogInstanceID = v66;
                }
                else
                {
                  v69 = &_os_log_internal;
                  id v70 = &_os_log_internal;
                  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(v77) = 0;
                    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"dm_config_ptr->dmVersion == 4\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 2313\n", (uint8_t *)&v77, 2u);
                  }
                }
              }
              *(_DWORD *)(a3 + 3) = 16843009;
              *(_DWORD *)a3 = 16843009;
              goto LABEL_200;
            }
          }
          goto LABEL_201;
        }
        unsigned int v62 = a4->displayType;
        if (v62 > 7 || v62 == 5) {
          goto LABEL_201;
        }
        if ((*(_WORD *)&self->super._anon_90[472] & 0x80) != 0 && (debugDM4DisableConf & 0x80) == 0)
        {
          *(void *)a3 = 0x1000000010101;
          *((_WORD *)a3 + 4) = 0;
          goto LABEL_169;
        }
        *(_DWORD *)(a3 + 3) = 16843009;
        *(_DWORD *)a3 = 16843009;
        *(_DWORD *)(a3 + 7) = 16843008;
        if (a4->processingType != 4) {
          goto LABEL_201;
        }
        BOOL enableHwOOTF = self->super._enableHwOOTF;
        if (enableHwOOTF)
        {
          BOOL enableHwOotfForHLG = self->super._enableHwOotfForDolby84;
          goto LABEL_177;
        }
        goto LABEL_178;
      }
      unsigned int v48 = a4->displayType;
      if (v48 <= 7 && v48 != 5)
      {
        int processingType = a4->processingType;
        *a3 = 1;
        a3[1] = isFormatYUV(a4->inputFormat);
        if (processingType == 1)
        {
          *(void *)(a3 + 2) = 0x100000101;
          a3[10] = 1;
          goto LABEL_201;
        }
        a3[6] = 1;
        *(_DWORD *)(a3 + 2) = 16843009;
LABEL_200:
        *(_DWORD *)(a3 + 7) = 16843008;
      }
LABEL_201:
      uint64_t v29 = isFormatYUV(a4->outputFormat);
      if (v29)
      {
        BOOL v71 = 1;
        a3[11] = 1;
      }
      else
      {
        if (v31 || !v28) {
          BOOL v72 = v28 && v31;
        }
        else {
          BOOL v72 = self->_enableFp16Regamma;
        }
        BOOL v71 = 0;
        a3[11] = v72;
      }
      a3[12] = v71;
LABEL_208:
      a3[13] = 0;
LABEL_209:
      uint64_t Config = GetConfig((HDRConfig *)v29);
      if (Config)
      {
        v74 = GetConfig((HDRConfig *)Config);
        if ((*(_DWORD *)HDRConfig::GetConfigEntryValue((uint64_t)v74, 0x3Cu, 0) - 1) <= 1)
        {
          signed int v75 = a4->outputFormat;
          if (v75 <= 1953903151)
          {
            unsigned int v76 = v75 - 1886680624;
            if (v76 > 4 || ((1 << v76) & 0x15) == 0) {
              return;
            }
LABEL_218:
            if (a4->outputTransferFunction == 16) {
              *(_WORD *)(a3 + 11) = 257;
            }
            return;
          }
          if (v75 == 1953903152 || v75 == 1953903668 || v75 == 1953903154) {
            goto LABEL_218;
          }
        }
      }
      return;
  }
}

- (void)populateMSRColorConfigHeader:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v10 = (FILE *)qword_26ABE76A0;
  if (qword_26ABE76A0)
  {
    unsigned int frameNumber = self->super._frameNumber;
    if (frameNumber != dword_26ABE7694)
    {
LABEL_27:
      fprintf(v10, "%scontrolpath[%d] = {}\n", a5, frameNumber);
      fprintf(v10, "%s\n", a5);
      return;
    }
    *(_OWORD *)id v21 = 0u;
    long long v22 = 0u;
    time_t v19 = time(0);
    localtime_r(&v19, &v20);
    asctime_r(&v20, v21);
    fprintf(v10, "%s---## %s %s on %s FDM Control Path Parameters (operation=%d \"%s\", convertType=%d \"%s\")\n", a5, contentTypeName[a10->contentType], colorSpaceName[a10->inputColorSpace], displayTypeName[a10->displayType], a10->operation, operationName[a10->operation], a10->convertType, convertTypeName[a10->convertType]);
    fprintf(v10, "%s---## Created on: %s", a5, v21);
    if (dword_26ABE7698 == -1) {
      fprintf(v10, "%s---## Frames: all\n");
    }
    else {
      fprintf(v10, "%s---## Frames: %d - %d\n");
    }
    fprintf(v10, "%s---## Targetnits: %f\n", a5, a8->targetMaxLinear);
    fprintf(v10, "%s---## TargetMinNits: %f\n", a5, a8->targetMinLinear);
    signed int inputTransferFunction = a10->inputTransferFunction;
    if (inputTransferFunction > 15)
    {
      if (inputTransferFunction != 16)
      {
        if (inputTransferFunction == 18)
        {
          uint64_t v16 = "HLG";
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      uint64_t v16 = "PQ";
    }
    else
    {
      if (inputTransferFunction != 1)
      {
        if (inputTransferFunction == 13)
        {
          uint64_t v16 = "sRGB";
          goto LABEL_16;
        }
LABEL_13:
        uint64_t v16 = "Linear";
        goto LABEL_16;
      }
      uint64_t v16 = "709";
    }
LABEL_16:
    fprintf(v10, "%s---## Input: %c%c%c%c [%c%c%c%c]%s\n", a5, HIBYTE(a10->inputFormatRaw), BYTE2(a10->inputFormatRaw), BYTE1(a10->inputFormatRaw), a10->inputFormatRaw, HIBYTE(a10->inputFormat), BYTE2(a10->inputFormat), BYTE1(a10->inputFormat), a10->inputFormat, v16);
    signed int outputTransferFunction = a10->outputTransferFunction;
    if (outputTransferFunction > 15)
    {
      if (outputTransferFunction == 16)
      {
        id v18 = "PQ";
        goto LABEL_26;
      }
      if (outputTransferFunction == 18)
      {
        id v18 = "HLG";
        goto LABEL_26;
      }
    }
    else
    {
      if (outputTransferFunction == 1)
      {
        id v18 = "709";
        goto LABEL_26;
      }
      if (outputTransferFunction == 13)
      {
        id v18 = "sRGB";
LABEL_26:
        fprintf(v10, "%s---## Output: %c%c%c%c [%c%c%c%c]%s\n", a5, HIBYTE(a10->outputFormatRaw), BYTE2(a10->outputFormatRaw), BYTE1(a10->outputFormatRaw), a10->outputFormatRaw, HIBYTE(a10->outputFormat), BYTE2(a10->outputFormat), BYTE1(a10->outputFormat), a10->outputFormat, v18);
        fprintf(v10, "%s\n", a5);
        fprintf(v10, "%scontrolpath = {}\n", a5);
        unsigned int frameNumber = self->super._frameNumber;
        goto LABEL_27;
      }
    }
    id v18 = "Linear";
    goto LABEL_26;
  }
}

- (void)populateMSRColorConfigStageB01_01:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10
{
  BOOL v13 = a4;
  uint64_t v16 = (FILE *)qword_26ABE76A0;
  unsigned int contentType = a10->contentType;
  if (a10->contentType == 3)
  {
    if (a10->inputColorSpace)
    {
      signed int inputFormat = a10->inputFormat;
      if (inputFormat > 1647534391)
      {
        BOOL v23 = inputFormat == 1815162994;
        int v24 = 1647534392;
      }
      else
      {
        BOOL v23 = inputFormat == 1378955371;
        int v24 = 1380411457;
      }
      if (!v23 && inputFormat != v24) {
        goto LABEL_44;
      }
    }
    goto LABEL_16;
  }
  if (contentType == 2)
  {
LABEL_16:
    unsigned int displayType = a10->displayType;
    if (displayType <= 7 && displayType != 5)
    {
      unsigned int BitDepthFromSurfaceFormat = getBitDepthFromSurfaceFormat(a10->inputFormat);
LABEL_21:
      float sdrMaxBrightnessInNits = a8->sdrMaxBrightnessInNits;
      goto LABEL_22;
    }
LABEL_44:
    unsigned int BitDepthFromSurfaceFormat = a7->var11 - 2;
    goto LABEL_21;
  }
  unsigned int BitDepthFromSurfaceFormat = a7->var11 - 2;
  float sdrMaxBrightnessInNits = a8->sdrMaxBrightnessInNits;
  if (contentType == 1)
  {
    signed int v20 = a10->inputFormat;
    if (isFormatYUV(v20))
    {
      unsigned int var13 = a7->var13;
      if (!v13) {
        return;
      }
      goto LABEL_23;
    }
  }
LABEL_22:
  signed int v20 = a10->inputFormat;
  unsigned int var13 = getChromaFormatFromSurfaceFormat(v20);
  if (!v13) {
    return;
  }
LABEL_23:
  if (v16)
  {
    fprintf(v16, "%s--- general and B01-01 Frame %d ---\n", a5, self->super._frameNumber);
    char v41 = BitDepthFromSurfaceFormat;
    fprintf(v16, "%scontrolpath[%d].signal_bit_depth = %d\n", a5, self->super._frameNumber, BitDepthFromSurfaceFormat);
    fprintf(v16, "%scontrolpath[%d].signal_color_space = %d\n", a5, self->super._frameNumber, a10->inputColorSpace);
    fprintf(v16, "%scontrolpath[%d].signal_chroma_format = %d\n", a5, self->super._frameNumber, var13);
    fprintf(v16, "%scontrolpath[%d].reshapeEnabled = %d\n", a5, self->super._frameNumber, a10->enableReshaping);
    if (a10->enableReshaping)
    {
      uint64_t v28 = 0;
      uint64_t v29 = self;
      do
      {
        fprintf(v16, "%scontrolpath[%d].reshapeLUT%d = {\n", a5, self->super._frameNumber, v28);
        [(ProcessingEngine *)self printArray:v16 Prefix:a5 Array:v29->_reshapeLUT Size:1024 NumberPerLine:8 Format:1];
        ++v28;
        uint64_t v29 = (MSRHDRProcessing *)((char *)v29 + 2048);
      }
      while (v28 != 3);
    }
    fprintf(v16, "%s\n", a5);
    signed int v20 = a10->inputFormat;
    LOBYTE(BitDepthFromSurfaceFormat) = v41;
  }
  a3->var2.var0.var1.dmaConfig.inputBitDepth = BitDepthFromSurfaceFormat;
  unsigned int inputColorSpace = a10->inputColorSpace;
  unsigned int outputColorSpace = a10->outputColorSpace;
  a3->var2.var0.var0[1] = inputColorSpace;
  a3->var2.var0.var0[2] = var13;
  a3->var2.var0.var1.dmaConfig.outputBitDepth = 16;
  a3->var2.var0.var0[7] = outputColorSpace;
  if (v20 <= 1647534391)
  {
    if (v20 != 1378955371)
    {
      int v32 = 1380411457;
      goto LABEL_33;
    }
LABEL_34:
    unsigned int v33 = a10->displayType;
    if (v33 <= 7 && ((1 << v33) & 0xB8) != 0) {
      goto LABEL_36;
    }
    goto LABEL_39;
  }
  if (v20 == 1815162994) {
    goto LABEL_34;
  }
  int v32 = 1647534392;
LABEL_33:
  if (v20 == v32) {
    goto LABEL_34;
  }
LABEL_39:
  if (inputColorSpace)
  {
    if (inputColorSpace != 1
      || a10->processingType != 5
      || (isSupportedMSRColorConversion(v20, a10->outputFormat) & 1) == 0)
    {
      goto LABEL_47;
    }
  }
  else if (a10->processingType != 5 || !isSupportedMSRColorConversion(v20, a10->outputFormat))
  {
    goto LABEL_47;
  }
LABEL_36:
  if (a10->inputTransferFunction == 13)
  {
    a3->var2.var0.var1.dmaConfig.fp16RangeadjustEnable = 1;
    float max_fp16 = self->_max_fp16;
    goto LABEL_38;
  }
LABEL_47:
  if (v20 > 1647534391)
  {
    if (v20 == 1815162994) {
      goto LABEL_53;
    }
    int v36 = 1647534392;
  }
  else
  {
    if (v20 == 1378955371) {
      goto LABEL_53;
    }
    int v36 = 1380411457;
  }
  if (v20 != v36)
  {
LABEL_75:
    a3->var2.var0.var1.dmaConfig.fp16RangeadjustEnable = 0;
    float v35 = 0.0;
    goto LABEL_76;
  }
LABEL_53:
  unsigned int v37 = a10->displayType;
  if (v37 <= 7 && ((1 << v37) & 0xB8) != 0) {
    goto LABEL_55;
  }
  if (v20 > 1647534391)
  {
    if (v20 == 1815162994) {
      goto LABEL_67;
    }
    int v38 = 1647534392;
  }
  else
  {
    if (v20 == 1378955371) {
      goto LABEL_67;
    }
    int v38 = 1380411457;
  }
  if (v20 != v38) {
    goto LABEL_75;
  }
LABEL_67:
  if (v37 == 6) {
    goto LABEL_55;
  }
  if (v20 > 1647534391)
  {
    if (v20 != 1815162994)
    {
      int v39 = 1647534392;
LABEL_73:
      if (v20 != v39) {
        goto LABEL_75;
      }
    }
  }
  else if (v20 != 1378955371)
  {
    int v39 = 1380411457;
    goto LABEL_73;
  }
  if (v37 != 2) {
    goto LABEL_75;
  }
LABEL_55:
  if (a10->inputTransferFunction != 8) {
    goto LABEL_75;
  }
  a3->var2.var0.var1.dmaConfig.fp16RangeadjustEnable = 1;
  if (sdrMaxBrightnessInNits > 4998.0)
  {
    float v35 = 0.01;
    goto LABEL_76;
  }
  if (sdrMaxBrightnessInNits < 1.0) {
    goto LABEL_77;
  }
  float max_fp16 = 10000.0 / sdrMaxBrightnessInNits;
  if (a10->contentType == 3) {
    float max_fp16 = max_fp16 * 12.0;
  }
LABEL_38:
  float v35 = 1.0 / max_fp16;
LABEL_76:
  a3->var2.var0.var1.dmaConfig.fp16Mult = v35;
LABEL_77:
  a3->var2.var0.var0[5] = 0;
  a3->var2.var0.var1.reshaping.mode = 0;
  a3->var2.var0.var1.chormaScaling.vscaleMode = 0;
  a3->var2.var0.var1.chormaScaling.hscaleMode = 0;
  if (inputColorSpace <= 2)
  {
    p_hscaleNumTaps = &a3->var2.var0.var1.chormaScaling.hscaleNumTaps;
    if (var13 == 1)
    {
      a3->var2.var0.var1.chormaScaling.hscaleMode = 4;
      unsigned __int8 *p_hscaleNumTaps = 15;
    }
    else
    {
      if (var13) {
        goto LABEL_83;
      }
      a3->var2.var0.var1.chormaScaling.vscaleMode = 4;
      a3->var2.var0.var1.chormaScaling.vscaleNumTaps = 9;
      a3->var2.var0.var1.chormaScaling.hscaleMode = 4;
      unsigned __int8 *p_hscaleNumTaps = 15;
      memmove(a3->var2.var0.var1.chormaScaling.vscaleCoefficents, self->_vScaleCoefficents, 0x480uLL);
    }
    memmove(a3->var2.var0.var1.chormaScaling.hscaleCoefficents, self->_hScaleCoefficents, 0x780uLL);
LABEL_83:
    if (a10->enableReshaping)
    {
      a3->var2.var0.var1.reshaping.mode = 3;
      memmove(a3->var2.var0.var1.reshaping.reshapeData, self->_reshapeLUT, 0x1800uLL);
    }
  }
  [(MSRHDRProcessing *)self dumpMmrConfig];
}

- (void)populateMSRColorConfigStageB01_02:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10
{
  BOOL v12 = a5;
  BOOL v13 = a3;
  unsigned __int16 v14 = self;
  uint64_t v110 = *MEMORY[0x263EF8340];
  unsigned int contentType = a10->contentType;
  if (a10->contentType == 3)
  {
    if (a10->inputColorSpace)
    {
      signed int inputFormat = a10->inputFormat;
      if (inputFormat > 1647534391)
      {
        BOOL v17 = inputFormat == 1815162994;
        int v18 = 1647534392;
      }
      else
      {
        BOOL v17 = inputFormat == 1378955371;
        int v18 = 1380411457;
      }
      if (!v17 && inputFormat != v18) {
        goto LABEL_15;
      }
    }
  }
  else if (contentType != 2)
  {
LABEL_15:
    unsigned int var11 = a7->var11;
    goto LABEL_16;
  }
  unsigned int displayType = a10->displayType;
  if (displayType >= 8 || ((0xDFu >> displayType) & 1) == 0) {
    goto LABEL_15;
  }
  LOBYTE(var11) = 12;
LABEL_16:
  long long v22 = (FILE *)qword_26ABE76A0;
  if (a4)
  {
    unsigned int v23 = ~(-1 << var11);
    float v24 = (float)-a6->var29 / a6->var28;
    BOOL v25 = v24 < 0.0;
    if (v24 < 0.0) {
      float v24 = -v24;
    }
    unsigned int v102 = 0xFFFFFFFF / (v23 << (16 - var11));
    unsigned int v103 = ((float)(v24 * 16777000.0) + 0.5) & 0x7FFFFFFF | (v25 << 31);
    int v26 = vcvts_n_u32_f32((float)((float)v23 * (float)v102) / (float)(1 << (var11 + 14)), 0x18uLL);
    if (self->_msrPlatform == 1869769064) {
      char v27 = 31;
    }
    else {
      char v27 = 29;
    }
    if (contentType != 3)
    {
      if (contentType == 2)
      {
        uint64_t v32 = (int)a10->displayType;
        if v32 < 8 && ((0xDFu >> v32))
        {
          p_unsigned int displayType = (unsigned int *)((char *)&unk_2222D4A74 + 4 * v32);
LABEL_58:
          unsigned int v43 = *p_displayType;
          if (v43 > 7 || v43 == 5)
          {
            unsigned int inputColorSpace = a10->inputColorSpace;
            goto LABEL_108;
          }
          goto LABEL_106;
        }
      }
      else if (contentType == 1 && !a10->inputColorSpace)
      {
        unsigned int v28 = a10->displayType;
        if (v28 <= 7 && v28 != 5) {
          goto LABEL_109;
        }
        if (a10->processingType == 4 && v28 <= 7 && ((1 << v28) & 0xC3) != 0) {
          goto LABEL_109;
        }
      }
      goto LABEL_52;
    }
    unsigned int inputColorSpace = a10->inputColorSpace;
    if (inputColorSpace)
    {
      signed int v30 = a10->inputFormat;
      if (v30 > 1647534391)
      {
        if (v30 != 1815162994)
        {
          int v31 = 1647534392;
LABEL_45:
          if (v30 != v31) {
            goto LABEL_52;
          }
        }
      }
      else if (v30 != 1378955371)
      {
        int v31 = 1380411457;
        goto LABEL_45;
      }
    }
    unsigned int v34 = a10->displayType;
    if (v34 <= 7 && v34 != 5)
    {
      if (inputColorSpace)
      {
        signed int v35 = a10->inputFormat;
        if (v35 > 1647534391)
        {
          if (v35 == 1815162994) {
            goto LABEL_104;
          }
          int v36 = 1647534392;
        }
        else
        {
          if (v35 == 1378955371) {
            goto LABEL_104;
          }
          int v36 = 1380411457;
        }
        if (v35 != v36) {
          goto LABEL_111;
        }
      }
LABEL_104:
      unsigned int v73 = a10->displayType;
      if (v73 > 7 || v73 == 5)
      {
LABEL_108:
        if (!inputColorSpace) {
          goto LABEL_109;
        }
LABEL_111:
        unsigned int v74 = v23;
        char v76 = 18;
        int v75 = 1;
        goto LABEL_112;
      }
LABEL_106:
      unsigned int v74 = v23;
      goto LABEL_107;
    }
LABEL_52:
    int v101 = v26;
    unsigned int v37 = a10->inputColorSpace;
    if (!v37 && a10->processingType == 5)
    {
      int v99 = ~(-1 << var11);
      char v40 = v27;
      char v41 = var11;
      int v42 = isSupportedMSRColorConversion(a10->inputFormat, a10->outputFormat);
      LOBYTE(var11) = v41;
      char v27 = v40;
      BOOL v13 = a3;
      BOOL v12 = a5;
      unsigned __int16 v14 = self;
      unsigned int v23 = v99;
      if (v42)
      {
        if (contentType != 3)
        {
          int v26 = v101;
          if (contentType == 2)
          {
            p_unsigned int displayType = &a10->displayType;
            goto LABEL_58;
          }
LABEL_109:
          if (a10->processingType != 5) {
            goto LABEL_111;
          }
          unsigned int v74 = v23;
          int v77 = v14;
          uint64_t v78 = v12;
          __int16 v79 = v13;
          char v80 = v27;
          char v81 = var11;
          char v82 = isSupportedMSRColorConversion(a10->inputFormat, a10->outputFormat);
          LOBYTE(var11) = v81;
          char v27 = v80;
          BOOL v13 = v79;
          BOOL v12 = v78;
          unsigned __int16 v14 = v77;
          unsigned int v23 = v74;
          if ((v82 & 1) == 0) {
            goto LABEL_111;
          }
LABEL_107:
          int v75 = 0;
          char v76 = 20;
LABEL_112:
          uint64_t v83 = 0;
          char v84 = var11 - 2;
          do
          {
            if (v75) {
              unsigned int v85 = a7->var5[v83] >> v76;
            }
            else {
              unsigned int v85 = (float)(*(&a6->var0 + (v83 & 3)) * 0.25);
            }
            v109[v83++] = v85;
          }
          while (v83 != 3);
          for (uint64_t i = 0; i != 9; ++i)
          {
            if (v75)
            {
              int v87 = a7->var4[i];
            }
            else
            {
              float v88 = a9->var19[i];
              BOOL v89 = v88 < 0.0;
              if (v88 < 0.0) {
                float v88 = -v88;
              }
              int v87 = ((float)(v88 * 8192.0) + 0.5);
              if (v89) {
                int v87 = -v87;
              }
            }
            *(int *)((char *)&v104 + i * 4) = v87;
          }
          *(void *)&info = 0x62675232767559;
          if (v22)
          {
            char v90 = v27;
            fprintf(v22, "%s--- B01-02 Frame %d ---\n", v12, v14->super._frameNumber);
            fprintf(v22, "%s--- %s ---\n", v12, (const char *)&info);
            fprintf(v22, "%scontrolpath[%d].PreCm3x3Enable = %d\n", v12, v14->super._frameNumber, 1);
            fprintf(v22, "%scontrolpath[%d].OutputBitDepth = %d\n", v12, v14->super._frameNumber, 16);
            fprintf(v22, "%scontrolpath[%d].rangeMin = %d\n", v12, v14->super._frameNumber, v103);
            fprintf(v22, "%scontrolpath[%d].range = %d\n", v12, v14->super._frameNumber, v74);
            fprintf(v22, "%scontrolpath[%d].rangeInv = %u\n", v12, v14->super._frameNumber, v102);
            fprintf(v22, "%scontrolpath[%d].m33Yuv2RgbScale2P = %d\n", v12, v14->super._frameNumber, 13);
            fprintf(v22, "%scontrolpath[%d].m33Yuv2Rgb = { {%d, %d, %d}, {%d, %d, %d}, {%d, %d, %d} }\n", v12, v14->super._frameNumber, (int)(float)v104, (int)(float)(int)v105, (int)(float)SHIDWORD(v105), (int)(float)(int)v106, (int)(float)SHIDWORD(v106), (int)(float)(int)v107, (int)(float)SHIDWORD(v107), (int)(float)(int)v108, (int)(float)SHIDWORD(v108));
            fprintf(v22, "%scontrolpath[%d].v3Yuv2RgbOffInRgb = { %d, %d, %d }\n", v12, v14->super._frameNumber, v109[0], v109[1], v109[2]);
            fprintf(v22, "%s\n", v12);
            char v27 = v90;
          }
          uint64_t v91 = 0;
          *(void *)&v13->var2.var0.var1.sourceToRGB.mode = 0xD00000002;
          int v92 = -1 << v27;
          coeff = v13->var2.var0.var1.sourceToRGB.src2rgb.coeff;
          if (v26 >= 0) {
            int v94 = -1;
          }
          else {
            int v94 = 1;
          }
          float v95 = (float)(v26 & ~v92) * 0.000000059605;
          v96 = &v104;
          do
          {
            uint64_t v97 = 0;
            v13->var2.var0.var0[v91 + 2317] = 0;
            v13->var2.var0.var0[v91 + 2320] = 1065353215;
            v13->var2.var0.var1.sourceToRGB.src2rgb.offsetIn[v91] = (float)-(float)v109[v91]
                                                                  / (float)(1 << v84);
            do
            {
              (*coeff)[v97] = (int)(float)v96[v97];
              ++v97;
            }
            while (v97 != 3);
            v13->var2.var0.var1.sourceToRGB.src2rgb.offsetOut[v91] = (float)(-(v103 * v102) >> 16) * 0.000000059605;
            v13->var2.var0.var1.sourceToRGB.src2rgb.outputMinClip[v91] = v95 * (float)v94;
            v13->var2.var0.var1.sourceToRGB.src2rgb.outputMaxClip[v91++] = v95 * (float)((v26 >> 31) | 1);
            ++coeff;
            v96 += 3;
          }
          while (v91 != 3);
          return;
        }
        unsigned int inputColorSpace = 0;
        int v26 = v101;
        goto LABEL_104;
      }
    }
    if (contentType == 1)
    {
      if (v37 != 2) {
        return;
      }
      unsigned int v44 = a10->displayType;
      if (v44 <= 7 && v44 != 5)
      {
        char v100 = var11;
        uint64_t v106 = 0x100000000;
        uint64_t v105 = 0;
        uint64_t v107 = 0;
        uint64_t v108 = 0x100000000;
        int v104 = 1;
        if (a10->processingType == 5)
        {
          v45 = v14;
          signed int v46 = v12;
          int v47 = v13;
          char v48 = v27;
          char v49 = isSupportedMSRColorConversion(a10->inputFormat, a10->outputFormat);
          char v27 = v48;
          BOOL v13 = v47;
          BOOL v12 = v46;
          unsigned __int16 v14 = v45;
          if (v49)
          {
LABEL_78:
            uint64_t v53 = 0;
            *(void *)&info = 0x534D4C32545049;
            v54 = &v104;
            id v55 = &m33Ipt2LmsFlt;
            int v56 = v101;
            unsigned int v57 = v103;
            do
            {
              for (uint64_t j = 0; j != 3; ++j)
              {
                float v59 = *(float *)&v55[j];
                BOOL v60 = v59 < 0.0;
                if (v59 < 0.0) {
                  float v59 = -v59;
                }
                int v61 = ((float)(v59 * 8192.0) + 0.5);
                if (v60) {
                  int v61 = -v61;
                }
                v54[j] = v61;
              }
              ++v53;
              v54 += 3;
              v55 += 3;
            }
            while (v53 != 3);
            int v62 = 13;
            goto LABEL_88;
          }
        }
LABEL_73:
        if (LODWORD(a6[1].var49) == 4)
        {
          unsigned int v52 = a10->displayType;
          if (v52 <= 7 && v52 != 5 && a10->enableToneMapping && a10->enableReshaping) {
            goto LABEL_78;
          }
        }
LABEL_87:
        int v62 = 0;
        strcpy((char *)&info, "IPT offsetting only");
        int v56 = v101;
        unsigned int v57 = v103;
LABEL_88:
        if (v22)
        {
          char v63 = v27;
          fprintf(v22, "%s--- B01-02 Frame %d ---\n", v12, v14->super._frameNumber);
          fprintf(v22, "%s--- %s ---\n", v12, (const char *)&info);
          fprintf(v22, "%scontrolpath[%d].PreCm3x3Enable = %d\n", v12, v14->super._frameNumber, 1);
          fprintf(v22, "%scontrolpath[%d].OutputBitDepth = %d\n", v12, v14->super._frameNumber, 16);
          fprintf(v22, "%scontrolpath[%d].rangeMin = %d\n", v12, v14->super._frameNumber, v57);
          fprintf(v22, "%scontrolpath[%d].range = %d\n", v12, v14->super._frameNumber, v23);
          fprintf(v22, "%scontrolpath[%d].rangeInv = %u\n", v12, v14->super._frameNumber, v102);
          fprintf(v22, "%scontrolpath[%d].m33Yuv2RgbScale2P = %d\n", v12, v14->super._frameNumber, v62);
          fprintf(v22, "%scontrolpath[%d].m33Yuv2Rgb = { {%d, %d, %d}, {%d, %d, %d}, {%d, %d, %d} }\n", v12, v14->super._frameNumber, v104, v105, HIDWORD(v105), v106, HIDWORD(v106), v107, HIDWORD(v107), v108, HIDWORD(v108));
          fprintf(v22, "%scontrolpath[%d].v3Yuv2RgbOffInRgb = { %d, %d, %d }\n", v12, v14->super._frameNumber, 0, 1 << (v100 - 3), 1 << (v100 - 3));
          fprintf(v22, "%s\n", v12);
          char v27 = v63;
        }
        v13->var2.var0.var0[2315] = 1;
        v13->var2.var0.var0[2316] = v62;
        if (v56 >= 0) {
          int v64 = -1;
        }
        else {
          int v64 = 1;
        }
        float v65 = (float)(v56 & ~(-1 << v27));
        float v66 = (float)(v65 * 0.000000059605) * (float)v64;
        float v67 = (float)(v65 * 0.000000059605) * (float)((v56 >> 31) | 1);
        outputMaxClip = v13->var2.var0.var1.sourceToRGB.src2rgb.outputMaxClip;
        *(void *)v13->var2.var0.var1.sourceToRGB.src2rgb.inputMinClip = 0;
        v13->var2.var0.var0[2319] = 0;
        memset_pattern16(v13->var2.var0.var1.sourceToRGB.src2rgb.inputMaxClip, &unk_2222D46C0, 0xCuLL);
        for (uint64_t k = 0; k != 3; ++k)
        {
          id v70 = v13->var2.var0.var1.sourceToRGB.src2rgb.coeff[k];
          BOOL v71 = (char *)&v104 + k * 12;
          if (k * 12) {
            float v72 = -0.5;
          }
          else {
            float v72 = 0.0;
          }
          *(outputMaxClip - 18) = v72;
          *(void *)id v70 = *(void *)v71;
          v70[2] = *((_DWORD *)v71 + 2);
          *(outputMaxClip - 6) = (float)(-(v57 * v102) >> 16) * 0.000000059605;
          *(outputMaxClip - 3) = v66;
          *outputMaxClip++ = v67;
        }
        return;
      }
    }
    else if (v37 != 2)
    {
      return;
    }
    if (a10->processingType != 5) {
      return;
    }
    char v50 = v27;
    char v100 = var11;
    if ((isSupportedMSRColorConversion(a10->inputFormat, a10->outputFormat) & 1) == 0) {
      return;
    }
    uint64_t v106 = 0x100000000;
    uint64_t v105 = 0;
    uint64_t v107 = 0;
    uint64_t v108 = 0x100000000;
    int v104 = 1;
    char v51 = isSupportedMSRColorConversion(a10->inputFormat, a10->outputFormat);
    char v27 = v50;
    if (v51) {
      goto LABEL_78;
    }
    if (contentType != 1) {
      goto LABEL_87;
    }
    goto LABEL_73;
  }
  if (qword_26ABE76A0)
  {
    fprintf((FILE *)qword_26ABE76A0, "%s--- B01-02 Frame %d ---\n", a5, self->super._frameNumber);
    fprintf(v22, "%scontrolpath[%d].PreCm3x3Enable = %d\n", v12, v14->super._frameNumber, 0);
    fprintf(v22, "%s\n", v12);
  }
  v13->var2.var0.var0[2315] = 0;
}

- (void)populateMSRColorConfigStageB01_03:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10
{
  unsigned __int16 v14 = (FILE *)qword_26ABE76A0;
  if (a4)
  {
    float tm_Send_nits = a8->auxData.tm_Send_nits;
    float v16 = 10000.0 / tm_Send_nits;
    BOOL v17 = tm_Send_nits == 0.0;
    LODWORD(v10) = 1.0;
    if (!v17) {
      *(float *)&double v10 = v16;
    }
    [(MSRHDRProcessing *)self updateDegammaLUT:a10 AdditionalScaler:v10];
    if (self->_msrPlatform == 1869769064) {
      uint64_t v18 = 1281;
    }
    else {
      uint64_t v18 = 514;
    }
    int type = self->_degamma.type;
    if ((type - 1) >= 3)
    {
      if (type == 4) {
        signed int v20 = "LINEAR";
      }
      else {
        signed int v20 = "Unknown";
      }
    }
    else
    {
      signed int v20 = off_264605C38[type - 1];
    }
    snprintf((char *)&info, 0x3FFuLL, "%s", v20);
    if (v14)
    {
      fprintf(v14, "%s--- B01-03 Frame %d ---\n", a5, self->super._frameNumber);
      fprintf(v14, "%s--- %s ---\n", a5, (const char *)&info);
      fprintf(v14, "%scontrolpath[%d].DeGammaEnable = %d\n", a5, self->super._frameNumber, 1);
      fprintf(v14, "%scontrolpath[%d].custom_degamma_LUT = {\n", a5, self->super._frameNumber);
      if (self->_msrPlatform - 1869769063 <= 1) {
        [(ProcessingEngine *)self printArray:v14 Prefix:a5 Array:&self->_degamma.var0 Size:v18 NumberPerLine:8 Format:0];
      }
      fprintf(v14, "%s\n", a5);
    }
    a3->var2.var0.var0[2344] = 2;
    if (self->_msrPlatform == 1869769063)
    {
      deGammaLUT = a3->var2.var0.var1.linearization.deGammaLUT;
      lut = (float (*)[1281])&self->_degamma.var0.degmmaS.lutForCModel[514];
      size_t v23 = 6168;
    }
    else
    {
      deGammaLUT = self->_msrCU->var4;
      lut = self->_degamma.var0.degmmaS.lut;
      size_t v23 = 5124;
    }
    memcpy(deGammaLUT, lut, v23);
  }
  else
  {
    if (qword_26ABE76A0)
    {
      fprintf((FILE *)qword_26ABE76A0, "%s--- B01-03 Frame %d ---\n", a5, self->super._frameNumber);
      fprintf(v14, "%scontrolpath[%d].DeGammaEnable = %d\n", a5, self->super._frameNumber, 0);
      fprintf(v14, "%s\n", a5);
    }
    a3->var2.var0.var0[2344] = 0;
  }
}

- (int)getRgb2LmsScale2P
{
  [(MSRHDRProcessing *)self getDolby84DegammaScale];
  return 14 - (int)log2f(10.0 / v2);
}

- (float)getDolby84PostDegammaScale
{
  return 1.0;
}

- (void)populateMSRColorConfigStageB01_04:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  BOOL v13 = (FILE *)qword_26ABE76A0;
  if (a4)
  {
    float sdrMaxBrightnessInNits = a8->sdrMaxBrightnessInNits;
    int processingType = a10->processingType;
    unsigned int inputTransferFunction = a10->inputTransferFunction;
    if (processingType == 5 && inputTransferFunction == 13)
    {
      float v21 = (float)((float)(sdrMaxBrightnessInNits / a8->EDRFactor) / 10000.0) * 200.0;
      unsigned int v22 = 7;
      goto LABEL_19;
    }
    if (inputTransferFunction == 8)
    {
      if (sdrMaxBrightnessInNits <= 4998.0)
      {
        float v21 = 0.01;
      }
      else
      {
        float v20 = 10000.0 / sdrMaxBrightnessInNits;
        if (a10->contentType == 3) {
          float v20 = v20 * 12.0;
        }
        float v21 = 1.0 / v20;
      }
    }
    else
    {
      float v21 = sdrMaxBrightnessInNits / 10000.0;
    }
    if ((processingType | 4) == 5)
    {
      unsigned int v22 = 14;
LABEL_19:
      if (a10->operationFlags)
      {
        snprintf((char *)&info, 0x3FFuLL, "postRGBtoRGB, scaler=%f", v21);
        uint64_t v39 = 0;
        float v40 = (float)(1 << v22);
        long long v41 = *(_OWORD *)&a6[1].var32;
        long long v42 = *(_OWORD *)&a6[1].var36;
        long long v43 = *(_OWORD *)&a6[1].var40;
        do
        {
          long long v91 = v41;
          float v44 = *(float *)((unint64_t)&v91 & 0xFFFFFFFFFFFFFFF3 | (4 * (v39 & 3)));
          BOOL v45 = v44 < 0.0;
          if (v44 < 0.0) {
            float v44 = -v44;
          }
          int v46 = ((float)(v44 * v40) + 0.5);
          int v47 = (float *)((unint64_t)&v90 & 0xFFFFFFFFFFFFFFF3 | (4 * (v39 & 3)));
          if (v45) {
            int v46 = -v46;
          }
          char v48 = &v95[v39];
          *char v48 = v46;
          long long v90 = v42;
          float v49 = *v47;
          BOOL v50 = *v47 < 0.0;
          if (*v47 < 0.0) {
            float v49 = -*v47;
          }
          char v51 = (float *)((unint64_t)&v89 & 0xFFFFFFFFFFFFFFF3 | (4 * (v39 & 3)));
          int v52 = ((float)(v49 * v40) + 0.5);
          if (v50) {
            int v52 = -v52;
          }
          v48[3] = v52;
          long long v89 = v43;
          float v53 = *v51;
          if (*v51 < 0.0) {
            float v53 = -*v51;
          }
          int v54 = ((float)(v53 * v40) + 0.5);
          if (*v51 < 0.0) {
            int v54 = -v54;
          }
          v48[6] = v54;
          ++v39;
        }
        while (v39 != 3);
      }
      else
      {
        uint64_t v23 = 0;
        float v24 = (float)(1 << v22);
        strcpy((char *)&info, "preRGBtoRGB");
        long long v25 = *(_OWORD *)&a6[1].var16;
        long long v26 = *(_OWORD *)&a6[1].var20;
        long long v27 = *(_OWORD *)&a6[1].var24;
        do
        {
          long long v88 = v25;
          float v28 = *(float *)((unint64_t)&v88 & 0xFFFFFFFFFFFFFFF3 | (4 * (v23 & 3)));
          BOOL v29 = v28 < 0.0;
          if (v28 < 0.0) {
            float v28 = -v28;
          }
          int v30 = ((float)(v28 * v24) + 0.5);
          int v31 = (float *)((unint64_t)&v87 & 0xFFFFFFFFFFFFFFF3 | (4 * (v23 & 3)));
          if (v29) {
            int v30 = -v30;
          }
          uint64_t v32 = &v95[v23];
          *uint64_t v32 = v30;
          long long v87 = v26;
          float v33 = *v31;
          BOOL v34 = *v31 < 0.0;
          if (*v31 < 0.0) {
            float v33 = -*v31;
          }
          signed int v35 = (float *)((unint64_t)&v86 & 0xFFFFFFFFFFFFFFF3 | (4 * (v23 & 3)));
          int v36 = ((float)(v33 * v24) + 0.5);
          if (v34) {
            int v36 = -v36;
          }
          v32[3] = v36;
          long long v86 = v27;
          float v37 = *v35;
          if (*v35 < 0.0) {
            float v37 = -*v35;
          }
          int v38 = ((float)(v37 * v24) + 0.5);
          if (*v35 < 0.0) {
            int v38 = -v38;
          }
          v32[6] = v38;
          ++v23;
        }
        while (v23 != 3);
      }
LABEL_49:
      if (v13)
      {
        fprintf(v13, "%s--- B01-04 Frame %d ---\n", a5, self->super._frameNumber);
        fprintf(v13, "%s--- %s ---\n", a5, (const char *)&info);
        fprintf(v13, "%scontrolpath[%d].PostDeGamma3x3Enable = %d\n", a5, self->super._frameNumber, 1);
        fprintf(v13, "%scontrolpath[%d].m33Rgb2Lms = { {%d, %d, %d}, {%d, %d, %d}, {%d, %d, %d} }\n", a5, self->super._frameNumber, (int)(float)(v21 * (float)v95[0]), (int)(float)(v21 * (float)v95[1]), (int)(float)(v21 * (float)v95[2]), (int)(float)(v21 * (float)v95[3]), (int)(float)(v21 * (float)v95[4]), (int)(float)(v21 * (float)v95[5]), (int)(float)(v21 * (float)v95[6]), (int)(float)(v21 * (float)v95[7]), (int)(float)(v21 * (float)v95[8]));
        fprintf(v13, "%scontrolpath[%d].m33Rgb2LmsScale2P = %d\n", a5, self->super._frameNumber, v22);
        fprintf(v13, "%scontrolpath[%d].Rgb2LmsOutMin = %d\n", a5, self->super._frameNumber, 0);
        fprintf(v13, "%s\n", a5);
      }
      uint64_t v55 = 0;
      a3->var2.var0.var0[3887] = 1;
      a3->var2.var0.var0[3888] = v22;
      coeff = a3->var2.var0.var1.colorAtoCommonSpace.a2c.coeff;
      unsigned int v57 = v95;
      do
      {
        uint64_t v58 = 0;
        a3->var2.var0.var0[v55 + 3889] = 0;
        a3->var2.var0.var0[v55 + 3892] = 1124073471;
        a3->var2.var0.var0[v55 + 3895] = 0;
        do
        {
          (*coeff)[v58] = (int)(float)(v21 * (float)(int)v57[v58]);
          ++v58;
        }
        while (v58 != 3);
        a3->var2.var0.var0[v55 + 3907] = 0;
        a3->var2.var0.var0[v55 + 3910] = 0;
        a3->var2.var0.var0[v55++ + 3913] = 1120403456;
        ++coeff;
        v57 += 3;
      }
      while (v55 != 3);
      return;
    }
    unsigned int v59 = *(unsigned __int16 *)&a6[1].var50;
    unsigned int contentType = a10->contentType;
    if (a10->contentType == 1)
    {
      if (a10->inputColorSpace == 2 && LODWORD(a6[1].var49) == 4)
      {
        unsigned int displayType = a10->displayType;
        BOOL v62 = displayType > 7 || displayType == 5;
        if (!v62 && a10->enableToneMapping && a10->enableReshaping)
        {
          snprintf((char *)&info, 0x3FFuLL, "LMS2%% to 4%% conversion");
          for (uint64_t i = 0; i != 9; ++i)
          {
            float v64 = *(float *)&m33CrossTalkTwo2FourPercentFlt[i];
            BOOL v65 = v64 < 0.0;
            if (v64 < 0.0) {
              float v64 = -v64;
            }
            int v66 = ((float)(v64 * 16384.0) + 0.5);
            if (v65) {
              int v66 = -v66;
            }
            v95[i] = v66;
            unsigned int v22 = 14;
          }
          goto LABEL_49;
        }
      }
      goto LABEL_93;
    }
    if (contentType == 3)
    {
      if (!a10->inputColorSpace) {
        goto LABEL_82;
      }
      signed int inputFormat = a10->inputFormat;
      if (inputFormat > 1647534391)
      {
        if (inputFormat == 1815162994) {
          goto LABEL_82;
        }
        int v68 = 1647534392;
      }
      else
      {
        if (inputFormat == 1378955371) {
          goto LABEL_82;
        }
        int v68 = 1380411457;
      }
      if (inputFormat != v68)
      {
LABEL_93:
        if (v59 & 1) == 0 || (debugDM4DisableConf)
        {
          strcpy((char *)&info, "RGBtoLMS from DM metadata");
          unint64_t v79 = __PAIR64__(*(unsigned int *)"DM metadata", 1.0);
          if (self->_msrHC.processingType == 4)
          {
            unsigned int v22 = 14;
            if ((*(_WORD *)&self->super._anon_90[472] & 0x80) == 0 || (debugDM4DisableConf & 0x80) != 0)
            {
              int v80 = [(MSRHDRProcessing *)self getRgb2LmsScale2P];
              [(MSRHDRProcessing *)self getDolby84PostDegammaScale];
              *(float *)&unint64_t v79 = *(float *)&v79 / (float)(1 << (14 - v80));
              unsigned int v22 = v80;
            }
          }
          else
          {
            unsigned int v22 = 14;
          }
          for (uint64_t j = 0; j != 9; ++j)
            v95[j] = (int)(float)((float)((float)a7->var6[j] * *(float *)&v79) + 0.5);
        }
        else
        {
          int v75 = ((debugDM4DisableConf & 0x40) == 0) & (v59 >> 6);
          snprintf((char *)&info, 0x3FFuLL, "RGBtoLMS from DM metadata with 4%% crosstalk");
          for (uint64_t k = 0; k != 9; ++k)
            *(float *)&v94[k * 4] = (float)a7->var6[k] * 0.000061035;
          int v93 = 1064011039;
          v92[0] = m33CrossTalkFourPercentFlt;
          v92[1] = unk_2222D47B8;
          Matrix3x3_multmatrix((uint64_t)v92, (uint64_t)v94);
          if (v75)
          {
            *(float *)&double v77 = v21;
            unsigned int v22 = [(MSRHDRProcessing *)self getMatrixScale2P:v92 OutputScale:v77];
            float v78 = (float)(1 << v22);
          }
          else
          {
            unsigned int v22 = 14;
            float v78 = 16384.0;
          }
          for (uint64_t m = 0; m != 9; ++m)
          {
            float v82 = *(float *)((char *)v92 + m * 4);
            BOOL v83 = v82 < 0.0;
            if (v82 < 0.0) {
              float v82 = -v82;
            }
            int v84 = ((float)(v78 * v82) + 0.5);
            if (v83) {
              int v84 = -v84;
            }
            v95[m] = v84;
          }
        }
        goto LABEL_49;
      }
    }
    else if (contentType != 2)
    {
      goto LABEL_93;
    }
LABEL_82:
    unsigned int v69 = a10->displayType;
    if (v69 <= 7 && v69 != 5)
    {
      uint64_t v71 = 0;
      strcpy((char *)&info, "RGBtoLMS from hdrCtrl");
      do
      {
        float v72 = a9->var20[v71];
        BOOL v73 = v72 < 0.0;
        if (v72 < 0.0) {
          float v72 = -v72;
        }
        int v74 = ((float)(v72 * 16384.0) + 0.5);
        if (v73) {
          int v74 = -v74;
        }
        v95[v71++] = v74;
      }
      while (v71 != 9);
      unsigned int v22 = 14;
      goto LABEL_49;
    }
    goto LABEL_93;
  }
  if (qword_26ABE76A0)
  {
    fprintf((FILE *)qword_26ABE76A0, "%s--- B01-04 Frame %d ---\n", a5, self->super._frameNumber);
    fprintf(v13, "%scontrolpath[%d].PostDeGamma3x3Enable = %d\n", a5, self->super._frameNumber, 0);
    fprintf(v13, "%s\n", a5);
  }
  a3->var2.var0.var0[3887] = 0;
}

- (void)populateMSRColorConfigStageB01_05:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10
{
  BOOL v10 = a4;
  BOOL v12 = (FILE *)qword_26ABE76A0;
  if (qword_26ABE76A0)
  {
    fprintf((FILE *)qword_26ABE76A0, "%s--- B01-05 Frame %d ---\n", a5, self->super._frameNumber);
    fprintf(v12, "%scontrolpath[%d].FixedPQReGammaEnable = %d\n", a5, self->super._frameNumber, v10);
    fprintf(v12, "%s\n", a5);
  }
  a3->var2.var0.var1.chromaticAdaption.fixedPQRegamma_Enable = v10;
}

- (void)populateMSRColorConfigStageB01_06:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10
{
  BOOL v13 = (FILE *)qword_26ABE76A0;
  if (a4)
  {
    unsigned int v14 = *(unsigned __int16 *)&a6[1].var50;
    if (a8->tmData.doviTmMode == 4)
    {
      char v15 = debugDM4DisableConf;
    }
    else
    {
      char v15 = debugDM4DisableConf;
      if ((((debugDM4DisableConf & 8) == 0) & (v14 >> 3)) != 1)
      {
        int v17 = 0;
        float v16 = (float *)&m33Lms2IptFlt;
LABEL_10:
        unsigned int v18 = 12;
        if ((v14 & 0x40) != 0 && (v15 & 0x40) == 0) {
          unsigned int v18 = [(MSRHDRProcessing *)self getMatrixScale2P:v16];
        }
        if (v17) {
          snprintf((char *)&info, 0x3FFuLL, "lms2ictcp");
        }
        else {
          snprintf((char *)&info, 0x3FFuLL, "lms2ipt");
        }
        if (v13)
        {
          fprintf(v13, "%s--- B01-06 Frame %d ---\n", a5, self->super._frameNumber);
          fprintf(v13, "%s--- %s ---\n", a5, (const char *)&info);
          fprintf(v13, "%scontrolpath[%d].PreToneMap3x3Enable = %d\n", a5, self->super._frameNumber, 1);
          float v19 = *v16;
          if (*v16 < 0.0) {
            float v19 = -*v16;
          }
          float v20 = (float)(1 << v18);
          int v21 = ((float)(v19 * v20) + 0.5);
          if (*v16 < 0.0) {
            int v21 = -v21;
          }
          float v22 = 0.4;
          if (v17) {
            float v22 = 0.5;
          }
          unsigned int v23 = ((float)(v22 * v20) + 0.5);
          float v24 = 0.2;
          if (v17) {
            float v24 = 0.0;
          }
          unsigned int v25 = ((float)(v24 * v20) + 0.5);
          float v26 = 4.455;
          if (v17) {
            float v26 = 0.80688;
          }
          unsigned int v27 = ((float)(v26 * v20) + 0.5);
          float v28 = -4.851;
          if (v17) {
            float v28 = -1.6617;
          }
          unsigned int v29 = (0.5 - (float)(v28 * v20));
          float v30 = 0.396;
          if (v17) {
            float v30 = 0.85486;
          }
          unsigned int v31 = ((float)(v30 * v20) + 0.5);
          float v32 = 0.8056;
          if (v17) {
            float v32 = 4.3782;
          }
          unsigned int v33 = ((float)(v32 * v20) + 0.5);
          float v34 = 0.3572;
          float v35 = -4.2456;
          if (!v17) {
            float v35 = 0.3572;
          }
          float v36 = -v35;
          if (v17) {
            float v34 = v36;
          }
          int v37 = ((float)(v34 * v20) + 0.5);
          if (v17) {
            int v37 = -v37;
          }
          float v38 = -1.1628;
          if (v17) {
            float v38 = -0.13257;
          }
          fprintf(v13, "%scontrolpath[%d].m33Lms2Ipt = { {%d, %d, %d}, {%d, %d, %d}, {%d, %d, %d} }\n", a5, self->super._frameNumber, v21, v23, v25, v27, -v29, v31, v33, v37, -(0.5 - (float)(v38 * v20)));
          fprintf(v13, "%scontrolpath[%d].m33Lms2IptScale2P = %d\n", a5, self->super._frameNumber, v18);
          fprintf(v13, "%s\n", a5);
        }
        else
        {
          float v20 = (float)(1 << v18);
        }
        uint64_t v39 = 0;
        a3->var2.var0.var0[3917] = 1;
        a3->var2.var0.var0[3918] = v18;
        coeff = a3->var2.var0.var1.chromaticAdaption.cacsc1.coeff;
        do
        {
          uint64_t v41 = 0;
          a3->var2.var0.var0[v39 + 3919] = -1023410177;
          a3->var2.var0.var0[v39 + 3922] = 1124073471;
          a3->var2.var0.var0[v39 + 3925] = 0;
          do
          {
            float v42 = v16[v41];
            BOOL v43 = v42 < 0.0;
            if (v42 < 0.0) {
              float v42 = -v42;
            }
            int v44 = ((float)(v20 * v42) + 0.5);
            if (v43) {
              int v44 = -v44;
            }
            (*coeff)[v41++] = v44;
          }
          while (v41 != 3);
          a3->var2.var0.var0[v39 + 3937] = 0;
          a3->var2.var0.var0[v39 + 3940] = -1082130433;
          a3->var2.var0.var0[v39++ + 3943] = 1065353215;
          ++coeff;
          v16 += 3;
        }
        while (v39 != 3);
        return;
      }
    }
    float v16 = (float *)&m33Lms2ItpFlt;
    int v17 = 1;
    goto LABEL_10;
  }
  if (qword_26ABE76A0)
  {
    fprintf((FILE *)qword_26ABE76A0, "%s--- B01-06 Frame %d ---\n", a5, self->super._frameNumber);
    fprintf(v13, "%scontrolpath[%d].PreToneMap3x3Enable = %d\n", a5, self->super._frameNumber, 0);
    fprintf(v13, "%s\n", a5);
  }
  a3->var2.var0.var0[3917] = 0;
}

- (int)getLumaShiftBits
{
  return 15;
}

- (void)populateMSRColorConfigStageB02HDR10:(id *)a3 DMConfig:(id *)a4
{
  p_var0 = &a3->var2.var0.var1.chromaticAdaption.var0;
  a3->var2.var0.var0[3946] = 2;
  a3->var2.var0.var1.chromaticAdaption.var0.toneMapMode1.int type = 0;
  a3->var2.var0.var1.chromaticAdaption.var0.toneMapMode1.lumaShiftBits = [(MSRHDRProcessing *)self getLumaShiftBits];
  a3->var2.var0.var0[3952] = 0;
  *(_WORD *)&p_var0->toneMapMode2.spacingComp0 = 512;
  p_var0->toneMapMode1.scaleShiftBits = 21;
  unsigned int v8 = &a3->var2.var0.var1.chromaticAdaption.var0.toneMapMode2 + 4;
  uint64_t v9 = -3;
  do
  {
    *(_DWORD *)&v8[-3].msbPos2 = vcvts_n_s32_f32(*(&a4[1].var28 + (((_BYTE)v9 - 1) & 3)), 7uLL);
    *(_DWORD *)&v8->msbPos0 = 128;
    unsigned int v8 = ($E14604B6101DC4D3C00E389343975F9C *)((char *)v8 + 4);
  }
  while (!__CFADD__(v9++, 1));
  *(_OWORD *)((char *)&a3->var2.var0.var1.chromaticAdaption.var0.toneMapMode2 + 52) = 0u;
  *(_OWORD *)(&a3->var2.var0.var1.chromaticAdaption.var0.toneMapMode2 + 6) = 0u;
  p_tonemapLUT = &self->_tonemapLUT;
  memcpy(a3->var2.var0.var1.chromaticAdaption.toneMapLUT, p_tonemapLUT, 0x804uLL);
  memcpy(a3->var2.var0.var1.chromaticAdaption.toneMapLUT[1], p_tonemapLUT->cmodel.tmLutS, sizeof(a3->var2.var0.var1.chromaticAdaption.toneMapLUT[1]));
}

- (void)populateMSRColorConfigStageB02HLG:(id *)a3 hdrControl:(id *)a4
{
  p_var0 = &a3->var2.var0.var1.chromaticAdaption.var0;
  a3->var2.var0.var0[3946] = 2;
  LOWORD(a3->var2.var0.var1.chromaticAdaption.var0.toneMapMode0.precision) = 6144;
  unsigned __int8 v8 = [(MSRHDRProcessing *)self getLumaShiftBits];
  uint64_t v9 = 0;
  p_var0->toneMapMode1.lumaShiftBits = v8;
  *(_WORD *)&p_var0->toneMapMode2.spacingComp0 = 0;
  a3->var2.var0.var0[3952] = 0;
  do
  {
    unsigned int var15 = a4->var15;
    if (var15 == 1) {
      int v11 = (char *)&RGB709toHLGY_coeff;
    }
    else {
      int v11 = (char *)&RGB2020toHLGY_coeff;
    }
    if (var15 == 12) {
      BOOL v12 = (char *)&RGBP3toHLGY_coeff;
    }
    else {
      BOOL v12 = v11;
    }
    int v13 = (int)(float)(*(float *)&v12[v9] * 127.0);
    unsigned int v14 = (char *)a3 + v9;
    *((_DWORD *)v14 + 3955) = v13;
    *((_DWORD *)v14 + 3951) = v13;
    v9 += 4;
  }
  while (v9 != 12);
  *(_OWORD *)((char *)&a3->var2.var0.var1.chromaticAdaption.var0.toneMapMode2 + 52) = 0u;
  *(_OWORD *)(&a3->var2.var0.var1.chromaticAdaption.var0.toneMapMode2 + 6) = 0u;
  memcpy(a3->var2.var0.var1.chromaticAdaption.toneMapLUT, &self->_tonemapLUT, 0x804uLL);
}

- (void)populateMSRColorConfigStageB02:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  int v13 = (FILE *)qword_26ABE76A0;
  if (a4)
  {
    unsigned int contentType = a10->contentType;
    if (a10->contentType == 2
      || contentType == 1 && ((unsigned int inputColorSpace = a10->inputColorSpace) == 0 || inputColorSpace == 2))
    {
      unsigned int displayType = a10->displayType;
      if (displayType <= 7 && displayType != 5) {
        goto LABEL_26;
      }
    }
    signed int inputFormat = a10->inputFormat;
    if (inputFormat > 1647534391)
    {
      BOOL v20 = inputFormat == 1815162994;
      int v21 = 1647534392;
    }
    else
    {
      BOOL v20 = inputFormat == 1378955371;
      int v21 = 1380411457;
    }
    if (!v20 && inputFormat != v21)
    {
LABEL_64:
      if (contentType == 1)
      {
        if (a10->processingType == 4 && !a10->inputColorSpace)
        {
          unsigned int v31 = a10->displayType;
          if (v31 <= 7 && v31 != 5) {
            goto LABEL_26;
          }
        }
        goto LABEL_83;
      }
      if (contentType != 3) {
        goto LABEL_83;
      }
      if (a10->inputColorSpace)
      {
        if (inputFormat > 1647534391)
        {
          if (inputFormat != 1815162994)
          {
            int v30 = 1647534392;
LABEL_80:
            if (inputFormat == v30) {
              goto LABEL_81;
            }
LABEL_83:
            if (enableLogInstance)
            {
              if (logInstanceID) {
                uint64_t v34 = logInstanceID;
              }
              else {
                uint64_t v34 = prevLogInstanceID;
              }
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v36 = WORD1(v34);
                _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"isTonemappingEnabled(msrHC)\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 3620\n", buf, 0xCu);
              }
              prevLogInstanceID = v34;
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"isTonemappingEnabled(msrHC)\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 3620\n", buf, 2u);
            }
LABEL_26:
            if (v13)
            {
              fprintf(v13, "%s--- B02 Frame %d ---\n", a5, self->super._frameNumber);
              fprintf(v13, "%scontrolpath[%d].ToneMapEnable = %d\n", a5, self->super._frameNumber, 1);
              fprintf(v13, "%scontrolpath[%d].toneMapLutPrecision = %d\n", a5, self->super._frameNumber, 24);
              fprintf(v13, "%scontrolpath[%d].tmLutI = {\n", a5, self->super._frameNumber);
              [(ProcessingEngine *)self printArray:v13 Prefix:a5 Array:&self->_tonemapLUT Size:self->_tonemappingTableSize NumberPerLine:8 Format:3];
              fprintf(v13, "%scontrolpath[%d].tmLutS = {\n", a5, self->super._frameNumber);
              [(ProcessingEngine *)self printArray:v13 Prefix:a5 Array:self->_tonemapLUT.cmodel.tmLutS Size:self->_tonemappingTableSize NumberPerLine:8 Format:3];
              fprintf(v13, "%scontrolpath[%d].smLutI = {\n", a5, self->super._frameNumber);
              [(ProcessingEngine *)self printArray:v13 Prefix:a5 Array:self->_tonemapLUT.cmodel.smLutI Size:self->_tonemappingTableSize NumberPerLine:8 Format:3];
              fprintf(v13, "%scontrolpath[%d].smLutS = {\n", a5, self->super._frameNumber);
              [(ProcessingEngine *)self printArray:v13 Prefix:a5 Array:self->_tonemapLUT.cmodel.smLutS Size:self->_tonemappingTableSize NumberPerLine:8 Format:3];
              fprintf(v13, "%s\n", a5);
            }
            int processingType = a10->processingType;
            if (processingType != 5 && processingType != 2)
            {
              if (processingType == 1)
              {
                strcpy((char *)&info, "RGB Tonemapping");
                -[MSRHDRProcessing populateMSRColorConfigStageB02HDR10:DMConfig:](self, "populateMSRColorConfigStageB02HDR10:DMConfig:", a3, a6, a5, a6, a7, a8);
                goto LABEL_59;
              }
              if ((*(_WORD *)&a6[1].var50 & 0x80) == 0 || (debugDM4DisableConf & 0x80) != 0)
              {
                if ((processingType | 4) != 4)
                {
                  if (enableLogInstance)
                  {
                    if (logInstanceID) {
                      uint64_t v27 = logInstanceID;
                    }
                    else {
                      uint64_t v27 = prevLogInstanceID;
                    }
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 134217984;
                      uint64_t v36 = WORD1(v27);
                      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"msrHC->processingType == kHDRProcessingTypeDoVi || msrHC->processingType == kHDRProcessingTypeDoVi84\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 3652\n", buf, 0xCu);
                    }
                    prevLogInstanceID = v27;
                  }
                  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"msrHC->processingType == kHDRProcessingTypeDoVi || msrHC->processingType == kHDRProcessingTypeDoVi84\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 3652\n", buf, 2u);
                  }
                }
                strcpy((char *)&info, "IPT Tonemapping");
                *(void *)&a3->var2.var0.var1.chromaticAdaption.toneMapMode_Enable = 0x1800000001;
                memcpy(a3->var2.var0.var1.chromaticAdaption.toneMapLUT, &self->_tonemapLUT, sizeof(a3->var2.var0.var1.chromaticAdaption.toneMapLUT));
                goto LABEL_59;
              }
            }
            strcpy((char *)&info, "HLG OOTF");
            -[MSRHDRProcessing populateMSRColorConfigStageB02HLG:hdrControl:](self, "populateMSRColorConfigStageB02HLG:hdrControl:", a3, a9, a5, a6, a7, a8);
LABEL_59:
            [(MSRHDRProcessing *)self writeMSRColorConfigFileStageB02Enabled:&a3->var2 Prefix:a5 Info:&info];
            return;
          }
        }
        else if (inputFormat != 1378955371)
        {
          int v30 = 1380411457;
          goto LABEL_80;
        }
      }
LABEL_81:
      unsigned int v33 = a10->displayType;
      if (v33 <= 7 && v33 != 5) {
        goto LABEL_26;
      }
      goto LABEL_83;
    }
    unsigned int v23 = a10->displayType;
    if (v23 <= 7 && ((1 << v23) & 0xB8) != 0) {
      goto LABEL_26;
    }
    if (inputFormat > 1647534391)
    {
      if (inputFormat == 1815162994) {
        goto LABEL_52;
      }
      int v28 = 1647534392;
    }
    else
    {
      if (inputFormat == 1378955371) {
        goto LABEL_52;
      }
      int v28 = 1380411457;
    }
    if (inputFormat != v28) {
      goto LABEL_64;
    }
LABEL_52:
    if (v23 == 6) {
      goto LABEL_26;
    }
    if (inputFormat > 1647534391)
    {
      if (inputFormat != 1815162994)
      {
        int v29 = 1647534392;
LABEL_62:
        if (inputFormat != v29) {
          goto LABEL_64;
        }
      }
    }
    else if (inputFormat != 1378955371)
    {
      int v29 = 1380411457;
      goto LABEL_62;
    }
    if (v23 == 2) {
      goto LABEL_26;
    }
    goto LABEL_64;
  }
  if (qword_26ABE76A0)
  {
    fprintf((FILE *)qword_26ABE76A0, "%s--- B02 Frame %d ---\n", a5, self->super._frameNumber);
    fprintf(v13, "%scontrolpath[%d].ToneMapEnable = %d\n", a5, self->super._frameNumber, 0);
    fprintf(v13, "%s\n", a5);
  }
  a3->var2.var0.var0[3946] = 0;
}

- (void)populateMSRColorConfigStageB03:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10
{
  a3->var2.var0.var0[6016] = a4;
}

- (void)populateMSRColorConfigStageB04_01:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10
{
  BOOL v12 = (FILE *)qword_26ABE76A0;
  int v13 = &a3->var2.var0.var0[6056];
  if (a4)
  {
    if (!a10->enableToneMapping || !a10->enableReshaping)
    {
      int v17 = 0;
      unsigned int v18 = 12;
      float v19 = &m33Ipt2LmsFlt;
      snprintf((char *)&info, 0x3FFuLL, "ipt2lms");
LABEL_16:
      if (v12)
      {
        fprintf(v12, "%s--- B04-01 Frame %d ---\n", a5, self->super._frameNumber);
        fprintf(v12, "%s--- %s ---\n", a5, (const char *)&info);
        fprintf(v12, "%scontrolpath[%d].PostCLUT3x3Enable = %d\n", a5, self->super._frameNumber, 1);
        float v21 = *(float *)v19;
        if (*(float *)v19 < 0.0) {
          float v21 = -*(float *)v19;
        }
        float v22 = (float)(1 << v18);
        int v23 = ((float)(v21 * v22) + 0.5);
        if (*(float *)v19 < 0.0) {
          int v23 = -v23;
        }
        float v24 = 0.097569;
        if (v17) {
          float v24 = 0.017218;
        }
        unsigned int v25 = ((float)(v24 * v22) + 0.5);
        float v26 = 0.20523;
        if (v17) {
          float v26 = 0.11103;
        }
        unsigned int v27 = ((float)(v26 * v22) + 0.5);
        float v28 = -0.11388;
        if (v17) {
          float v28 = -0.017218;
        }
        unsigned int v29 = (0.5 - (float)(v28 * v22));
        float v30 = 0.13322;
        float v31 = -0.11103;
        if (!v17) {
          float v31 = 0.13322;
        }
        float v32 = -v31;
        if (v17) {
          float v30 = v32;
        }
        int v33 = ((float)(v30 * v22) + 0.5);
        if (v17) {
          int v33 = -v33;
        }
        float v34 = 0.032615;
        if (v17) {
          float v34 = 1.1201;
        }
        unsigned int v35 = ((float)(v34 * v22) + 0.5);
        float v36 = -0.67689;
        if (v17) {
          float v36 = -0.32063;
        }
        fprintf(v12, "%scontrolpath[%d].m33Ipt2Lms = { {%d, %d, %d}, {%d, %d, %d}, {%d, %d, %d} }\n", a5, self->super._frameNumber, v23, v25, v27, (v22 + 0.5), -v29, v33, (v22 + 0.5), v35, -(0.5 - (float)(v36 * v22)));
        fprintf(v12, "%scontrolpath[%d].m33Ipt2LmsScale2P = %d\n", a5, self->super._frameNumber, v18);
        fprintf(v12, "%scontrolpath[%d].Ipt2LmsOutMin = %d\n", a5, self->super._frameNumber, 0);
        fprintf(v12, "%s\n", a5);
      }
      else
      {
        float v22 = (float)(1 << v18);
      }
      uint64_t v37 = 0;
      *int v13 = 1;
      v13[1] = v18;
      coeff = a3->var2.var0.var1.chromaticAdaption.cacsc2.coeff;
      do
      {
        uint64_t v39 = 0;
        if (v37) {
          float v40 = -1.0;
        }
        else {
          float v40 = 0.0;
        }
        a3->var2.var0.var1.chromaticAdaption.cacsc2.inputMinClip[v37] = v40;
        a3->var2.var0.var0[v37 + 6061] = 1065353216;
        a3->var2.var0.var0[v37 + 6064] = 0;
        do
        {
          float v41 = *(float *)&v19[v39];
          BOOL v42 = v41 < 0.0;
          if (v41 < 0.0) {
            float v41 = -v41;
          }
          int v43 = ((float)(v22 * v41) + 0.5);
          if (v42) {
            int v43 = -v43;
          }
          (*coeff)[v39++] = v43;
        }
        while (v39 != 3);
        a3->var2.var0.var0[v37 + 6076] = 0;
        a3->var2.var0.var0[v37 + 6079] = 0;
        a3->var2.var0.var0[v37++ + 6082] = 1065353216;
        ++coeff;
        v19 += 3;
      }
      while (v37 != 3);
      return;
    }
    __int16 v15 = *(_WORD *)&a6[1].var50;
    if (a8->tmData.doviTmMode == 4)
    {
      char v16 = debugDM4DisableConf;
    }
    else
    {
      int v17 = 0;
      BOOL v20 = "ipt2lms";
      unsigned int v18 = 12;
      float v19 = &m33Ipt2LmsFlt;
      if ((v15 & 8) == 0 || (char v16 = debugDM4DisableConf, (debugDM4DisableConf & 8) != 0))
      {
LABEL_15:
        snprintf((char *)&info, 0x3FFuLL, v20);
        goto LABEL_16;
      }
    }
    BOOL v20 = "ictcp2lms";
    int v17 = 1;
    unsigned int v18 = 12;
    float v19 = &m33Itp2LmsFlt;
    if ((v15 & 0x40) != 0 && (v16 & 0x40) == 0)
    {
      unsigned int v18 = [(MSRHDRProcessing *)self getMatrixScale2P:&m33Itp2LmsFlt];
      BOOL v20 = "ictcp2lms";
    }
    goto LABEL_15;
  }
  if (qword_26ABE76A0)
  {
    fprintf((FILE *)qword_26ABE76A0, "%s--- B04-01 Frame %d ---\n", a5, self->super._frameNumber);
    fprintf(v12, "%scontrolpath[%d].PostCLUT3x3Enable = %d\n", a5, self->super._frameNumber, 0);
    fprintf(v12, "%s\n", a5);
  }
  *int v13 = 0;
}

- (void)populateMSRColorConfigStageB04_02:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10
{
  BOOL v10 = a4;
  BOOL v12 = (FILE *)qword_26ABE76A0;
  if (qword_26ABE76A0)
  {
    fprintf((FILE *)qword_26ABE76A0, "%s--- B04-02 Frame %d ---\n", a5, self->super._frameNumber);
    fprintf(v12, "%scontrolpath[%d].FixedPQDeGammaEnable = %d\n", a5, self->super._frameNumber, v10);
    fprintf(v12, "%s\n", a5);
  }
  a3->var2.var0.var1.chromaticAdaption.fixedPQDegamma_Enable = v10;
}

- (void)populateMSRColorConfigStageB04_03:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  p_commonSpaceToColorB = &a3->var2.var0.var1.commonSpaceToColorB;
  int v13 = (FILE *)qword_26ABE76A0;
  if (a4)
  {
    char v16 = a3;
    long long v103 = 0x3F800000uLL;
    *(void *)&v104[4] = 0;
    *(void *)&v104[12] = 0x3F80000000000000;
    *(_DWORD *)int v104 = 1065353216;
    float var13 = 1.0;
    if (a8->atmEnable && (double targetMaxLinear = a8->targetMaxLinearOutput, targetMaxLinear > a8->diffuseInNits))
    {
      if (a10->processingType == 2) {
        float var13 = a8->targetMaxLinear / targetMaxLinear;
      }
    }
    else
    {
      double targetMaxLinear = a8->targetMaxLinear;
    }
    float v19 = (__CFString **)MEMORY[0x263F03F20];
    BOOL v20 = (__CFString **)MEMORY[0x263F03F00];
    int v99 = a8;
    switch(a10->processingType)
    {
      case 0:
      case 4:
        goto LABEL_28;
      case 1:
      case 5:
        if (a10->outputTransferFunction != 16) {
          float var13 = 10000.0 / targetMaxLinear;
        }
        snprintf((char *)&info, 0x3FFuLL, "postRGB2RGB: from DM config, scaler=%f", var13);
        long long v21 = *(_OWORD *)&a6[1].var32;
        HIDWORD(v21) = *(_OWORD *)&a6[1].var36;
        int8x16_t v22 = *(int8x16_t *)&a6[1].var40;
        int8x16_t v23 = vextq_s8(vextq_s8(*(int8x16_t *)&a6[1].var36, *(int8x16_t *)&a6[1].var36, 0xCuLL), v22, 8uLL);
        long long v103 = v21;
        *(int8x16_t *)int v104 = v23;
        *(_DWORD *)&v104[16] = v22.i32[2];
        float v107 = *(float *)&v22.i32[2];
        *(_OWORD *)buf = v21;
        int8x16_t v106 = v23;
        goto LABEL_56;
      case 2:
        unsigned int var15 = a9->var15;
        if (var15 != 9)
        {
          if (var15 == 12)
          {
            targetColorPrimaries = a8->targetColorPrimaries;
            if (targetColorPrimaries != (__CFString *)*MEMORY[0x263F03F00])
            {
              if (targetColorPrimaries == (__CFString *)*MEMORY[0x263F03F08])
              {
                strcpy((char *)&info, "postRGB2RGB: P3 -> 709");
                float v26 = &RGBP3toRGB709_coeff;
                goto LABEL_150;
              }
              goto LABEL_149;
            }
            strcpy((char *)&info, "postRGB2RGB: P3 -> 2020");
            float v26 = &RGBP3toRGB2020_coeff;
            goto LABEL_150;
          }
LABEL_149:
          strcpy((char *)&info, "postRGB2RGB: No conversion");
          float v26 = &v103;
          goto LABEL_150;
        }
        long long v91 = a8->targetColorPrimaries;
        if (v91 == (__CFString *)*MEMORY[0x263F03F20])
        {
          strcpy((char *)&info, "postRGB2RGB: 2020 -> P3");
          float v26 = &RGB2020toRGBP3_coeff;
        }
        else
        {
          if (v91 != (__CFString *)*MEMORY[0x263F03F08]) {
            goto LABEL_149;
          }
          strcpy((char *)&info, "postRGB2RGB: 2020 -> 709");
          float v26 = &RGB2020toRGB709_coeff;
        }
LABEL_150:
        long long v92 = v26[1];
        *(_OWORD *)buf = *v26;
        int8x16_t v106 = (int8x16_t)v92;
        float v107 = *((float *)v26 + 8);
        if (a10->outputTransferFunction != 16)
        {
          if (BYTE1(a6[1].var52)) {
            goto LABEL_56;
          }
          double v93 = *(float *)&a6[1].var2 / targetMaxLinear;
          goto LABEL_155;
        }
        if (BYTE1(a6[1].var52))
        {
          double v93 = targetMaxLinear / 10000.0;
LABEL_155:
          float var13 = v93;
          goto LABEL_56;
        }
        float var13 = *(float *)&a6[1].var2 / 10000.0;
LABEL_56:
        uint64_t v39 = 0;
        double v40 = 0.0;
        do
        {
          float v41 = fabsf(*(float *)&buf[v39]);
          if (*(float *)&v40 < v41) {
            *(float *)&double v40 = v41;
          }
          v39 += 4;
        }
        while (v39 != 36);
        float v42 = 32767.0 / *(float *)&v40;
        if (var13 > v42) {
          float var13 = v42;
        }
        if ((*(_WORD *)&a6[1].var50 & 0x40) == 0 || (debugDM4DisableConf & 0x40) != 0)
        {
          *(float *)&double v40 = var13;
          uint64_t Config = [(MSRHDRProcessing *)self setLms2RgbScale2P:buf OutputScale:v40];
        }
        else
        {
          *(float *)&double v40 = var13;
          uint64_t Config = [(MSRHDRProcessing *)self getMatrixScale2P:buf OutputScale:v40];
        }
        unsigned int v44 = Config;
        if (v13)
        {
          fprintf(v13, "%s--- B04-03 Frame %d ---\n", a5, self->super._frameNumber);
          fprintf(v13, "%s--- %s ---\n", a5, (const char *)&info);
          fprintf(v13, "%scontrolpath[%d].PreReGamma3x3Enable = %d\n", a5, self->super._frameNumber, 1);
          float v45 = -(float)(var13 * *(float *)buf);
          if ((float)(var13 * *(float *)buf) >= 0.0) {
            float v45 = var13 * *(float *)buf;
          }
          float v46 = (float)(1 << v44);
          int v47 = ((float)(v45 * v46) + 0.5);
          if ((float)(var13 * *(float *)buf) < 0.0) {
            int v47 = -v47;
          }
          float v48 = -(float)(var13 * *(float *)&buf[4]);
          if ((float)(var13 * *(float *)&buf[4]) >= 0.0) {
            float v48 = var13 * *(float *)&buf[4];
          }
          int v49 = ((float)(v48 * v46) + 0.5);
          if ((float)(var13 * *(float *)&buf[4]) < 0.0) {
            int v49 = -v49;
          }
          float v50 = -(float)(var13 * *(float *)&buf[8]);
          if ((float)(var13 * *(float *)&buf[8]) >= 0.0) {
            float v50 = var13 * *(float *)&buf[8];
          }
          int v51 = ((float)(v50 * v46) + 0.5);
          if ((float)(var13 * *(float *)&buf[8]) < 0.0) {
            int v51 = -v51;
          }
          float v52 = var13 * *(float *)&buf[12];
          if ((float)(var13 * *(float *)&buf[12]) < 0.0) {
            float v52 = -(float)(var13 * *(float *)&buf[12]);
          }
          int v53 = ((float)(v52 * v46) + 0.5);
          if ((float)(var13 * *(float *)&buf[12]) < 0.0) {
            int v53 = -v53;
          }
          float v54 = -(float)(var13 * *(float *)v106.i32);
          if ((float)(var13 * *(float *)v106.i32) >= 0.0) {
            float v54 = var13 * *(float *)v106.i32;
          }
          int v55 = ((float)(v54 * v46) + 0.5);
          if ((float)(var13 * *(float *)v106.i32) < 0.0) {
            int v55 = -v55;
          }
          float v56 = var13 * *(float *)&v106.i32[1];
          if ((float)(var13 * *(float *)&v106.i32[1]) < 0.0) {
            float v56 = -(float)(var13 * *(float *)&v106.i32[1]);
          }
          int v57 = ((float)(v56 * v46) + 0.5);
          if ((float)(var13 * *(float *)&v106.i32[1]) < 0.0) {
            int v57 = -v57;
          }
          float v58 = -(float)(var13 * *(float *)&v106.i32[2]);
          if ((float)(var13 * *(float *)&v106.i32[2]) >= 0.0) {
            float v58 = var13 * *(float *)&v106.i32[2];
          }
          int v59 = ((float)(v58 * v46) + 0.5);
          if ((float)(var13 * *(float *)&v106.i32[2]) < 0.0) {
            int v59 = -v59;
          }
          float v60 = var13 * *(float *)&v106.i32[3];
          if ((float)(var13 * *(float *)&v106.i32[3]) < 0.0) {
            float v60 = -(float)(var13 * *(float *)&v106.i32[3]);
          }
          int v61 = ((float)(v60 * v46) + 0.5);
          if ((float)(var13 * *(float *)&v106.i32[3]) < 0.0) {
            int v61 = -v61;
          }
          float v62 = -(float)(var13 * v107);
          if ((float)(var13 * v107) >= 0.0) {
            float v62 = var13 * v107;
          }
          int v63 = ((float)(v62 * v46) + 0.5);
          if ((float)(var13 * v107) < 0.0) {
            int v63 = -v63;
          }
          fprintf(v13, "%scontrolpath[%d].m33Lms2Rgb = { {%d, %d, %d}, {%d, %d, %d}, {%d, %d, %d} }\n", a5, self->super._frameNumber, v47, v49, v51, v53, v55, v57, v59, v61, v63);
          fprintf(v13, "%scontrolpath[%d].m33Lms2RgbScale2P = %d\n", a5, self->super._frameNumber, v44);
          fprintf(v13, "%scontrolpath[%d].Lms2RgbInMax = %llu\n", a5, self->super._frameNumber, 0x1387FFE00);
          fprintf(v13, "%scontrolpath[%d].Lms2RgbOutMin = %llu\n", a5, self->super._frameNumber, 0);
          fprintf(v13, "%scontrolpath[%d].Lms2RgbOutMax = %llu\n", a5, self->super._frameNumber, 1048576000);
          uint64_t Config = fprintf(v13, "%s\n", a5);
        }
        else
        {
          float v46 = (float)(1 << Config);
        }
        uint64_t v64 = 0;
        p_commonSpaceToColorB->mode = 1;
        p_commonSpaceToColorB->c2b.precision = v44;
        inputMinClip = v16->var2.var0.var1.commonSpaceToColorB.c2b.inputMinClip;
        inputMaxClip = v16->var2.var0.var1.commonSpaceToColorB.c2b.inputMaxClip;
        offsetIn = v16->var2.var0.var1.commonSpaceToColorB.c2b.offsetIn;
        coeff = v16->var2.var0.var1.commonSpaceToColorB.c2b.coeff;
        offsetOut = v16->var2.var0.var1.commonSpaceToColorB.c2b.offsetOut;
        v98 = *v19;
        uint64_t v97 = (__CFString *)*MEMORY[0x263F03F00];
        outputMinClip = v16->var2.var0.var1.commonSpaceToColorB.c2b.outputMinClip;
        outputMaxClip = v16->var2.var0.var1.commonSpaceToColorB.c2b.outputMaxClip;
        float v72 = buf;
        do
        {
          uint64_t v73 = 0;
          inputMinClip[v64] = -2.0;
          inputMaxClip[v64] = 2.0;
          offsetIn[v64] = 0.0;
          do
          {
            float v74 = var13 * *(float *)&v72[v73 * 4];
            float v75 = -v74;
            if (v74 >= 0.0) {
              float v75 = var13 * *(float *)&v72[v73 * 4];
            }
            int v76 = ((float)(v46 * v75) + 0.5);
            if (v74 < 0.0) {
              int v76 = -v76;
            }
            (*coeff)[v73++] = v76;
          }
          while (v73 != 3);
          BOOL v77 = 0;
          offsetOut[v64] = 0.0;
          if (v99->targetTransferFunction == 16)
          {
            float v78 = v99->targetColorPrimaries;
            BOOL v77 = v78 == v98 || v78 == v97;
          }
          uint64_t Config = (uint64_t)GetConfig((HDRConfig *)Config);
          if (Config
            && ((int v80 = GetConfig((HDRConfig *)Config),
                 uint64_t Config = HDRConfig::GetConfigEntryValue((uint64_t)v80, 0x50u, 0),
                 *(unsigned char *)Config)
              ? (BOOL v81 = v77)
              : (BOOL v81 = 0),
                v81))
          {
            float v82 = 1.0;
            int v83 = 0;
          }
          else
          {
            float v82 = 2.0;
            int v83 = -1073741825;
          }
          LODWORD(outputMinClip[v64]) = v83;
          outputMaxClip[v64++] = v82;
          ++coeff;
          v72 += 12;
        }
        while (v64 != 3);
        return;
      default:
        if (enableLogInstance)
        {
          if (logInstanceID) {
            uint64_t v27 = logInstanceID;
          }
          else {
            uint64_t v27 = prevLogInstanceID;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = WORD1(v27);
            _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"msrHC->processingType == kHDRProcessingTypeDoVi || msrHC->processingType == kHDRProcessingTypeDoVi84\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 4049\n", buf, 0xCu);
          }
          prevLogInstanceID = v27;
          a8 = v99;
          float v19 = (__CFString **)MEMORY[0x263F03F20];
          BOOL v20 = (__CFString **)MEMORY[0x263F03F00];
        }
        else
        {
          BOOL v28 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
          a8 = v99;
          BOOL v20 = (__CFString **)MEMORY[0x263F03F00];
          if (v28)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"msrHC->processingType == kHDRProcessingTypeDoVi || msrHC->processingType == kHDRProcessingTypeDoVi84\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 4049\n", buf, 2u);
            BOOL v20 = (__CFString **)MEMORY[0x263F03F00];
            a8 = v99;
          }
        }
LABEL_28:
        unsigned int v29 = a8->targetColorPrimaries;
        if (v29 == (__CFString *)*MEMORY[0x263F03F08])
        {
          float v30 = "709";
        }
        else if (v29 == *v19)
        {
          float v30 = "P3";
        }
        else if (v29 == *v20)
        {
          float v30 = "2020";
        }
        else
        {
          float v30 = "P3 (by default)";
        }
        float var13 = a6[1].var13;
        if (a10->outputTransferFunction != 16) {
          float var13 = (float)(var13 * 10000.0) / targetMaxLinear;
        }
        if (v29 == (__CFString *)*MEMORY[0x263F03F08])
        {
          float v32 = v16;
          float v31 = &LMStoRGB_coeff_709;
        }
        else
        {
          float v31 = &LMStoRGB_coeff_P3;
          float v32 = v16;
          if (v29 != *v19 && v29 == *v20) {
            float v31 = (long long *)&LMStoRGB_coeff_2020;
          }
        }
        __int16 v33 = *(_WORD *)&a6[1].var50;
        float v34 = (long long *)&LMStoRGB_coeff_2020_DM4;
        if ((debugDM4DisableConf & 0x10) != 0) {
          float v34 = v31;
        }
        if ((v33 & 0x10) != 0) {
          unsigned int v35 = v34;
        }
        else {
          unsigned int v35 = v31;
        }
        if ((v33 & 2) != 0 && (debugDM4DisableConf & 2) == 0)
        {
          long long v36 = v35[1];
          long long v100 = *v35;
          int8x16_t v101 = (int8x16_t)v36;
          float v102 = *((float *)v35 + 8);
          snprintf((char *)&info, 0x3FFuLL, "lms2rgb: %s, with 4%% inverse crosstalk", v30);
          uint64_t v37 = &m33InverseCrossTalkFourPercentFlt;
LABEL_54:
          Matrix3x3_multmatrix((uint64_t)&v100, (uint64_t)v37);
          char v16 = v32;
LABEL_55:
          *(_OWORD *)buf = v100;
          int8x16_t v106 = v101;
          float v107 = v102;
          goto LABEL_56;
        }
        if ((*(_WORD *)&a6[1].var50 & 0x100) != 0 && (debugDM4DisableConf & 0x100) == 0)
        {
          long long v38 = v35[1];
          long long v100 = *v35;
          int8x16_t v101 = (int8x16_t)v38;
          float v102 = *((float *)v35 + 8);
          snprintf((char *)&info, 0x3FFuLL, "lms2rgb: %s, with 2%% inverse crosstalk", v30);
          uint64_t v37 = &m33InverseCrossTalkTwoPercentFlt;
          goto LABEL_54;
        }
        if ((v33 & 4) != 0 && (debugDM4DisableConf & 4) == 0)
        {
          long long v84 = v35[1];
          long long v100 = *v35;
          int8x16_t v101 = (int8x16_t)v84;
          float v102 = *((float *)v35 + 8);
          if ((v33 & 4) != 0)
          {
            char v16 = v32;
            if ((v33 & 0x80) == 0 || (debugDM4DisableConf & 0x80) != 0)
            {
              snprintf((char *)&info, 0x3FFuLL, "lms2rgb: %s, with 4%%-to-2%% inverse crosstalk", v30);
              Matrix3x3_multmatrix((uint64_t)&v100, (uint64_t)&m33CrossTalkFour2TwoPercentFlt);
            }
            else
            {
              snprintf((char *)&info, 0x3FFuLL, "rgb2rgb: RGBtoLMS from DM metadata, 2%% crosstalk, and LMStoRGB");
              for (uint64_t i = 0; i != 9; ++i)
                *(float *)&buf[i * 4] = (float)a7->var6[i] * 0.000061035;
              Matrix3x3_multmatrix((uint64_t)&v100, (uint64_t)&m33CrossTalkTwoPercentFlt);
              Matrix3x3_multmatrix((uint64_t)&v100, (uint64_t)buf);
              float var13 = 0.1;
            }
          }
          else
          {
            char v16 = v32;
            if (enableLogInstance)
            {
              unsigned int v85 = v19;
              if (logInstanceID) {
                uint64_t v86 = logInstanceID;
              }
              else {
                uint64_t v86 = prevLogInstanceID;
              }
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                *(void *)&uint8_t buf[4] = WORD1(v86);
                _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 4101\n", buf, 0xCu);
              }
              prevLogInstanceID = v86;
              float v19 = v85;
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 4101\n", buf, 2u);
            }
          }
          goto LABEL_55;
        }
        if (a10->contentType != 1) {
          goto LABEL_171;
        }
        if (a10->inputColorSpace != 2) {
          goto LABEL_171;
        }
        if (LODWORD(a6[1].var49) != 4) {
          goto LABEL_171;
        }
        unsigned int displayType = a10->displayType;
        if (displayType > 7 || displayType == 5) {
          goto LABEL_171;
        }
        if (a10->enableToneMapping && a10->enableReshaping)
        {
          snprintf((char *)&info, 0x3FFuLL, "lms2rgb: %s, with 4%% inverse crosstalk", v30);
          long long v88 = v35[1];
          long long v100 = *v35;
          int8x16_t v101 = (int8x16_t)v88;
          float v102 = *((float *)v35 + 8);
          long long v89 = &m33InverseCrossTalkFourPercentFlt;
        }
        else
        {
          if (displayType != 7 || !a10->enableReshaping || a10->enableToneMapping)
          {
LABEL_171:
            snprintf((char *)&info, 0x3FFuLL, "lms2rgb: %s", v30);
            int8x16_t v95 = (int8x16_t)v35[1];
            *(_OWORD *)buf = *v35;
            int8x16_t v106 = v95;
            float v90 = *((float *)v35 + 8);
            goto LABEL_172;
          }
          snprintf((char *)&info, 0x3FFuLL, "lms2rgb: %s, with 2%% inverse crosstalk", v30);
          long long v96 = v35[1];
          long long v100 = *v35;
          int8x16_t v101 = (int8x16_t)v96;
          float v102 = *((float *)v35 + 8);
          long long v89 = &m33InverseCrossTalkTwoPercentFlt;
        }
        Matrix3x3_multmatrix((uint64_t)&v100, (uint64_t)v89);
        *(_OWORD *)buf = v100;
        int8x16_t v106 = v101;
        float v90 = v102;
LABEL_172:
        float v107 = v90;
        char v16 = v32;
        goto LABEL_56;
    }
  }
  if (qword_26ABE76A0)
  {
    fprintf((FILE *)qword_26ABE76A0, "%s--- B04-03 Frame %d ---\n", a5, self->super._frameNumber);
    fprintf(v13, "%scontrolpath[%d].PreReGamma3x3Enable = %d\n", a5, self->super._frameNumber, 0);
    fprintf(v13, "%s\n", a5);
  }
  p_commonSpaceToColorB->mode = 0;
}

- (void)populateMSRColorConfigStageB04_04:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10
{
  p_gammaEncoding = &a3->var2.var0.var1.gammaEncoding;
  int v13 = (FILE *)qword_26ABE76A0;
  if (a4)
  {
    -[MSRHDRProcessing updateRegammaLUT:](self, "updateRegammaLUT:", a10, a4, a5, a6, a7, a8);
    int type = self->_regamma.type;
    __int16 v15 = "L2PQ";
    char v16 = "Unknown";
    if (type == 3) {
      char v16 = "LINEAR DPC";
    }
    if (type != 2) {
      __int16 v15 = v16;
    }
    if (type == 1) {
      int v17 = "SRGB Regamma";
    }
    else {
      int v17 = v15;
    }
    snprintf((char *)&info, 0x3FFuLL, "%s", v17);
    if (v13)
    {
      fprintf(v13, "%s--- B04-04 Frame %d ---\n", a5, self->super._frameNumber);
      fprintf(v13, "%s--- %s ---\n", a5, (const char *)&info);
      fprintf(v13, "%scontrolpath[%d].ReGammaEnable = %d\n", a5, self->super._frameNumber, 1);
      fprintf(v13, "%scontrolpath[%d].custom_regamma_LUT = {\n", a5, self->super._frameNumber);
      [(ProcessingEngine *)self printArray:v13 Prefix:a5 Array:self->_regamma.lutForCModel Size:706 NumberPerLine:8 Format:0];
      fprintf(v13, "%s\n", a5);
      fprintf(v13, "%s\n", a5);
    }
    p_gammaEncoding->mode = 2;
    unsigned int v18 = p_gammaEncoding->gamma_LUT[0];
    float v19 = (HDRConfig *)memcpy(v18, self->_regamma.lut, 0x2118uLL);
    uint64_t Config = GetConfig(v19);
    if (Config)
    {
      long long v21 = GetConfig((HDRConfig *)Config);
      uint64_t ConfigEntryValue = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v21, 0x3Cu, 0);
      if ((*(_DWORD *)ConfigEntryValue - 1) <= 1)
      {
        signed int outputFormat = a10->outputFormat;
        if (outputFormat > 1953903151)
        {
          if (outputFormat != 1953903152 && outputFormat != 1953903668 && outputFormat != 1953903154) {
            return;
          }
        }
        else
        {
          unsigned int v24 = outputFormat - 1886680624;
          if (v24 > 4 || ((1 << v24) & 0x15) == 0) {
            return;
          }
        }
        if (a10->outputTransferFunction == 16)
        {
          unsigned int v25 = GetConfig(ConfigEntryValue);
          float v26 = 0.0;
          if (v25)
          {
            uint64_t v27 = GetConfig((HDRConfig *)v25);
            BOOL v28 = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v27, 0x3Cu, 0);
            if (*(_DWORD *)v28 == 2)
            {
              uint64_t v39 = (HDRConfig *)GetConfig(v28);
              float v40 = 0.0;
              float v41 = 0.0;
              if (v39)
              {
                float v42 = GetConfig(v39);
                uint64_t v39 = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v42, 0x74u, 0);
                float v41 = (float)*(unsigned int *)v39;
              }
              int v43 = (HDRConfig *)GetConfig(v39);
              if (v43)
              {
                unsigned int v44 = GetConfig(v43);
                int v43 = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v44, 0x75u, 0);
                float v40 = (float)*(unsigned int *)v43;
              }
              float v45 = v41 / 4095.0;
              float v46 = v40 / 4095.0;
              int v47 = GetConfig(v43);
              if (v47)
              {
                float v48 = GetConfig((HDRConfig *)v47);
                float v49 = (float)*(unsigned int *)HDRConfig::GetConfigEntryValue((uint64_t)v48, 0x76u, 0);
              }
              else
              {
                float v49 = 0.0;
              }
              float v50 = (float)(v49 / 4095.0) + -0.5;
              float v26 = (float)((float)((float)(v46 + -0.5) * 2.0e-17) + (float)((float)(v45 + -0.0625) * 1.1687))
                  + (float)(v50 * 1.6848);
              float v29 = (float)((float)((float)(v46 + -0.5) * -0.18802) + (float)((float)(v45 + -0.0625) * 1.1687))
                  + (float)(v50 * -0.65282);
              float v30 = (float)((float)((float)(v46 + -0.5) * 2.1496) + (float)((float)(v45 + -0.0625) * 1.1687))
                  + (float)(v50 * 9.0e-17);
            }
            else
            {
              float v29 = 0.0;
              float v30 = 0.0;
              if (*(_DWORD *)v28 == 1)
              {
                float v31 = (HDRConfig *)GetConfig(v28);
                float v32 = 0.0;
                if (v31)
                {
                  __int16 v33 = GetConfig(v31);
                  float v31 = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v33, 0x74u, 0);
                  float v26 = (float)*(unsigned int *)v31;
                }
                float v34 = (HDRConfig *)GetConfig(v31);
                if (v34)
                {
                  unsigned int v35 = GetConfig(v34);
                  float v34 = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v35, 0x75u, 0);
                  float v32 = (float)*(unsigned int *)v34;
                }
                long long v36 = GetConfig(v34);
                if (v36)
                {
                  uint64_t v37 = GetConfig((HDRConfig *)v36);
                  float v38 = (float)*(unsigned int *)HDRConfig::GetConfigEntryValue((uint64_t)v37, 0x76u, 0);
                }
                else
                {
                  float v38 = 0.0;
                }
                float v26 = v26 / 4095.0;
                float v29 = v32 / 4095.0;
                float v30 = v38 / 4095.0;
              }
            }
          }
          else
          {
            float v29 = 0.0;
            float v30 = 0.0;
          }
          uint64_t v51 = 706;
          do
          {
            float *v18 = v26;
            v18[706] = v29;
            v18[1412] = v30;
            ++v18;
            --v51;
          }
          while (v51);
        }
      }
    }
  }
  else
  {
    if (qword_26ABE76A0)
    {
      fprintf((FILE *)qword_26ABE76A0, "%s--- B04-04 Frame %d ---\n", a5, self->super._frameNumber);
      fprintf(v13, "%scontrolpath[%d].ReGammaEnable = %d\n", a5, self->super._frameNumber, 0);
      fprintf(v13, "%s\n", a5);
    }
    p_gammaEncoding->mode = 0;
  }
}

- (void)populateMSRColorConfigStageB04_05:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  p_rgb2ycc = &a3->var2.var0.var1.rgb2ycc;
  int v13 = (FILE *)qword_26ABE76A0;
  if (!a4)
  {
    if (qword_26ABE76A0)
    {
      fprintf((FILE *)qword_26ABE76A0, "%s--- B04-05 Frame %d ---\n", a5, self->super._frameNumber);
      fprintf(v13, "%scontrolpath[%d].PostCm3x3Enable = %d\n", a5, self->super._frameNumber, 0);
      fprintf(v13, "%s\n", a5);
    }
    p_rgb2ycc->mode = 0;
    return;
  }
  memset((char *)v70 + 4, 0, 32);
  LODWORD(v70[0]) = 1065353216;
  if (a10->processingType == 5 && isSupportedMSRColorConversion(a10->inputFormat, a10->outputFormat))
  {
    unsigned int outputColorSpace = a10->outputColorSpace;
    if (outputColorSpace)
    {
      if (outputColorSpace == 2)
      {
        *(void *)&info = 0x74706932736D6CLL;
        RGBtoYUVMatrixForUITargetColorPrimary = &m33Lms2IptFlt;
        float v19 = &qword_2222D49D0;
        goto LABEL_46;
      }
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v26 = logInstanceID;
        }
        else {
          uint64_t v26 = prevLogInstanceID;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = WORD1(v26);
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"isConversionOutputYuv(msrHC)\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 4412\n", buf, 0xCu);
        }
        prevLogInstanceID = v26;
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"isConversionOutputYuv(msrHC)\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 4412\n", buf, 2u);
      }
    }
    targetColorPrimaries = a8->targetColorPrimaries;
    if ((__CFString *)*MEMORY[0x263F03F08] == targetColorPrimaries)
    {
      int v68 = "709";
    }
    else
    {
      BOOL v67 = (__CFString *)*MEMORY[0x263F03F00] != targetColorPrimaries
         || *MEMORY[0x263F03F20] == (void)targetColorPrimaries;
      int v68 = "P3";
      if (!v67) {
        int v68 = "2020";
      }
    }
    snprintf((char *)&info, 0x3FFuLL, "rgb2yuv: %s", v68);
    if (isFullRangeFromSurfaceFormat(a10->outputFormat))
    {
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v69 = logInstanceID;
        }
        else {
          uint64_t v69 = prevLogInstanceID;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = WORD1(v69);
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"!isFullRangeFromSurfaceFormat(msrHC->outputFormat)\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 4415\n", buf, 0xCu);
        }
        prevLogInstanceID = v69;
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"!isFullRangeFromSurfaceFormat(msrHC->outputFormat)\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingImpl.mm\" at line 4415\n", buf, 2u);
      }
    }
    BOOL v28 = a8;
    unsigned int v23 = 0;
    goto LABEL_44;
  }
  if (a10->contentType == 1
    && !a10->inputColorSpace
    && !a10->displayType
    && ((*(_WORD *)&a6[1].var50 & 0x20) == 0 || (debugDM4DisableConf & 0x20) != 0))
  {
    strcpy((char *)&info, "rgb2yuv: DolbyVision to DolbyVision TV");
    RGBtoYUVMatrixForUITargetColorPrimary = &xmmword_2222D49A0;
    goto LABEL_45;
  }
  BOOL v20 = a8->targetColorPrimaries;
  if ((__CFString *)*MEMORY[0x263F03F08] == v20)
  {
    int8x16_t v22 = "709";
  }
  else
  {
    BOOL v21 = (__CFString *)*MEMORY[0x263F03F00] != v20 || *MEMORY[0x263F03F20] == (void)v20;
    int8x16_t v22 = "P3";
    if (!v21) {
      int8x16_t v22 = "2020";
    }
  }
  snprintf((char *)&info, 0x3FFuLL, "rgb2yuv: %s", v22);
  if (a10->contentType == 1)
  {
    if (a10->processingType != 4 || a10->inputColorSpace) {
      goto LABEL_42;
    }
    goto LABEL_40;
  }
  if (a10->contentType != 3) {
    goto LABEL_42;
  }
  if (!a10->inputColorSpace) {
    goto LABEL_40;
  }
  unsigned int v23 = 0;
  signed int inputFormat = a10->inputFormat;
  if (inputFormat > 1647534391)
  {
    if (inputFormat == 1815162994) {
      goto LABEL_40;
    }
    int v25 = 1647534392;
  }
  else
  {
    if (inputFormat == 1378955371) {
      goto LABEL_40;
    }
    int v25 = 1380411457;
  }
  if (inputFormat == v25)
  {
LABEL_40:
    unsigned int displayType = a10->displayType;
    if (displayType < 8)
    {
      unsigned int v23 = (0xDFu >> displayType) & 1;
      goto LABEL_43;
    }
LABEL_42:
    unsigned int v23 = 0;
  }
LABEL_43:
  BOOL v28 = a8;
LABEL_44:
  RGBtoYUVMatrixForUITargetColorPrimary = (long long *)getRGBtoYUVMatrixForUITargetColorPrimary((uint64_t)v28, v23);
LABEL_45:
  float v19 = &qword_2222D49C4;
LABEL_46:
  *(void *)buf = *v19;
  *(_DWORD *)&buf[8] = *((_DWORD *)v19 + 2);
  long long v29 = RGBtoYUVMatrixForUITargetColorPrimary[1];
  v70[0] = *RGBtoYUVMatrixForUITargetColorPrimary;
  v70[1] = v29;
  LODWORD(v70[2]) = *((_DWORD *)RGBtoYUVMatrixForUITargetColorPrimary + 8);
  if (v13)
  {
    fprintf(v13, "%s--- B04-05 Frame %d ---\n", a5, self->super._frameNumber);
    fprintf(v13, "%s--- %s ---\n", a5, (const char *)&info);
    fprintf(v13, "%scontrolpath[%d].PostCm3x3Enable = %d\n", a5, self->super._frameNumber, 1);
    float v31 = *((float *)v70 + 1);
    float v30 = *(float *)v70;
    if (*(float *)v70 < 0.0) {
      float v30 = -*(float *)v70;
    }
    int v32 = ((float)(v30 * 4095.0) + 0.5);
    if (*(float *)v70 < 0.0) {
      int v32 = -v32;
    }
    if (*((float *)v70 + 1) < 0.0) {
      float v31 = -*((float *)v70 + 1);
    }
    int v33 = ((float)(v31 * 4095.0) + 0.5);
    if (*((float *)v70 + 1) < 0.0) {
      int v33 = -v33;
    }
    float v34 = *((float *)v70 + 2);
    if (*((float *)v70 + 2) < 0.0) {
      float v34 = -*((float *)v70 + 2);
    }
    int v35 = ((float)(v34 * 4095.0) + 0.5);
    if (*((float *)v70 + 2) < 0.0) {
      int v35 = -v35;
    }
    float v36 = -*((float *)v70 + 3);
    if (*((float *)v70 + 3) >= 0.0) {
      float v36 = *((float *)v70 + 3);
    }
    int v37 = ((float)(v36 * 4095.0) + 0.5);
    if (*((float *)v70 + 3) < 0.0) {
      int v37 = -v37;
    }
    float v38 = *(float *)&v70[1];
    if (*(float *)&v70[1] < 0.0) {
      float v38 = -*(float *)&v70[1];
    }
    int v39 = ((float)(v38 * 4095.0) + 0.5);
    if (*(float *)&v70[1] < 0.0) {
      int v39 = -v39;
    }
    float v40 = -*((float *)&v70[1] + 1);
    if (*((float *)&v70[1] + 1) >= 0.0) {
      float v40 = *((float *)&v70[1] + 1);
    }
    int v41 = ((float)(v40 * 4095.0) + 0.5);
    if (*((float *)&v70[1] + 1) < 0.0) {
      int v41 = -v41;
    }
    float v42 = *((float *)&v70[1] + 2);
    if (*((float *)&v70[1] + 2) < 0.0) {
      float v42 = -*((float *)&v70[1] + 2);
    }
    int v43 = ((float)(v42 * 4095.0) + 0.5);
    if (*((float *)&v70[1] + 2) < 0.0) {
      int v43 = -v43;
    }
    float v44 = -*((float *)&v70[1] + 3);
    if (*((float *)&v70[1] + 3) >= 0.0) {
      float v44 = *((float *)&v70[1] + 3);
    }
    int v45 = ((float)(v44 * 4095.0) + 0.5);
    if (*((float *)&v70[1] + 3) < 0.0) {
      int v45 = -v45;
    }
    float v46 = *(float *)&v70[2];
    if (*(float *)&v70[2] < 0.0) {
      float v46 = -*(float *)&v70[2];
    }
    int v47 = ((float)(v46 * 4095.0) + 0.5);
    if (*(float *)&v70[2] < 0.0) {
      int v47 = -v47;
    }
    fprintf(v13, "%scontrolpath[%d].m33Rgb2Yuv = { {%d, %d, %d}, {%d, %d, %d}, {%d, %d, %d} }\n", a5, self->super._frameNumber, v32, v33, v35, v37, v39, v41, v43, v45, v47);
    fprintf(v13, "%scontrolpath[%d].outclr_eq_KClrYuv = %d\n", a5, self->super._frameNumber, 0);
    fprintf(v13, "%scontrolpath[%d].rangeOverOne = %d\n", a5, self->super._frameNumber, 0x10000);
    fprintf(v13, "%scontrolpath[%d].rangeMin = %d\n", a5, self->super._frameNumber, 0);
    fprintf(v13, "%scontrolpath[%d].m33Rgb2YuvScale2P = %d\n", a5, self->super._frameNumber, 12);
    fprintf(v13, "%scontrolpath[%d].v3Rgb2YuvOff = { %d, %d, %d }\n", a5, self->super._frameNumber, *(_DWORD *)buf, *(_DWORD *)&buf[4], *(_DWORD *)&buf[8]);
    fprintf(v13, "%s\n", a5);
  }
  uint64_t v48 = 0;
  *(void *)&p_rgb2ycc->mode = 0xC00000001;
  coeff = a3->var2.var0.var1.rgb2ycc.rgb2ycc.coeff;
  float v50 = v70;
  uint64_t v51 = a3->var2.var0.var1.rgb2ycc.rgb2ycc.coeff;
  do
  {
    uint64_t v52 = 0;
    a3->var2.var0.var0[v48 + 8236] = -1073741825;
    a3->var2.var0.var0[v48 + 8239] = 0x3FFFFFFF;
    a3->var2.var0.var0[v48 + 8242] = 0;
    do
    {
      float v53 = *(float *)((char *)v50 + v52 * 4);
      BOOL v54 = v53 < 0.0;
      if (v53 < 0.0) {
        float v53 = -v53;
      }
      int v55 = ((float)(v53 * 4095.0) + 0.5);
      if (v54) {
        int v55 = -v55;
      }
      (*v51)[v52++] = v55;
    }
    while (v52 != 3);
    p_rgb2ycc->rgb2ycc.offsetOut[v48] = (float)*(unsigned int *)&buf[4 * v48] * 0.00024414;
    a3->var2.var0.var0[v48 + 8257] = 0;
    a3->var2.var0.var0[v48++ + 8260] = 1065353216;
    ++v51;
    float v50 = (_OWORD *)((char *)v50 + 12);
  }
  while (v48 != 3);
  uint64_t Config = GetConfig((HDRConfig *)buf);
  if (Config)
  {
    int v57 = GetConfig((HDRConfig *)Config);
    if ((*(_DWORD *)HDRConfig::GetConfigEntryValue((uint64_t)v57, 0x3Cu, 0) - 1) <= 1)
    {
      signed int outputFormat = a10->outputFormat;
      if (outputFormat > 1953903151)
      {
        if (outputFormat != 1953903152 && outputFormat != 1953903668 && outputFormat != 1953903154) {
          return;
        }
      }
      else
      {
        unsigned int v59 = outputFormat - 1886680624;
        if (v59 > 4 || ((1 << v59) & 0x15) == 0) {
          return;
        }
      }
      if (a10->outputTransferFunction == 16)
      {
        char v60 = 0;
        uint64_t v61 = 0;
        float v62 = (float *)&R2020_Rgb2YuvNarrow;
        do
        {
          for (uint64_t i = 0; i != 3; ++i)
          {
            float v64 = v62[i];
            if ((0x198uLL >> (v60 + i))) {
              float v64 = -v64;
            }
            int v65 = ((float)(v64 * 4096.0) + 0.5);
            if ((0x198uLL >> (v60 + i))) {
              int v65 = -v65;
            }
            (*coeff)[i] = v65;
          }
          ++v61;
          ++coeff;
          v60 += 3;
          v62 += 3;
        }
        while (v61 != 3);
        *(void *)p_rgb2ycc->rgb2ycc.offsetOut = 0x3F0000003D800000;
        p_rgb2ycc->rgb2ycc.offsetOut[2] = 0.5;
      }
    }
  }
}

- (int)getColorConfigSignatureString:(char *)a3 length:(int)a4 tcControl:(ToneCurve_Control *)a5 hdrControl:(id *)a6
{
  p_msrHC = &self->_msrHC;
  unsigned int var15 = a6->var15;
  switch(var15)
  {
    case 1u:
      uint64_t v9 = "709";
      break;
    case 9u:
      uint64_t v9 = "2020";
      break;
    case 0xCu:
      uint64_t v9 = "P3";
      break;
    default:
      uint64_t v9 = "Unknown";
      break;
  }
  signed int inputTransferFunction = self->_msrHC.inputTransferFunction;
  if (inputTransferFunction > 15)
  {
    if (inputTransferFunction == 16)
    {
      int v11 = "PQ";
      goto LABEL_18;
    }
    if (inputTransferFunction == 18)
    {
      int v11 = "HLG";
      goto LABEL_18;
    }
  }
  else
  {
    if (inputTransferFunction == 1)
    {
      int v11 = "709";
      goto LABEL_18;
    }
    if (inputTransferFunction == 13)
    {
      int v11 = "sRGB";
      goto LABEL_18;
    }
  }
  int v11 = "Linear";
LABEL_18:
  signed int var16 = a6->var16;
  if (var16 <= 11)
  {
    if (var16 == 1)
    {
      int v13 = "709";
      goto LABEL_30;
    }
    if (var16 == 9)
    {
      int v13 = "2020";
      goto LABEL_30;
    }
  }
  else
  {
    switch(var16)
    {
      case 248:
        int v13 = "IPT";
        goto LABEL_30;
      case 14:
        int v13 = "ICtCp";
        goto LABEL_30;
      case 12:
        int v13 = "P3";
        goto LABEL_30;
    }
  }
  int v13 = "Unknown";
LABEL_30:
  targetColorPrimaries = a5->targetColorPrimaries;
  if ((__CFString *)*MEMORY[0x263F03F08] == targetColorPrimaries)
  {
    char v16 = "709";
  }
  else
  {
    BOOL v15 = (__CFString *)*MEMORY[0x263F03F00] != targetColorPrimaries
       || *MEMORY[0x263F03F20] == (void)targetColorPrimaries;
    char v16 = "P3";
    if (!v15) {
      char v16 = "2020";
    }
  }
  signed int outputTransferFunction = self->_msrHC.outputTransferFunction;
  if (outputTransferFunction > 15)
  {
    if (outputTransferFunction == 16)
    {
      unsigned int v18 = "PQ";
      goto LABEL_48;
    }
    if (outputTransferFunction == 18)
    {
      unsigned int v18 = "HLG";
      goto LABEL_48;
    }
  }
  else
  {
    if (outputTransferFunction == 1)
    {
      unsigned int v18 = "709";
      goto LABEL_48;
    }
    if (outputTransferFunction == 13)
    {
      unsigned int v18 = "sRGB";
      goto LABEL_48;
    }
  }
  unsigned int v18 = "Linear";
LABEL_48:
  float v19 = processingTypeName[self->_msrHC.processingType];
  BOOL v20 = colorSpaceName[self->_msrHC.inputColorSpace];
  unsigned int inputFormat = self->_msrHC.inputFormat;
  int8x16_t v22 = operationName[self->_msrHC.operation];
  int targetMatrixCoeffs = a5->targetMatrixCoeffs;
  if (targetMatrixCoeffs <= 11)
  {
    if (targetMatrixCoeffs == 1)
    {
      unsigned int v24 = "709";
      goto LABEL_60;
    }
    if (targetMatrixCoeffs == 9)
    {
      unsigned int v24 = "2020";
      goto LABEL_60;
    }
  }
  else
  {
    switch(targetMatrixCoeffs)
    {
      case 248:
        unsigned int v24 = "IPT";
        goto LABEL_60;
      case 14:
        unsigned int v24 = "ICtCp";
        goto LABEL_60;
      case 12:
        unsigned int v24 = "P3";
        goto LABEL_60;
    }
  }
  unsigned int v24 = "Unknown";
LABEL_60:
  int v25 = colorSpaceName[p_msrHC->outputColorSpace];
  unsigned int outputFormat = p_msrHC->outputFormat;
  unint64_t inputWidth = p_msrHC->inputWidth;
  unint64_t inputHeight = p_msrHC->inputHeight;
  float AmbientInNits = a5->AmbientInNits;
  if (AmbientInNits <= 0.0) {
    float AmbientInNits = 0.0;
  }
  return snprintf(a3, a4, "%s_%s-%s-%s-%s-%c%c%c%c_%s_%s-%s-%s-%s-%c%c%c%c_%zdx%zd_edrFactor-%.2f_ambient-%.0fnits_targetnits-%.0fnits", v19, v9, v11, v13, v20, HIBYTE(inputFormat), BYTE2(inputFormat), BYTE1(inputFormat), inputFormat, v22, v16, v18, v24, v25, HIBYTE(outputFormat), BYTE2(outputFormat),
           BYTE1(outputFormat),
           outputFormat,
           inputWidth,
           inputHeight,
           a5->EDRFactor,
           AmbientInNits,
           a5->targetMaxLinear);
}

- (void)runPostFrameDumpActions:(id *)a3
{
  uint64_t v4 = 0;
  float v5 = (FILE **)&qword_26ABE7688;
  do
  {
    if ((v4 - 1) <= 2)
    {
      if (*((unsigned char *)v5 - 16))
      {
        unsigned int frameNumber = self->super._frameNumber;
        if (*((_DWORD *)v5 - 3) <= frameNumber && frameNumber <= *((_DWORD *)v5 - 2) && *v5)
        {
          fflush(*v5);
          if (self->super._frameNumber == *((_DWORD *)v5 - 2))
          {
            fclose(*v5);
            *float v5 = 0;
          }
        }
      }
    }
    ++v4;
    v5 += 3;
  }
  while (v4 != 4);
}

- (void)populateMSRColorConfig:(id *)a3 DMConfig:(id *)a4 DMData:(id *)a5 tcControl:(ToneCurve_Control *)a6 hdrControl:(id *)a7 MSRHDRContext:(MSRHDRContext *)a8
{
  v17[2] = *MEMORY[0x263EF8340];
  char v16 = 0;
  *(void *)((char *)v17 + 7) = 0;
  v17[0] = 0;
  int v15 = *(_DWORD *)&a4[1].var48;
  *(_OWORD *)&a8->dpcParam.alpha = *(_OWORD *)&a4[1].var44;
  *(_DWORD *)&a8->dpcParam.on = v15;
  [(MSRHDRProcessing *)self decideStageStatus:v17 MSRHDRContext:a8 DMConfig:a4];
  [(MSRHDRProcessing *)self checkNewFrameForDump];
  [(MSRHDRProcessing *)self populateMSRColorConfigHeader:a3 Enabled:1 Prefix:&v16 DMConfig:a4 DMData:a5 tcControl:a6 hdrControl:a7 MSRHDRContext:a8];
  [(MSRHDRProcessing *)self populateMSRColorConfigStageB01_01:a3 Enabled:LOBYTE(v17[0]) Prefix:&v16 DMConfig:a4 DMData:a5 tcControl:a6 hdrControl:a7 MSRHDRContext:a8];
  [(MSRHDRProcessing *)self populateMSRColorConfigStageB01_02:a3 Enabled:BYTE1(v17[0]) Prefix:&v16 DMConfig:a4 DMData:a5 tcControl:a6 hdrControl:a7 MSRHDRContext:a8];
  [(MSRHDRProcessing *)self populateMSRColorConfigStageB01_03:a3 Enabled:BYTE2(v17[0]) Prefix:&v16 DMConfig:a4 DMData:a5 tcControl:a6 hdrControl:a7 MSRHDRContext:a8];
  [(MSRHDRProcessing *)self populateMSRColorConfigStageB01_04:a3 Enabled:BYTE3(v17[0]) Prefix:&v16 DMConfig:a4 DMData:a5 tcControl:a6 hdrControl:a7 MSRHDRContext:a8];
  [(MSRHDRProcessing *)self populateMSRColorConfigStageB01_05:a3 Enabled:BYTE4(v17[0]) Prefix:&v16 DMConfig:a4 DMData:a5 tcControl:a6 hdrControl:a7 MSRHDRContext:a8];
  [(MSRHDRProcessing *)self populateMSRColorConfigStageB01_06:a3 Enabled:BYTE5(v17[0]) Prefix:&v16 DMConfig:a4 DMData:a5 tcControl:a6 hdrControl:a7 MSRHDRContext:a8];
  [(MSRHDRProcessing *)self populateMSRColorConfigStageB04_01:a3 Enabled:LOBYTE(v17[1]) Prefix:&v16 DMConfig:a4 DMData:a5 tcControl:a6 hdrControl:a7 MSRHDRContext:a8];
  [(MSRHDRProcessing *)self populateMSRColorConfigStageB04_02:a3 Enabled:BYTE1(v17[1]) Prefix:&v16 DMConfig:a4 DMData:a5 tcControl:a6 hdrControl:a7 MSRHDRContext:a8];
  [(MSRHDRProcessing *)self populateMSRColorConfigStageB04_03:a3 Enabled:BYTE2(v17[1]) Prefix:&v16 DMConfig:a4 DMData:a5 tcControl:a6 hdrControl:a7 MSRHDRContext:a8];
  [(MSRHDRProcessing *)self populateMSRColorConfigStageB04_04:a3 Enabled:BYTE3(v17[1]) Prefix:&v16 DMConfig:a4 DMData:a5 tcControl:a6 hdrControl:a7 MSRHDRContext:a8];
  [(MSRHDRProcessing *)self populateMSRColorConfigStageB04_05:a3 Enabled:BYTE4(v17[1]) Prefix:&v16 DMConfig:a4 DMData:a5 tcControl:a6 hdrControl:a7 MSRHDRContext:a8];
  [(MSRHDRProcessing *)self populateMSRColorConfigStageB02:a3 Enabled:BYTE6(v17[0]) Prefix:&v16 DMConfig:a4 DMData:a5 tcControl:a6 hdrControl:a7 MSRHDRContext:a8];
  [(MSRHDRProcessing *)self populateMSRColorConfigStageB03:a3 Enabled:HIBYTE(v17[0]) Prefix:&v16 DMConfig:a4 DMData:a5 tcControl:a6 hdrControl:a7 MSRHDRContext:a8];
  [(MSRHDRProcessing *)self populateMSRColorConfigStageHwOOTF:a3 Enabled:BYTE6(v17[1]) Prefix:&v16 DMConfig:a4 DMData:a5 tcControl:a6 hdrControl:a7 MSRHDRContext:a8];
}

- (void)attachHDRMetaDataToOutputSurface:(__IOSurface *)a3 withDMData:(id *)a4 withDMConfig:(id *)a5 withHdrControl:(id *)a6 withTcControl:(ToneCurve_Control *)a7 withMSRHDRContext:(MSRHDRContext *)a8 withInfoFrame:(id *)a9
{
  unsigned int displayType = self->_msrHC.displayType;
  if (!displayType || a6->var3 == 4 && a6->var6)
  {
    [(MSRHDRProcessing *)self attachDoViMetadataPacketTo:a3 withDMData:a4 withDMConfig:a5 withHdrControl:a6 withMSRHDRContext:a8];
  }
  else if (displayType == 2)
  {
    [(MSRHDRProcessing *)self attachInfoFrameTo:a3 withDMData:a4 withTcControl:a7 withInfoFrame:a9];
  }
}

- (void)attachDoViMetadataPacketTo:(__IOSurface *)a3 withDMData:(id *)a4 withDMConfig:(id *)a5 withHdrControl:(id *)a6 withMSRHDRContext:(MSRHDRContext *)a7
{
  if (a6->var3 == 4)
  {
    if (a6->var6)
    {
      id value = objc_alloc_init(MEMORY[0x263EFF9A0]);
      int v11 = [NSNumber numberWithInt:a7->outputTransferFunction];
      [value setObject:v11 forKeyedSubscript:*MEMORY[0x263F0EDD8]];

      LOWORD(v12) = a4->var21.var2;
      *(float *)&double v13 = (float)v12 / 4095.0;
      unsigned int v14 = [NSNumber numberWithFloat:v13];
      [value setObject:v14 forKeyedSubscript:*MEMORY[0x263F0EDE8]];

      LOWORD(v15) = a4->var21.var1;
      *(float *)&double v16 = (float)v15 / 4095.0;
      int v17 = [NSNumber numberWithFloat:v16];
      [value setObject:v17 forKeyedSubscript:*MEMORY[0x263F0EDF0]];

      LOWORD(v18) = a4->var21.var3;
      *(float *)&double v19 = (float)v18 / 4095.0;
      BOOL v20 = [NSNumber numberWithFloat:v19];
      [value setObject:v20 forKeyedSubscript:*MEMORY[0x263F0EDE0]];

      if (a4->var31.var0)
      {
        BOOL v21 = [NSNumber numberWithInt:a4->var31.var2 + 2];
        [value setObject:v21 forKeyedSubscript:*MEMORY[0x263F03F68]];

        if (a4->var31.var2 == 2)
        {
          if (a4->var23.var0)
          {
            unsigned int v23 = [NSNumber numberWithInt:a4->var23.var1];
            [value setObject:v23 forKeyedSubscript:*MEMORY[0x263F03F78]];

            unsigned int v24 = [NSNumber numberWithInt:a4->var23.var2];
            [value setObject:v24 forKeyedSubscript:*MEMORY[0x263F03F70]];

            int v25 = [NSNumber numberWithInt:a4->var23.var3];
            [value setObject:v25 forKeyedSubscript:*MEMORY[0x263F03F60]];
          }
          if (a4->var24.var0)
          {
            LOWORD(v22) = a4->var24.var2;
            *(float *)&double v22 = (float)LODWORD(v22) / 4095.0;
            uint64_t v26 = [NSNumber numberWithFloat:v22];
            [value setObject:v26 forKeyedSubscript:*MEMORY[0x263F03F58]];

            LOWORD(v27) = a4->var24.var1;
            *(float *)&double v28 = (float)v27 / 4095.0;
            long long v29 = [NSNumber numberWithFloat:v28];
            [value setObject:v29 forKeyedSubscript:*MEMORY[0x263F03F50]];
          }
        }
      }
      IOSurfaceSetValue(a3, (CFStringRef)*MEMORY[0x263F0EDD0], value);
    }
  }
  else
  {
    p_payload = &self->_payload;
    self->_payLoadLength = convertMetaDataToPayLoad((uint64_t)a4, (char *)&self->_payload);
    if (a7->contentType == 3)
    {
      LODWORD(v33) = a5[1].var2;
      setTargitBrightnessInMetaData((uint64_t)p_payload, v33, a6->var22, *(float *)&v33, a6->var22);
    }
    if (SLODWORD(a5[1].var49) <= 3) {
      adjustL1MetaData((uint64_t)p_payload, 0);
    }
    float v34 = (HDRConfig *)adjustL2MetaData(&p_payload->dm_metadata_id, 0);
    self->_payLoadLength = v34;
    uint64_t Config = GetConfig(v34);
    if (Config)
    {
      float v36 = GetConfig((HDRConfig *)Config);
      HDRConfig::GetConfigEntryValue((uint64_t)v36, 0x3Fu, 0);
    }
    self->_numOfPackets = PacketizeMetadataMSR((char *)p_payload, self->_payLoadLength, (uint64_t)&self->_doviHDMIMetaData.version + 3);
    *(_DWORD *)(&self->_payload + 1) = 1;
    *(_DWORD *)&self->_doviHDMIMetaData.var0.v1.output_conversion.metadata[3][127] = 3;
    *(unsigned int *)((char *)&self->_doviHDMIMetaData.var0.v1.output_conversion.metadata_copies + 3) = self->_numOfPackets;
    CFDataRef v37 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)&self->_payload + 607, 524);
    IOSurfaceSetValue(a3, @"DolbyVisionHDMIData", v37);
    CFRelease(v37);
  }
}

- (void)attachInfoFrameTo:(__IOSurface *)a3 withDMData:(id *)a4 withTcControl:(ToneCurve_Control *)a5 withInfoFrame:(id *)a6
{
  if ((!a6->var0.var2 || !a6->var1.var0) && !a4->var26.var0)
  {
    unsigned int var16 = a4->var16;
    if (var16 >= 0xC06)
    {
      PQ12Bit2LinFloat(var16);
      PQ12Bit2LinFloat(a4->var15);
    }
  }
  IOSurfaceSetBulkAttachments2();
}

+ (void)dolbyIOMFBMetadata:(id *)a3 withMinBrightness:(float)a4 maxBrightness:(float)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  bzero(a3, 0x20CuLL);
  if (a5 <= a4)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v14 = logInstanceID;
      }
      else {
        uint64_t v14 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134219010;
        int v17 = (const char *)WORD1(v14);
        __int16 v18 = 2080;
        double v19 = COERCE_DOUBLE("+[MSRHDRProcessing dolbyIOMFBMetadata:withMinBrightness:maxBrightness:]");
        __int16 v20 = 2048;
        double v21 = a5;
        __int16 v22 = 2048;
        double v23 = a4;
        __int16 v24 = 2048;
        int v25 = a3;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx     %s : error max=%f <= min=%f, metaData=%p", (uint8_t *)&v16, 0x34u);
      }
      unsigned int v13 = 0;
      prevLogInstanceID = v14;
    }
    else
    {
      BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      unsigned int v13 = 0;
      if (v15)
      {
        int v16 = 136315906;
        int v17 = "+[MSRHDRProcessing dolbyIOMFBMetadata:withMinBrightness:maxBrightness:]";
        __int16 v18 = 2048;
        double v19 = a5;
        __int16 v20 = 2048;
        double v21 = a4;
        __int16 v22 = 2048;
        double v23 = *(double *)&a3;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54]     %s : error max=%f <= min=%f, metaData=%p", (uint8_t *)&v16, 0x2Au);
        unsigned int v13 = 0;
      }
    }
  }
  else
  {
    int v8 = PQIn12Bit(a4);
    __int16 v9 = PQIn12Bit(a5);
    LOBYTE(dword_267F7C938) = BYTE1(v8);
    int v10 = v8 + 2467;
    BYTE1(dword_267F7C938) = v8;
    BYTE2(dword_267F7C938) = HIBYTE(v9);
    HIBYTE(dword_267F7C938) = v9;
    if (v8 < -2467) {
      int v10 = v8 + 2468;
    }
    *(_DWORD *)&byte_267F7C93E = 1;
    int v11 = v10 >> 1;
    word_267F7C942 = 262;
    byte_267F7C944 = BYTE1(v8);
    byte_267F7C945 = v8;
    word_267F7C946 = -23799;
    byte_267F7C948 = BYTE1(v11);
    byte_267F7C949 = v11;
    adjustL1MetaData((uint64_t)SDRMetaData, 0);
    unsigned int v12 = adjustL2MetaData((unsigned __int8 *)SDRMetaData, 0);
    unsigned int v13 = PacketizeMetadataMSR(SDRMetaData, v12, (uint64_t)&a3->var1);
  }
  a3->var0 = 1;
  a3->var1.var0.var0.var1 = 3;
  a3->var1.var0.var0.var2 = v13;
}

+ (void)dolbyIOMFBMetadata:(id *)a3 withFilteredMinPQ:(float)a4 FilteredMaxPQ:(float)a5 FilteredAvgPQ:(float)a6 EnableLevel4:(BOOL)a7 FilteredAvg:(float)a8 FilteredStdDev:(float)a9
{
  BOOL v11 = a7;
  float v13 = a4 * 4095.0;
  float v14 = -(float)(a4 * 4095.0);
  if (v13 >= 0.0) {
    float v14 = v13;
  }
  unsigned int v15 = (v14 + 0.5);
  if (v13 < 0.0) {
    unsigned int v15 = -v15;
  }
  if (v15 >= 0xFFF) {
    unsigned int v16 = 4095;
  }
  else {
    unsigned int v16 = v15;
  }
  float v17 = a5 * 4095.0;
  float v18 = -(float)(a5 * 4095.0);
  BOOL v19 = v17 < 0.0;
  if (v17 < 0.0) {
    float v17 = v18;
  }
  unsigned int v20 = (v17 + 0.5);
  if (v19) {
    unsigned int v20 = -v20;
  }
  if (v20 >= 0xFFF) {
    unsigned int v21 = 4095;
  }
  else {
    unsigned int v21 = v20;
  }
  float v22 = a6 * 4095.0;
  if ((float)(a6 * 4095.0) < 0.0) {
    float v22 = -(float)(a6 * 4095.0);
  }
  unsigned int v23 = (v22 + 0.5);
  if ((float)(a6 * 4095.0) < 0.0) {
    unsigned int v23 = -v23;
  }
  if (v23 >= 0xFFF) {
    unsigned int v24 = 4095;
  }
  else {
    unsigned int v24 = v23;
  }
  if (v16 >= 0xC) {
    __int16 v25 = 12;
  }
  else {
    __int16 v25 = v16;
  }
  if (v24 <= 0x333) {
    unsigned int v26 = 819;
  }
  else {
    unsigned int v26 = v24;
  }
  if (v21 <= 0x821) {
    int v27 = 2081;
  }
  else {
    int v27 = v21;
  }
  if (v26 >= v27 - 1) {
    __int16 v28 = v27 - 1;
  }
  else {
    __int16 v28 = v26;
  }
  bzero(a3, 0x20CuLL);
  dword_267F7C938 = 118242816;
  word_267F7C942 = 262;
  byte_267F7C944 = 0;
  byte_267F7C945 = v25;
  LOBYTE(word_267F7C946) = BYTE1(v27);
  HIBYTE(word_267F7C946) = v27;
  byte_267F7C948 = HIBYTE(v28);
  byte_267F7C949 = v28;
  *(_DWORD *)&byte_267F7C93E = 2;
  unk_267F7C94A = 100663296;
  byte_267F7C94E = 3;
  byte_267F7C94F = (unsigned __int16)(v16 - v25 + 2048) >> 8;
  byte_267F7C950 = v16 - v25;
  byte_267F7C951 = (unsigned __int16)(v21 - v27 + 2048) >> 8;
  byte_267F7C952 = v21 - v27;
  byte_267F7C953 = (unsigned __int16)(v24 - v28 + 2048) >> 8;
  byte_267F7C954 = v24 - v28;
  if (v11)
  {
    float v29 = a8 * 4095.0;
    if ((float)(a8 * 4095.0) < 0.0) {
      float v29 = -(float)(a8 * 4095.0);
    }
    unsigned int v30 = (v29 + 0.5);
    if ((float)(a8 * 4095.0) < 0.0) {
      unsigned int v30 = -v30;
    }
    if (v30 >= 0xFFF) {
      LOWORD(v30) = 4095;
    }
    float v31 = a9 * 4095.0;
    if ((float)(a9 * 4095.0) < 0.0) {
      float v31 = -(float)(a9 * 4095.0);
    }
    byte_267F7C93E = 3;
    byte_267F7C959 = 4;
    if ((float)(a9 * 4095.0) >= 0.0) {
      unsigned int v32 = (v31 + 0.5);
    }
    else {
      unsigned int v32 = -(v31 + 0.5);
    }
    unk_267F7C955 = 0x4000000;
    if (v32 >= 0xFFF) {
      LOWORD(v32) = 4095;
    }
    byte_267F7C95A = BYTE1(v30);
    byte_267F7C95B = v30;
    byte_267F7C95C = BYTE1(v32);
    byte_267F7C95D = v32;
  }
  unsigned int v33 = adjustL2MetaData((unsigned __int8 *)SDRMetaData, 0);
  float v34 = (HDRConfig *)PacketizeMetadataMSR(SDRMetaData, v33, (uint64_t)&a3->var1);
  unsigned int v35 = v34;
  uint64_t Config = GetConfig(v34);
  if (Config)
  {
    CFDataRef v37 = GetConfig((HDRConfig *)Config);
    HDRConfig::GetConfigEntryValue((uint64_t)v37, 0x3Fu, 0);
  }
  a3->var0 = 1;
  a3->var1.var0.var0.var1 = 3;
  a3->var1.var0.var0.var2 = v35;
}

+ (void)HDR10PlusIOMFBMetadata:(id *)a3 withHDR10PlusData:(id *)a4
{
  a3->var0 = 1;
  *(_DWORD *)(&a3->var0 + 1) = a4->var0;
  *(unsigned int *)((char *)&a3->var1.var0.var0 + 1) = a4->var2;
  long long v4 = *(_OWORD *)a4->var5;
  long long v5 = *(_OWORD *)&a4->var5[4];
  *(unsigned int *)((char *)&a3->var1.var0.var2[7] + 1) = a4->var5[8];
  *(_OWORD *)((char *)&a3->var1.var0.var2[3] + 1) = v5;
  *(_OWORD *)((char *)&a3->var1.var0.var1 + 1) = v4;
  *(unsigned int *)((char *)&a3->var1.var0.var2[8] + 1) = *(_DWORD *)&a4->var7;
  long long v6 = *(_OWORD *)a4->var10;
  *(unsigned __int16 *)((char *)&a3->var1.var0.var5[6] + 1) = a4->var10[8];
  *(_OWORD *)((char *)&a3->var1.var0.var3 + 1) = v6;
  HIBYTE(a3->var1.var0.var5[7]) = a4->var6;
  LOBYTE(a3->var1.var0.var5[8]) = a4->var9;
}

- (void).cxx_destruct
{
}

@end