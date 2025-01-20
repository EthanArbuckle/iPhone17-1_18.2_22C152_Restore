@interface DolbyVisionDM4
- (BOOL)GetPrimaries:(unsigned int)a3 Primaries:(int *)a4 Count:(int)a5;
- (BOOL)hasDM4TonemapConfigChanged:(id *)a3 TonemapConfig:(id *)a4 EdrAdaptationParam:(const _EdrAdaptationParam *)a5 AmbAdaptationParam:(const _AmbAdaptationParam *)a6;
- (float)applyL8Trim:(float)a3;
- (float)satMapI:(float)a3 Adm:(float)a4;
- (float)satMapS:(float)a3;
- (float)toneMapI:(float)a3;
- (float)toneMapInterpI:(float)a3;
- (float)toneMapS:(float)a3;
- (id)init:(unint64_t)a3;
- (int)BuildInterpInfo:(int)a3 Xa:(double *)a4 Idxa:(int *)a5 TIdxMax:(int)a6 X2Interp:(double)a7 Alpha:(double *)a8 U16a:(void *)a9 U16L:(void *)a10 U16R:(void *)a11 DmMetaData:(id *)a12;
- (int)DecodeL2L8:(id *)a3 CodeBias2:(id *)a4 TrimData8:(id *)a5 CodeBias8:(id *)a6 Default8:(id *)a7 UseDftLuma:(unsigned __int8)a8 UseDftChroma:(unsigned __int8)a9;
- (void)BuildChromaXInfo:(double)a3 TrimSetAct:(int)a4 Luma:(double *)a5 Idxa:(int *)a6 IdxMax:(int *)a7 X2Interp:(double *)a8 DmMetaData:(id *)a9;
- (void)BuildLumaXInfo:(double)a3 TrimSetAct:(int)a4 Luma:(double *)a5 Idxa:(int *)a6 IdxMax:(int *)a7 X2Interp:(double *)a8 DmMetaData:(id *)a9;
- (void)DmProcess:(int)a3 Height:(int)a4 bufI:(float *)a5 bufU:(float *)a6 bufV:(float *)a7;
- (void)InputMapping:(float *)a3 pX1:(float *)a4 pX2:(float *)a5;
- (void)OutputMapping:(float *)a3 pX1:(float *)a4 pX2:(float *)a5;
- (void)SetL2L8L10:(id *)a3 TrimData8:(id *)a4 Default8:(id *)a5 UseDftLuma:(unsigned __int8)a6 UseDftChroma:(unsigned __int8)a7;
- (void)ToneMapping:(float *)a3 pX1:(float *)a4 pX2:(float *)a5 pAdm:(float *)a6;
- (void)ToneMappingInCtrl:(float *)a3 pX1:(float *)a4 pX2:(float *)a5 pAdm:(float *)a6;
- (void)applyL3:(id *)a3 srcCrushPQ:(float *)a4 srcMidPQ:(float *)a5 srcClipPQ:(float *)a6;
- (void)applyL9:(id *)a3;
- (void)calcToneMapParams;
- (void)calcToneMapParamsBrightAdapted;
- (void)calcToneMapParamsHDR10;
- (void)createTmLuts:(float *)a3 tLutS:(float *)a4 sLutI:(float *)a5 sLutS:(float *)a6 tLutISize:(unint64_t)a7 tLutSSize:(unint64_t)a8 sLutISize:(unint64_t)a9 sLutSSize:(unint64_t)a10;
- (void)createTmLutsEx:(float *)a3 tLutS:(float *)a4 sLutI:(float *)a5 sLutS:(float *)a6 tLutISize:(unint64_t)a7 tLutSSize:(unint64_t)a8 sLutISize:(unint64_t)a9 sLutSSize:(unint64_t)a10 config:(id *)a11 TmParam:(const _DoViTMParam *)a12 EdrAdaptationParam:(const _EdrAdaptationParam *)a13 AmbAdaptationParam:(const _AmbAdaptationParam *)a14 IsDoVi84:(BOOL)a15 HlgOOTFCombined:(BOOL)a16;
- (void)createToneCurve:(float)a3 srcMaxPQ:(float)a4 tgtMinPQ:(float)a5 tgtMaxPQ:(float)a6 srcCrushPQ:(float)a7 srcMidPQ:(float)a8 srcClipPQ:(float)a9 targetMaxLinear:(float)a10 DM_MetaData:(id *)a11 tcCtrl:(ToneCurve_Control *)a12 dm4TmMode:(int)a13;
- (void)dealloc;
- (void)dumpConfigData:(__sFILE *)a3;
- (void)dumpConfigDataToFile:(int)a3;
- (void)getDM4Params:(id *)a3;
- (void)initBt1886Param;
- (void)initColorSpace:(unsigned int)a3 OutClrSpace:(unsigned int)a4 OutTrfFunction:(unsigned int)a5;
- (void)initDmAlgVerInCm:(unsigned int)a3;
- (void)initOutputColorPrimaries:(unsigned int)a3;
- (void)initToneMapMatrices:(float *)a3 tgtRgb2LmsTm:(float *)a4;
- (void)initToneMapMatrices:(unsigned int)a3 outbits:(unsigned int)a4 srcRgb2LmsTm:(float *)a5 tgtRgb2LmsTm:(float *)a6;
- (void)initToneMapParams:(float)a3 srcMaxPQ:(float)a4 tgtMinPQ:(float)a5 tgtMaxPQ:(float)a6 srcCrushPQ:(float)a7 srcMidPQ:(float)a8 srcClipPQ:(float)a9 targetMaxLinear:(float)a10 DM_MetaData:(id *)a11;
- (void)initTrimData:(id *)a3;
- (void)setPseudoTrimDataForHLG:(float)a3;
- (void)updateDM4TonemapConfig:(id *)a3 DMConfig:(id *)a4 EdrAdaptationParam:(const _EdrAdaptationParam *)a5 AmbAdaptationParam:(const _AmbAdaptationParam *)a6;
@end

@implementation DolbyVisionDM4

- (id)init:(unint64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)DolbyVisionDM4;
  v4 = [(DolbyVisionDM4 *)&v14 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  *((void *)v4 + 170) = a3;
  *((_DWORD *)v4 + 219) = -1106788352;
  *(_OWORD *)(v4 + 844) = m33Lms2ItpDbl;
  *(_OWORD *)(v4 + 860) = unk_2222D1E50;
  *((_DWORD *)v4 + 228) = -1096537793;
  *((_OWORD *)v4 + 55) = m33Itp2LmsDbl;
  *((_OWORD *)v4 + 56) = unk_2222D1E74;
  *((_DWORD *)v4 + 201) = 1063469056;
  *(_OWORD *)(v4 + 772) = P3_Rgb2LMSDbl;
  *(_OWORD *)(v4 + 788) = unk_2222D1E98;
  *((_DWORD *)v4 + 210) = 1063682048;
  *(_OWORD *)(v4 + 808) = R2020_Rgb2LMSDbl;
  *(_OWORD *)(v4 + 824) = unk_2222D1EBC;
  *((_DWORD *)v4 + 18) = 4;
  *(_OWORD *)(v4 + 120) = xmmword_2222D1C90;
  *((_DWORD *)v4 + 35) = 0;
  *(_OWORD *)(v4 + 104) = xmmword_2222D1CA0;
  *(_OWORD *)(v4 + 276) = xmmword_2222D1CB0;
  *(void *)(v4 + 292) = 0x3F8000003F800000;
  *(_OWORD *)(v4 + 436) = xmmword_2222D1CC0;
  *(void *)(v4 + 452) = 1056964608;
  *(_OWORD *)(v4 + 356) = 0u;
  *(_OWORD *)(v4 + 372) = 0u;
  *(_OWORD *)(v4 + 388) = 0u;
  *(_OWORD *)(v4 + 404) = 0u;
  *(_OWORD *)(v4 + 420) = 0u;
  long long v6 = *(_OWORD *)(v4 + 276);
  *(void *)(v4 + 612) = *(void *)(v4 + 292);
  *(_OWORD *)(v4 + 596) = v6;
  long long v7 = *(_OWORD *)(v4 + 436);
  *(void *)(v4 + 692) = *(void *)(v4 + 452);
  *(_OWORD *)(v4 + 676) = v7;
  *(void *)(v4 + 620) = 0;
  *(void *)(v4 + 700) = 0xBF000000BF000000;
  *(void *)(v4 + 644) = 0;
  *(_OWORD *)(v4 + 628) = 0u;
  memset_pattern16(v4 + 708, &unk_2222D1D20, 0x18uLL);
  *(void *)(v5 + 668) = 0;
  *(_OWORD *)(v5 + 652) = 0u;
  memset_pattern16(v5 + 732, &unk_2222D1D30, 0x18uLL);
  *(_OWORD *)(v5 + 1084) = xmmword_2222D1CD0;
  *((_DWORD *)v5 + 275) = 15;
  *((_OWORD *)v5 + 69) = 0u;
  *((_OWORD *)v5 + 70) = 0u;
  *((_OWORD *)v5 + 71) = 0u;
  *((_WORD *)v5 + 576) = 0;
  *(_OWORD *)(v5 + 1156) = xmmword_2222D1CD0;
  *((_DWORD *)v5 + 293) = 15;
  *(_OWORD *)(v5 + 1176) = 0u;
  *(_OWORD *)(v5 + 1192) = 0u;
  *(_OWORD *)(v5 + 1208) = 0u;
  *((_WORD *)v5 + 612) = 0;
  v8 = malloc_type_calloc(a3, 4uLL, 0x100004052888210uLL);
  *((void *)v5 + 171) = v8;
  if (!v8) {
    goto LABEL_7;
  }
  v9 = malloc_type_calloc(a3, 4uLL, 0x100004052888210uLL);
  *((void *)v5 + 172) = v9;
  if (v9
    && (v10 = malloc_type_calloc(a3, 4uLL, 0x100004052888210uLL), (*((void *)v5 + 173) = v10) != 0)
    && (v11 = malloc_type_calloc(a3, 4uLL, 0x100004052888210uLL), (*((void *)v5 + 174) = v11) != 0))
  {
    v12 = v5;
  }
  else
  {
LABEL_7:
    v12 = 0;
  }

  return v12;
}

- (void)dealloc
{
  tmLutI = self->tmLutI;
  if (tmLutI)
  {
    free(tmLutI);
    self->tmLutI = 0;
  }
  tmLutS = self->tmLutS;
  if (tmLutS)
  {
    free(tmLutS);
    self->tmLutS = 0;
  }
  smLutI = self->smLutI;
  if (smLutI)
  {
    free(smLutI);
    self->smLutI = 0;
  }
  smLutS = self->smLutS;
  if (smLutS)
  {
    free(smLutS);
    self->smLutS = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)DolbyVisionDM4;
  [(DolbyVisionDM4 *)&v7 dealloc];
}

- (void)initBt1886Param
{
  float tMaxPq = self->tMaxPq;
  BOOL v4 = tMaxPq < 0.00000073096;
  if (tMaxPq < 0.00000073096) {
    float tMaxPq = -(float)(tMaxPq + -0.0000014619);
  }
  float v5 = 10000.0;
  if (v4) {
    float v6 = -10000.0;
  }
  else {
    float v6 = 10000.0;
  }
  float v7 = pow(tMaxPq, 0.0126833133);
  float v8 = fmax((float)((float)(v7 + -0.83594) / (float)((float)(v7 * -18.688) + 18.852)), 0.0);
  float v9 = v6 * powf(v8, 6.2774);
  self->bt1886Param.Lw = v9;
  float tMinPq = self->tMinPq;
  if (tMinPq < 0.00000073096)
  {
    float tMinPq = -(float)(tMinPq + -0.0000014619);
    float v5 = -10000.0;
  }
  float v11 = pow(tMinPq, 0.0126833133);
  float v12 = fmax((float)((float)(v11 + -0.83594) / (float)((float)(v11 * -18.688) + 18.852)), 0.0);
  float v13 = v5 * powf(v12, 6.2774);
  self->bt1886Param.Lb = v13;
  self->bt1886Param.gamma = 2.4;
  self->bt1886Param.gammaR = 0.41667;
  float v14 = powf(v9, 0.41667);
  float v15 = powf(v13, 0.41667);
  float v16 = powf(v14 - v15, 2.4);
  self->bt1886Param.a = v16;
  float v17 = 1.0 / v16;
  self->bt1886Param.aR = v17;
  self->bt1886Param.b = powf(v13 * v17, 0.41667);
}

- (void)applyL3:(id *)a3 srcCrushPQ:(float *)a4 srcMidPQ:(float *)a5 srcClipPQ:(float *)a6
{
  if (a3 && a3->var23.var0)
  {
    LOWORD(v6) = a3->var23.var1;
    *(float *)&unint64_t v6 = (double)v6 * 0.00048828125 + -1.0;
    LOWORD(v7) = a3->var23.var2;
    double v8 = (double)v7 * 0.00048828125 + -1.0;
    *(float *)&double v8 = v8;
    LODWORD(self->pqOffset.min_PQ_offset) = v6;
    self->pqOffset.max_PQ_offset = *(float *)&v8;
    LOWORD(v8) = a3->var23.var3;
    float v9 = (double)*(unint64_t *)&v8 * 0.00048828125 + -1.0;
  }
  else
  {
    *(void *)&self->pqOffset.min_PQ_offset = 0;
    float v9 = 0.0;
    LODWORD(v6) = 0;
  }
  self->pqOffset.avg_PQ_offset = v9;
  *a4 = *(float *)&v6 + *a4;
  *a5 = self->pqOffset.avg_PQ_offset + *a5;
  *a6 = self->pqOffset.max_PQ_offset + *a6;
}

- (void)applyL9:(id *)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (a3 && a3->var28.var0)
  {
    unint64_t var2 = a3->var28.var2;
    self->inputSurface.primariesScale2P = 26;
    if (var2 <= 0x12)
    {
      float v9 = (int32x4_t *)((char *)&V8PrimartTbl + 32 * var2);
    }
    else
    {
      unsigned int var4 = a3->var28.var4;
      v28[0] = a3->var28.var3;
      v28[1] = var4;
      v35.i64[0] = __PAIR64__(var4, v28[0]);
      unsigned int var6 = a3->var28.var6;
      unsigned int var5 = a3->var28.var5;
      unsigned int v30 = var6;
      v35.i64[1] = __PAIR64__(var6, var5);
      unsigned int var8 = a3->var28.var8;
      unsigned int var7 = a3->var28.var7;
      unsigned int v32 = var8;
      v36.i64[0] = __PAIR64__(var8, var7);
      unsigned int var10 = a3->var28.var10;
      unsigned int var9 = a3->var28.var9;
      unsigned int v34 = var10;
      v36.i64[1] = __PAIR64__(var10, var9);
      self->inputSurface.primariesScale2P = 15;
      float v9 = &v35;
      int32x4_t v35 = vshlq_n_s32(v35, 0xBuLL);
      int32x4_t v36 = vshlq_n_s32(v36, 0xBuLL);
    }
  }
  else
  {
    float v9 = &v35;
    [(DolbyVisionDM4 *)self GetPrimaries:self->inputSurface.colorPrimaries Primaries:&v35 Count:8];
    self->inputSurface.primariesScale2P = 26;
  }
  __int16 Rgb2LmsByV8PrimsM33Fxp = GetRgb2LmsByV8PrimsM33Fxp(v9->i32, (uint64_t)v26);
  m33Rgb2Lms = self->inputSurface.m33Rgb2Lms;
  self->inputSurface.m33Rgb2LmsScale2P = APPLY_CT2RIGHT((uint64_t)v26, Rgb2LmsByV8PrimsM33Fxp, 1311, (uint64_t)self->inputSurface.m33Rgb2Lms);
  float v12 = (int *)v27;
  [(DolbyVisionDM4 *)self GetPrimaries:self->outputSurface.colorPrimaries Primaries:v27 Count:8];
  if (self->outputSurface.primariesScale2P <= 25)
  {
    unint64_t v13 = 0;
    uint32x4_t v14 = (uint32x4_t)vdupq_n_s32(26 - self->inputSurface.primariesScale2P);
    do
    {
      *(uint32x4_t *)&v28[v13 / 4] = vshlq_u32((uint32x4_t)v27[v13 / 0x10], v14);
      v13 += 16;
    }
    while (v13 != 32);
    float v12 = v28;
  }
  __int16 v15 = GetRgb2LmsByV8PrimsM33Fxp(v12, (uint64_t)v26);
  int v16 = APPLY_CT2RIGHT((uint64_t)v26, v15, 1311, (uint64_t)self->outputSurface.m33Rgb2Lms);
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  self->outputSurface.m33Rgb2LmsScale2P = v16;
  int32x4_t v19 = v9[1];
  *(int32x4_t *)self->inputSurface.primaries = *v9;
  long long v20 = v27[1];
  *(_OWORD *)self->outputSurface.primaries = v27[0];
  *(_OWORD *)&self->outputSurface.primaries[4] = v20;
  float v21 = (float)(1 << self->inputSurface.m33Rgb2LmsScale2P);
  *(int32x4_t *)&self->inputSurface.primaries[4] = v19;
  do
  {
    uint64_t v22 = 0;
    uint64_t v23 = v17;
    do
    {
      *(float *)&v25[v23] = (float)(*m33Rgb2Lms)[v22] / v21;
      *(float *)&v24[v23] = (float)(*m33Rgb2Lms)[v22 + 36] / (float)(1 << v16);
      ++v22;
      v23 += 4;
    }
    while (v22 != 3);
    ++v18;
    v17 += 12;
    ++m33Rgb2Lms;
  }
  while (v18 != 3);
  [(DolbyVisionDM4 *)self initToneMapMatrices:v25 tgtRgb2LmsTm:v24];
}

