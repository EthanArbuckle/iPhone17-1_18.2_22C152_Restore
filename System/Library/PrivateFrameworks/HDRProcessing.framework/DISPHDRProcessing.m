@interface DISPHDRProcessing
- (BOOL)isContentSupported:(id *)a3;
- (BOOL)processFrameByDISPWithComposerData:(id *)a3 DM:(id)a4 DMData:(id *)a5 tcControl:(ToneCurve_Control *)a6 hdrControl:(id *)a7 hdr10InfoFrame:(id *)a8 layer0:(__IOSurface *)a9 layer1:(__IOSurface *)a10 frameNumebr:(unint64_t)a11;
- (DISPHDRProcessing)init;
- (int64_t)iterateDISPColorConfig:(int)a3 config:(id)a4;
- (unint64_t)getTmLutSize;
- (void)decideStageStatus:(BOOL *)a3 DMConfig:(id *)a4 AlgoMode:(int *)a5 DISPHDRContext:(EngineHDRContext *)a6;
- (void)getDISPColorConfigOutputScale:(id *)a3 DMData:(id *)a4 tcControl:(ToneCurve_Control *)a5 hdrControl:(id *)a6 DISPHDRContext:(EngineHDRContext *)a7;
- (void)getTmLutInput;
- (void)hdr10_createLUTFromDMConfig:(id *)a3 DM:(id)a4 TCControl:(ToneCurve_Control *)a5 HDRControl:(id *)a6 TMParam:(_HDR10TMParam *)a7 EdrAdaptationParam:(_EdrAdaptationParam *)a8 AmbAdaptationParam:(_AmbAdaptationParam *)a9;
- (void)hdr10_tm_createLUTFromDMConfig:(id *)a3 TMParam:(_HDR10TMParam *)a4 EdrAdaptationParam:(_EdrAdaptationParam *)a5 AmbAdaptationParam:(_AmbAdaptationParam *)a6 DM:(id)a7;
- (void)hlg_createLUTFromDMConfig:(id *)a3 DM:(id)a4 HDRControl:(id *)a5 TMParam:(_HLGTMParam *)a6 EdrAdaptationParam:(_EdrAdaptationParam *)a7 AmbAdaptationParam:(_AmbAdaptationParam *)a8 TMMode:(int)a9;
- (void)hlg_tm_createLUTFromDMConfig:(id *)a3 DM:(id)a4 TMParam:(_HLGTMParam *)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7 TMMode:(int)a8;
- (void)iterateDISPColorConfigCleanUp;
- (void)populateDISPColorConfig:(id *)a3 DMData:(id *)a4 tcControl:(ToneCurve_Control *)a5 hdrControl:(id *)a6 MSRHDRContext:(EngineHDRContext *)a7;
- (void)populateDISPColorConfigFixedDegamma:(BOOL)a3 AlgoMode:(int)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 DISPHDRContext:(EngineHDRContext *)a10;
- (void)populateDISPColorConfigPostToneMapCSC:(BOOL)a3 AlgoMode:(int)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 DISPHDRContext:(EngineHDRContext *)a10;
- (void)populateDISPColorConfigPreToneMapCSC:(BOOL)a3 AlgoMode:(int)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 DISPHDRContext:(EngineHDRContext *)a10;
- (void)populateDISPColorConfigToneMap:(BOOL)a3 AlgoMode:(int)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 DISPHDRContext:(EngineHDRContext *)a10;
- (void)populateDISPColorConfigToneMapDpc:(BOOL)a3 Prefix:(char *)a4 DMConfig:(id *)a5 DMData:(id *)a6 tcControl:(ToneCurve_Control *)a7 hdrControl:(id *)a8 DISPHDRContext:(EngineHDRContext *)a9;
- (void)populateDISPColorConfigToneMapLUT:(BOOL)a3 Prefix:(char *)a4 DMConfig:(id *)a5 DMData:(id *)a6 tcControl:(ToneCurve_Control *)a7 hdrControl:(id *)a8 DISPHDRContext:(EngineHDRContext *)a9;
- (void)populateDISPColorConfigToneMapParametric:(BOOL)a3 Prefix:(char *)a4 DMConfig:(id *)a5 DMData:(id *)a6 tcControl:(ToneCurve_Control *)a7 hdrControl:(id *)a8 DISPHDRContext:(EngineHDRContext *)a9;
- (void)populateDISPToneMapConfig:(char *)a3 DMConfig:(id *)a4 DMData:(id *)a5 tcControl:(ToneCurve_Control *)a6 hdrControl:(id *)a7 DISPHDRContext:(EngineHDRContext *)a8;
- (void)processDISPColorConfig:(__IOMobileFramebuffer *)a3 layer:(unsigned int)a4;
- (void)setDisplayManagementParametricConfig:(ToneCurve_Control *)a3 HDRControl:(id *)a4;
- (void)setDisplayManagementParametricConfigToneMap:(ToneCurve_Control *)a3 HDRControl:(id *)a4;
- (void)setDisplayManagementParametricConfigToneMapBezier:(_ebzCurveParam *)a3 TMSendC:(float)a4;
- (void)setDisplayManagementParametricConfigToneMapHDR10:(ToneCurve_Control *)a3 HDRControl:(id *)a4;
- (void)setDisplayManagementParametricConfigToneMapHLG:(ToneCurve_Control *)a3 HDRControl:(id *)a4;
- (void)setDisplayManagementParametricConfigToneMapSpline:(_splCurveParam *)a3;
- (void)setupDISPHDRContext:(id *)a3 TCControl:(ToneCurve_Control *)a4 DMData:(id *)a5 input:(__IOSurface *)a6;
@end

@implementation DISPHDRProcessing

- (DISPHDRProcessing)init
{
  v6.receiver = self;
  v6.super_class = (Class)DISPHDRProcessing;
  v2 = [(ProcessingEngine *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(DISPHDRProcessing *)v2 getTmLutInput];
    v4 = v3;
  }

  return v3;
}

- (BOOL)processFrameByDISPWithComposerData:(id *)a3 DM:(id)a4 DMData:(id *)a5 tcControl:(ToneCurve_Control *)a6 hdrControl:(id *)a7 hdr10InfoFrame:(id *)a8 layer0:(__IOSurface *)a9 layer1:(__IOSurface *)a10 frameNumebr:(unint64_t)a11
{
  id v16 = a4;
  v17 = (HDRConfig *)[(DISPHDRProcessing *)self isContentSupported:a7];
  BOOL v18 = (char)v17;
  if (v17)
  {
    Config = GetConfig(v17);
    if (Config)
    {
      v20 = GetConfig((HDRConfig *)Config);
      BOOL v21 = *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v20, 2u, 0) != 0;
    }
    else
    {
      BOOL v21 = 0;
    }
    *(_OWORD *)&self->_dispHC.contentType = 0u;
    *(_OWORD *)&self->_dispHC.convertType = 0u;
    *(_OWORD *)&self->_dispHC.outputFormat = 0u;
    *(_OWORD *)&self->_dispHC.outputTransferFunction = 0u;
    *(_OWORD *)&self->_dispHC.inputHeight = 0u;
    *(_OWORD *)&self->_dispHC.outputHeight = 0u;
    *(_OWORD *)&self->_dispHC.dpcParam.alphaPrime = 0u;
    *(void *)&self->_dispHC.originalInputTransferFunction = 0;
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
    self->super._frameNumber = a11;
    sDispDumpContext = v21;
    if (v21)
    {
      dword_267F7CBC4 = ccDumpStart;
      unk_267F7CBC8 = ccDumpStart + ccDumpNumber - 1;
    }
    [(ProcessingEngine *)self setupToneMappingWithDmData:a5 tcControl:a6 hdrControl:a7 dmConfig:self->super._anon_90 DM:v16 hdr10InfoFrame:a8];
    [(DISPHDRProcessing *)self setupDISPHDRContext:a7 TCControl:a6 DMData:a5 input:a9];
    [(DISPHDRProcessing *)self runPreFrameDumpActions:&self->_dispHC tcControl:a6 hdrControl:a7];
    [(DISPHDRProcessing *)self populateDISPColorConfig:self->super._anon_90 DMData:a5 tcControl:a6 hdrControl:a7 MSRHDRContext:&self->_dispHC];
    [(DISPHDRProcessing *)self runPostFrameDumpActions];
  }

  return v18;
}

- (BOOL)isContentSupported:(id *)a3
{
  return a3->var0 == 3;
}

- (void)processDISPColorConfig:(__IOMobileFramebuffer *)a3 layer:(unsigned int)a4
{
  IOMobileFramebufferSwapSetToneMapConfig();
  if (self->FixedDegamma.mode == 1) {
    IOMobileFramebufferSwapSetICCCurve();
  }
  if (self->PreToneMapCSC.mode == 1) {
    IOMobileFramebufferSwapSetICCMatrix();
  }
  if (self->ToneMapLUT.mode == 1) {
    IOMobileFramebufferSwapSetICCCurve();
  }
  if (self->ToneMapMixFactorLUT.mode == 1) {
    IOMobileFramebufferSwapSetICCCurve();
  }
  if (self->PostToneMapCSC.mode == 1)
  {
    IOMobileFramebufferSwapSetICCMatrix();
  }
}

- (void)iterateDISPColorConfigCleanUp
{
  ToneMapLUT_xsamples = self->ToneMapLUT_xsamples;
  if (ToneMapLUT_xsamples)
  {
    free(ToneMapLUT_xsamples);
    self->ToneMapLUT_xsamples = 0;
  }
  ToneMapLUT_ysamples = self->ToneMapLUT_ysamples;
  if (ToneMapLUT_ysamples)
  {
    free(ToneMapLUT_ysamples);
    self->ToneMapLUT_ysamples = 0;
  }
  ToneMapMixFactorLUT_xsamples = self->ToneMapMixFactorLUT_xsamples;
  if (ToneMapMixFactorLUT_xsamples)
  {
    free(ToneMapMixFactorLUT_xsamples);
    self->ToneMapMixFactorLUT_xsamples = 0;
  }
  ToneMapMixFactorLUT_ysamples = self->ToneMapMixFactorLUT_ysamples;
  if (ToneMapMixFactorLUT_ysamples)
  {
    free(ToneMapMixFactorLUT_ysamples);
    self->ToneMapMixFactorLUT_ysamples = 0;
  }
}

- (int64_t)iterateDISPColorConfig:(int)a3 config:(id)a4
{
  id v5 = a4;
  (*((void (**)(id, void, void, $9CB6C2168DB96ECF9C8DAD95E278DC4D *))v5 + 2))(v5, 0, 0, &self->ToneMapConfig);
  if (self->FixedDegamma.mode == 1) {
    p_curveData = &self->FixedDegamma.curveData;
  }
  else {
    p_curveData = 0;
  }
  (*((void (**)(id, uint64_t, uint64_t, $694DE7F989F9513FBE40A75B71A8A0B9 *))v5 + 2))(v5, 2, 7, p_curveData);
  if (self->PreToneMapCSC.mode == 1) {
    p_colorMatrix = &self->PreToneMapCSC.colorMatrix;
  }
  else {
    p_colorMatrix = 0;
  }
  (*((void (**)(id, uint64_t, uint64_t, $59B699D5DDB9496B0D382F98FBA88B91 *))v5 + 2))(v5, 1, 2, p_colorMatrix);
  if (self->ToneMapLUT.mode == 1) {
    v8 = &self->ToneMapLUT.curveData;
  }
  else {
    v8 = 0;
  }
  (*((void (**)(id, uint64_t, uint64_t, $694DE7F989F9513FBE40A75B71A8A0B9 *))v5 + 2))(v5, 2, 3, v8);
  if (self->ToneMapMixFactorLUT.mode == 1) {
    v9 = &self->ToneMapMixFactorLUT.curveData;
  }
  else {
    v9 = 0;
  }
  (*((void (**)(id, uint64_t, uint64_t, $694DE7F989F9513FBE40A75B71A8A0B9 *))v5 + 2))(v5, 2, 6, v9);
  if (self->PostToneMapCSC.mode == 1) {
    v10 = &self->PostToneMapCSC.colorMatrix;
  }
  else {
    v10 = 0;
  }
  (*((void (**)(id, uint64_t, uint64_t, $59B699D5DDB9496B0D382F98FBA88B91 *))v5 + 2))(v5, 1, 3, v10);
  if (self->DpcCurve.mode == 1) {
    v11 = &self->DpcCurve.curveData;
  }
  else {
    v11 = 0;
  }
  (*((void (**)(id, uint64_t, uint64_t, $694DE7F989F9513FBE40A75B71A8A0B9 *))v5 + 2))(v5, 2, 11, v11);
  [(DISPHDRProcessing *)self iterateDISPColorConfigCleanUp];

  return -17000;
}

- (void)setupDISPHDRContext:(id *)a3 TCControl:(ToneCurve_Control *)a4 DMData:(id *)a5 input:(__IOSurface *)a6
{
  p_dispHC = &self->_dispHC;
  unsigned int var10 = a3->var10;
  self->_dispHC.contentType = a3->var0;
  self->_dispHC.displayType = var10;
  unsigned int var3 = a3->var3;
  self->_dispHC.processingType = a4->tmData.processingType;
  self->_dispHC.operation = var3;
  uint64_t PixelFormat = IOSurfaceGetPixelFormat(a6);
  p_dispHC->inputFormatRaw = PixelFormat;
  p_dispHC->inputFormat = getFourCCforType(PixelFormat);
  unsigned int var17 = a3->var17;
  p_dispHC->inputColorSpace = a3->var18;
  p_dispHC->inputTransferFunction = var17;
  p_dispHC->originalInputTransferFunction = a3->var28;
  *(_WORD *)&p_dispHC->enableReshaping = 0;
  p_dispHC->inputWidth = IOSurfaceGetWidth(a6);
  p_dispHC->inputHeight = IOSurfaceGetHeight(a6);
}

- (void)decideStageStatus:(BOOL *)a3 DMConfig:(id *)a4 AlgoMode:(int *)a5 DISPHDRContext:(EngineHDRContext *)a6
{
  if ((a6->contentType & 0xFFFFFFFE) == 2)
  {
    *(_DWORD *)a3 = 16843009;
    a3[4] = a4[1].var48;
    Config = GetConfig((HDRConfig *)self);
    if (Config
      && (v8 = GetConfig((HDRConfig *)Config), *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v8, 0x4Au, 0)))
    {
      *(void *)&long long v9 = 0x100000001;
      *((void *)&v9 + 1) = 0x100000001;
      *(_OWORD *)a5 = v9;
      a5[4] = 1;
    }
    else
    {
      *(void *)a5 = 0;
      *((void *)a5 + 1) = 0;
      a5[4] = 0;
    }
  }
}

- (void)populateDISPToneMapConfig:(char *)a3 DMConfig:(id *)a4 DMData:(id *)a5 tcControl:(ToneCurve_Control *)a6 hdrControl:(id *)a7 DISPHDRContext:(EngineHDRContext *)a8
{
  unsigned int contentType = self->_dispHC.contentType;
  if (contentType == 2)
  {
    uint64_t v18 = 0;
    p_ToneMapConfig = &self->ToneMapConfig;
    self->ToneMapConfig.toneMapMode_Enable = 2;
    do
    {
      v19 = &p_ToneMapConfig->toneMapMode_Enable + v18;
      v19[3] = (int)(float)((float)((float)(*(&a4[1].var28 + (v18 & 3)) / 100.0) * 16384.0) + 0.5);
      v19[7] = 164;
      ++v18;
    }
    while (v18 != 3);
    char v16 = 2;
    char v17 = 14;
  }
  else
  {
    if (contentType != 3) {
      return;
    }
    uint64_t v9 = 0;
    p_ToneMapConfig = &self->ToneMapConfig;
    self->ToneMapConfig.toneMapMode_Enable = 2;
    do
    {
      unsigned int var15 = a7->var15;
      if (var15 == 1) {
        v12 = (char *)&RGB709toHLGY_coeff;
      }
      else {
        v12 = (char *)&RGB2020toHLGY_coeff;
      }
      if (var15 == 12) {
        v13 = (char *)&RGBP3toHLGY_coeff;
      }
      else {
        v13 = v12;
      }
      int v14 = (int)(float)(*(float *)&v13[v9] * 127.0);
      v15 = (char *)p_ToneMapConfig + v9;
      *((_DWORD *)v15 + 7) = v14;
      *((_DWORD *)v15 + 3) = v14;
      v9 += 4;
    }
    while (v9 != 12);
    char v16 = 0;
    char v17 = 7;
  }
  *(_OWORD *)((char *)&self->ToneMapConfig.var0.toneMapMode2 + 52) = 0u;
  *(_OWORD *)(&self->ToneMapConfig.var0.toneMapMode2 + 6) = 0u;
  p_ToneMapConfig->var0.toneMapMode1.lumaShiftBits = v17;
  p_ToneMapConfig->var0.toneMapMode1.lumaOutputSel = v16;
  p_ToneMapConfig->var0.toneMapMode1.histtype = 0;
  p_ToneMapConfig->var0.toneMapMode1.scaleShiftBits = self->_scaleShiftBits;
  p_ToneMapConfig->var0.toneMapMode1.mixLookupBasis = 0;
  p_ToneMapConfig->var0.toneMapMode1.lumaAvgOffset = 0;
}