- (void)initToneMapParams:(float)a3 srcMaxPQ:(float)a4 tgtMinPQ:(float)a5 tgtMaxPQ:(float)a6 srcCrushPQ:(float)a7 srcMidPQ:(float)a8 srcClipPQ:(float)a9 targetMaxLinear:(float)a10 DM_MetaData:(id *)a11
{
  float v31 = a3;
  self->sMinPq = a3;
  self->sMaxPq = a4;
  self->float tMinPq = a5;
  self->float tMaxPq = a6;
  self->sCrushPq = a7;
  self->sMidPq = a8;
  self->sClipPq = a9;
  self->tMaxLinear = a10;
  if (a3 >= 0.00000073096)
  {
    float v13 = 10000.0;
  }
  else
  {
    a3 = -(float)(a3 + -0.0000014619);
    float v13 = -10000.0;
  }
  float v28 = v13;
  float v14 = powf(a3, 0.012683);
  float v15 = fmax((float)((float)(v14 + -0.83594) / (float)((float)(v14 * -18.688) + 18.852)), 0.0);
  self->sMinTm = v28 * powf(v15, 6.2774);
  float v16 = -(float)(a4 + -0.0000014619);
  if (a4 < 0.00000073096)
  {
    float v17 = -10000.0;
  }
  else
  {
    float v16 = a4;
    float v17 = 10000.0;
  }
  float v29 = v17;
  float v18 = powf(v16, 0.012683);
  float v19 = fmax((float)((float)(v18 + -0.83594) / (float)((float)(v18 * -18.688) + 18.852)), 0.0);
  self->sMaxTm = v29 * powf(v19, 6.2774);
  float v20 = -(float)(a5 + -0.0000014619);
  if (a5 < 0.00000073096)
  {
    float v21 = -10000.0;
  }
  else
  {
    float v20 = a5;
    float v21 = 10000.0;
  }
  float v22 = powf(v20, 0.012683);
  float v23 = fmax((float)((float)(v22 + -0.83594) / (float)((float)(v22 * -18.688) + 18.852)), 0.0);
  self->tMinTm = v21 * powf(v23, 6.2774);
  float v24 = -(float)(a6 + -0.0000014619);
  if (a6 < 0.00000073096)
  {
    float v25 = -10000.0;
  }
  else
  {
    float v24 = a6;
    float v25 = 10000.0;
  }
  float v26 = powf(v24, 0.012683);
  float v27 = fmax((float)((float)(v26 + -0.83594) / (float)((float)(v26 * -18.688) + 18.852)), 0.0);
  self->tMaxTm = v25 * powf(v27, 6.2774);
  self->sMinPqTm = v31;
  self->sMaxPqTm = a4;
  self->tMinPqTm = a5;
  self->tMaxPqTm = a6;
  [(DolbyVisionDM4 *)self initBt1886Param];
}

- (void)initDmAlgVerInCm:(unsigned int)a3
{
  self->dmAlgVerInCm = a3;
}

- (void)initOutputColorPrimaries:(unsigned int)a3
{
  self->outputSurface.colorPrimaries = a3;
}

- (void)BuildLumaXInfo:(double)a3 TrimSetAct:(int)a4 Luma:(double *)a5 Idxa:(int *)a6 IdxMax:(int *)a7 X2Interp:(double *)a8 DmMetaData:(id *)a9
{
  int v11 = 0;
  uint64_t v12 = 0;
  uint64_t v37 = *MEMORY[0x263EF8340];
  *a7 = 0;
  *a8 = 0.0;
  do
  {
    if (a4 != 1)
    {
      float v16 = (char *)a9 + 16 * v12;
      if (!*((_WORD *)v16 + 82)) {
        goto LABEL_24;
      }
      LOWORD(v9) = *((_WORD *)v16 + 83);
      goto LABEL_9;
    }
    if (!a9->var27[v12].var0) {
      goto LABEL_24;
    }
    uint64_t var2 = a9->var27[v12].var2;
    if (var2 <= 0x31)
    {
      uint64_t v14 = DisplayIdxTbl[var2];
      if (v14)
      {
        uint64_t v15 = v11;
        double v9 = (double)*(int *)(v14 + 12) * 0.015625;
        goto LABEL_10;
      }
    }
    uint64_t v23 = 0;
    p_var3 = &a9->var29[0].var3;
    while (!*(p_var3 - 3) || *((unsigned __int8 *)p_var3 - 2) != var2)
    {
      ++v23;
      p_var3 += 14;
      if (v23 == 4) {
        goto LABEL_24;
      }
    }
    if ((v23 & 0x80000000) == 0)
    {
      LOWORD(v9) = *p_var3;
LABEL_9:
      double v9 = (double)*(unint64_t *)&v9;
      uint64_t v15 = v11;
LABEL_10:
      a5[v11] = v9;
      if (v9 >= 1015.0)
      {
        double v9 = v9 * a3;
        unsigned int v17 = (v9 & 0xFFFFFF00) + 256;
        unsigned int v18 = (v9 + 128) & 0xFFFFFF00;
        if (v11 < 1)
        {
LABEL_16:
          v35[v15] = v17;
          v36[v15] = v18;
          a6[v15] = v12;
          int v11 = *a7 + 1;
          *a7 = v11;
        }
        else
        {
          uint64_t v19 = v11;
          float v20 = v35;
          float v21 = v36;
          while (1)
          {
            int v22 = *v21++;
            if (v18 == v22 || v17 == *v20) {
              break;
            }
            ++v20;
            if (!--v19) {
              goto LABEL_16;
            }
          }
        }
      }
    }
LABEL_24:
    ++v12;
  }
  while (v12 != 5);
  double v25 = (float)(self->sMaxPq * 4095.0);
  a5[v11] = v25;
  if (v11 < 1)
  {
LABEL_30:
    a6[v11] = a9->var20;
  }
  else
  {
    double v26 = v25 * a3;
    uint64_t v27 = v11;
    float v28 = v35;
    float v29 = v36;
    while (1)
    {
      int v30 = *v29++;
      if (((v26 + 128) & 0xFFFFFF00) == v30 || (v26 & 0xFFFFFF00) + 256 == *v28) {
        break;
      }
      ++v28;
      if (!--v27) {
        goto LABEL_30;
      }
    }
    *a7 = v11 - 1;
  }
  float tMaxLinear = self->tMaxLinear;
  if (tMaxLinear >= 0.0)
  {
    float v34 = powf(tMaxLinear * 0.0001, 0.1593);
    float v33 = powf((float)((float)(v34 * 18.852) + 0.83594) / (float)((float)(v34 * 18.688) + 1.0), 78.844);
  }
  else
  {
    float v32 = powf(tMaxLinear * -0.0001, 0.1593);
    float v33 = 0.0000014619 - powf((float)((float)(v32 * 18.852) + 0.83594) / (float)((float)(v32 * 18.688) + 1.0), 78.844);
  }
  *a8 = (float)(v33 * 4095.0);
}

- (BOOL)GetPrimaries:(unsigned int)a3 Primaries:(int *)a4 Count:(int)a5
{
  if (a5 >= 8)
  {
    unsigned int v5 = a3 == 12;
    *(int8x16_t *)a4 = vbslq_s8((int8x16_t)vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v5)), 0x1FuLL)), (int8x16_t)xmmword_2222D1CF0, (int8x16_t)xmmword_2222D1CE0);
    *((int8x8_t *)a4 + 2) = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v5), 0x1FuLL)), (int8x8_t)0x3D70A30099999ALL, (int8x8_t)0x2F1A9F008624DDLL);
    *((void *)a4 + 3) = 0x150E5600140346ELL;
  }
  return a5 > 7;
}

- (void)BuildChromaXInfo:(double)a3 TrimSetAct:(int)a4 Luma:(double *)a5 Idxa:(int *)a6 IdxMax:(int *)a7 X2Interp:(double *)a8 DmMetaData:(id *)a9
{
  v10 = a8;
  uint64_t v15 = 0;
  uint64_t v75 = *MEMORY[0x263EF8340];
  int v73 = 0;
  memset(v72, 0, sizeof(v72));
  int v71 = 0;
  p_unsigned int var6 = &a9->var29[0].var6;
  memset(v70, 0, sizeof(v70));
  *a7 = 0;
  *a8 = 0.0;
  do
  {
    if (a4 != 1)
    {
      uint64_t v23 = (char *)a9 + 16 * v15;
      if (!*((_WORD *)v23 + 82)) {
        goto LABEL_29;
      }
      unsigned int v24 = *((unsigned __int16 *)v23 + 83);
      if (v24 < 0x3F7) {
        goto LABEL_29;
      }
      double v25 = (double)v24 / 4095.0;
      float v26 = v25;
      BOOL v27 = v26 < 0.00000073096;
      if (v26 < 0.00000073096) {
        float v26 = -(float)(v26 + -0.0000014619);
      }
      float v28 = flt_2222D1868[v27];
      float v29 = powf(v26, 0.012683);
      float v30 = fmax((float)((float)(v29 + -0.83594) / (float)((float)(v29 * -18.688) + 18.852)), 0.0);
      float v31 = powf(v30, 6.2774);
      double ChromaDist = (double)FindChromaDist(dword_2222D1448, (float)(v28 * v31), (int)v25);
      goto LABEL_16;
    }
    if (!a9->var27[v15].var0) {
      goto LABEL_29;
    }
    uint64_t var2 = a9->var27[v15].var2;
    if (var2 <= 0x31)
    {
      unsigned int v18 = (unsigned int *)DisplayIdxTbl[var2];
      if (v18)
      {
        int v19 = v18[3];
        if (v19 < 1015) {
          goto LABEL_29;
        }
        uint64_t v20 = v18[4];
        if (v20 <= 0x12) {
          float v21 = (int *)((char *)&V8PrimartTbl + 32 * v20);
        }
        else {
          float v21 = 0;
        }
        double ChromaDist = (double)(int)FindChromaDist(v21, v18[2], v19);
        goto LABEL_16;
      }
    }
    uint64_t v40 = 0;
    v41 = (int16x8_t *)p_var6;
    while (!v41[-1].i16[2] || v41[-1].u8[8] != var2)
    {
      ++v40;
      v41 = (int16x8_t *)((char *)v41 + 28);
      if (v40 == 4) {
        goto LABEL_29;
      }
    }
    if ((v40 & 0x80000000) == 0)
    {
      unsigned int v42 = v41[-1].u16[5];
      if (v42 >= 0x3F7)
      {
        v67 = v10;
        float v43 = (float)v42 * 0.00024414;
        BOOL v44 = v43 < 0.00000073096;
        if (v43 < 0.00000073096) {
          float v43 = -(float)(v43 + -0.0000014619);
        }
        float v45 = powf(v43, 0.012683);
        float v46 = fmax((float)((float)(v45 + -0.83594) / (float)((float)(v45 * -18.688) + 18.852)), 0.0);
        float v47 = powf(v46, 6.2774);
        unint64_t v48 = v41[-1].u8[14];
        if (v48 < 0x13)
        {
          v50 = (int *)((char *)&V8PrimartTbl + 32 * v48);
        }
        else
        {
          int32x4_t v49 = vshll_high_n_s16(*v41, 0xBuLL);
          v74[0] = vshll_n_s16(*(int16x4_t *)v41->i8, 0xBuLL);
          v74[1] = v49;
          v50 = (int *)v74;
        }
        double ChromaDist = (double)(int)FindChromaDist(v50, vcvts_n_u32_f32(flt_2222D1868[v44] * v47, 0x12uLL), v42 << 6);
        v10 = v67;
LABEL_16:
        uint64_t v32 = *a7;
        a5[v32] = ChromaDist;
        double v33 = ChromaDist * a3;
        unsigned int v34 = (v33 & 0xFFFFFF00) + 256;
        unsigned int v35 = (v33 + 128) & 0xFFFFFF00;
        if ((int)v32 < 1)
        {
LABEL_21:
          *((_DWORD *)v70 + v32) = v34;
          *((_DWORD *)v72 + v32) = v35;
          a6[v32] = v15;
          ++*a7;
        }
        else
        {
          uint64_t v36 = v32;
          uint64_t v37 = v70;
          v38 = (int *)v72;
          while (1)
          {
            int v39 = *v38++;
            if (v35 == v39 || v34 == *v37) {
              break;
            }
            ++v37;
            if (!--v36) {
              goto LABEL_21;
            }
          }
        }
      }
    }
LABEL_29:
    ++v15;
  }
  while (v15 != 5);
  float sMaxTm = self->sMaxTm;
  unsigned int v52 = vcvts_n_u32_f32(sMaxTm, 0x12uLL);
  if (sMaxTm <= 10000.0) {
    unsigned int v53 = v52;
  }
  else {
    unsigned int v53 = -1673527296;
  }
  double v54 = (double)FindChromaDist(self->inputSurface.primaries, v53, vcvts_n_s32_f32(self->sMaxPqTm, 0x12uLL));
  uint64_t v55 = *a7;
  a5[v55] = v54;
  if ((int)v55 < 1)
  {
LABEL_45:
    a6[v55] = a9->var20;
  }
  else
  {
    double v56 = v54 * a3;
    uint64_t v57 = v55;
    v58 = v70;
    v59 = (int *)v72;
    while (1)
    {
      int v60 = *v59++;
      if (((v56 + 128) & 0xFFFFFF00) == v60 || (v56 & 0xFFFFFF00) + 256 == *v58) {
        break;
      }
      ++v58;
      if (!--v57) {
        goto LABEL_45;
      }
    }
    *a7 = v55 - 1;
  }
  float tMaxLinear = self->tMaxLinear;
  if (tMaxLinear >= 0.0)
  {
    float v64 = powf(tMaxLinear * 0.0001, 0.1593);
    float v63 = powf((float)((float)(v64 * 18.852) + 0.83594) / (float)((float)(v64 * 18.688) + 1.0), 78.844);
  }
  else
  {
    float v62 = powf(tMaxLinear * -0.0001, 0.1593);
    float v63 = 0.0000014619 - powf((float)((float)(v62 * 18.852) + 0.83594) / (float)((float)(v62 * 18.688) + 1.0), 78.844);
  }
  unsigned int v65 = vcvts_n_u32_f32(tMaxLinear, 0x12uLL);
  if (tMaxLinear <= 10000.0) {
    unsigned int v66 = v65;
  }
  else {
    unsigned int v66 = -1673527296;
  }
  double *v10 = (double)FindChromaDist(self->outputSurface.primaries, v66, vcvts_n_s32_f32(v63, 0x12uLL));
}