- (void)populateDISPColorConfigFixedDegamma:(BOOL)a3 AlgoMode:(int)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 DISPHDRContext:(EngineHDRContext *)a10
{
  p_FixedDegamma = &self->FixedDegamma;
  if (a3)
  {
    *(void *)&p_FixedDegamma->mode = 0x700000001;
    if (a10->contentType == 2)
    {
      int v11 = 11;
      goto LABEL_8;
    }
    if (a10->contentType == 3)
    {
      int v11 = 10;
LABEL_8:
      self->FixedDegamma.curveData.type = v11;
    }
  }
  else
  {
    p_FixedDegamma->mode = 0;
  }
}

- (void)populateDISPColorConfigPreToneMapCSC:(BOOL)a3 AlgoMode:(int)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 DISPHDRContext:(EngineHDRContext *)a10
{
  p_PreToneMapCSC = &self->PreToneMapCSC;
  if (a3)
  {
    *(void *)&p_PreToneMapCSC->mode = 0x200000001;
    if (a10->contentType == 2)
    {
      *(void *)self->PreToneMapCSC.colorMatrix.in_offset = 0;
      self->PreToneMapCSC.colorMatrix.in_offset[2] = 0.0;
      *(void *)self->PreToneMapCSC.colorMatrix.out_offset = 0;
      self->PreToneMapCSC.colorMatrix.out_offset[2] = 0.0;
      *(void *)&long long v18 = *(void *)&a6[1].var17;
      float var22 = a6[1].var22;
      unsigned int var26 = a6[1].var26;
      *((void *)&v18 + 1) = *(void *)&a6[1].var20;
      uint64_t v21 = *(void *)&a6[1].var24;
      self->PreToneMapCSC.colorMatrix.matrix[0] = a6[1].var16;
      *(_OWORD *)&self->PreToneMapCSC.colorMatrix.matrix[1] = v18;
      self->PreToneMapCSC.colorMatrix.matrix[5] = var22;
      *(void *)&self->PreToneMapCSC.colorMatrix.matrix[6] = v21;
      LODWORD(self->PreToneMapCSC.colorMatrix.matrix[8]) = var26;
    }
    else if (a10->contentType == 3)
    {
      uint64_t v11 = 0;
      *(void *)self->PreToneMapCSC.colorMatrix.in_offset = 0;
      self->PreToneMapCSC.colorMatrix.in_offset[2] = 0.0;
      *(void *)self->PreToneMapCSC.colorMatrix.out_offset = 0;
      self->PreToneMapCSC.colorMatrix.out_offset[2] = 0.0;
      v12 = &self->PreToneMapCSC.colorMatrix.matrix[1];
      int64x2_t v13 = (int64x2_t)xmmword_2222D09C0;
      int64x2_t v14 = vdupq_n_s64(2uLL);
      uint64x2_t v15 = (uint64x2_t)vdupq_n_s64(9uLL);
      do
      {
        if (vmovn_s64((int64x2_t)vcgtq_u64(v15, (uint64x2_t)v13)).u8[0])
        {
          if ((v11 & 0x7FFFFFFA) == 0 || v11 == 8) {
            float v17 = 0.083333;
          }
          else {
            float v17 = 0.0;
          }
          *(v12 - 1) = v17;
        }
        if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(9uLL), *(uint64x2_t *)&v13)).i32[1]) {
          float *v12 = 0.0;
        }
        v11 += 2;
        int64x2_t v13 = vaddq_s64(v13, v14);
        v12 += 2;
      }
      while (v11 != 10);
    }
  }
  else
  {
    p_PreToneMapCSC->mode = 0;
  }
}

- (void)getDISPColorConfigOutputScale:(id *)a3 DMData:(id *)a4 tcControl:(ToneCurve_Control *)a5 hdrControl:(id *)a6 DISPHDRContext:(EngineHDRContext *)a7
{
  float v10 = 1.0;
  if (a5->atmEnable && (double targetMaxLinear = a5->targetMaxLinearOutput, targetMaxLinear > a5->diffuseInNits))
  {
    if (a7->processingType == 2) {
      float v10 = a5->targetMaxLinear / targetMaxLinear;
    }
  }
  else
  {
    double targetMaxLinear = a5->targetMaxLinear;
  }
  int processingType = a7->processingType;
  if (processingType == 1)
  {
    if (a7->outputTransferFunction != 16) {
      float v10 = 10000.0 / targetMaxLinear;
    }
    self->_float tmOutputScale = v10 / 100.0;
    Config = GetConfig((HDRConfig *)self);
    if (Config)
    {
      char v16 = GetConfig((HDRConfig *)Config);
      ConfigEntryValue = (unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v16, 0x4Du, 0);
      float tmOutputScale = self->_tmOutputScale;
      float v19 = 21.0;
      if (*ConfigEntryValue)
      {
        float tmOutputScale = tmOutputScale * a5->maxEDRValue;
        self->_float tmOutputScale = tmOutputScale;
      }
    }
    else
    {
      float tmOutputScale = self->_tmOutputScale;
      float v19 = 21.0;
    }
    goto LABEL_31;
  }
  if (processingType != 2) {
    return;
  }
  unsigned int outputTransferFunction = a7->outputTransferFunction;
  if (outputTransferFunction == 13)
  {
    float v10 = 1.0;
    goto LABEL_23;
  }
  if (outputTransferFunction != 16)
  {
    if (BYTE1(a3[1].var52)) {
      goto LABEL_23;
    }
    double v14 = *(float *)&a3[1].var2 / targetMaxLinear;
    goto LABEL_21;
  }
  if (BYTE1(a3[1].var52))
  {
    double v14 = targetMaxLinear / 10000.0;
LABEL_21:
    float v10 = v14;
    goto LABEL_23;
  }
  float v10 = *(float *)&a3[1].var2 / 10000.0;
LABEL_23:
  self->_float tmOutputScale = v10;
  v20 = GetConfig((HDRConfig *)self);
  if (v20)
  {
    uint64_t v21 = GetConfig((HDRConfig *)v20);
    if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v21, 0x4Du, 0))
    {
      if (a7->displayType == 2 && (double Sdiv_nits = a5->tmData.Sdiv_nits, targetMaxLinear > Sdiv_nits)) {
        float v23 = targetMaxLinear / Sdiv_nits * self->_tmOutputScale;
      }
      else {
        float v23 = a5->maxEDRValue * self->_tmOutputScale;
      }
      self->_float tmOutputScale = v23;
    }
  }
  float tmOutputScale = self->_tmOutputScale;
  float v19 = 24.0;
LABEL_31:
  self->_scaleShiftBits = (int)(float)(v19 - ceilf(log2f(tmOutputScale)));
}

- (void)populateDISPColorConfigToneMapLUT:(BOOL)a3 Prefix:(char *)a4 DMConfig:(id *)a5 DMData:(id *)a6 tcControl:(ToneCurve_Control *)a7 hdrControl:(id *)a8 DISPHDRContext:(EngineHDRContext *)a9
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  p_ToneMapLUT = &self->ToneMapLUT;
  if (!a3)
  {
    p_ToneMapLUT->mode = 0;
    return;
  }
  *(void *)&p_ToneMapLUT->mode = 0x300000001;
  self->ToneMapLUT.curveData.type = 9;
  self->ToneMapLUT.curveData.var0.table.count = 754;
  uint64x2_t v15 = (float *)malloc_type_malloc(0xBC8uLL, 0x100004052888210uLL);
  self->ToneMapLUT_xsamples = v15;
  if (!v15)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v24 = logInstanceID;
      }
      else {
        uint64_t v24 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      int v29 = 134217984;
      uint64_t v30 = WORD1(v24);
      v25 = &_os_log_internal;
      v26 = " [1.419.54] #%04llx ToneMapLUT_xsamples memory allocation failed!";
      goto LABEL_41;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v29) = 0;
    v27 = &_os_log_internal;
    v28 = " [1.419.54] ToneMapLUT_xsamples memory allocation failed!";