- (int)BuildInterpInfo:(int)a3 Xa:(double *)a4 Idxa:(int *)a5 TIdxMax:(int)a6 X2Interp:(double)a7 Alpha:(double *)a8 U16a:(void *)a9 U16L:(void *)a10 U16R:(void *)a11 DmMetaData:(id *)a12
{
  SortAscend(a4, (int32x2_t *)a5, a6);
  if (!a6 || *a4 > a7)
  {
    int v20 = 0;
    int v21 = 0;
    if (a3) {
      goto LABEL_4;
    }
LABEL_27:
    uint64_t v46 = a5[v20];
    unsigned int var19 = a12->var19;
    uint64_t v48 = a5[v21];
    int32x4_t v49 = &a12->var22[v48];
    if (v48 == var19) {
      int32x4_t v49 = ($C7EF1C30BD66CD38C86D0B0FDFDFB4A1 *)a9;
    }
    BOOL v50 = v46 == var19;
    if (v46 == var19) {
      v51 = ($C7EF1C30BD66CD38C86D0B0FDFDFB4A1 *)a9;
    }
    else {
      v51 = &a12->var22[v46];
    }
    *a10 = v51;
    *a11 = v49;
    if (!v50 && v48 != var19) {
      goto LABEL_40;
    }
    if (v21 != v20)
    {
      *((_WORD *)a9 + 2) = (int)(((float)((float)(self->default8.trimSlope - self->codeBias8.trimSlope) * 4096.0)
                                + -2048.0)
                               * 2.0
                               + 2048.0
                               + 0.5);
      *((_WORD *)a9 + 3) = (int)(((float)((float)(self->default8.trimOffset - self->codeBias8.trimOffset) * 4096.0)
                                + -2048.0)
                               * 2.0
                               + 2048.0
                               + 0.5);
      *((_WORD *)a9 + 4) = (int)(((float)((float)(self->default8.trimPower - self->codeBias8.trimPower) * 4096.0)
                                + -2048.0)
                               * 2.0
                               + 2048.0
                               + 0.5);
      *((_WORD *)a9 + 5) = (int)((float)((float)(self->default8.trimChromaWeight - self->codeBias8.trimChromaWeight)
                                       * 4096.0)
                               + 0.5);
      *((_WORD *)a9 + 6) = (int)((float)((float)(self->default8.trimSaturationGain - self->codeBias8.trimSaturationGain)
                                       * 4096.0)
                               + 0.5);
      *((_WORD *)a9 + 7) = (int)((float)(self->default8.msWeight - self->codeBias8.msWeight) * 2048.0 + 0.5);
    }
LABEL_39:
    int result = 1;
    goto LABEL_41;
  }
  int v21 = (a6 & ~(a6 >> 31)) + 1;
  float v43 = a4 + 1;
  int v20 = -1;
  uint64_t v44 = a6 & ~(a6 >> 31);
  while (v44)
  {
    double v45 = *v43++;
    ++v20;
    --v44;
    if (v45 > a7)
    {
      int v21 = v20 + 1;
      goto LABEL_24;
    }
  }
  int v20 = a6 & ~(a6 >> 31);
LABEL_24:
  if (v21 > a6) {
    int v21 = v20;
  }
  if (!a3) {
    goto LABEL_27;
  }
LABEL_4:
  if (a3 == 1)
  {
    int v22 = a5[v20];
    int v23 = a5[v21];
    unsigned int var20 = a12->var20;
    double v25 = &a12->var27[v23];
    if (v23 == var20) {
      double v25 = ($D23273F4A1B449B3C1F6202688E0D0C3 *)a9;
    }
    _ZF = v22 == var20;
    BOOL v27 = v22 == var20 ? a9 : &a12->var27[v22];
    *a10 = v27;
    *a11 = v25;
    if (_ZF || v23 == var20)
    {
      if (v21 != v20)
      {
        uint64_t v29 = 0;
        float32x4_t v30 = vsubq_f32(*(float32x4_t *)&self->default8.trimSlope, *(float32x4_t *)&self->codeBias8.trimSlope);
        float32x4_t v31 = vsubq_f32(*(float32x4_t *)&self->default8.trimSaturationGain, *(float32x4_t *)&self->codeBias8.trimSaturationGain);
        v55.val[1] = (int8x16_t)vcvt_hight_f64_f32(v31);
        v55.val[2] = (int8x16_t)vcvt_hight_f64_f32(v30);
        v55.val[3] = (int8x16_t)vdupq_n_s64(0x40B0000000000000uLL);
        __asm { FMOV            V5.2D, #0.5 }
        float64x2_t v36 = vmlaq_f64(_Q5, (float64x2_t)v55.val[3], vcvtq_f64_f32(*(float32x2_t *)v30.f32));
        float64x2_t v37 = vmlaq_f64(_Q5, (float64x2_t)xmmword_2222D1D00, vcvtq_f64_f32(*(float32x2_t *)v31.f32));
        float64x2_t v38 = vmlaq_f64(_Q5, (float64x2_t)v55.val[3], (float64x2_t)v55.val[2]);
        v55.val[0] = (int8x16_t)vcvtq_s64_f64(vmlaq_f64(_Q5, (float64x2_t)v55.val[3], (float64x2_t)v55.val[1]));
        *(int32x2_t *)v55.val[3].i8 = vmovn_s64((int64x2_t)v55.val[0]);
        *(int32x2_t *)v55.val[1].i8 = vmovn_s64(vcvtq_s64_f64(v38));
        *(int32x2_t *)v55.val[2].i8 = vmovn_s64(vcvtq_s64_f64(v37));
        *(int32x2_t *)v55.val[0].i8 = vmovn_s64(vcvtq_s64_f64(v36));
        *(int8x16_t *)((char *)a9 + 6) = vqtbl4q_s8(v55, (int8x16_t)xmmword_2222D1D10);
        hueVector = self->codeBias8.hueVector;
        do
        {
          uint64_t v40 = (char *)a9 + v29 + 22;
          *uint64_t v40 = (int)((float)(*(hueVector - 26) - *(hueVector - 6)) * 128.0 + 0.5);
          float v41 = *(hueVector - 20);
          float v42 = *hueVector++;
          v40[6] = (int)((float)(v41 - v42) * 256.0 + 0.5);
          ++v29;
        }
        while (v29 != 6);
      }
      goto LABEL_39;
    }
  }
LABEL_40:
  int result = 0;
LABEL_41:
  double v54 = 0.0;
  if (v20 != v21) {
    double v54 = (a7 - a4[v20]) / (a4[v21] - a4[v20]);
  }
  *a8 = v54;
  return result;
}

- (int)DecodeL2L8:(id *)a3 CodeBias2:(id *)a4 TrimData8:(id *)a5 CodeBias8:(id *)a6 Default8:(id *)a7 UseDftLuma:(unsigned __int8)a8 UseDftChroma:(unsigned __int8)a9
{
  if (self->dmAlgVerInCm > 3)
  {
    if (a8)
    {
      if (a9) {
        goto LABEL_15;
      }
    }
    else
    {
      float v13 = a5->var0 * 0.000244140625 + a6->var0;
      float v14 = a5->var1 * 0.000244140625 + a6->var1;
      float v15 = a5->var2 * 0.000244140625 + a6->var2;
      a5->unsigned int var5 = (float)(a5->var5 * 0.00048828) + a6->var5;
      *(float32x2_t *)&a5->unsigned int var6 = vcvt_f32_f64(vaddq_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)&a5->var6), (float64x2_t)vdupq_n_s64(0x3F30000000000000uLL)), vcvtq_f64_f32(*(float32x2_t *)&a6->var6)));
      a5->float var0 = (float)((float)(v13 + -1.0) * 2.0) + 1.0;
      a5->float var1 = v14 + v14;
      a5->float var2 = (float)((float)(v15 + -1.0) * 2.0) + 1.0;
      if (a9) {
        goto LABEL_15;
      }
    }
    uint64_t v16 = 0;
    *(float32x2_t *)&a5->var3 = vcvt_f32_f64(vaddq_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)&a5->var3), (float64x2_t)vdupq_n_s64(0x3F30000000000000uLL)), vcvtq_f64_f32(*(float32x2_t *)&a6->var3)));
    unsigned int var8 = a6->var8;
    unsigned int var9 = a5->var9;
    do
    {
      int v19 = &var9[v16];
      float v20 = var9[v16 - 6] * 0.0078125 + var8[v16];
      *(v19 - 6) = v20;
      float v21 = var9[v16] * 0.00390625 + var8[v16 + 6];
      *int v19 = v21;
      ++v16;
    }
    while (v16 != 6);
  }
  else
  {
    if (a8)
    {
      if (a9) {
        goto LABEL_15;
      }
    }
    else
    {
      *(void *)&a5->float var0 = *(void *)&a3->var0;
      float v9 = a3->var2 * 0.000244140625 + a4->var2;
      a5->float var2 = v9;
      a5->unsigned int var5 = (float)(a3->var5 * 0.00048828) + a4->var5;
      *(void *)&a5->unsigned int var6 = *(void *)&a7->var6;
      if (a9) {
        goto LABEL_15;
      }
    }
    uint64_t v10 = 0;
    *(float32x2_t *)&a5->var3 = vadd_f32(vmul_f32(*(float32x2_t *)&a3->var3, (float32x2_t)vdup_n_s32(0x39800000u)), *(float32x2_t *)&a4->var3);
    int v11 = a7->var9;
    do
    {
      uint64_t v12 = &a5->var8[v10];
      float *v12 = v11[v10 - 6];
      v12[6] = v11[v10++];
    }
    while (v10 != 6);
  }
LABEL_15:
  if (a8)
  {
    if (a9) {
      goto LABEL_17;
    }
LABEL_34:
    a5->unsigned int var4 = a5->var4 + (float)self->satGainAdj;
    goto LABEL_17;
  }
  float v23 = 0.0;
  float v24 = 2.0;
  float var1 = a5->var1;
  if (a5->var0 <= 2.0) {
    float var0 = a5->var0;
  }
  else {
    float var0 = 2.0;
  }
  if (a5->var0 >= 0.0) {
    float v27 = var0;
  }
  else {
    float v27 = 0.0;
  }
  float v28 = 1.0;
  if (var1 <= 1.0) {
    float v28 = a5->var1;
  }
  if (var1 >= -1.0) {
    float v29 = v28;
  }
  else {
    float v29 = -1.0;
  }
  a5->float var1 = v29;
  float var2 = a5->var2;
  if (var2 <= 2.0) {
    float v24 = a5->var2;
  }
  if (var2 >= 0.0) {
    float v23 = v24;
  }
  a5->float var0 = v27 + (float)self->slopeAdj;
  a5->float var2 = v23 + (float)self->powerAdj;
  a5->unsigned int var6 = a5->var6 + (float)self->tMidContrastAdj;
  if (!a9) {
    goto LABEL_34;
  }
LABEL_17:
  ClampL8(&a5->var0);
  return 0;
}

- (void)SetL2L8L10:(id *)a3 TrimData8:(id *)a4 Default8:(id *)a5 UseDftLuma:(unsigned __int8)a6 UseDftChroma:(unsigned __int8)a7
{
  if (a6)
  {
    float var0 = a5->var0;
    float var1 = a5->var1;
    float var2 = a5->var2;
    float var6 = a5->var6;
    a4->unsigned int var5 = a5->var5;
    a4->unsigned int var7 = a5->var7;
    float v11 = -1.0;
    float v12 = 1.0;
    float v13 = (float)((float)(var0 + -1.0) * 2.0) + 1.0;
    float v14 = var1 + var1;
    float v15 = (float)((float)(var2 + -1.0) * 2.0) + 1.0;
    float v16 = 0.0;
    float v17 = 0.0;
    if (v13 >= 0.0)
    {
      float v17 = 2.0;
      if (v13 <= 2.0) {
        float v17 = v13;
      }
    }
    if (v14 <= 1.0) {
      float v12 = v14;
    }
    if (v14 >= -1.0) {
      float v11 = v12;
    }
    a4->float var1 = v11;
    if (v15 >= 0.0)
    {
      float v16 = 2.0;
      if (v15 <= 2.0) {
        float v16 = v15;
      }
    }
    a4->float var0 = v17 + (float)self->slopeAdj;
    a4->float var2 = v16 + (float)self->powerAdj;
    a4->float var6 = var6 + (float)self->tMidContrastAdj;
  }
  if (a7)
  {
    uint64_t v18 = 0;
    float var4 = a5->var4;
    a4->var3 = a5->var3;
    a4->float var4 = var4;
    unsigned int var9 = a5->var9;
    do
    {
      float v21 = &a4->var8[v18];
      *float v21 = var9[v18 - 6];
      v21[6] = var9[v18++];
    }
    while (v18 != 6);
    a4->float var4 = var4 + (float)self->satGainAdj;
  }
  ClampL8(&a4->var0);
}

- (void)initTrimData:(id *)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  if (self->dmAlgVerInCm < 4)
  {
    unsigned int v61 = 0;
    double v59 = 0.0;
    double v60 = 0.0;
    uint64_t v57 = 0;
    v58 = 0;
    [(DolbyVisionDM4 *)self BuildLumaXInfo:0 TrimSetAct:v62 Luma:v63 Idxa:&v61 IdxMax:&v60 X2Interp:a3 DmMetaData:64.0156288];
    int v18 = [(DolbyVisionDM4 *)self BuildInterpInfo:0 Xa:v62 Idxa:v63 TIdxMax:v61 X2Interp:&v59 Alpha:v64 U16a:v60 U16L:&v58 U16R:&v57 DmMetaData:a3];
    if (v58 == v57 && v18)
    {
      [(DolbyVisionDM4 *)self BuildChromaXInfo:0 TrimSetAct:v62 Luma:v63 Idxa:&v61 IdxMax:&v60 X2Interp:a3 DmMetaData:1.0];
      int v19 = [(DolbyVisionDM4 *)self BuildInterpInfo:0 Xa:v62 Idxa:v63 TIdxMax:v61 X2Interp:&v59 Alpha:v64 U16a:v60 U16L:&v58 U16R:&v57 DmMetaData:a3];
      int v22 = v57;
      float v23 = v58;
      if (v58 == v57 && v19)
      {
        uint64_t v11 = 1;
LABEL_20:
        uint64_t v17 = 1;
        goto LABEL_26;
      }
      double v34 = v59;
      LOWORD(v20) = v58[5];
      double v35 = (double)v20;
      LOWORD(v21) = v57[5];
      *(double *)&unint64_t v36 = (double)v21 - v35;
      double v37 = v35 + *(double *)&v36 * v59;
      *(float *)&double v37 = v37;
      self->trimData2.trimChromaWeight = *(float *)&v37;
      LOWORD(v37) = v23[6];
      LOWORD(v36) = v22[6];
      double v38 = (double)*(unint64_t *)&v37 + ((double)v36 - (double)*(unint64_t *)&v37) * v34;
      uint64_t v11 = 1;
    }
    else
    {
      InterpLumaTrim2(v58, v57, v64, (uint64_t)&self->trimData2, v59);
      [(DolbyVisionDM4 *)self BuildChromaXInfo:0 TrimSetAct:v62 Luma:v63 Idxa:&v61 IdxMax:&v60 X2Interp:a3 DmMetaData:1.0];
      int v29 = [(DolbyVisionDM4 *)self BuildInterpInfo:0 Xa:v62 Idxa:v63 TIdxMax:v61 X2Interp:&v59 Alpha:v64 U16a:v60 U16L:&v58 U16R:&v57 DmMetaData:a3];
      uint64_t v32 = v57;
      double v33 = v58;
      if (v58 == v57 && v29)
      {
        uint64_t v11 = 0;
        goto LABEL_20;
      }
      uint64_t v11 = 0;
      double v39 = v59;
      LOWORD(v30) = v58[5];
      double v40 = (double)v30;
      LOWORD(v31) = v57[5];
      *(double *)&unint64_t v41 = (double)v31 - v40;
      double v42 = v40 + *(double *)&v41 * v59;
      *(float *)&double v42 = v42;
      self->trimData2.trimChromaWeight = *(float *)&v42;
      LOWORD(v42) = v33[6];
      LOWORD(v41) = v32[6];
      double v38 = (double)*(unint64_t *)&v42 + ((double)v41 - (double)*(unint64_t *)&v42) * v39;
    }
    uint64_t v17 = 0;
    float v43 = v38;
    self->trimData2.trimSaturationGain = v43;
    goto LABEL_26;
  }
  for (uint64_t i = 0; i != 140; i += 20)
    DisplayIdxTbl[*(unsigned __int16 *)((char *)&DisplayTbl + i)] = (char *)&DisplayTbl + i;
  unsigned int v61 = 0;
  double v59 = 0.0;
  double v60 = 0.0;
  uint64_t v57 = 0;
  v58 = 0;
  [(DolbyVisionDM4 *)self BuildLumaXInfo:1 TrimSetAct:v62 Luma:v64 Idxa:&v61 IdxMax:&v60 X2Interp:a3 DmMetaData:64.0156288];
  int v7 = [(DolbyVisionDM4 *)self BuildInterpInfo:1 Xa:v62 Idxa:v64 TIdxMax:v61 X2Interp:&v59 Alpha:v63 U16a:v60 U16L:&v58 U16R:&v57 DmMetaData:a3];
  if (v58 != v57 || !v7)
  {
    InterpLumaTrim8(v58, v57, v59, v8, v9, v10, v6, (uint64_t)&self->trimData8);
    uint64_t v17 = 1;
    [(DolbyVisionDM4 *)self BuildChromaXInfo:1 TrimSetAct:v62 Luma:v64 Idxa:&v61 IdxMax:&v60 X2Interp:a3 DmMetaData:1.0];
    int v25 = [(DolbyVisionDM4 *)self BuildInterpInfo:1 Xa:v62 Idxa:v64 TIdxMax:v61 X2Interp:&v59 Alpha:v63 U16a:v60 U16L:&v58 U16R:&v57 DmMetaData:a3];
    if (v58 == v57 && v25)
    {
      uint64_t v11 = 0;
      goto LABEL_26;
    }
    InterpChromaTrim8((uint64_t)v58, (uint64_t)v57, v59, v26, v27, v28, v24, &self->trimData8.trimSlope);
    uint64_t v11 = 0;
    goto LABEL_23;
  }
  uint64_t v11 = 1;
  [(DolbyVisionDM4 *)self BuildChromaXInfo:1 TrimSetAct:v62 Luma:v64 Idxa:&v61 IdxMax:&v60 X2Interp:a3 DmMetaData:1.0];
  int v13 = [(DolbyVisionDM4 *)self BuildInterpInfo:1 Xa:v62 Idxa:v64 TIdxMax:v61 X2Interp:&v59 Alpha:v63 U16a:v60 U16L:&v58 U16R:&v57 DmMetaData:a3];
  if (v58 != v57 || (uint64_t v17 = 1, !v13))
  {
    InterpChromaTrim8((uint64_t)v58, (uint64_t)v57, v59, v14, v15, v16, v12, &self->trimData8.trimSlope);
LABEL_23:
    uint64_t v17 = 0;
  }