LABEL_47:
    _os_log_impl(&dword_22224D000, v27, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v29, 2u);
    return;
  }
  p_ToneMapLUT->curveData.var0.table.samples = v15;
  char v16 = (float *)malloc_type_malloc(0xBC8uLL, 0x100004052888210uLL);
  self->ToneMapLUT_ysamples = v16;
  if (!v16)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v24 = logInstanceID;
      }
      else {
        uint64_t v24 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      int v29 = 134217984;
      uint64_t v30 = WORD1(v24);
      v25 = &_os_log_internal;
      v26 = " [1.419.54] #%04llx ToneMapLUT_ysamples memory allocation failed!";
      goto LABEL_41;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v29) = 0;
    v27 = &_os_log_internal;
    v28 = " [1.419.54] ToneMapLUT_ysamples memory allocation failed!";
    goto LABEL_47;
  }
  p_ToneMapLUT->curveData.var0.nonuniformtable.ysamples = v16;
  [(DISPHDRProcessing *)self getDISPColorConfigOutputScale:a5 DMData:a6 tcControl:a7 hdrControl:a8 DISPHDRContext:a9];
  lutInput = self->_lutInput;
  p_ToneMapLUT->curveData.var0.polycurve.segcurvorder[0] = LODWORD(self->_lutInput[753]);
  p_ToneMapLUT->curveData.var0.param.d = self->_scalingFactorTableBuffer[753] * self->_tmOutputScale;
  memcpy(p_ToneMapLUT->curveData.var0.table.samples, self->_lutInput, 0xBC8uLL);
  for (uint64_t i = 0; i != 754; ++i)
    p_ToneMapLUT->curveData.var0.nonuniformtable.ysamples[i] = self->_scalingFactorTableBuffer[i] * self->_tmOutputScale;
  if (a9->contentType != 2) {
    return;
  }
  p_ToneMapMixFactorLUT = &self->ToneMapMixFactorLUT;
  *(void *)&self->ToneMapMixFactorLUT.mode = 0x600000001;
  self->ToneMapMixFactorLUT.curveData.type = 9;
  self->ToneMapMixFactorLUT.curveData.var0.table.count = 754;
  v20 = (float *)malloc_type_malloc(0xBC8uLL, 0x100004052888210uLL);
  self->ToneMapMixFactorLUT_xsamples = v20;
  if (!v20)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v24 = logInstanceID;
      }
      else {
        uint64_t v24 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      int v29 = 134217984;
      uint64_t v30 = WORD1(v24);
      v25 = &_os_log_internal;
      v26 = " [1.419.54] #%04llx ToneMapMixFactorLUT_xsamples memory allocation failed!";
      goto LABEL_41;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v29) = 0;
    v27 = &_os_log_internal;
    v28 = " [1.419.54] ToneMapMixFactorLUT_xsamples memory allocation failed!";
    goto LABEL_47;
  }
  self->ToneMapMixFactorLUT.curveData.var0.table.samples = v20;
  uint64_t v21 = (float *)malloc_type_malloc(0xBC8uLL, 0x100004052888210uLL);
  self->ToneMapMixFactorLUT_ysamples = v21;
  if (!v21)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v24 = logInstanceID;
      }
      else {
        uint64_t v24 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      int v29 = 134217984;
      uint64_t v30 = WORD1(v24);
      v25 = &_os_log_internal;
      v26 = " [1.419.54] #%04llx ToneMapMixFactorLUT_ysamples memory allocation failed!";
LABEL_41:
      _os_log_impl(&dword_22224D000, v25, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v29, 0xCu);
LABEL_42:
      prevLogInstanceID = v24;
      return;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v29) = 0;
    v27 = &_os_log_internal;
    v28 = " [1.419.54] ToneMapMixFactorLUT_ysamples memory allocation failed!";
    goto LABEL_47;
  }
  self->ToneMapMixFactorLUT.curveData.var0.nonuniformtable.ysamples = v21;
  self->ToneMapMixFactorLUT.curveData.var0.polycurve.segcurvorder[0] = LODWORD(self->_lutInput[753]);
  lumaMixFactorTableBuffer = self->_lumaMixFactorTableBuffer;
  p_ToneMapMixFactorLUT->curveData.var0.param.d = lumaMixFactorTableBuffer[753];
  memcpy(p_ToneMapMixFactorLUT->curveData.var0.table.samples, lutInput, 0xBC8uLL);
  ysamples = p_ToneMapMixFactorLUT->curveData.var0.nonuniformtable.ysamples;
  memcpy(ysamples, lumaMixFactorTableBuffer, 0xBC8uLL);
}