LABEL_26:
  LOBYTE(v56) = v17;
  [(DolbyVisionDM4 *)self DecodeL2L8:&self->trimData2 CodeBias2:&self->codeBias2 TrimData8:&self->trimData8 CodeBias8:&self->codeBias8 Default8:&self->default8 UseDftLuma:v11 UseDftChroma:v56];
  if (v17 | v11) {
    [(DolbyVisionDM4 *)self SetL2L8L10:&self->trimData2 TrimData8:&self->trimData8 Default8:&self->default8 UseDftLuma:v11 UseDftChroma:v17];
  }
  float sMidPq = self->sMidPq;
  if (sMidPq >= 0.000244200244)
  {
    if (sMidPq > 0.9997558) {
      float sMidPq = 0.99976;
    }
  }
  else
  {
    float sMidPq = 0.0002442;
  }
  float clipTrim = self->trimData8.clipTrim;
  float sClipPq = self->sClipPq;
  self->float sMidPq = sMidPq;
  float sCrushPq = self->sCrushPq;
  if (sCrushPq >= 0.0)
  {
    double v48 = sMidPq;
    if (v48 + -0.000244200244 < sCrushPq) {
      float sCrushPq = v48 + -0.000244200244;
    }
  }
  else
  {
    double v48 = sMidPq;
    float sCrushPq = 0.0;
  }
  float v49 = clipTrim + sClipPq;
  self->float sCrushPq = sCrushPq;
  double v50 = v49;
  double v51 = v48 + 0.000244200244;
  if (v49 >= 1.0) {
    float v49 = 1.0;
  }
  if (v51 <= v50)
  {
    float v53 = v49;
  }
  else
  {
    float v52 = v51;
    float v53 = v52;
  }
  self->float sClipPq = v53;
  long long v54 = *(_OWORD *)&self->trimData8.trimSlope;
  *(_OWORD *)&self->trimData.trimSaturationGain = *(_OWORD *)&self->trimData8.trimSaturationGain;
  long long v55 = *(_OWORD *)&self->trimData8.saturationVector[4];
  *(_OWORD *)self->trimData.saturationVector = *(_OWORD *)self->trimData8.saturationVector;
  *(_OWORD *)&self->trimData.saturationVector[4] = v55;
  *(_OWORD *)&self->trimData.hueVector[2] = *(_OWORD *)&self->trimData8.hueVector[2];
  *(_OWORD *)&self->trimData.trimSlope = v54;
}

- (void)setPseudoTrimDataForHLG:(float)a3
{
  float v3 = (self->codeBias8.trimSlope + 0.600097656 + -1.0) * 2.0 + 1.0;
  double trimPower = self->codeBias8.trimPower;
  float v5 = (trimPower + 0.5390625 + -1.0) * 2.0 + 1.0;
  if (a3 <= 0.90256)
  {
    if (a3 <= 0.75189)
    {
      float v5 = (trimPower + 0.463867188 + -1.0) * 2.0 + 1.0;
      if (a3 <= 0.6525)
      {
        self->trimData.trimSlope = 1.0;
      }
      else
      {
        float v7 = (float)(a3 + -0.6525) / 0.099389;
        self->trimData.trimSlope = (float)(v7 * 0.0) + 1.0;
        float v5 = v5 + (float)((float)(1.0 - v5) * v7);
      }
    }
    else
    {
      float v6 = (float)(a3 + -0.75189) / 0.15067;
      self->trimData.trimSlope = (float)((float)(v3 + -1.0) * v6) + 1.0;
      float v5 = (float)((float)(v5 + -1.0) * v6) + 1.0;
    }
  }
  else
  {
    self->trimData.trimSlope = v3;
  }
  self->trimData.double trimPower = v5;
  self->trimData.trimOffset = 0.0;
}

- (void)initToneMapMatrices:(float *)a3 tgtRgb2LmsTm:(float *)a4
{
  if (a3)
  {
    long long v4 = *(_OWORD *)a3;
    long long v5 = *((_OWORD *)a3 + 1);
    self->SRGB2LMS_TM[2][2] = a3[8];
    *(_OWORD *)&self->SRGB2LMS_TM[0][0] = v4;
    *(_OWORD *)&self->SRGB2LMS_TM[1][1] = v5;
  }
  if (a4)
  {
    long long v6 = *(_OWORD *)a4;
    long long v7 = *((_OWORD *)a4 + 1);
    self->TRGB2LMS_TM[2][2] = a4[8];
    *(_OWORD *)&self->TRGB2LMS_TM[0][0] = v6;
    *(_OWORD *)&self->TRGB2LMS_TM[1][1] = v7;
  }
}

- (void)initToneMapMatrices:(unsigned int)a3 outbits:(unsigned int)a4 srcRgb2LmsTm:(float *)a5 tgtRgb2LmsTm:(float *)a6
{
  if (a5)
  {
    long long v6 = *(_OWORD *)a5;
    long long v7 = *((_OWORD *)a5 + 1);
    self->SRGB2LMS_TM[2][2] = a5[8];
    *(_OWORD *)&self->SRGB2LMS_TM[0][0] = v6;
    *(_OWORD *)&self->SRGB2LMS_TM[1][1] = v7;
  }
  if (a6)
  {
    long long v6 = *(_OWORD *)a6;
    long long v8 = *((_OWORD *)a6 + 1);
    self->TRGB2LMS_TM[2][2] = a6[8];
    *(_OWORD *)&self->TRGB2LMS_TM[0][0] = v6;
    *(_OWORD *)&self->TRGB2LMS_TM[1][1] = v8;
  }
  uint64_t v9 = 0;
  self->Yuv2RgbOffset[0] = 16 << (a3 - 8);
  int v10 = 1 << (a3 - 1);
  self->Yuv2RgbOffset[1] = v10;
  self->Yuv2RgbOffset[2] = v10;
  unsigned int v11 = ~(-1 << a3);
  self->inputRange = v11;
  unsigned int v12 = ~(-1 << a4);
  *(float *)&long long v6 = (float)v11;
  self->outputRange = v12;
  *(float32x2_t *)&long long v6 = vdiv_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v6, 0), vcvt_f32_s32((int32x2_t)vshl_u32((uint32x2_t)0xE0000000DBLL, (uint32x2_t)vdup_n_s32(a3 - 8))));
  do
  {
    *(float32x2_t *)&self->YUV2RGB[v9][0] = vmul_f32(*(float32x2_t *)&v6, *(float32x2_t *)((char *)&R2020_Yuv2RgbFullFloatComp + v9 * 12));
    self->YUV2RGB[v9][2] = *((float *)&v6 + 1) * *(float *)((char *)&R2020_Yuv2RgbFullFloatComp + v9 * 12 + 8);
    ++v9;
  }
  while (v9 != 3);
  uint64_t v13 = 0;
  self->YUV2RGB[2][2] = 0.0;
  *(_OWORD *)&self->YUV2RGB[0][0] = xmmword_2222D1EF4;
  *(_OWORD *)&self->YUV2RGB[1][1] = unk_2222D1F04;
  self->RGB2LMS[2][2] = 0.88773;
  *(_OWORD *)&self->RGB2LMS[0][0] = xmmword_2222D1F18;
  *(_OWORD *)&self->RGB2LMS[1][1] = unk_2222D1F28;
  self->LMS2RGB[2][2] = 1.2765;
  *(_OWORD *)&self->LMS2RGB[0][0] = xmmword_2222D1F3C;
  *(_OWORD *)&self->LMS2RGB[1][1] = unk_2222D1F4C;
  RGB2YUV = self->RGB2YUV;
  float v15 = (float)v12 / (float)(224 << (a4 - 8));
  do
  {
    double v16 = &(*RGB2YUV)[v13];
    *double v16 = *(float *)((char *)&R2020_Rgb2YuvFullFloatComp + v13 * 4) / (float)((float)v12 / (float)(219 << (a4 - 8)));
    v16[3] = *(float *)((char *)&R2020_Rgb2YuvFullFloatComp + v13 * 4 + 12) / v15;
    v16[6] = *(float *)((char *)&R2020_Rgb2YuvFullFloatComp + v13 * 4 + 24) / v15;
    ++v13;
  }
  while (v13 != 3);
  self->RGB2YUV[2][2] = -0.040124;
  *(_OWORD *)RGB2YUV = xmmword_2222D1F84;
  *(_OWORD *)&self->RGB2YUV[1][1] = unk_2222D1F94;
  self->Rgb2YuvOffset[0] = 16 << (a4 - 8);
  int v17 = 1 << (a4 - 1);
  self->Rgb2YuvOffset[1] = v17;
  self->Rgb2YuvOffset[2] = v17;
}

- (void)initColorSpace:(unsigned int)a3 OutClrSpace:(unsigned int)a4 OutTrfFunction:(unsigned int)a5
{
  self->inputSurface.colorSpace = a3;
  self->outputSurface.colorSpace = a4;
  self->outputSurface.transferFunction = a5;
}

- (float)toneMapInterpI:(float)a3
{
  float sCrushPq = self->sCrushPq;
  if (sCrushPq >= a3)
  {
    float v9 = self->tCrushPq - (float)((float)(sCrushPq - a3) * self->crushSlope);
  }
  else
  {
    float sMidPq = self->sMidPq;
    if (sMidPq >= a3)
    {
      *(float *)&double v3 = self->tCrushPq;
      *(float *)&double v4 = self->crushSlope;
    }
    else
    {
      float sClipPq = self->sClipPq;
      if (sClipPq < a3)
      {
        float v9 = self->tClipPq + (float)((float)(a3 - sClipPq) * self->clipSlope);
        goto LABEL_9;
      }
      *(float *)&double v3 = self->tMidPq;
      *(float *)&double v4 = self->midSlope;
      float sCrushPq = self->sMidPq;
      float sMidPq = self->sClipPq;
    }
    cubicSplineInterp(*(double *)&a3, sCrushPq, v3, v4, sMidPq);
  }
LABEL_9:
  unsigned int dmAlgVerInCm = self->dmAlgVerInCm;
  if (dmAlgVerInCm >= 4) {
    float v9 = (float)(v9 - self->tMinPq) / (float)(self->tMaxPq - self->tMinPq);
  }
  float v11 = self->trimData.trimOffset + (float)(self->trimData.trimSlope * v9);
  if (v11 <= 0.0)
  {
    float v12 = 0.0;
    if (v11 < 0.0) {
      float v12 = -powf(-v11, self->trimData.trimPower);
    }
  }
  else
  {
    float v12 = powf(self->trimData.trimOffset + (float)(self->trimData.trimSlope * v9), self->trimData.trimPower);
  }
  if (dmAlgVerInCm >= 4) {
    float v12 = self->tMinPq + (float)(v12 * (float)(self->tMaxPq - self->tMinPq));
  }
  float v13 = 1.0;
  if (v12 <= 1.0) {
    float v13 = v12;
  }
  BOOL v14 = v12 < 0.0;
  float result = 0.0;
  if (!v14) {
    return v13;
  }
  return result;
}

- (float)toneMapI:(float)a3
{
  float sCrushPq = self->sCrushPq;
  if (sCrushPq >= a3)
  {
    float mLow = self->mLow;
    float bLow = self->bLow;
    goto LABEL_6;
  }
  float sMidPq = self->sMidPq;
  if (sMidPq >= a3)
  {
    float v7 = a3 - sCrushPq;
    float v8 = (float)(self->cLow[0] + (float)(self->cLow[1] * v7)) + (float)((float)(v7 * self->cLow[2]) * v7);
    float v9 = self->cLow[3];
LABEL_10:
    a3 = v8 + (float)((float)(v7 * (float)(v7 * v9)) * v7);
    goto LABEL_7;
  }
  if (self->sClipPq >= a3)
  {
    float v7 = a3 - sMidPq;
    float v8 = (float)(self->cHigh[0] + (float)(self->cHigh[1] * v7)) + (float)((float)(v7 * self->cHigh[2]) * v7);
    float v9 = self->cHigh[3];
    goto LABEL_10;
  }
  float mLow = self->mHigh;
  float bLow = self->bHigh;
LABEL_6:
  a3 = bLow + (float)(mLow * a3);
LABEL_7:
  [(DolbyVisionDM4 *)self applyL8Trim:*(double *)&a3];
  return result;
}

- (float)satMapI:(float)a3 Adm:(float)a4
{
  float v4 = 0.0;
  if (a4 < 0.0) {
    a4 = 0.0;
  }
  double v5 = a3;
  if (a3 > 0.00610500611)
  {
    float v4 = 1.0;
    if (v5 < 0.21978022)
    {
      float v6 = (v5 + -0.00610500611) / -0.213675214;
      float v4 = 1.0 - (float)((float)(v6 + 1.0) * (float)(v6 + 1.0));
    }
  }
  float v7 = a4 + -1.0;
  if (a4 < 0.000244200244) {
    float v7 = -0.99976;
  }
  float v8 = (float)((float)(v7 * v7) * v7) + 1.0;
  if (v5 < 0.000244200244) {
    float v9 = -0.99976;
  }
  else {
    float v9 = a3 + -1.0;
  }
  float v10 = v8 / (float)((float)((float)(v9 * v9) * v9) + 1.0);
  if ((float)(1.0 / v10) >= v4)
  {
    float v4 = 1.0;
    if ((float)(1.0 / v10) <= 1.0) {
      float v4 = 1.0 / v10;
    }
  }
  float v11 = fmax((float)(a4 - self->tCrushPq), 0.000244200244)
      / fmax((float)(self->tCrushPq - self->sCrushPq), 0.000244200244);
  float v12 = fminf(v11, 1.0);
  if (v12 < 1.0) {
    float v13 = -1.0;
  }
  else {
    float v13 = 1.0;
  }
  return fminf(self->trimData.trimSaturationGain* (float)((float)((float)(v13 * (float)((float)(v12 + -1.0) * (float)(v12 + -1.0))) + 1.0) * (float)(v10 * v4)), 2.0);
}

- (float)toneMapS:(float)a3
{
  float v3 = 2.0;
  if (a3 <= 2.0) {
    float v4 = a3;
  }
  else {
    float v4 = 2.0;
  }
  BOOL v5 = a3 < 0.0;
  float result = 0.0;
  if (v5) {
    float v4 = 0.0;
  }
  float v7 = sqrtf(v4);
  float v8 = fminf(self->clipIPred2TmIRatio, 1.0);
  if ((float)((float)((float)(v8 + -1.0)
                     * (float)((float)(v7 / self->clipSat)
                             * (float)((float)(v7 / self->clipSat) * (float)(v7 / self->clipSat))))
             + 1.0) >= v8)
    float v8 = (float)((float)(v8 + -1.0)
               * (float)((float)(v7 / self->clipSat) * (float)((float)(v7 / self->clipSat) * (float)(v7 / self->clipSat))))
       + 1.0;
  float v9 = (float)((float)((float)(self->trimData.trimChromaWeight * 4.0) * v7) + 1.0) * fminf(v8, 1.0);
  if (v9 <= 2.0) {
    float v3 = v9;
  }
  if (v9 >= 0.0) {
    return v3;
  }
  return result;
}

- (float)satMapS:(float)a3
{
  float v3 = 2.0;
  if (a3 <= 2.0) {
    float v4 = a3;
  }
  else {
    float v4 = 2.0;
  }
  BOOL v5 = a3 < 0.0;
  float result = 0.0;
  if (v5) {
    float v4 = 0.0;
  }
  float v7 = sqrtf(v4);
  float v8 = fminf(self->clipSatPred2SmISatRatio, 1.0);
  if ((float)((float)((float)(v8 + -1.0)
                     * (float)((float)(v7 / self->clipSat)
                             * (float)((float)(v7 / self->clipSat) * (float)(v7 / self->clipSat))))
             + 1.0) >= v8)
    float v8 = (float)((float)(v8 + -1.0)
               * (float)((float)(v7 / self->clipSat) * (float)((float)(v7 / self->clipSat) * (float)(v7 / self->clipSat))))
       + 1.0;
  float v9 = (float)((float)((float)(self->trimData.trimChromaWeight * 3.0) * v7) + 1.0) * fminf(v8, 1.0);
  if (v9 <= 2.0) {
    float v3 = v9;
  }
  if (v9 >= 0.0) {
    return v3;
  }
  return result;
}