- (void)populateDISPColorConfigToneMapParametric:(BOOL)a3 Prefix:(char *)a4 DMConfig:(id *)a5 DMData:(id *)a6 tcControl:(ToneCurve_Control *)a7 hdrControl:(id *)a8 DISPHDRContext:(EngineHDRContext *)a9
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    uint64_t v11 = 14568;
LABEL_36:
    *(_DWORD *)((char *)&self->super.super.isa + v11) = 0;
    return;
  }
  if (a9->contentType == 3)
  {
    p_artisticOOTFParam = &a7->hlgTmParam.artisticOOTFParam;
    *(void *)&self->ToneMapOotf.mode = 0x200000001;
    self->ToneMapOotf.curveData.type = 1;
    self->ToneMapOotf.curveData.var0.table.count = LODWORD(a7->hlgTmParam.systemGamma);
  }
  else
  {
    p_artisticOOTFParam = &a7->hdr10TmParam;
  }
  *(void *)&self->ToneMapOetf.mode = 0x800000001;
  self->ToneMapOetf.curveData.type = 16;
  self->ToneMapOetf.curveData.var0.table.count = a7->tmData.Smax_nits;
  switch(p_artisticOOTFParam->tmCurveParam.curveType)
  {
    case 0:
      p_ToneMapPolyCurve = &self->ToneMapPolyCurve;
      *(void *)&self->ToneMapPolyCurve.mode = 0x300000001;
      self->ToneMapPolyCurve.curveData.type = 12;
      *(void *)&self->ToneMapPolyCurve.curveData.var0.param.gamma = 0x100000004;
      self->ToneMapPolyCurve.curveData.var0.polycurve.segcurvebound[0] = p_artisticOOTFParam->tmCurveParam.param.spl.XsC[0];
      self->ToneMapPolyCurve.curveData.var0.polycurve.segcurvcoeff[0][0] = p_artisticOOTFParam->tmCurveParam.param.spl.linCs[0][0];
      int64x2_t v13 = (char *)&self->ToneMapPolyCurve.curveData.var0.dpccurve + 84;
      self->ToneMapPolyCurve.curveData.var0.polycurve.segcurvcoeff[0][1] = p_artisticOOTFParam->tmCurveParam.param.spl.linCs[0][1];
      unint64_t n = p_artisticOOTFParam->tmCurveParam.param.spl.n;
      if (n > 1)
      {
        uint64_t v15 = 0;
        uint64_t v16 = 144;
        uint64_t v17 = 244;
        do
        {
          long long v18 = &p_ToneMapPolyCurve->mode + v15;
          v18[6] = 3;
          v18[16] = *(&p_artisticOOTFParam->tmCurveParam.param.hdr10Plus.numBezierAnchors + v15);
          float v19 = (int *)((char *)&p_ToneMapPolyCurve->mode + v16);
          _DWORD *v19 = *(_DWORD *)(&p_artisticOOTFParam->on + v17);
          v19[1] = *(_DWORD *)((char *)&p_artisticOOTFParam->Smin_nits + v17);
          v19[2] = *(_DWORD *)((char *)&p_artisticOOTFParam->Smin_nits + v17);
          v19[3] = *(_DWORD *)((char *)&p_artisticOOTFParam->Smin_nits + v17);
          unint64_t v20 = v15 + 2;
          ++v15;
          unint64_t n = p_artisticOOTFParam->tmCurveParam.param.spl.n;
          v16 += 44;
          v17 += 16;
        }
        while (v20 < n);
      }
      self->ToneMapPolyCurve.curveData.var0.polycurve.segcurvorder[n] = 1;
      self->ToneMapPolyCurve.curveData.var0.polycurve.segcurvebound[p_artisticOOTFParam->tmCurveParam.param.spl.n] = 1.0;
      *(float *)&v13[44 * p_artisticOOTFParam->tmCurveParam.param.spl.n] = p_artisticOOTFParam->tmCurveParam.param.spl.linCs[1][0];
      *(float *)&v13[44 * p_artisticOOTFParam->tmCurveParam.param.spl.n + 4] = p_artisticOOTFParam->tmCurveParam.param.spl.linCs[1][1];
      break;
    case 1:
      *(void *)&self->ToneMapPolyCurve.mode = 0x300000001;
      *(void *)&self->ToneMapPolyCurve.curveData.var0.param.gamma = 0x100000005;
      self->ToneMapPolyCurve.curveData.var0.polycurve.segcurvebound[0] = p_artisticOOTFParam->tmCurveParam.param.spl.XsC[0];
      uint64_t v21 = (char *)&self->ToneMapPolyCurve.curveData.var0.dpccurve + 44;
      self->ToneMapPolyCurve.curveData.var0.polycurve.segcurvcoeff[0][0] = p_artisticOOTFParam->tmCurveParam.param.spl.YsC[0]
                                                                         * p_artisticOOTFParam->tm_Tend_C;
      v22 = (char *)&self->ToneMapPolyCurve.curveData.var0.dpccurve + 84;
      self->ToneMapPolyCurve.curveData.type = 12;
      p_a = &self->ToneMapPolyCurve.curveData.var0.param.a;
      self->ToneMapPolyCurve.curveData.var0.polycurve.segcurvcoeff[0][1] = 0.0;
      unint64_t v24 = p_artisticOOTFParam->tmCurveParam.param.spl.n;
      if (v24 >= 2)
      {
        v25 = &self->ToneMapPolyCurve.curveData.var0.dpccurve + 8;
        v26 = (char *)&p_artisticOOTFParam->tmCurveParam.param.hdr10Plus + 1052;
        for (unint64_t i = 1; i < v24; ++i)
        {
          LODWORD(p_a[i]) = 3;
          *(float *)&v21[4 * i] = p_artisticOOTFParam->tmCurveParam.param.spl.XsC[i];
          if (p_artisticOOTFParam->tmCurveParam.param.spl.n)
          {
            unint64_t v28 = 0;
            do
            {
              *((_DWORD *)&v25->alpha + v28) = *(_DWORD *)&v26[4 * v28];
              ++v28;
              unint64_t v24 = p_artisticOOTFParam->tmCurveParam.param.spl.n;
            }
            while (v28 < v24);
          }
          else
          {
            unint64_t v24 = 0;
          }
          v25 = ($C2D1CD5EE3F90B9700D35467A572ACCB *)((char *)v25 + 44);
          v26 += 60;
        }
      }
      LODWORD(p_a[v24]) = 1;
      *(_DWORD *)&v21[4 * p_artisticOOTFParam->tmCurveParam.param.spl.n] = 1065353216;
      *(float *)&v22[44 * p_artisticOOTFParam->tmCurveParam.param.spl.n] = p_artisticOOTFParam->tmCurveParam.param.spl.XsC[p_artisticOOTFParam->tmCurveParam.param.spl.n + 5]
                                                                         * p_artisticOOTFParam->tm_Tend_C;
      *(_DWORD *)&v22[44 * p_artisticOOTFParam->tmCurveParam.param.spl.n + 4] = 0;
      break;
    case 2:
      *(void *)&self->ToneMapPolyCurve.mode = 0x300000001;
      self->ToneMapPolyCurve.curveData.type = 14;
      *(void *)&self->ToneMapPolyCurve.curveData.var0.param.gamma = *(void *)&a5->var37;
      self->ToneMapPolyCurve.curveData.var0.polycurve.segcurvorder[1] = LODWORD(a5->var39);
      self->ToneMapPolyCurve.curveData.var0.polycurve.segcurvorder[2] = 1051372203;
      self->ToneMapPolyCurve.curveData.var0.polycurve.segcurvorder[3] = LODWORD(a5->var36);
      break;
    case 3:
      -[DolbyVisionDM4 getDM4Params:](self->_dm40, "getDM4Params:", v49, a4, a5, a6);
      *(void *)&self->ToneMapPolyCurve.mode = 0x300000001;
      self->ToneMapPolyCurve.curveData.type = 12;
      *(void *)&self->ToneMapPolyCurve.curveData.var0.param.gamma = 0x100000004;
      *(int32x2_t *)((char *)&self->ToneMapPolyCurve.curveData.var0.dpccurve + 84) = vrev64_s32(*(int32x2_t *)&v49[3]);
      self->ToneMapPolyCurve.curveData.var0.polycurve.segcurvorder[1] = 3;
      float v29 = *(float *)v49;
      *(void *)((char *)&self->ToneMapPolyCurve.curveData.var0.dpccurve + 44) = *(void *)v49;
      v51[0] = -v29;
      v51[1] = 1.0;
      PolyGeneric2PolyStd(v51, 2, 3, &v50, self->ToneMapPolyCurve.curveData.var0.polycurve.segcurvcoeff[1]);
    default:
      break;
  }
  if (a9->contentType == 2)
  {
    *(void *)&self->ToneMapMixFactorCurve.mode = 0x600000001;
    self->ToneMapMixFactorCurve.curveData.type = 15;
    self->ToneMapMixFactorCurve.curveData.var0.param.gamma = (float)-p_artisticOOTFParam->lumaMixXMinRatio
                                                           / (float)(p_artisticOOTFParam->lumaMixXMaxRatio
                                                                   - p_artisticOOTFParam->lumaMixXMinRatio);
    self->ToneMapMixFactorCurve.curveData.var0.param.a = 1.0
                                                       / (float)(p_artisticOOTFParam->lumaMixXMaxRatio
                                                               - p_artisticOOTFParam->lumaMixXMinRatio);
    self->ToneMapMixFactorCurve.curveData.var0.polycurve.segcurvorder[1] = LODWORD(p_artisticOOTFParam->lumaMixYMinRatio);
    self->ToneMapMixFactorCurve.curveData.var0.param.c = p_artisticOOTFParam->lumaMixYMaxRatio
                                                       - p_artisticOOTFParam->lumaMixYMinRatio;
    self->ToneMapMixFactorCurve.curveData.var0.polycurve.segcurvorder[3] = LODWORD(p_artisticOOTFParam->lumaMixPower);
  }
  p_ToneMapEdrPolyCurve = &self->ToneMapEdrPolyCurve;
  if (a7->edrAdaptationParam.on)
  {
    *(void *)&p_ToneMapEdrPolyCurve->mode = 0x400000001;
    *(void *)&self->ToneMapEdrPolyCurve.curveData.var0.param.gamma = 0x100000004;
    self->ToneMapEdrPolyCurve.curveData.var0.polycurve.segcurvebound[0] = a7->edrAdaptationParam.Xs[0];
    self->ToneMapEdrPolyCurve.curveData.var0.polycurve.segcurvcoeff[0][0] = a7->edrAdaptationParam.linCs[0][0];
    uint64_t v31 = (char *)&self->ToneMapEdrPolyCurve.curveData.var0.dpccurve + 84;
    self->ToneMapEdrPolyCurve.curveData.type = 12;
    self->ToneMapEdrPolyCurve.curveData.var0.polycurve.segcurvcoeff[0][1] = a7->edrAdaptationParam.linCs[0][1];
    unint64_t v32 = a7->edrAdaptationParam.n;
    if (v32 >= 2)
    {
      uint64_t v33 = 0;
      v34 = &a7->edrAdaptationParam.polyCs[0][1];
      uint64_t v35 = 144;
      do
      {
        v36 = &p_ToneMapEdrPolyCurve->mode + v33;
        v36[6] = 3;
        v36[16] = LODWORD(a7->edrAdaptationParam.Xs[v33 + 1]);
        v37 = (int *)((char *)&p_ToneMapEdrPolyCurve->mode + v35);
        _DWORD *v37 = *((_DWORD *)v34 - 1);
        v37[1] = *(_DWORD *)v34;
        v37[2] = *(_DWORD *)v34;
        int v38 = *(_DWORD *)v34;
        v34 += 4;
        v37[3] = v38;
        unint64_t v39 = v33 + 2;
        ++v33;
        unint64_t v32 = a7->edrAdaptationParam.n;
        v35 += 44;
      }
      while (v39 < v32);
    }
    self->ToneMapEdrPolyCurve.curveData.var0.polycurve.segcurvorder[v32] = 1;
    self->ToneMapEdrPolyCurve.curveData.var0.polycurve.segcurvebound[a7->edrAdaptationParam.n] = 1.0;
    *(void *)&v31[44 * a7->edrAdaptationParam.n] = *(void *)&a7->edrAdaptationParam.linCs[1][0];
  }
  else
  {
    p_ToneMapEdrPolyCurve->mode = 0;
  }
  p_ToneMapAmbPolyCurve = &self->ToneMapAmbPolyCurve;
  if (!a7->ambAdaptationParam.on)
  {
    p_ToneMapAmbPolyCurve->mode = 0;
    self->ToneMapAmbEOTFCurve.mode = 0;
    uint64_t v11 = 16744;
    goto LABEL_36;
  }
  *(void *)&p_ToneMapAmbPolyCurve->mode = 0x500000001;
  *(void *)&self->ToneMapAmbPolyCurve.curveData.var0.param.gamma = 0x100000004;
  self->ToneMapAmbPolyCurve.curveData.var0.polycurve.segcurvebound[0] = a7->ambAdaptationParam.XsC[0];
  self->ToneMapAmbPolyCurve.curveData.var0.polycurve.segcurvcoeff[0][0] = a7->ambAdaptationParam.linCs[0][0];
  self->ToneMapAmbPolyCurve.curveData.type = 12;
  self->ToneMapAmbPolyCurve.curveData.var0.polycurve.segcurvcoeff[0][1] = a7->ambAdaptationParam.linCs[0][1];
  unint64_t v41 = a7->ambAdaptationParam.n;
  if (v41 >= 2)
  {
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    v44 = &a7->ambAdaptationParam.XsC[1];
    uint64_t v45 = 144;
    do
    {
      v46 = &p_ToneMapAmbPolyCurve->mode + v43;
      v46[6] = 3;
      v46[16] = LODWORD(v44[v43]);
      v47 = (int *)((char *)&p_ToneMapAmbPolyCurve->mode + v45);
      _DWORD *v47 = LODWORD(v44[v42 + 19]);
      v47[1] = LODWORD(v44[v42 + 20]);
      v47[2] = LODWORD(v44[v42 + 20]);
      v47[3] = LODWORD(v44[v42 + 20]);
      unint64_t v48 = v43 + 2;
      ++v43;
      unint64_t v41 = a7->ambAdaptationParam.n;
      v45 += 44;
      v42 += 4;
    }
    while (v48 < v41);
  }
  self->ToneMapAmbPolyCurve.curveData.var0.polycurve.segcurvorder[v41] = 1;
  self->ToneMapAmbPolyCurve.curveData.var0.polycurve.segcurvebound[a7->ambAdaptationParam.n] = 1.0;
  *(void *)((char *)&self->ToneMapAmbPolyCurve.curveData.var0.dpccurve + 44 * a7->ambAdaptationParam.n + 84) = *(void *)&a7->ambAdaptationParam.linCs[1][0];
  *(void *)&self->ToneMapAmbEOTFCurve.mode = 0x900000001;
  self->ToneMapAmbEOTFCurve.curveData.type = 7;
  *(void *)&self->ToneMapAmbientCurve.mode = 0xA00000001;
  self->ToneMapAmbientCurve.curveData.type = 13;
  self->ToneMapAmbientCurve.curveData.var0.polycurve.segcurvorder[0] = LODWORD(a7->ambAdaptationParam.aL);
  self->ToneMapAmbientCurve.curveData.var0.table.count = LODWORD(a7->ambAdaptationParam.bL);
  self->ToneMapAmbientCurve.curveData.var0.polycurve.segcurvorder[1] = 1;
}

- (void)populateDISPColorConfigToneMap:(BOOL)a3 AlgoMode:(int)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 DISPHDRContext:(EngineHDRContext *)a10
{
  BOOL v15 = a3;
  if (!a4
    || (Config = GetConfig((HDRConfig *)self)) != 0
    && (long long v18 = GetConfig((HDRConfig *)Config), *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v18, 0x4Bu, 0)))
  {
    [(DISPHDRProcessing *)self populateDISPColorConfigToneMapLUT:v15 Prefix:a5 DMConfig:a6 DMData:a7 tcControl:a8 hdrControl:a9 DISPHDRContext:a10];
  }
  if (a4 == 1)
  {
    -[DISPHDRProcessing populateDISPColorConfigToneMapParametric:Prefix:DMConfig:DMData:tcControl:hdrControl:DISPHDRContext:](self, "populateDISPColorConfigToneMapParametric:Prefix:DMConfig:DMData:tcControl:hdrControl:DISPHDRContext:", v15, a5, a6, a7, a8, a9);
  }
}

- (void)populateDISPColorConfigPostToneMapCSC:(BOOL)a3 AlgoMode:(int)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 DISPHDRContext:(EngineHDRContext *)a10
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    self->PostToneMapCSC.mode = 0;
    return;
  }
  float var42 = 1.0;
  if (a8->atmEnable && (double targetMaxLinear = a8->targetMaxLinearOutput, targetMaxLinear > a8->diffuseInNits))
  {
    if (a10->processingType == 2) {
      float v14 = a8->targetMaxLinear / targetMaxLinear;
    }
    else {
      float v14 = 1.0;
    }
  }
  else
  {
    float v14 = 1.0;
    double targetMaxLinear = a8->targetMaxLinear;
  }
  int processingType = a10->processingType;
  if (processingType == 1)
  {
    if (a10->outputTransferFunction != 16) {
      float v14 = 10000.0 / targetMaxLinear;
    }
    snprintf(__str, 0x3FFuLL, "postRGB2RGB: from DM config, scaler=%f", v14);
    *(void *)&long long v16 = *(void *)&a6[1].var32;
    *(void *)&long long v19 = *(void *)&a6[1].var37;
    float var42 = a6[1].var42;
    DWORD2(v16) = LODWORD(a6[1].var34);
    HIDWORD(v16) = LODWORD(a6[1].var36);
    *((void *)&v19 + 1) = *(void *)&a6[1].var40;
    goto LABEL_31;
  }
  if (processingType == 2)
  {
    long long v16 = xmmword_2222D09D0;
    unsigned int var15 = a9->var15;
    if (var15 == 9)
    {
      targetColorPrimaries = a8->targetColorPrimaries;
      if (targetColorPrimaries == (__CFString *)*MEMORY[0x263F03F20])
      {
        unint64_t v20 = &RGB2020toRGBP3_coeff;
      }
      else
      {
        long long v19 = xmmword_2222D09D0;
        if (targetColorPrimaries != (__CFString *)*MEMORY[0x263F03F08]) {
          goto LABEL_27;
        }
        unint64_t v20 = &RGB2020toRGB709_coeff;
      }
    }
    else
    {
      if (var15 != 12)
      {
        long long v19 = xmmword_2222D09D0;
        goto LABEL_27;
      }
      long long v18 = a8->targetColorPrimaries;
      if (v18 == (__CFString *)*MEMORY[0x263F03F00])
      {
        unint64_t v20 = &RGBP3toRGB2020_coeff;
      }
      else
      {
        long long v19 = xmmword_2222D09D0;
        if (v18 != (__CFString *)*MEMORY[0x263F03F08]) {
          goto LABEL_27;
        }
        unint64_t v20 = &RGBP3toRGB709_coeff;
      }
    }
    long long v16 = *v20;
    long long v19 = v20[1];
    float var42 = *((float *)v20 + 8);
LABEL_27:
    if (a10->outputTransferFunction == 13)
    {
      long long v24 = v19;
      long long v25 = v16;
      Config = GetConfig((HDRConfig *)self);
      if (Config)
      {
        float v23 = GetConfig((HDRConfig *)Config);
        HDRConfig::GetConfigEntryValue((uint64_t)v23, 0x4Du, 0);
      }
      long long v19 = v24;
      long long v16 = v25;
    }
    goto LABEL_31;
  }
  long long v16 = xmmword_2222D09D0;
  long long v19 = xmmword_2222D09D0;