- (void)calcToneMapParams
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  float sMidPq = self->sMidPq;
  if (sMidPq >= 0.000244200244)
  {
    if (sMidPq > 0.9997558) {
      float sMidPq = 0.99976;
    }
  }
  else
  {
    float sMidPq = 0.0002442;
  }
  float sCrushPq = self->sCrushPq;
  if (sCrushPq >= 0.0)
  {
    double v6 = sMidPq;
    double v2 = sMidPq + -0.000244200244;
    if (v2 < sCrushPq)
    {
      float v7 = v2;
      float sCrushPq = v7;
    }
  }
  else
  {
    double v6 = sMidPq;
    float sCrushPq = 0.0;
  }
  float sClipPq = self->sClipPq;
  double v9 = sClipPq;
  double v10 = v6 + 0.000244200244;
  float v11 = 1.0;
  if (sClipPq <= 1.0) {
    float v11 = self->sClipPq;
  }
  if (v10 <= v9)
  {
    *(float *)&double v9 = v11;
  }
  else
  {
    float v12 = v10;
    *(float *)&double v9 = v12;
  }
  *(float *)&double v2 = self->tMinPq;
  *(float *)&double v10 = sMidPq;
  float v13 = *(float *)&v9;
  float v14 = sCrushPq;
  float v59 = sCrushPq;
  double v15 = deriveTmidPq(v10, sCrushPq, v9, v2, self->tMaxPq);
  float tMinPq = self->tMinPq;
  float tMaxPq = self->tMaxPq;
  double v18 = tMaxPq + -0.000244200244;
  if (v18 >= v15) {
    double v18 = v15;
  }
  if (tMinPq + 0.000244200244 <= v15) {
    double v19 = v18;
  }
  else {
    double v19 = tMinPq + 0.000244200244;
  }
  float v20 = v19;
  self->tMidPq = v20;
  if ((float)(v20 - (float)(sMidPq - v14)) >= tMinPq) {
    float tMinPq = v20 - (float)(sMidPq - v14);
  }
  self->float tCrushPq = tMinPq;
  float v58 = v13;
  if ((float)((float)(v13 - sMidPq) + v20) <= tMaxPq) {
    float tMaxPq = (float)(v13 - sMidPq) + v20;
  }
  self->float tClipPq = tMaxPq;
  float v21 = (float)(v20 - tMinPq) / (float)(sMidPq - v14);
  float v22 = (float)(tMaxPq - v20) / (float)(v13 - sMidPq);
  float v23 = self->trimData.targetMidContrast + (float)((float)(v20 - sMidPq) + 1.0);
  if ((float)(v21 * 3.0) > (float)(v22 * 3.0)) {
    float v24 = v22 * 3.0;
  }
  else {
    float v24 = v21 * 3.0;
  }
  if (v23 <= v24) {
    float v24 = v23;
  }
  BOOL v25 = v23 <= 0.0;
  float v26 = 0.0;
  if (!v25) {
    float v26 = v24;
  }
  self->midSlope = v26;
  float v27 = v21 * v21;
  if ((float)(v21 * v21) > (float)(v21 * 3.0)) {
    float v27 = v21 * 3.0;
  }
  self->float crushSlope = v27;
  float v28 = fminf(v22 * v22, 1.0);
  if (v28 > (float)(v22 * 3.0)) {
    float v28 = v22 * 3.0;
  }
  self->float clipSlope = v28;
  float v29 = fminf(v13, 1.0);
  BOOL v30 = v29 < 0.00000073096;
  if (v29 < 0.00000073096) {
    float v29 = -(float)(v29 + -0.0000014619);
  }
  float v31 = -10000.0;
  if (v30) {
    float v32 = -10000.0;
  }
  else {
    float v32 = 10000.0;
  }
  float v33 = pow(v29, 0.0126833133);
  float v34 = fmax((float)((float)(v33 + -0.83594) / (float)((float)(v33 * -18.688) + 18.852)), 0.0);
  float v35 = powf(v34, 6.2774);
  RgbLinear2Itp(fmaxf(v32 * v35, 5.0), 0.0, 0.0, self->SRGB2LMS_TM, self->LMS2ITP, &v60);
  float v37 = v60;
  float v36 = v61;
  self->clipI = v60;
  self->float clipSat = sqrtf((float)(v62 * v62) + (float)(v36 * v36));
  float v38 = fminf(self->tMaxPqTm, 1.0);
  if (v38 >= 0.00000073096) {
    float v31 = 10000.0;
  }
  else {
    float v38 = -(float)(v38 + -0.0000014619);
  }
  float v39 = pow(v38, 0.0126833133);
  float v40 = fmax((float)((float)(v39 + -0.83594) / (float)((float)(v39 * -18.688) + 18.852)), 0.0);
  float v41 = powf(v40, 6.2774);
  RgbLinear2Itp(fmaxf(v31 * v41, 5.0), 0.0, 0.0, self->TRGB2LMS_TM, self->LMS2ITP, &v60);
  float v42 = v61;
  self->clipIPred = v60;
  self->clipSatPred = sqrtf((float)(v62 * v62) + (float)(v42 * v42));
  self->float sCrushPq = v59;
  self->float sMidPq = sMidPq;
  self->float sClipPq = v58;
  *(float *)&double v43 = v37;
  [(DolbyVisionDM4 *)self toneMapInterpI:v43];
  *(float *)&double v45 = v44;
  self->float clipTmI = v44;
  *(float *)&double v46 = self->clipI;
  [(DolbyVisionDM4 *)self satMapI:v46 Adm:v45];
  self->clipSmI = v47;
  float clipSat = self->clipSat;
  float v49 = self->clipSatPred / fmax((float)(v47 * clipSat), 0.000244200244);
  self->clipSatPred2SmISatRatio = v49;
  float clipTmI = self->clipTmI;
  if (clipTmI < 0.000244200244) {
    float clipTmI = 0.0002442;
  }
  self->float clipTmI = clipTmI;
  self->clipIPred2TmIRatio = self->clipIPred / clipTmI;
  if (clipSat >= 0.000244200244) {
    float v51 = clipSat;
  }
  else {
    float v51 = 0.0002442;
  }
  self->float clipSat = v51;
  calcCubicSplineParam((uint64_t)self->cLow, self->sCrushPq, self->tCrushPq, self->crushSlope, self->sMidPq, self->tMidPq, self->midSlope);
  calcCubicSplineParam((uint64_t)self->cHigh, self->sMidPq, self->tMidPq, self->midSlope, self->sClipPq, self->tClipPq, self->clipSlope);
  float v52 = self->sCrushPq;
  float tCrushPq = self->tCrushPq;
  float crushSlope = self->crushSlope;
  self->float mLow = crushSlope;
  self->float bLow = tCrushPq - (float)(v52 * crushSlope);
  float v55 = self->sClipPq;
  float tClipPq = self->tClipPq;
  float clipSlope = self->clipSlope;
  self->mHigh = clipSlope;
  self->bHigh = tClipPq - (float)(v55 * clipSlope);
}

- (void)calcToneMapParamsHDR10
{
  float sMidPq = self->sMidPq;
  if (sMidPq >= 0.000244200244)
  {
    if (sMidPq > 0.9997558) {
      float sMidPq = 0.99976;
    }
  }
  else
  {
    float sMidPq = 0.0002442;
  }
  float sCrushPq = self->sCrushPq;
  if (sCrushPq >= 0.0)
  {
    double v6 = sMidPq;
    double v7 = sMidPq + -0.000244200244;
    if (v7 < sCrushPq) {
      float sCrushPq = v7;
    }
  }
  else
  {
    double v6 = sMidPq;
    float sCrushPq = 0.0;
  }
  float sClipPq = self->sClipPq;
  double v9 = sClipPq;
  double v10 = v6 + 0.000244200244;
  if (sClipPq >= 1.0) {
    float sClipPq = 1.0;
  }
  if (v10 <= v9)
  {
    float v12 = sClipPq;
  }
  else
  {
    float v11 = v10;
    float v12 = v11;
  }
  float tMinPq = self->tMinPq;
  float tMaxPq = self->tMaxPq;
  float v15 = tMaxPq - tMinPq;
  double v16 = 1.0 - (float)((float)(tMaxPq - tMinPq) / (float)(v12 - sCrushPq));
  double v17 = v16 * 0.1;
  if (v16 >= 0.0)
  {
    float v18 = v16 * 0.1;
    float v19 = v18;
  }
  else
  {
    float v19 = 0.0;
  }
  float v20 = tMinPq + (float)(v15 / 3.0);
  float v21 = v15 + v15;
  if (sCrushPq > tMinPq) {
    float v22 = self->tMinPq;
  }
  else {
    float v22 = sCrushPq;
  }
  if (v12 < tMaxPq) {
    float v23 = self->tMaxPq;
  }
  else {
    float v23 = v12;
  }
  if ((float)(tMinPq + 0.02) > v20) {
    *(float *)&double v17 = tMinPq + (float)(v15 / 3.0);
  }
  else {
    *(float *)&double v17 = tMinPq + 0.02;
  }
  if ((float)(tMaxPq - v19) < v20) {
    float v24 = tMinPq + (float)(v15 / 3.0);
  }
  else {
    float v24 = tMaxPq - v19;
  }
  float v25 = (float)(v20 - *(float *)&v17) / (float)(v20 - v22);
  float v26 = fminf(v25 * 3.0, 1.0);
  float v27 = fminf((float)((float)(v24 - v20) / (float)(v23 - v20)) * 3.0, 1.0);
  if (v21 > v26) {
    float v28 = v26;
  }
  else {
    float v28 = v21;
  }
  if (v28 > v27) {
    float v28 = v27;
  }
  if (v20 >= sMidPq)
  {
    float v29 = v25 * v25;
    if (v29 > v26) {
      *(float *)&double v2 = v26;
    }
    else {
      *(float *)&double v2 = v29;
    }
    *(float *)&double v10 = sMidPq;
    float v23 = v20;
  }
  else
  {
    *(float *)&double v10 = sMidPq;
    float v22 = v20;
    *(float *)&double v17 = v20;
    *(float *)&double v2 = v28;
  }
  cubicSplineInterp(v10, v22, v17, v2, v23);
  float v31 = v12 - sMidPq;
  if ((float)(tMaxPq - v30) <= (float)(v12 - sMidPq)) {
    float v32 = v30;
  }
  else {
    float v32 = tMaxPq - (float)(v12 - sMidPq);
  }
  float v33 = sMidPq - sCrushPq;
  if ((float)(v30 - tMinPq) > (float)(sMidPq - sCrushPq)) {
    float v30 = (float)(sMidPq - sCrushPq) + tMinPq;
  }
  if (v32 >= sMidPq) {
    float v32 = sMidPq;
  }
  if (v30 <= sMidPq) {
    float v30 = sMidPq;
  }
  double v34 = (float)((float)(v32 + v30) - sMidPq);
  float v35 = self->tMinPq;
  float v36 = self->tMaxPq;
  double v37 = v36 + -0.000244200244;
  if (v37 >= v34) {
    double v37 = v34;
  }
  if (v35 + 0.000244200244 <= v34) {
    double v38 = v37;
  }
  else {
    double v38 = v35 + 0.000244200244;
  }
  float v39 = v38;
  self->tMidPq = v39;
  if ((float)(v39 - v33) >= v35) {
    float v35 = v39 - v33;
  }
  self->float tCrushPq = v35;
  float v40 = v31 + v39;
  if ((float)(v31 + v39) > v36) {
    float v40 = v36;
  }
  self->float tClipPq = v40;
  float v41 = (float)(v39 - v35) / v33;
  float v42 = (float)(v40 - v39) / v31;
  float v43 = v42 * 3.0;
  float v44 = (float)(v41 + v42) * 0.5;
  if ((float)(v41 * 3.0) > (float)(v42 * 3.0)) {
    float v45 = v42 * 3.0;
  }
  else {
    float v45 = v41 * 3.0;
  }
  if (v44 <= v45) {
    float v45 = (float)(v41 + v42) * 0.5;
  }
  if (v44 <= 0.0) {
    float v45 = 0.0;
  }
  self->midSlope = v45;
  float v46 = v41 * v41;
  if ((float)(v41 * v41) > (float)(v41 * 3.0)) {
    float v46 = v41 * 3.0;
  }
  self->float crushSlope = v46;
  float v47 = fminf(v42 * v42, 1.0);
  if (v47 > v43) {
    float v47 = v43;
  }
  self->float clipSlope = v47;
  self->float sCrushPq = sCrushPq;
  self->float sMidPq = sMidPq;
  self->float sClipPq = v12;
  calcCubicSplineParam((uint64_t)self->cLow, sCrushPq, v35, v46, sMidPq, v39, v45);
  calcCubicSplineParam((uint64_t)self->cHigh, self->sMidPq, self->tMidPq, self->midSlope, self->sClipPq, self->tClipPq, self->clipSlope);
  float v48 = self->sCrushPq;
  float tCrushPq = self->tCrushPq;
  float crushSlope = self->crushSlope;
  self->float mLow = crushSlope;
  self->float bLow = tCrushPq - (float)(v48 * crushSlope);
  float v51 = self->sClipPq;
  float tClipPq = self->tClipPq;
  float clipSlope = self->clipSlope;
  self->mHigh = clipSlope;
  self->bHigh = tClipPq - (float)(v51 * clipSlope);
}

- (void)calcToneMapParamsBrightAdapted
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  float sMidPq = self->sMidPq;
  if (sMidPq >= 0.000244200244)
  {
    if (sMidPq > 0.9997558) {
      float sMidPq = 0.99976;
    }
  }
  else
  {
    float sMidPq = 0.0002442;
  }
  float sCrushPq = self->sCrushPq;
  if (sCrushPq >= 0.0)
  {
    double v6 = sMidPq;
    double v2 = sMidPq + -0.000244200244;
    if (v2 < sCrushPq)
    {
      float v7 = v2;
      float sCrushPq = v7;
    }
  }
  else
  {
    double v6 = sMidPq;
    float sCrushPq = 0.0;
  }
  float sClipPq = self->sClipPq;
  double v9 = sClipPq;
  double v10 = v6 + 0.000244200244;
  float v11 = 1.0;
  if (sClipPq <= 1.0) {
    float v11 = self->sClipPq;
  }
  if (v10 <= v9)
  {
    *(float *)&double v9 = v11;
  }
  else
  {
    float v12 = v10;
    *(float *)&double v9 = v12;
  }
  *(float *)&double v2 = self->tMinPq;
  *(float *)&double v10 = sMidPq;
  float v13 = *(float *)&v9;
  float v14 = sCrushPq;
  float v64 = sCrushPq;
  double v15 = deriveTmidPq(v10, sCrushPq, v9, v2, self->tMaxPq);
  float tMinPq = self->tMinPq;
  float tMaxPq = self->tMaxPq;
  double v18 = tMaxPq + -0.000244200244;
  if (v18 >= v15) {
    double v18 = v15;
  }
  if (tMinPq + 0.000244200244 <= v15) {
    double v19 = v18;
  }
  else {
    double v19 = tMinPq + 0.000244200244;
  }
  float v20 = v19;
  self->tMidPq = v20;
  if ((float)(v20 - (float)(sMidPq - v14)) >= tMinPq) {
    float tMinPq = v20 - (float)(sMidPq - v14);
  }
  self->float tCrushPq = tMinPq;
  if ((float)((float)(v13 - sMidPq) + v20) <= tMaxPq) {
    float tMaxPq = (float)(v13 - sMidPq) + v20;
  }
  self->float tClipPq = tMaxPq;
  float v21 = (float)(v20 - tMinPq) / (float)(sMidPq - v14);
  float v22 = (float)(tMaxPq - v20) / (float)(v13 - sMidPq);
  float v23 = v21 * 3.0;
  float v24 = v22 * 3.0;
  float v25 = self->trimData.targetMidContrast + (float)((float)(v20 - sMidPq) + 1.0);
  float v26 = (float)((float)(sMidPq + -0.35) * -0.66667) + 1.0;
  if (v26 <= 1.0) {
    float v27 = (float)((float)(sMidPq + -0.35) * -0.66667) + 1.0;
  }
  else {
    float v27 = 1.0;
  }
  if (v26 >= 0.8) {
    float v28 = v27;
  }
  else {
    float v28 = 0.8;
  }
  float v29 = v28 * v25;
  if (v23 > v24) {
    float v30 = v22 * 3.0;
  }
  else {
    float v30 = v21 * 3.0;
  }
  if (v29 <= v30) {
    float v30 = v29;
  }
  BOOL v31 = v29 <= 0.0;
  float v32 = 0.0;
  if (!v31) {
    float v32 = v30;
  }
  self->midSlope = v32;
  float v33 = (float)((float)(v21 * v21) * 0.3) + 0.7;
  if (v33 > v23) {
    float v33 = v21 * 3.0;
  }
  self->float crushSlope = v33;
  float v34 = fminf(v22 * v22, 1.0);
  if (v34 > v24) {
    float v34 = v22 * 3.0;
  }
  self->float clipSlope = v34;
  float v35 = fminf(v13, 1.0);
  BOOL v36 = v35 < 0.00000073096;
  if (v35 < 0.00000073096) {
    float v35 = -(float)(v35 + -0.0000014619);
  }
  float v37 = -10000.0;
  if (v36) {
    float v38 = -10000.0;
  }
  else {
    float v38 = 10000.0;
  }
  float v39 = pow(v35, 0.0126833133);
  float v40 = fmax((float)((float)(v39 + -0.83594) / (float)((float)(v39 * -18.688) + 18.852)), 0.0);
  float v41 = powf(v40, 6.2774);
  RgbLinear2Itp(fmaxf(v38 * v41, 5.0), 0.0, 0.0, self->SRGB2LMS_TM, self->LMS2ITP, &v65);
  float v43 = v65;
  float v42 = v66;
  self->clipI = v65;
  self->float clipSat = sqrtf((float)(v67 * v67) + (float)(v42 * v42));
  float v44 = fminf(self->tMaxPqTm, 1.0);
  if (v44 >= 0.00000073096) {
    float v37 = 10000.0;
  }
  else {
    float v44 = -(float)(v44 + -0.0000014619);
  }
  float v45 = pow(v44, 0.0126833133);
  float v46 = fmax((float)((float)(v45 + -0.83594) / (float)((float)(v45 * -18.688) + 18.852)), 0.0);
  float v47 = powf(v46, 6.2774);
  RgbLinear2Itp(fmaxf(v37 * v47, 5.0), 0.0, 0.0, self->TRGB2LMS_TM, self->LMS2ITP, &v65);
  float v48 = v66;
  self->clipIPred = v65;
  self->clipSatPred = sqrtf((float)(v67 * v67) + (float)(v48 * v48));
  self->float sCrushPq = v64;
  self->float sMidPq = sMidPq;
  self->float sClipPq = v13;
  *(float *)&double v49 = v43;
  [(DolbyVisionDM4 *)self toneMapInterpI:v49];
  *(float *)&double v51 = v50;
  self->float clipTmI = v50;
  *(float *)&double v52 = self->clipI;
  [(DolbyVisionDM4 *)self satMapI:v52 Adm:v51];
  self->clipSmI = v53;
  float clipSat = self->clipSat;
  float v55 = self->clipSatPred / fmax((float)(v53 * clipSat), 0.000244200244);
  self->clipSatPred2SmISatRatio = v55;
  float clipTmI = self->clipTmI;
  if (clipTmI < 0.000244200244) {
    float clipTmI = 0.0002442;
  }
  self->float clipTmI = clipTmI;
  self->clipIPred2TmIRatio = self->clipIPred / clipTmI;
  if (clipSat >= 0.000244200244) {
    float v57 = clipSat;
  }
  else {
    float v57 = 0.0002442;
  }
  self->float clipSat = v57;
  calcCubicSplineParam((uint64_t)self->cLow, self->sCrushPq, self->tCrushPq, self->crushSlope, self->sMidPq, self->tMidPq, self->midSlope);
  calcCubicSplineParam((uint64_t)self->cHigh, self->sMidPq, self->tMidPq, self->midSlope, self->sClipPq, self->tClipPq, self->clipSlope);
  float v58 = self->sCrushPq;
  float tCrushPq = self->tCrushPq;
  float crushSlope = self->crushSlope;
  self->float mLow = crushSlope;
  self->float bLow = tCrushPq - (float)(v58 * crushSlope);
  float v61 = self->sClipPq;
  float tClipPq = self->tClipPq;
  float clipSlope = self->clipSlope;
  self->mHigh = clipSlope;
  self->bHigh = tClipPq - (float)(v61 * clipSlope);
}