LABEL_31:
  *(void *)&self->PostToneMapCSC.mode = 0x300000001;
  *(void *)self->PostToneMapCSC.colorMatrix.in_offset = 0;
  self->PostToneMapCSC.colorMatrix.in_offset[2] = 0.0;
  *(void *)self->PostToneMapCSC.colorMatrix.out_offset = 0;
  self->PostToneMapCSC.colorMatrix.out_offset[2] = 0.0;
  *(_OWORD *)self->PostToneMapCSC.colorMatrix.matrix = v16;
  *(_OWORD *)&self->PostToneMapCSC.colorMatrix.matrix[4] = v19;
  self->PostToneMapCSC.colorMatrix.matrix[8] = var42;
}

- (void)populateDISPColorConfigToneMapDpc:(BOOL)a3 Prefix:(char *)a4 DMConfig:(id *)a5 DMData:(id *)a6 tcControl:(ToneCurve_Control *)a7 hdrControl:(id *)a8 DISPHDRContext:(EngineHDRContext *)a9
{
  p_DpcCurve = &self->DpcCurve;
  if (a3)
  {
    *(void *)&p_DpcCurve->mode = 0xB00000001;
    self->DpcCurve.curveData.type = 17;
    *(void *)&self->DpcCurve.curveData.var0.param.gamma = *(void *)&a5[1].var44;
    float maxEDRValue = 1.0;
    if (a8->var25 != 1) {
      float maxEDRValue = a7->maxEDRValue;
    }
    self->DpcCurve.curveData.var0.param.b = maxEDRValue;
    self->DpcCurve.curveData.var0.polycurve.segcurvorder[2] = LODWORD(a5[1].var47);
  }
  else
  {
    p_DpcCurve->mode = 0;
  }
}

- (void)populateDISPColorConfig:(id *)a3 DMData:(id *)a4 tcControl:(ToneCurve_Control *)a5 hdrControl:(id *)a6 MSRHDRContext:(EngineHDRContext *)a7
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v15 = 0;
  unsigned __int8 v14 = 0;
  int v13 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  int v18 = 0;
  [(DISPHDRProcessing *)self decideStageStatus:&v13 DMConfig:a3 AlgoMode:&v16 DISPHDRContext:a7];
  [(DISPHDRProcessing *)self populateDISPColorConfigFixedDegamma:v13 AlgoMode:v16 Prefix:&v15 DMConfig:a3 DMData:a4 tcControl:a5 hdrControl:a6 DISPHDRContext:a7];
  [(DISPHDRProcessing *)self populateDISPColorConfigPreToneMapCSC:BYTE1(v13) AlgoMode:HIDWORD(v16) Prefix:&v15 DMConfig:a3 DMData:a4 tcControl:a5 hdrControl:a6 DISPHDRContext:a7];
  [(DISPHDRProcessing *)self populateDISPColorConfigToneMap:BYTE2(v13) AlgoMode:v17 Prefix:&v15 DMConfig:a3 DMData:a4 tcControl:a5 hdrControl:a6 DISPHDRContext:a7];
  [(DISPHDRProcessing *)self populateDISPToneMapConfig:&v15 DMConfig:a3 DMData:a4 tcControl:a5 hdrControl:a6 DISPHDRContext:a7];
  [(DISPHDRProcessing *)self populateDISPColorConfigPostToneMapCSC:HIBYTE(v13) AlgoMode:HIDWORD(v17) Prefix:&v15 DMConfig:a3 DMData:a4 tcControl:a5 hdrControl:a6 DISPHDRContext:a7];
  [(DISPHDRProcessing *)self populateDISPColorConfigToneMapDpc:v14 Prefix:&v15 DMConfig:a3 DMData:a4 tcControl:a5 hdrControl:a6 DISPHDRContext:a7];
}

- (void)hdr10_createLUTFromDMConfig:(id *)a3 DM:(id)a4 TCControl:(ToneCurve_Control *)a5 HDRControl:(id *)a6 TMParam:(_HDR10TMParam *)a7 EdrAdaptationParam:(_EdrAdaptationParam *)a8 AmbAdaptationParam:(_AmbAdaptationParam *)a9
{
  id v14 = a4;
  if ([(ProcessingEngine *)self hdr10_tm_configChanged:a7 HDRControl:a6 EdrAdaptationParam:a8 AmbAdaptationParam:a9])
  {
    [(DISPHDRProcessing *)self hdr10_tm_createLUTFromDMConfig:a3 TMParam:a7 EdrAdaptationParam:a8 AmbAdaptationParam:a9 DM:v14];
    [(ProcessingEngine *)self hdr10_tm_reserveConfig:a7 HDRControl:a6 EdrAdaptationParam:a8 AmbAdaptationParam:a9];
  }
}

- (unint64_t)getTmLutSize
{
  return 754;
}

- (void)getTmLutInput
{
  int v2 = 0;
  lutInput = self->_lutInput;
  float v4 = 0.000000059605;
  float v5 = 0.0;
  do
  {
    if (v2 > 15)
    {
      if (v2 != 16)
      {
        if (v2 != 17)
        {
LABEL_5:
          int v6 = 16;
          goto LABEL_11;
        }
        goto LABEL_8;
      }
      int v6 = 496;
    }
    else
    {
      if (v2)
      {
        if (v2 != 15) {
          goto LABEL_5;
        }
LABEL_8:
        int v6 = 1;
        goto LABEL_11;
      }
      int v6 = 32;
    }
    do
    {
LABEL_11:
      *lutInput++ = v5;
      float v5 = v4 + v5;
      --v6;
    }
    while (v6);
    if (v2 == 15) {
      float v7 = v4;
    }
    else {
      float v7 = 0.0;
    }
    float v5 = v5 - v7;
    if (v2 != 17 && v2 != 15) {
      float v4 = v4 + v4;
    }
    ++v2;
  }
  while (v2 != 18);
}

- (void)hdr10_tm_createLUTFromDMConfig:(id *)a3 TMParam:(_HDR10TMParam *)a4 EdrAdaptationParam:(_EdrAdaptationParam *)a5 AmbAdaptationParam:(_AmbAdaptationParam *)a6 DM:(id)a7
{
  id v17 = [a7 getDolbyVisionDM4];
  hdr10_setScalingFactorTableS_L_NormIn((uint64_t)self->_scalingFactorTableBuffer, (uint64_t)self->_lutInput, 0x2F2uLL, a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a3, v17);
  uint64_t v12 = 0;
  float v13 = (float)((float)((float)(a4->tm_Tmax_C + -0.41928) * 0.3) / 0.1072) + 0.1;
  float v14 = 0.4;
  if (v13 <= 0.4) {
    float v14 = (float)((float)((float)(a4->tm_Tmax_C + -0.41928) * 0.3) / 0.1072) + 0.1;
  }
  if (v13 >= 0.1) {
    float v15 = v14;
  }
  else {
    float v15 = 0.1;
  }
  do
  {
    float v16 = fmaxf(fminf(self->_lutInput[v12], 1.0), 0.0);
    self->_lumaMixFactorTableBuffer[v12++] = v15 + (float)((float)(1.0 - v15) * (float)(v16 * v16));
  }
  while (v12 != 754);
}

- (void)hlg_createLUTFromDMConfig:(id *)a3 DM:(id)a4 HDRControl:(id *)a5 TMParam:(_HLGTMParam *)a6 EdrAdaptationParam:(_EdrAdaptationParam *)a7 AmbAdaptationParam:(_AmbAdaptationParam *)a8 TMMode:(int)a9
{
  id v15 = a4;
  if ([(ProcessingEngine *)self hlg_tm_configChanged:a3 HDRControl:a5 TMParam:a6 EdrAdaptationParam:a7 AmbAdaptationParam:a8])
  {
    [(DISPHDRProcessing *)self hlg_tm_createLUTFromDMConfig:a3 DM:v15 TMParam:a6 EdrAdaptationParam:a7 AmbAdaptationParam:a8 TMMode:a9];
    [(ProcessingEngine *)self hlg_tm_reserveConfig:a3 HDRControl:a5 TMParam:a6 EdrAdaptationParam:a7 AmbAdaptationParam:a8];
  }
}