- (void)getDM4Params:(id *)a3
{
  uint64_t v3 = 0;
  a3->float var0 = self->sCrushPq;
  a3->float var1 = self->sMidPq;
  a3->var3 = self->mLow;
  a3->float var4 = self->bLow;
  a3->unsigned int var5 = self->mHigh;
  a3->float var6 = self->bHigh;
  cHigh = self->cHigh;
  do
  {
    BOOL v5 = &a3->var7[v3];
    float *v5 = cHigh[v3 - 4];
    v5[4] = cHigh[v3++];
  }
  while (v3 != 4);
}

- (void)createToneCurve:(float)a3 srcMaxPQ:(float)a4 tgtMinPQ:(float)a5 tgtMaxPQ:(float)a6 srcCrushPQ:(float)a7 srcMidPQ:(float)a8 srcClipPQ:(float)a9 targetMaxLinear:(float)a10 DM_MetaData:(id *)a11 tcCtrl:(ToneCurve_Control *)a12 dm4TmMode:(int)a13
{
  Config = GetConfig((HDRConfig *)self);
  if (Config)
  {
    float v34 = GetConfig((HDRConfig *)Config);
    if (*((_DWORD *)v34 + 3545))
    {
      if ((v34[7088] & 0x80) != 0)
      {
        float v35 = GetConfig((HDRConfig *)v34);
        if (v35)
        {
          BOOL v36 = GetConfig((HDRConfig *)v35);
          a13 = *(_DWORD *)HDRConfig::GetConfigEntryValue((uint64_t)v36, 0xA1u, 0);
        }
        else
        {
          a13 = 0;
        }
      }
    }
  }
  *(float *)&double v26 = a3;
  *(float *)&double v27 = a4;
  *(float *)&double v28 = a5;
  *(float *)&double v29 = a6;
  *(float *)&double v30 = a7;
  *(float *)&double v31 = a8;
  *(float *)&double v32 = a9;
  *(float *)&double v33 = a10;
  float v37 = (HDRConfig *)[(DolbyVisionDM4 *)self initToneMapParams:a11 srcMaxPQ:v26 tgtMinPQ:v27 tgtMaxPQ:v28 srcCrushPQ:v29 srcMidPQ:v30 srcClipPQ:v31 targetMaxLinear:v32 DM_MetaData:v33];
  if (a11)
  {
    float v38 = GetConfig(v37);
    if (!v38 || (float v39 = GetConfig((HDRConfig *)v38), !*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v39, 9u, 0))) {
      [(DolbyVisionDM4 *)self initTrimData:a11];
    }
  }
  switch(a13)
  {
    case 1:
      if (a10 >= 0.0)
      {
        float v45 = powf(a10 * 0.0001, 0.1593);
        *(float *)&double v41 = powf((float)((float)(v45 * 18.852) + 0.83594) / (float)((float)(v45 * 18.688) + 1.0), 78.844);
      }
      else
      {
        float v40 = powf(a10 * -0.0001, 0.1593);
        *(float *)&double v41 = 0.0000014619
                       - powf((float)((float)(v40 * 18.852) + 0.83594) / (float)((float)(v40 * 18.688) + 1.0), 78.844);
      }
      [(DolbyVisionDM4 *)self setPseudoTrimDataForHLG:v41];
      goto LABEL_23;
    case 2:
      goto LABEL_23;
    case 3:
      [(DolbyVisionDM4 *)self calcToneMapParamsHDR10];
      if (!a12) {
        return;
      }
      goto LABEL_24;
    case 4:
      goto LABEL_28;
    case 5:
      if (a10 >= 0.0)
      {
        float v46 = powf(a10 * 0.0001, 0.1593);
        *(float *)&double v44 = powf((float)((float)(v46 * 18.852) + 0.83594) / (float)((float)(v46 * 18.688) + 1.0), 78.844);
      }
      else
      {
        float v43 = powf(a10 * -0.0001, 0.1593);
        *(float *)&double v44 = 0.0000014619
                       - powf((float)((float)(v43 * 18.852) + 0.83594) / (float)((float)(v43 * 18.688) + 1.0), 78.844);
      }
      [(DolbyVisionDM4 *)self setPseudoTrimDataForHLG:v44];
LABEL_28:
      [(DolbyVisionDM4 *)self calcToneMapParamsBrightAdapted];
      if (!a12) {
        return;
      }
      goto LABEL_24;
    default:
      float trimOffset = self->trimData.trimOffset;
      if (trimOffset > 0.0) {
        float trimOffset = 0.0;
      }
      self->trimData.float trimOffset = trimOffset;
LABEL_23:
      [(DolbyVisionDM4 *)self calcToneMapParams];
      if (a12)
      {
LABEL_24:
        a12->crush = self->sCrushPq;
        a12->mid = self->sMidPq;
        a12->clip = self->sClipPq;
      }
      return;
  }
}

- (void)createTmLuts:(float *)a3 tLutS:(float *)a4 sLutI:(float *)a5 sLutS:(float *)a6 tLutISize:(unint64_t)a7 tLutSSize:(unint64_t)a8 sLutISize:(unint64_t)a9 sLutSSize:(unint64_t)a10
{
  if (!a7) {
    __assert_rtn("-[DolbyVisionDM4 createTmLuts:tLutS:sLutI:sLutS:tLutISize:tLutSSize:sLutISize:sLutSSize:]", "DolbyVisionDM4.mm", 2124, "tLutISize");
  }
  if (!a8) {
    __assert_rtn("-[DolbyVisionDM4 createTmLuts:tLutS:sLutI:sLutS:tLutISize:tLutSSize:sLutISize:sLutSSize:]", "DolbyVisionDM4.mm", 2125, "tLutSSize");
  }
  if (!a9) {
    __assert_rtn("-[DolbyVisionDM4 createTmLuts:tLutS:sLutI:sLutS:tLutISize:tLutSSize:sLutISize:sLutSSize:]", "DolbyVisionDM4.mm", 2126, "sLutISize");
  }
  if (!a10) {
    __assert_rtn("-[DolbyVisionDM4 createTmLuts:tLutS:sLutI:sLutS:tLutISize:tLutSSize:sLutISize:sLutSSize:]", "DolbyVisionDM4.mm", 2127, "sLutSSize");
  }
  uint64_t v18 = 0;
  float v19 = (float)(a7 - 1);
  do
  {
    *(float *)&double v10 = (float)(int)v18 / v19;
    [(DolbyVisionDM4 *)self toneMapI:v10];
    a3[v18++] = *(float *)&v10;
  }
  while (a7 != v18);
  uint64_t v20 = 0;
  float v21 = (float)(a9 - 1);
  do
  {
    *(float *)&double v10 = (float)(int)v20 / v21;
    [(DolbyVisionDM4 *)self toneMapI:v10];
    LODWORD(v23) = v22;
    *(float *)&double v24 = (float)(int)v20 / v21;
    [(DolbyVisionDM4 *)self satMapI:v24 Adm:v23];
    a5[v20++] = *(float *)&v10;
  }
  while (a9 != v20);
  uint64_t v25 = 0;
  do
  {
    *(float *)&double v10 = (float)((float)(int)v25 / (float)(a8 - 1)) + (float)((float)(int)v25 / (float)(a8 - 1));
    [(DolbyVisionDM4 *)self toneMapS:v10];
    a4[v25++] = *(float *)&v10;
  }
  while (a8 != v25);
  for (uint64_t i = 0; i != a10; ++i)
  {
    *(float *)&double v10 = (float)((float)(int)i / (float)(a10 - 1)) + (float)((float)(int)i / (float)(a10 - 1));
    [(DolbyVisionDM4 *)self satMapS:v10];
    a6[i] = *(float *)&v10;
  }
  memcpy(self->tmLutI, a3, 4 * a7);
  memcpy(self->tmLutS, a4, 4 * a8);
  memcpy(self->smLutI, a5, 4 * a9);
  smLutS = self->smLutS;
  memcpy(smLutS, a6, 4 * a10);
}

- (void)createTmLutsEx:(float *)a3 tLutS:(float *)a4 sLutI:(float *)a5 sLutS:(float *)a6 tLutISize:(unint64_t)a7 tLutSSize:(unint64_t)a8 sLutISize:(unint64_t)a9 sLutSSize:(unint64_t)a10 config:(id *)a11 TmParam:(const _DoViTMParam *)a12 EdrAdaptationParam:(const _EdrAdaptationParam *)a13 AmbAdaptationParam:(const _AmbAdaptationParam *)a14 IsDoVi84:(BOOL)a15 HlgOOTFCombined:(BOOL)a16
{
  float adjTmax_nits = a12->adjTmax_nits;
  float OOTFMixingFactor = a12->OOTFMixingFactor;
  float Smin_nits = a12->Smin_nits;
  float SDRTmax_nits = a12->SDRTmax_nits;
  long double v19 = (float)(SDRTmax_nits / 1000.0);
  if (SDRTmax_nits > 400.0 && SDRTmax_nits < 2000.0)
  {
    double v23 = log10(v19) * 0.419999987 + 1.20000005 + -1.0;
  }
  else
  {
    long double v21 = log2(v19);
    double v23 = pow(1.11099994, v21) * 1.20000005 + -1.0;
  }
  if (!a7) {
    __assert_rtn("-[DolbyVisionDM4 createTmLutsEx:tLutS:sLutI:sLutS:tLutISize:tLutSSize:sLutISize:sLutSSize:config:TmParam:EdrAdaptationParam:AmbAdaptationParam:IsDoVi84:HlgOOTFCombined:]", "DolbyVisionDM4.mm", 2202, "tLutISize");
  }
  if (!a8) {
    __assert_rtn("-[DolbyVisionDM4 createTmLutsEx:tLutS:sLutI:sLutS:tLutISize:tLutSSize:sLutISize:sLutSSize:config:TmParam:EdrAdaptationParam:AmbAdaptationParam:IsDoVi84:HlgOOTFCombined:]", "DolbyVisionDM4.mm", 2203, "tLutSSize");
  }
  if (!a9) {
    __assert_rtn("-[DolbyVisionDM4 createTmLutsEx:tLutS:sLutI:sLutS:tLutISize:tLutSSize:sLutISize:sLutSSize:config:TmParam:EdrAdaptationParam:AmbAdaptationParam:IsDoVi84:HlgOOTFCombined:]", "DolbyVisionDM4.mm", 2204, "sLutISize");
  }
  if (!a10) {
    __assert_rtn("-[DolbyVisionDM4 createTmLutsEx:tLutS:sLutI:sLutS:tLutISize:tLutSSize:sLutISize:sLutSSize:config:TmParam:EdrAdaptationParam:AmbAdaptationParam:IsDoVi84:HlgOOTFCombined:]", "DolbyVisionDM4.mm", 2205, "sLutSSize");
  }
  float v24 = v23;
  Config = GetConfig(v22);
  unint64_t v92 = a10;
  v93 = a6;
  if (Config)
  {
    double v27 = GetConfig((HDRConfig *)Config);
    BOOL v28 = *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v27, 0xEu, 0) != 0;
  }
  else
  {
    BOOL v28 = 0;
  }
  uint64_t v29 = 0;
  float v96 = (float)(a7 - 1);
  float v100 = v24 + 1.0;
  float v99 = 1000.0 - Smin_nits;
  BOOL v30 = v28 || !a15;
  float v98 = 1.0 - OOTFMixingFactor;
  do
  {
    float v31 = (float)(int)v29 / v96;
    float v32 = v31 + -0.0000014619;
    *(float *)&double v26 = v31;
    if (a16)
    {
      float v33 = -v32;
      if (v31 >= 0.00000073096) {
        float v33 = (float)(int)v29 / v96;
      }
      float v34 = flt_2222D1868[v31 < 0.00000073096];
      float v35 = powf(v33, 0.012683);
      float v36 = fmax((float)((float)(v35 + -0.83594) / (float)((float)(v35 * -18.688) + 18.852)), 0.0);
      float v37 = powf(v36, 6.2774);
      float v38 = Smin_nits + (float)(powf((float)(v34 * v37) / 1000.0, 1.2) * v99);
      if (v38 >= 0.0)
      {
        float v40 = powf(v38 * 0.0001, 0.1593);
        *(float *)&double v26 = powf((float)((float)(v40 * 18.852) + 0.83594) / (float)((float)(v40 * 18.688) + 1.0), 78.844);
      }
      else
      {
        float v39 = powf(v38 * -0.0001, 0.1593);
        *(float *)&double v26 = 0.0000014619
                       - powf((float)((float)(v39 * 18.852) + 0.83594) / (float)((float)(v39 * 18.688) + 1.0), 78.844);
      }
    }
    -[DolbyVisionDM4 toneMapI:](self, "toneMapI:", v26, v92);
    float v42 = v41;
    if (!BYTE1(a11[1].var52)) {
      goto LABEL_25;
    }
    int linearStretchMode = a12->linearStretchMode;
    if (linearStretchMode != 1)
    {
      if (!linearStretchMode) {
        float v42 = applyLinearStretchInPQ(v41, a12->linearScaler, a12->linearOffset);
      }
LABEL_25:
      if (v30) {
        goto LABEL_34;
      }
LABEL_26:
      float v44 = -v32;
      if (v31 >= 0.00000073096) {
        float v44 = (float)(int)v29 / v96;
      }
      float v45 = flt_2222D1868[v31 < 0.00000073096];
      float v46 = powf(v44, 0.012683);
      float v47 = fmax((float)((float)(v46 + -0.83594) / (float)((float)(v46 * -18.688) + 18.852)), 0.0);
      float v48 = fmaxf((float)(v45 * powf(v47, 6.2774)) / 1000.0, 0.0);
      if (!a16) {
        float v48 = powf(fabsf(v48), 0.83333);
      }
      float v49 = adjTmax_nits * powf(v48, v100);
      if (v49 >= 0.0)
      {
        float v52 = powf(v49 * 0.0001, 0.1593);
        float v51 = powf((float)((float)(v52 * 18.852) + 0.83594) / (float)((float)(v52 * 18.688) + 1.0), 78.844);
      }
      else
      {
        float v50 = powf(v49 * -0.0001, 0.1593);
        float v51 = 0.0000014619
            - powf((float)((float)(v50 * 18.852) + 0.83594) / (float)((float)(v50 * 18.688) + 1.0), 78.844);
      }
      float v42 = (float)(v98 * v51) + (float)(OOTFMixingFactor * v42);
      goto LABEL_34;
    }
    float nonlinearScaler = a12->nonlinearScaler;
    if (nonlinearScaler != 1.0) {
      float v42 = a12->nonlinearOffset + (float)((float)(v42 - a12->nonlinearOffset) * nonlinearScaler);
    }
    if (!v30) {
      goto LABEL_26;
    }
LABEL_34:
    *(float *)&double v53 = applyEdrAdaptationCurveS((uint64_t)a13, v42);
    if (BYTE1(a11[1].var52))
    {
      int v54 = a12->linearStretchMode;
      if (v54 == 3)
      {
        float v56 = a12->nonlinearScaler;
        if (v56 != 1.0) {
          *(float *)&double v53 = a12->nonlinearOffset + (float)((float)(*(float *)&v53 - a12->nonlinearOffset) * v56);
        }
      }
      else if (v54 == 2)
      {
        *(float *)&double v53 = applyLinearStretchInPQ(*(float *)&v53, a12->linearScaler, a12->linearOffset);
      }
    }
    double v26 = applyAmbAdaptationCurveS_C((uint64_t)a14, v53);
    a3[v29++] = fmaxf(fminf(*(float *)&v26, 1.0), 0.0);
  }
  while (a7 != v29);
  uint64_t v57 = 0;
  float v97 = (float)(a9 - 1);
  if (a9 <= 1) {
    unint64_t v58 = 1;
  }
  else {
    unint64_t v58 = a9;
  }
  do
  {
    float v59 = (float)(int)v57 / v97;
    float v60 = v59 + -0.0000014619;
    *(float *)&double v26 = v59;
    if (a16)
    {
      float v61 = -v60;
      if (v59 >= 0.00000073096) {
        float v61 = (float)(int)v57 / v97;
      }
      float v62 = flt_2222D1868[v59 < 0.00000073096];
      float v63 = powf(v61, 0.012683);
      float v64 = fmax((float)((float)(v63 + -0.83594) / (float)((float)(v63 * -18.688) + 18.852)), 0.0);
      float v65 = powf(v64, 6.2774);
      float v66 = Smin_nits + (float)(powf((float)(v62 * v65) / 1000.0, 1.2) * v99);
      if (v66 >= 0.0)
      {
        float v68 = powf(v66 * 0.0001, 0.1593);
        *(float *)&double v26 = powf((float)((float)(v68 * 18.852) + 0.83594) / (float)((float)(v68 * 18.688) + 1.0), 78.844);
      }
      else
      {
        float v67 = powf(v66 * -0.0001, 0.1593);
        *(float *)&double v26 = 0.0000014619
                       - powf((float)((float)(v67 * 18.852) + 0.83594) / (float)((float)(v67 * 18.688) + 1.0), 78.844);
      }
    }
    [(DolbyVisionDM4 *)self toneMapI:v26];
    float v70 = v69;
    if (!BYTE1(a11[1].var52)) {
      goto LABEL_58;
    }
    int v71 = a12->linearStretchMode;
    if (v71 != 1)
    {
      if (!v71) {
        float v70 = applyLinearStretchInPQ(v69, a12->linearScaler, a12->linearOffset);
      }
LABEL_58:
      if (v30) {
        goto LABEL_67;
      }
LABEL_59:
      float v72 = -v60;
      if (v59 >= 0.00000073096) {
        float v72 = (float)(int)v57 / v97;
      }
      float v73 = flt_2222D1868[v59 < 0.00000073096];
      float v74 = powf(v72, 0.012683);
      float v75 = fmax((float)((float)(v74 + -0.83594) / (float)((float)(v74 * -18.688) + 18.852)), 0.0);
      float v76 = fmaxf((float)(v73 * powf(v75, 6.2774)) / 1000.0, 0.0);
      if (!a16) {
        float v76 = powf(fabsf(v76), 1.0 / a12->systemGamma);
      }
      float v77 = adjTmax_nits * powf(v76, v100);
      if (v77 >= 0.0)
      {
        float v80 = powf(v77 * 0.0001, 0.1593);
        float v79 = powf((float)((float)(v80 * 18.852) + 0.83594) / (float)((float)(v80 * 18.688) + 1.0), 78.844);
      }
      else
      {
        float v78 = powf(v77 * -0.0001, 0.1593);
        float v79 = 0.0000014619
            - powf((float)((float)(v78 * 18.852) + 0.83594) / (float)((float)(v78 * 18.688) + 1.0), 78.844);
      }
      float v70 = (float)(v98 * v79) + (float)(OOTFMixingFactor * v70);
      goto LABEL_67;
    }
    float v83 = a12->nonlinearScaler;
    if (v83 != 1.0) {
      float v70 = a12->nonlinearOffset + (float)((float)(v70 - a12->nonlinearOffset) * v83);
    }
    if (!v30) {
      goto LABEL_59;
    }
LABEL_67:
    *(float *)&double v81 = applyEdrAdaptationCurveS((uint64_t)a13, v70);
    if (BYTE1(a11[1].var52))
    {
      int v82 = a12->linearStretchMode;
      if (v82 == 3)
      {
        float v84 = a12->nonlinearScaler;
        if (v84 != 1.0) {
          *(float *)&double v81 = a12->nonlinearOffset + (float)((float)(*(float *)&v81 - a12->nonlinearOffset) * v84);
        }
      }
      else if (v82 == 2)
      {
        *(float *)&double v81 = applyLinearStretchInPQ(*(float *)&v81, a12->linearScaler, a12->linearOffset);
      }
    }
    double v85 = applyAmbAdaptationCurveS_C((uint64_t)a14, v81);
    *(float *)&unsigned int v86 = fmaxf(fminf(*(float *)&v85, 1.0), 0.0);
    *(float *)&double v85 = (float)(int)v57 / v97;
    [(DolbyVisionDM4 *)self satMapI:v85 Adm:COERCE_DOUBLE((unint64_t)v86)];
    a5[v57++] = *(float *)&v26;
  }
  while (v58 != v57);
  uint64_t v87 = 0;
  if (a8 <= 1) {
    unint64_t v88 = 1;
  }
  else {
    unint64_t v88 = a8;
  }
  do
  {
    *(float *)&double v26 = (float)((float)(int)v87 / (float)(a8 - 1)) + (float)((float)(int)v87 / (float)(a8 - 1));
    [(DolbyVisionDM4 *)self toneMapS:v26];
    a4[v87++] = *(float *)&v26;
  }
  while (v88 != v87);
  uint64_t v89 = 0;
  if (v92 <= 1) {
    uint64_t v90 = 1;
  }
  else {
    uint64_t v90 = v92;
  }
  do
  {
    *(float *)&double v26 = (float)((float)(int)v89 / (float)(v92 - 1)) + (float)((float)(int)v89 / (float)(v92 - 1));
    [(DolbyVisionDM4 *)self satMapS:v26];
    v93[v89++] = *(float *)&v26;
  }
  while (v90 != v89);
  memcpy(self->tmLutI, a3, 4 * a7);
  memcpy(self->tmLutS, a4, 4 * a8);
  memcpy(self->smLutI, a5, 4 * a9);
  smLutS = self->smLutS;
  memcpy(smLutS, v93, 4 * v92);
}

- (void)InputMapping:(float *)a3 pX1:(float *)a4 pX2:(float *)a5
{
  unsigned int colorSpace = self->inputSurface.colorSpace;
  if (colorSpace != 2)
  {
    if (!colorSpace)
    {
      float v10 = *a3 - (float)self->Yuv2RgbOffset[0];
      float v11 = *a4 - (float)self->Yuv2RgbOffset[1];
      float v12 = *a5 - (float)self->Yuv2RgbOffset[2];
      *a3 = (float)((float)(v11 * self->YUV2RGB[0][1]) + (float)(self->YUV2RGB[0][0] * v10))
          + (float)(self->YUV2RGB[0][2] * v12);
      *a4 = (float)((float)(v11 * self->YUV2RGB[1][1]) + (float)(self->YUV2RGB[1][0] * v10))
          + (float)(self->YUV2RGB[1][2] * v12);
      *a5 = (float)((float)(v11 * self->YUV2RGB[2][1]) + (float)(self->YUV2RGB[2][0] * v10))
          + (float)(self->YUV2RGB[2][2] * v12);
    }
    float v13 = 1.0 / (float)self->inputRange;
    *a3 = *a3 * v13;
    *a4 = *a4 * v13;
    *a5 = v13 * *a5;
    float v14 = 0.0;
    float v15 = 0.0;
    if (*a3 >= 0.0)
    {
      float v15 = 1.0;
      if (*a3 <= 1.0) {
        float v15 = *a3;
      }
    }
    *a3 = v15;
    if (*a4 >= 0.0)
    {
      float v14 = 1.0;
      if (*a4 <= 1.0) {
        float v14 = *a4;
      }
    }
    *a4 = v14;
    float v16 = 0.0;
    if (*a5 >= 0.0)
    {
      float v16 = 1.0;
      if (*a5 <= 1.0) {
        float v16 = *a5;
      }
    }
    *a5 = v16;
    float v17 = *a3;
    if (*a3 < 0.0) {
      float v17 = 0.0;
    }
    float v18 = powf(v17, 0.012683);
    float v19 = (float)(v18 + -0.83594) / (float)((float)(v18 * -18.688) + 18.852);
    if (v19 < 0.0) {
      float v19 = 0.0;
    }
    *a3 = powf(v19, 6.2774) * 10000.0;
    float v20 = *a4;
    if (*a4 < 0.0) {
      float v20 = 0.0;
    }
    float v21 = powf(v20, 0.012683);
    float v22 = (float)(v21 + -0.83594) / (float)((float)(v21 * -18.688) + 18.852);
    if (v22 < 0.0) {
      float v22 = 0.0;
    }
    *a4 = powf(v22, 6.2774) * 10000.0;
    float v23 = *a5;
    if (*a5 < 0.0) {
      float v23 = 0.0;
    }
    float v24 = powf(v23, 0.012683);
    float v25 = (float)(v24 + -0.83594) / (float)((float)(v24 * -18.688) + 18.852);
    if (v25 < 0.0) {
      float v25 = 0.0;
    }
    float v26 = powf(v25, 6.2774) * 10000.0;
    *a5 = v26;
    float v27 = (float)((float)(self->RGB2LMS[0][1] * *a4) + (float)(self->RGB2LMS[0][0] * *a3))
        + (float)(self->RGB2LMS[0][2] * v26);
    float v28 = (float)((float)(*a4 * self->RGB2LMS[1][1]) + (float)(self->RGB2LMS[1][0] * *a3))
        + (float)(self->RGB2LMS[1][2] * v26);
    float v29 = (float)((float)(*a4 * self->RGB2LMS[2][1]) + (float)(self->RGB2LMS[2][0] * *a3))
        + (float)(self->RGB2LMS[2][2] * v26);
    float v30 = v27 / 10000.0;
    float v39 = v29;
    float v40 = v29 / 10000.0;
    if (v27 > 10000.0) {
      float v30 = 1.0;
    }
    if (v30 < 0.0) {
      float v30 = 0.0;
    }
    float v31 = powf(v30, 0.1593);
    float v32 = powf((float)((float)(v31 * 18.852) + 0.83594) / (float)((float)(v31 * 18.688) + 1.0), 78.844);
    float v33 = v28 / 10000.0;
    if (v28 > 10000.0) {
      float v33 = 1.0;
    }
    if (v33 < 0.0) {
      float v33 = 0.0;
    }
    float v34 = powf(v33, 0.1593);
    float v35 = powf((float)((float)(v34 * 18.852) + 0.83594) / (float)((float)(v34 * 18.688) + 1.0), 78.844);
    float v36 = v40;
    if (v39 > 10000.0) {
      float v36 = 1.0;
    }
    if (v36 < 0.0) {
      float v36 = 0.0;
    }
    float v37 = powf(v36, 0.1593);
    float v38 = powf((float)((float)(v37 * 18.852) + 0.83594) / (float)((float)(v37 * 18.688) + 1.0), 78.844);
    *a3 = (float)((float)(self->LMS2ITP[0][1] * v35) + (float)(self->LMS2ITP[0][0] * v32))
        + (float)(self->LMS2ITP[0][2] * v38);
    *a4 = (float)((float)(self->LMS2ITP[1][1] * v35) + (float)(self->LMS2ITP[1][0] * v32))
        + (float)(self->LMS2ITP[1][2] * v38);
    *a5 = (float)((float)(v35 * self->LMS2ITP[2][1]) + (float)(self->LMS2ITP[2][0] * v32))
        + (float)(self->LMS2ITP[2][2] * v38);
  }
}

- (void)ToneMappingInCtrl:(float *)a3 pX1:(float *)a4 pX2:(float *)a5 pAdm:(float *)a6
{
  float v11 = (float)(*a5 * *a5) + (float)(*a4 * *a4);
  *a6 = *a3;
  -[DolbyVisionDM4 toneMapI:](self, "toneMapI:");
  int v13 = v12;
  *(_DWORD *)a6 = v12;
  *(float *)&double v14 = v11;
  [(DolbyVisionDM4 *)self toneMapS:v14];
  *a6 = v15 * *a6;
  *(float *)&double v16 = *a3;
  LODWORD(v17) = v13;
  [(DolbyVisionDM4 *)self satMapI:v16 Adm:v17];
  float v19 = v18;
  *(float *)&double v20 = v11;
  [(DolbyVisionDM4 *)self satMapS:v20];
  float v22 = v19 * v21;
  *a4 = *a4 * v22;
  *a5 = v22 * *a5;
}

- (void)ToneMapping:(float *)a3 pX1:(float *)a4 pX2:(float *)a5 pAdm:(float *)a6
{
  unint64_t tmLutSize = self->tmLutSize;
  if (tmLutSize)
  {
    float v7 = (float)((float)(*a5 * *a5) + (float)(*a4 * *a4)) * 0.5;
    float v8 = *a3;
    if (*a3 <= 0.0)
    {
      float v11 = *self->tmLutI;
    }
    else if (v8 >= 1.0)
    {
      float v11 = self->tmLutI[tmLutSize - 1];
    }
    else
    {
      float v9 = v8 * (float)(tmLutSize - 1);
      *a6 = v9;
      float v10 = &self->tmLutI[v9];
      float v11 = *v10 + (float)((float)(v10[1] - *v10) * (float)(v9 - (float)(int)v9));
    }
    *a6 = v11;
    if (v7 > 0.0)
    {
      if (v7 >= 1.0)
      {
        float v12 = self->tmLutS[tmLutSize - 1];
      }
      else
      {
        float v13 = v7 * (float)(tmLutSize - 1);
        double v14 = &self->tmLutS[v13];
        float v12 = *v14 + (float)((float)(v14[1] - *v14) * (float)(v13 - (float)(int)v13));
      }
    }
    else
    {
      float v12 = *self->tmLutS;
    }
    *a6 = v11 * v12;
    float v15 = *a3;
    if (*a3 <= 0.0)
    {
      float v18 = *self->smLutI;
    }
    else if (v15 >= 1.0)
    {
      float v18 = self->smLutI[tmLutSize - 1];
    }
    else
    {
      float v16 = v15 * (float)(tmLutSize - 1);
      double v17 = &self->smLutI[v16];
      float v18 = *v17 + (float)((float)(v17[1] - *v17) * (float)(v16 - (float)(int)v16));
    }
    if (v7 > 0.0)
    {
      if (v7 >= 1.0)
      {
        float v19 = self->smLutS[tmLutSize - 1];
      }
      else
      {
        float v20 = v7 * (float)(tmLutSize - 1);
        float v21 = &self->smLutS[v20];
        float v19 = *v21 + (float)((float)(v21[1] - *v21) * (float)(v20 - (float)(int)v20));
      }
    }
    else
    {
      float v19 = *self->smLutS;
    }
    float v22 = v18 * v19;
    *a4 = *a4 * v22;
    *a5 = v22 * *a5;
  }
  else
  {
    [(DolbyVisionDM4 *)self ToneMappingInCtrl:a3 pX1:a4 pX2:a5 pAdm:a6];
  }
}