- (void)hlg_tm_createLUTFromDMConfig:(id *)a3 DM:(id)a4 TMParam:(_HLGTMParam *)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7 TMMode:(int)a8
{
  id v16 = a4;
  float v14 = [v16 getDolbyVisionDM4];
  dm40 = self->_dm40;
  self->_dm40 = v14;

  hlg_setScalingFactorTable((uint64_t)self->_scalingFactorTableBuffer, (uint64_t)self->_lutInput, [(DISPHDRProcessing *)self getTmLutSize], (uint64_t)a3, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, self->_dm40);
}

- (void)setDisplayManagementParametricConfigToneMapBezier:(_ebzCurveParam *)a3 TMSendC:(float)a4
{
  for (uint64_t i = 0; i != 6; ++i)
    a3->XsCA[i] = a3->XsC[i] * a4;
  getBezierAnchors(&a3->n);
  convertBezierToPoly((float *)&a3->n);
}

- (void)setDisplayManagementParametricConfigToneMapSpline:(_splCurveParam *)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unint64_t n = a3->n;
  BOOL v5 = n > 1;
  unint64_t v6 = n - 1;
  if (v5)
  {
    float v7 = a3->polyCs[0];
    calcCubicSplineParam((uint64_t)a3->splCs, a3->XsC[0], a3->YsC[0], a3->MsC[0], a3->XsC[1], a3->YsC[1], a3->MsC[1]);
    v9[0] = -a3->XsC[0];
    v9[1] = 1.0;
    PolyGeneric2PolyStd(v9, 2, 3, v7 - 20, v7);
  }
  float v8 = a3->MsC[0];
  a3->linCs[0][0] = a3->YsC[0] - (float)(v8 * a3->XsC[0]);
  a3->linCs[0][1] = v8;
  a3->linCs[1][0] = a3->YsC[v6] - (float)(a3->MsC[v6] * a3->XsC[v6]);
  a3->linCs[1][1] = a3->MsC[v6];
}

- (void)setDisplayManagementParametricConfigToneMapHLG:(ToneCurve_Control *)a3 HDRControl:(id *)a4
{
  int curveType = a3->hlgTmParam.artisticOOTFParam.tmCurveParam.curveType;
  if (curveType)
  {
    if (curveType == 1)
    {
      *(float *)&double v4 = a3->hlgTmParam.artisticOOTFParam.tm_Send_C;
      -[DISPHDRProcessing setDisplayManagementParametricConfigToneMapBezier:TMSendC:](self, "setDisplayManagementParametricConfigToneMapBezier:TMSendC:", &a3->hlgTmParam.artisticOOTFParam.tmCurveParam.param, a4, v4);
    }
  }
  else
  {
    -[DISPHDRProcessing setDisplayManagementParametricConfigToneMapSpline:](self, "setDisplayManagementParametricConfigToneMapSpline:", &a3->hlgTmParam.artisticOOTFParam.tmCurveParam.param, a4);
  }
}

- (void)setDisplayManagementParametricConfigToneMapHDR10:(ToneCurve_Control *)a3 HDRControl:(id *)a4
{
  HIDWORD(v4) = 1065353216;
  *(_OWORD *)&a3->hdr10TmParam.lumaMixXMinRatio = xmmword_2222D09E0;
  a3->hdr10TmParam.lumaMixPower = 2.0;
  int curveType = a3->hdr10TmParam.tmCurveParam.curveType;
  if (curveType)
  {
    if (curveType == 1)
    {
      *(float *)&double v4 = a3->hdr10TmParam.tm_Send_C;
      -[DISPHDRProcessing setDisplayManagementParametricConfigToneMapBezier:TMSendC:](self, "setDisplayManagementParametricConfigToneMapBezier:TMSendC:", &a3->hdr10TmParam.tmCurveParam.param, a4, v4);
    }
  }
  else
  {
    -[DISPHDRProcessing setDisplayManagementParametricConfigToneMapSpline:](self, "setDisplayManagementParametricConfigToneMapSpline:", &a3->hdr10TmParam.tmCurveParam.param, a4);
  }
}

- (void)setDisplayManagementParametricConfigToneMap:(ToneCurve_Control *)a3 HDRControl:(id *)a4
{
  if (a4->var0 == 2)
  {
    -[DISPHDRProcessing setDisplayManagementParametricConfigToneMapHDR10:HDRControl:](self, "setDisplayManagementParametricConfigToneMapHDR10:HDRControl:", a3);
  }
  else if (a4->var0 == 3)
  {
    -[DISPHDRProcessing setDisplayManagementParametricConfigToneMapHLG:HDRControl:](self, "setDisplayManagementParametricConfigToneMapHLG:HDRControl:", a3);
  }
}

- (void)setDisplayManagementParametricConfig:(ToneCurve_Control *)a3 HDRControl:(id *)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(DISPHDRProcessing *)self setDisplayManagementParametricConfigToneMap:a3 HDRControl:a4];
  unint64_t n = a3->edrAdaptationParam.n;
  BOOL v6 = n > 1;
  unint64_t v7 = n - 1;
  if (v6)
  {
    calcCubicSplineParam((uint64_t)a3->edrAdaptationParam.splCs, a3->edrAdaptationParam.Xs[0], a3->edrAdaptationParam.Ys[0], a3->edrAdaptationParam.Ms[0], a3->edrAdaptationParam.Xs[1], a3->edrAdaptationParam.Ys[1], a3->edrAdaptationParam.Ms[1]);
    float v12 = -a3->edrAdaptationParam.Xs[0];
    int v13 = 1065353216;
    PolyGeneric2PolyStd(&v12, 2, 3, a3->edrAdaptationParam.splCs[0], a3->edrAdaptationParam.polyCs[0]);
  }
  float v8 = a3->edrAdaptationParam.Ms[0];
  a3->edrAdaptationParam.linCs[0][0] = a3->edrAdaptationParam.Ys[0] - (float)(v8 * a3->edrAdaptationParam.Xs[0]);
  a3->edrAdaptationParam.linCs[0][1] = v8;
  a3->edrAdaptationParam.linCs[1][0] = a3->edrAdaptationParam.Ys[v7]
                                     - (float)(a3->edrAdaptationParam.Ms[v7] * a3->edrAdaptationParam.Xs[v7]);
  a3->edrAdaptationParam.linCs[1][1] = a3->edrAdaptationParam.Ms[v7];
  unint64_t v9 = a3->ambAdaptationParam.n;
  BOOL v6 = v9 > 1;
  unint64_t v10 = v9 - 1;
  if (v6)
  {
    calcCubicSplineParam((uint64_t)a3->ambAdaptationParam.splCs, a3->ambAdaptationParam.XsC[0], a3->ambAdaptationParam.YsC[0], a3->ambAdaptationParam.MsC[0], a3->ambAdaptationParam.XsC[1], a3->ambAdaptationParam.YsC[1], a3->ambAdaptationParam.MsC[1]);
    float v12 = -a3->ambAdaptationParam.XsC[0];
    int v13 = 1065353216;
    PolyGeneric2PolyStd(&v12, 2, 3, a3->ambAdaptationParam.splCs[0], a3->ambAdaptationParam.polyCs[0]);
  }
  float v11 = a3->ambAdaptationParam.MsC[0];
  a3->ambAdaptationParam.linCs[0][0] = a3->ambAdaptationParam.YsC[0] - (float)(v11 * a3->ambAdaptationParam.XsC[0]);
  a3->ambAdaptationParam.linCs[0][1] = v11;
  a3->ambAdaptationParam.linCs[1][0] = a3->ambAdaptationParam.YsC[v10]
                                     - (float)(a3->ambAdaptationParam.MsC[v10] * a3->ambAdaptationParam.XsC[v10]);
  a3->ambAdaptationParam.linCs[1][1] = a3->ambAdaptationParam.MsC[v10];
  a3->ambAdaptationParam.TmaxNits = 1.0;
}

- (void).cxx_destruct
{
}

@end