- (void)OutputMapping:(float *)a3 pX1:(float *)a4 pX2:(float *)a5
{
  unsigned int colorSpace = self->outputSurface.colorSpace;
  if (colorSpace != 2)
  {
    float v10 = (float)((float)(self->ITP2LMS[0][1] * *a4) + (float)(self->ITP2LMS[0][0] * *a3))
        + (float)(self->ITP2LMS[0][2] * *a5);
    float v11 = (float)((float)(*a4 * self->ITP2LMS[1][1]) + (float)(self->ITP2LMS[1][0] * *a3))
        + (float)(self->ITP2LMS[1][2] * *a5);
    float v12 = (float)((float)(*a4 * self->ITP2LMS[2][1]) + (float)(self->ITP2LMS[2][0] * *a3))
        + (float)(self->ITP2LMS[2][2] * *a5);
    if (v10 <= 1.0) {
      float v13 = (float)((float)(self->ITP2LMS[0][1] * *a4) + (float)(self->ITP2LMS[0][0] * *a3))
    }
          + (float)(self->ITP2LMS[0][2] * *a5);
    else {
      float v13 = 1.0;
    }
    if (v10 >= 0.0) {
      float v14 = v13;
    }
    else {
      float v14 = 0.0;
    }
    if (v11 <= 1.0) {
      float v15 = (float)((float)(*a4 * self->ITP2LMS[1][1]) + (float)(self->ITP2LMS[1][0] * *a3))
    }
          + (float)(self->ITP2LMS[1][2] * *a5);
    else {
      float v15 = 1.0;
    }
    if (v11 >= 0.0) {
      float v16 = v15;
    }
    else {
      float v16 = 0.0;
    }
    if (v12 <= 1.0) {
      float v17 = (float)((float)(*a4 * self->ITP2LMS[2][1]) + (float)(self->ITP2LMS[2][0] * *a3))
    }
          + (float)(self->ITP2LMS[2][2] * *a5);
    else {
      float v17 = 1.0;
    }
    if (v12 >= 0.0) {
      float v18 = v17;
    }
    else {
      float v18 = 0.0;
    }
    float v51 = v18;
    if (v14 < 0.0) {
      float v14 = 0.0;
    }
    float v19 = powf(v14, 0.012683);
    float v20 = (float)(v19 + -0.83594) / (float)((float)(v19 * -18.688) + 18.852);
    if (v20 < 0.0) {
      float v20 = 0.0;
    }
    float v50 = powf(v20, 6.2774) * 10000.0;
    if (v16 < 0.0) {
      float v21 = 0.0;
    }
    else {
      float v21 = v16;
    }
    float v22 = powf(v21, 0.012683);
    float v23 = (float)(v22 + -0.83594) / (float)((float)(v22 * -18.688) + 18.852);
    if (v23 < 0.0) {
      float v23 = 0.0;
    }
    float v24 = powf(v23, 6.2774) * 10000.0;
    float v25 = v51;
    if (v51 < 0.0) {
      float v25 = 0.0;
    }
    float v26 = powf(v25, 0.012683);
    float v27 = (float)(v26 + -0.83594) / (float)((float)(v26 * -18.688) + 18.852);
    if (v27 < 0.0) {
      float v27 = 0.0;
    }
    float v28 = powf(v27, 6.2774) * 10000.0;
    *a3 = (float)((float)(self->LMS2RGB[0][1] * v24) + (float)(self->LMS2RGB[0][0] * v50))
        + (float)(self->LMS2RGB[0][2] * v28);
    *a4 = (float)((float)(self->LMS2RGB[1][1] * v24) + (float)(self->LMS2RGB[1][0] * v50))
        + (float)(self->LMS2RGB[1][2] * v28);
    *a5 = (float)((float)(self->LMS2RGB[2][1] * v24) + (float)(self->LMS2RGB[2][0] * v50))
        + (float)(self->LMS2RGB[2][2] * v28);
    unsigned int transferFunction = self->outputSurface.transferFunction;
    if (transferFunction == 16)
    {
      float v39 = *a3 / 10000.0;
      if (v39 < 0.0) {
        float v39 = 0.0;
      }
      float v40 = powf(v39, 0.1593);
      *a3 = powf((float)((float)(v40 * 18.852) + 0.83594) / (float)((float)(v40 * 18.688) + 1.0), 78.844);
      float v41 = *a4 / 10000.0;
      if (v41 < 0.0) {
        float v41 = 0.0;
      }
      float v42 = powf(v41, 0.1593);
      *a4 = powf((float)((float)(v42 * 18.852) + 0.83594) / (float)((float)(v42 * 18.688) + 1.0), 78.844);
      float v43 = *a5 / 10000.0;
      if (v43 < 0.0) {
        float v43 = 0.0;
      }
      float v44 = powf(v43, 0.1593);
      float v38 = powf((float)((float)(v44 * 18.852) + 0.83594) / (float)((float)(v44 * 18.688) + 1.0), 78.844);
    }
    else
    {
      if (transferFunction) {
        goto LABEL_65;
      }
      float Lb = self->bt1886Param.Lb;
      if (*a3 >= Lb)
      {
        float Lb = self->bt1886Param.Lw;
        if (*a3 <= Lb) {
          float Lb = *a3;
        }
      }
      *a3 = Lb;
      float Lw = self->bt1886Param.Lb;
      if (*a4 >= Lw)
      {
        float Lw = self->bt1886Param.Lw;
        if (*a4 <= Lw) {
          float Lw = *a4;
        }
      }
      *a4 = Lw;
      float v32 = self->bt1886Param.Lb;
      if (*a5 >= v32)
      {
        float v32 = self->bt1886Param.Lw;
        if (*a5 <= v32) {
          float v32 = *a5;
        }
      }
      *a5 = v32;
      float v33 = *a3;
      if (*a3 < 0.0) {
        float v33 = 0.0;
      }
      *a3 = v33;
      *a3 = powf(v33 * self->bt1886Param.aR, self->bt1886Param.gammaR) - self->bt1886Param.b;
      float v34 = *a4;
      if (*a4 < 0.0) {
        float v34 = 0.0;
      }
      *a4 = v34;
      *a4 = powf(v34 * self->bt1886Param.aR, self->bt1886Param.gammaR) - self->bt1886Param.b;
      float v35 = *a5;
      if (*a5 < 0.0) {
        float v35 = 0.0;
      }
      *a5 = v35;
      *a5 = powf(v35 * self->bt1886Param.aR, self->bt1886Param.gammaR) - self->bt1886Param.b;
      float v36 = *a3;
      if (*a3 < 0.0) {
        float v36 = 0.0;
      }
      *a3 = v36;
      float v37 = *a4;
      if (*a4 < 0.0) {
        float v37 = 0.0;
      }
      *a4 = v37;
      float v38 = *a5;
      if (*a5 < 0.0) {
        float v38 = 0.0;
      }
    }
    *a5 = v38;
LABEL_65:
    float outputRange = (float)self->outputRange;
    *a3 = (float)(outputRange * *a3) + 0.0;
    *a4 = (float)(outputRange * *a4) + 0.0;
    float v46 = (float)(outputRange * *a5) + 0.0;
    *a5 = v46;
    if (!colorSpace)
    {
      float v47 = (float)((float)(self->RGB2YUV[0][1] * *a4) + (float)(self->RGB2YUV[0][0] * *a3))
          + (float)(self->RGB2YUV[0][2] * v46);
      float v48 = (float)((float)(*a4 * self->RGB2YUV[1][1]) + (float)(self->RGB2YUV[1][0] * *a3))
          + (float)(self->RGB2YUV[1][2] * v46);
      float v49 = (float)((float)(*a4 * self->RGB2YUV[2][1]) + (float)(self->RGB2YUV[2][0] * *a3))
          + (float)(self->RGB2YUV[2][2] * v46);
      *a3 = v47 + (float)self->Rgb2YuvOffset[0];
      *a4 = v48 + (float)self->Rgb2YuvOffset[1];
      *a5 = v49 + (float)self->Rgb2YuvOffset[2];
    }
  }
}

- (void)DmProcess:(int)a3 Height:(int)a4 bufI:(float *)a5 bufU:(float *)a6 bufV:(float *)a7
{
  LODWORD(v18) = 0;
  if (a4 >= 1)
  {
    int v13 = 0;
    uint64_t v14 = 4 * a3;
    do
    {
      if (a3 >= 1)
      {
        uint64_t v16 = 0;
        do
        {
          float v17 = a5[v16];
          float v19 = a6[v16];
          float v20 = v17;
          *((float *)&v18 + 1) = a7[v16];
          -[DolbyVisionDM4 InputMapping:pX1:pX2:](self, "InputMapping:pX1:pX2:", &v20, &v19, (char *)&v18 + 4, v18);
          [(DolbyVisionDM4 *)self ToneMapping:&v20 pX1:&v19 pX2:(char *)&v18 + 4 pAdm:&v18];
          float v20 = *(float *)&v18;
          [(DolbyVisionDM4 *)self OutputMapping:&v20 pX1:&v19 pX2:(char *)&v18 + 4];
          a5[v16] = v20;
          a6[v16] = v19;
          a7[v16++] = *((float *)&v18 + 1);
        }
        while (a3 != v16);
      }
      ++v13;
      a7 = (float *)((char *)a7 + v14);
      a6 = (float *)((char *)a6 + v14);
      a5 = (float *)((char *)a5 + v14);
    }
    while (v13 != a4);
  }
}

- (void)dumpConfigData:(__sFILE *)a3
{
  fprintf(a3, "float mLow = %0.7f, bLow = %0.7f\n", self->mLow, self->bLow);
  fprintf(a3, "mHigh = %0.7f, bHigh = %0.7f\n", self->mHigh, self->bHigh);
}

- (void)dumpConfigDataToFile:(int)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x64uLL, "/tmp/com.apple.hdrprocessing/dm4_config_%d.txt", a3);
  float v4 = fopen(__str, "w");
  if (v4)
  {
    BOOL v5 = v4;
    [(DolbyVisionDM4 *)self dumpConfigData:v4];
    fclose(v5);
  }
}

- (BOOL)hasDM4TonemapConfigChanged:(id *)a3 TonemapConfig:(id *)a4 EdrAdaptationParam:(const _EdrAdaptationParam *)a5 AmbAdaptationParam:(const _AmbAdaptationParam *)a6
{
  if (LODWORD(a3[1].var49) != a4->var8) {
    return 1;
  }
  if (self->sClipPq != a4->var9.var0.var2) {
    return 1;
  }
  if (self->sCrushPq != a4->var9.var0.var0) {
    return 1;
  }
  if (self->sMidPq != a4->var9.var0.var1) {
    return 1;
  }
  if (self->tMaxPq != a4->var9.var0.var4) {
    return 1;
  }
  if (self->tMinPq != a4->var9.var0.var3) {
    return 1;
  }
  if (self->trimData.trimChromaWeight != a4->var9.var0.var10) {
    return 1;
  }
  if (self->trimData.trimOffset != a4->var9.var0.var6) {
    return 1;
  }
  if (self->trimData.trimPower != a4->var9.var0.var7) {
    return 1;
  }
  if (self->trimData.targetMidContrast != a4->var9.var0.var8) {
    return 1;
  }
  if (self->trimData.trimSaturationGain != a4->var9.var0.var9) {
    return 1;
  }
  if (self->trimData.trimSlope != a4->var9.var0.var5) {
    return 1;
  }
  if (a3->var53 != a4->var2) {
    return 1;
  }
  if (a3[1].var55.alphaPrime != a4->var3) {
    return 1;
  }
  uint64_t n = a5->n;
  if (n != a4->var5.n) {
    return 1;
  }
  if (a5->n)
  {
    Xs = a4->var5.Xs;
    Ys = a5->Ys;
    while (*(Ys - 3) == *Xs && *Ys == Xs[3] && Ys[3] == Xs[6])
    {
      ++Xs;
      ++Ys;
      if (!--n) {
        goto LABEL_22;
      }
    }
    return 1;
  }
LABEL_22:
  uint64_t v9 = a6->n;
  if (v9 != a4->var6.n) {
    return 1;
  }
  if (a6->n)
  {
    XsC = a4->var6.XsC;
    YsC = a6->YsC;
    while (*(YsC - 3) == *XsC && *YsC == XsC[3] && YsC[3] == XsC[6])
    {
      ++XsC;
      ++YsC;
      if (!--v9) {
        goto LABEL_29;
      }
    }
    return 1;
  }
LABEL_29:
  if (a6->aL != a4->var6.aL || a6->bL != a4->var6.bL) {
    return 1;
  }
  unint64_t v14 = 0;
  m33Rgb2Lms = self->inputSurface.m33Rgb2Lms;
  uint64_t v16 = (char *)&a4->var9.var2 + 44;
  BOOL v17 = 1;
  while (2)
  {
    for (uint64_t i = 0; i != 3; ++i)
    {
      if ((unsigned __int16)(*m33Rgb2Lms)[i] != *(unsigned __int16 *)&v16[i * 2]
        || (unsigned __int16)(*m33Rgb2Lms)[i + 36] != *(unsigned __int16 *)&v16[i * 2 + 18])
      {
        return v17;
      }
    }
    BOOL v12 = 0;
    BOOL v17 = v14 < 2;
    ++m33Rgb2Lms;
    v16 += 6;
    if (++v14 != 3) {
      continue;
    }
    break;
  }
  return v12;
}

- (void)updateDM4TonemapConfig:(id *)a3 DMConfig:(id *)a4 EdrAdaptationParam:(const _EdrAdaptationParam *)a5 AmbAdaptationParam:(const _AmbAdaptationParam *)a6
{
  a3->unsigned int var8 = LODWORD(a4[1].var49);
  a3->var9.var0.float var2 = self->sClipPq;
  *(void *)&a3->var9.var0.float var0 = *(void *)&self->sCrushPq;
  *($95A7711724258D2DBCF2C7E5A2AF8B2C *)((char *)&a3->var9.var2 + 12) = *($95A7711724258D2DBCF2C7E5A2AF8B2C *)&self->tMinPq;
  a3->var9.var0.unsigned int var10 = self->trimData.trimChromaWeight;
  *((void *)&a3->var9.var2 + 3) = *(void *)&self->trimData.trimOffset;
  a3->var9.var0.unsigned int var8 = self->trimData.targetMidContrast;
  a3->var9.var0.unsigned int var9 = self->trimData.trimSaturationGain;
  a3->var9.var0.unsigned int var5 = self->trimData.trimSlope;
  float alphaPrime = a4[1].var55.alphaPrime;
  a3->float var2 = a4->var53;
  a3->var3 = alphaPrime;
  long long v8 = *(_OWORD *)&a5->polyCs[0][1];
  long long v7 = *(_OWORD *)&a5->polyCs[1][1];
  long long v9 = *(_OWORD *)&a5->splCs[1][1];
  *(_OWORD *)&a3->var5.linCs[0][0] = *(_OWORD *)&a5->linCs[0][0];
  *(_OWORD *)&a3->var5.polyCs[0][1] = v8;
  *(_OWORD *)&a3->var5.polyCs[1][1] = v7;
  *(_OWORD *)&a3->var5.splCs[1][1] = v9;
  long long v10 = *(_OWORD *)a5->Ys;
  long long v12 = *(_OWORD *)&a5->Ms[1];
  long long v11 = *(_OWORD *)&a5->splCs[0][1];
  *(_OWORD *)&a3->var5.ouint64_t n = *(_OWORD *)&a5->on;
  *(_OWORD *)a3->var5.Ys = v10;
  *(_OWORD *)&a3->var5.Ms[1] = v12;
  *(_OWORD *)&a3->var5.splCs[0][1] = v11;
  long long v13 = *(_OWORD *)&a6->splCs[0][3];
  long long v15 = *(_OWORD *)a6->YsC;
  long long v14 = *(_OWORD *)&a6->MsC[1];
  *(_OWORD *)&a3->var6.withLinearExtensiouint64_t n = *(_OWORD *)&a6->withLinearExtension;
  *(_OWORD *)&a3->var6.splCs[0][3] = v13;
  *(_OWORD *)a3->var6.YsC = v15;
  *(_OWORD *)&a3->var6.MsC[1] = v14;
  long long v17 = *(_OWORD *)&a6->polyCs[0][3];
  long long v16 = *(_OWORD *)&a6->polyCs[1][3];
  long long v18 = *(_OWORD *)&a6->splCs[1][3];
  *(void *)&a3->var6.linCs[1][1] = *(void *)&a6->linCs[1][1];
  *(_OWORD *)&a3->var6.polyCs[0][3] = v17;
  *(_OWORD *)&a3->var6.polyCs[1][3] = v16;
  *(_OWORD *)&a3->var6.splCs[1][3] = v18;
  *(_OWORD *)&a3->var6.ouint64_t n = *(_OWORD *)&a6->on;
  long long v19 = *(_OWORD *)&self->inputSurface.m33Rgb2Lms[0][0];
  a3->var9.var1.var11[2][2] = self->inputSurface.m33Rgb2Lms[2][2];
  *(_OWORD *)((char *)&a3->var9.var2 + 44) = v19;
  long long v20 = *(_OWORD *)&self->outputSurface.m33Rgb2Lms[0][0];
  a3->var9.var1.var12[2][2] = self->outputSurface.m33Rgb2Lms[2][2];
  *(_OWORD *)((char *)&a3->var9.var2 + 62) = v20;
}

- (float)applyL8Trim:(float)a3
{
  unsigned int dmAlgVerInCm = self->dmAlgVerInCm;
  if (dmAlgVerInCm >= 4) {
    a3 = (float)(a3 - self->tMinPq) / (float)(self->tMaxPq - self->tMinPq);
  }
  float v5 = self->trimData.trimOffset + (float)(self->trimData.trimSlope * a3);
  if (v5 <= 0.0)
  {
    float v6 = 0.0;
    if (v5 < 0.0) {
      float v6 = -powf(-v5, self->trimData.trimPower);
    }
  }
  else
  {
    float v6 = powf(self->trimData.trimOffset + (float)(self->trimData.trimSlope * a3), self->trimData.trimPower);
  }
  if (dmAlgVerInCm >= 4) {
    float v6 = self->tMinPq + (float)(v6 * (float)(self->tMaxPq - self->tMinPq));
  }
  float v7 = 1.0;
  if (v6 <= 1.0) {
    float v7 = v6;
  }
  BOOL v8 = v6 < 0.0;
  float result = 0.0;
  if (!v8) {
    return v7;
  }
  return result;
}

@end