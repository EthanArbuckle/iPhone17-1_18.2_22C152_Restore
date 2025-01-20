@interface DolbyVisionMR
- (DolbyVisionMR)init;
- (int)metadataReconstruction:(id *)a3 dmData:(id *)a4 maxDisplayBrightnessNits:(double)a5 targetMaxNits:(double)a6 targetMinNits:(double)a7 displayPrimaries:(double *)a8 baseMax:(double)a9 baseMin:(double)a10 videoFullRangeFlag:(int)a11 colourPrimaries:(int)a12 matrixCoeffs:(int)a13 numFrames:(unsigned int)a14;
- (void)dealloc;
@end

@implementation DolbyVisionMR

- (DolbyVisionMR)init
{
  v7.receiver = self;
  v7.super_class = (Class)DolbyVisionMR;
  v2 = [(DolbyVisionMR *)&v7 init];
  v3 = (DolbyVisionMR *)v2;
  if (v2)
  {
    uint64_t v4 = 0;
    *(_OWORD *)(v2 + 8) = xmmword_2222D4C80;
    *((void *)v2 + 3) = 0x10000000CLL;
    *((_DWORD *)v2 + 8) = 1;
    *((void *)v2 + 5) = 0;
    *((_DWORD *)v2 + 12) = 0;
    *((void *)v2 + 16) = 0x200000000;
    *((_DWORD *)v2 + 34) = 0;
    *((_DWORD *)v2 + 54) = 0;
    *((_DWORD *)v2 + 62) = 0;
    *((_DWORD *)v2 + 72) = 0;
    *((void *)v2 + 35) = 3;
    *((void *)v2 + 37) = 0x3F747AE147AE147BLL;
    *((void *)v2 + 38) = 0x408F400000000000;
    *((void *)v2 + 39) = 3;
    *((void *)v2 + 48) = 28;
    *((void *)v2 + 49) = 0x3F747AE147AE147BLL;
    *((void *)v2 + 50) = 0x4059000000000000;
    *((void *)v2 + 51) = 2;
    *((void *)v2 + 60) = 16;
    do
    {
      DisplayIdxTblDoViMR81[DisplayTbl[v4]] = &DisplayTbl[v4];
      v4 += 40;
    }
    while (v4 != 280);
    bzero(v2 + 12752, 0x450uLL);
    v5 = v3;
  }

  return v3;
}

- (int)metadataReconstruction:(id *)a3 dmData:(id *)a4 maxDisplayBrightnessNits:(double)a5 targetMaxNits:(double)a6 targetMinNits:(double)a7 displayPrimaries:(double *)a8 baseMax:(double)a9 baseMin:(double)a10 videoFullRangeFlag:(int)a11 colourPrimaries:(int)a12 matrixCoeffs:(int)a13 numFrames:(unsigned int)a14
{
  uint64_t v184 = *MEMORY[0x263EF8340];
  double v25 = a9 / 10000.0;
  if (a9 < 0.0) {
    double v25 = 0.0;
  }
  long double v26 = pow(v25, 0.159301758);
  long double v28 = pow((v26 * 18.8515625 + 0.8359375) / (v26 * 18.6875 + 1.0), 78.84375);
  LODWORD(v29) = a4->var16;
  double v30 = v28 + (double)v29 / -4095.0;
  if (v30 > -0.00138888889 && v30 < 0.00138888889)
  {
    if (a3->var14[0][0][1][0] == 1 || a3->var14[0][0][2][0] == 1)
    {
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v31 = logInstanceID;
        }
        else {
          uint64_t v31 = prevLogInstanceID;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v168 = WORD1(v31);
          __int16 v169 = 1024;
          int v170 = 1;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx MR81: metadataReconstruction: Error: unmapped, hasMMRData=%d", buf, 0x12u);
        }
        prevLogInstanceID = v31;
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v168) = 1;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] MR81: metadataReconstruction: Error: unmapped, hasMMRData=%d", buf, 8u);
      }
      updateComposerData((uint64_t)a3);
      goto LABEL_199;
    }
    goto LABEL_20;
  }
  if (a6 > 1000.0) {
    a6 = 1000.0;
  }
  Config = GetConfig(v27);
  if (Config)
  {
    v33 = GetConfig((HDRConfig *)Config);
    if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v33, 0x52u, 0))
    {
      v176[0] = 0;
      IsHit = (HDRConfig *)MrCacheIsHit((uint64_t)a4, a11, a12, a13, (char *)&self->mrCache, v176, a6, a7, a9, a10);
      if (IsHit)
      {
LABEL_19:
        invalidateDMDataL2L4L5L6L8L10((uint64_t)a4);
        MrCacheReadTgt((uint64_t)a4, (uint64_t)self->mrCache.YCCtoRGB_coef);
        updateComposerData((uint64_t)a3);
        goto LABEL_20;
      }
      if (v176[0])
      {
        v36 = GetConfig(IsHit);
        if (v36)
        {
          v37 = GetConfig((HDRConfig *)v36);
          if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v37, 0x56u, 0))
          {
            LOWORD(v168) = 0;
            *(_DWORD *)buf = 0;
            if (a4->var24.var0) {
              hdrpConstructL4((uint64_t)&self->mr, (uint64_t)a4, buf, v38);
            }
            *(_DWORD *)&self->mrCache.mr_L4.valid = *(_DWORD *)buf;
            self->mrCache.mr_L4.anchor_power = v168;
            goto LABEL_19;
          }
        }
      }
      MrCacheUpdateSrc((uint64_t)a4, a11, a12, a13, (uint64_t)self->mrCache.YCCtoRGB_coef, a6, a7, a9, a10);
    }
  }
  memset(v177, 0, sizeof(v177));
  memset(v176, 0, 170);
  memset(v175, 0, sizeof(v175));
  uint64_t v166 = 0;
  unsigned int v165 = 0;
  p_trim8 = &self->mr.mdsBase.mdsExtBaseFxp.trim8;
  p_mdsExt = &self->mdsExt;
  bzero(&self->mdsExt, 0xBE0uLL);
  *(void *)&self->mdsExt.trim2.TrimLevel = 0x700000002;
  *(void *)&self->mdsExt.trim8.TrimLevel = 0x1500000008;
  *(void *)&self->mdsExt.trim10.TrimLevel = 0xC0000000ALL;
  self->mdsExt.filtered_mean_PQ = -1.0;
  p_mr = &self->mr;
  bzero(&self->mr, 0x2408uLL);
  uint64_t v39 = 0;
  self->mr.trmCodec.Default2[1] = 1.0;
  self->mr.trmCodec.Default2[3] = 1.0;
  __asm { FMOV            V0.2D, #1.0 }
  long long v157 = _Q0;
  *(_OWORD *)&self->mr.trmCodec.Default2[5] = _Q0;
  self->mr.trmCodec.CodeBias2[1] = 0.5;
  *(_OWORD *)&self->mr.trmCodec.CodeBias2[2] = xmmword_2222D4C90;
  *(_OWORD *)&self->mr.trmCodec.CodeBias2[4] = xmmword_2222D4C90;
  self->mr.trmCodec.Default8[0] = 1.0;
  do
  {
    *(_OWORD *)&self->mr.trmCodec.Default8[v39 + 1] = *(_OWORD *)&self->mr.trmCodec.Default2[v39 + 1];
    *(_OWORD *)&self->mr.trmCodec.CodeBias8[v39 + 1] = *(_OWORD *)&self->mr.trmCodec.CodeBias2[v39 + 1];
    v39 += 2;
  }
  while (v39 != 6);
  *(_OWORD *)&self->mr.trmCodec.Default8[7] = 0u;
  self->mr.trmCodec.CodeBias8[7] = -0.5;
  self->mr.trmCodec.CodeBias8[8] = -0.5;
  *(_OWORD *)&self->mr.trmCodec.Default8[9] = 0u;
  *(_OWORD *)&self->mr.trmCodec.Default8[11] = 0u;
  *(_OWORD *)&self->mr.trmCodec.Default8[13] = 0u;
  memset_pattern16(&self->mr.trmCodec.CodeBias8[9], &unk_2222D4D10, 0x30uLL);
  *(_OWORD *)&self->mr.trmCodec.Default8[19] = 0u;
  *(_OWORD *)&self->mr.trmCodec.Default8[17] = 0u;
  *(_OWORD *)&self->mr.trmCodec.Default8[15] = 0u;
  memset_pattern16(&self->mr.trmCodec.CodeBias8[15], &unk_2222D4D20, 0x30uLL);
  *(_OWORD *)&self->mr.trmCodec.CodeBias10[8] = 0u;
  *(_OWORD *)&self->mr.trmCodec.CodeBias10[10] = 0u;
  *(_OWORD *)&self->mr.trmCodec.CodeBias10[4] = 0u;
  *(_OWORD *)&self->mr.trmCodec.CodeBias10[6] = 0u;
  *(_OWORD *)self->mr.trmCodec.CodeBias10 = 0u;
  *(_OWORD *)&self->mr.trmCodec.CodeBias10[2] = 0u;
  self->mr.trmCodec.Default10[0] = 1.0;
  *(_OWORD *)&self->mr.trmCodec.Default10[1] = xmmword_2222D4CA0;
  self->mr.trmCodec.Default10[3] = 1.0;
  self->mr.mrCfgChged = 1;
  self->mr.mdsExtChged = 1;
  self->mr.mdsBaseValid = -1;
  p_mdsExtBase = &self->mr.mdsBase.mdsExtBase;
  bzero(&self->mr.mdsBase.mdsExtBase, 0xBE0uLL);
  *(void *)&self->mr.mdsBase.mdsExtBase.trim2.TrimLevel = 0x700000002;
  *(void *)&self->mr.mdsBase.mdsExtBase.trim8.TrimLevel = 0x1500000008;
  *(void *)&self->mr.mdsBase.mdsExtBase.trim10.TrimLevel = 0xC0000000ALL;
  self->mr.mdsBase.mdsExtBase.filtered_mean_PQ = -1.0;
  p_mdsExtBaseFxp = &self->mr.mdsBase.mdsExtBaseFxp;
  bzero(&self->mr.mdsBase.mdsExtBaseFxp, 0x2BCuLL);
  *(void *)&self->mr.mdsBase.mdsExtBaseFxp.trim2.TrimLevel = 0x700000002;
  *(void *)&p_trim8->TrimLevel = 0x1500000008;
  *(void *)&self->mr.mdsBase.mdsExtBaseFxp.trim10.TrimLevel = 0xC0000000ALL;
  self->mr.mdsBase.mdsExtBaseFxp.filtered_mean_PQ = -1;
  self->mr.tcCtrl.pDefL8 = self->mr.trmCodec.Default8;
  self->mr.tcCtrl.pDefL2 = (double *)p_mr;
  self->mr.tcCtrl.sps[1].sMin = 0.0;
  *(_OWORD *)&self->mr.tcCtrl.sps[1].tMin = xmmword_2222D4CB0;
  *(_OWORD *)&self->mr.tcCtrl.sps[1].sMid = xmmword_2222D4CC0;
  *(_OWORD *)&self->mr.tcCtrl.sps[1].slopeMid = v157;
  *(_OWORD *)&self->mr.tcCtrl.sps[1].tMax = v157;
  *(_OWORD *)&self->mr.tcCtrl.sps[1].c2l = 0u;
  *(_OWORD *)&self->mr.tcCtrl.sps[1].c2u = 0u;
  self->mrCfg.mrCtrl.Bdp = a3->var2;
  self->mrCfg.mrCtrl.Rng = a11 != 0;
  if (a12 == 12)
  {
    self->mrCfg.sigEnv[0].RgbDef = 0;
    v46 = &xmmword_2222D4E20;
  }
  else if (a12 == 1)
  {
    self->mrCfg.sigEnv[0].RgbDef = 2;
    v46 = &xmmword_2222D4DA0;
  }
  else
  {
    self->mrCfg.sigEnv[0].RgbDef = 3;
    v46 = &xmmword_2222D4DE0;
  }
  long long v47 = v46[1];
  *(_OWORD *)self->mrCfg.sigEnv[0].V8Primaries = *v46;
  *(_OWORD *)&self->mrCfg.sigEnv[0].V8Primaries[2] = v47;
  long long v48 = v46[3];
  *(_OWORD *)&self->mrCfg.sigEnv[0].V8Primaries[4] = v46[2];
  *(_OWORD *)&self->mrCfg.sigEnv[0].V8Primaries[6] = v48;
  if (a13 == 1) {
    int v49 = 2;
  }
  else {
    int v49 = 3;
  }
  if (a13 == 12) {
    int v49 = 0;
  }
  self->mrCfg.mrCtrl.YuvXferSpec = v49;
  long long v50 = *(_OWORD *)a8;
  long long v51 = *((_OWORD *)a8 + 1);
  long long v52 = *((_OWORD *)a8 + 3);
  *(_OWORD *)&self->mrCfg.sigEnv[1].V8Primaries[4] = *((_OWORD *)a8 + 2);
  *(_OWORD *)&self->mrCfg.sigEnv[1].V8Primaries[6] = v52;
  *(_OWORD *)self->mrCfg.sigEnv[1].V8Primaries = v50;
  *(_OWORD *)&self->mrCfg.sigEnv[1].V8Primaries[2] = v51;
  ConfigEntryValue = (HDRConfig *)GetConfig(v45);
  if (ConfigEntryValue)
  {
    v54 = GetConfig(ConfigEntryValue);
    ConfigEntryValue = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v54, 0x59u, 0);
    if (*(unsigned char *)ConfigEntryValue)
    {
      *(_OWORD *)self->mrCfg.sigEnv[1].V8Primaries = xmmword_2222D4E20;
      *(_OWORD *)&self->mrCfg.sigEnv[1].V8Primaries[2] = unk_2222D4E30;
      *(_OWORD *)&self->mrCfg.sigEnv[1].V8Primaries[4] = xmmword_2222D4E40;
      *(_OWORD *)&self->mrCfg.sigEnv[1].V8Primaries[6] = unk_2222D4E50;
    }
  }
  self->mrCfg.mrCtrl.DmVer = 2;
  if (!a4->var31.var0)
  {
    unsigned int v55 = 4;
    goto LABEL_50;
  }
  unsigned int v55 = 4;
  if (a4->var31.var2 != 2)
  {
LABEL_50:
    unsigned int v56 = 8;
    goto LABEL_51;
  }
  self->mrCfg.mrCtrl.DmVer = 4;
  unsigned int v56 = 16;
  unsigned int v55 = 16;
LABEL_51:
  p_mrCfg = (char *)&self->mrCfg;
  self->mrCfg.sigEnv[0].SupportDms = v55;
  self->mrCfg.sigEnv[1].SupportDms = v56;
  self->mrCfg.sigEnv[0].Min = a10;
  self->mrCfg.sigEnv[0].Max = a9;
  uint64_t v174 = 0;
  long long v173 = 0u;
  long long v172 = 0u;
  *(_OWORD *)&v171[8] = 0u;
  *(double *)v171 = a6;
  v58 = (HDRConfig *)GetConfig(ConfigEntryValue);
  if (v58
    && (v59 = GetConfig(v58), v58 = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v59, 0x57u, 0), *(unsigned char *)v58))
  {
    *(_OWORD *)v171 = xmmword_2222D4CD0;
    *(void *)&v171[16] = 0x407D900000000000;
    v58 = (HDRConfig *)GetConfig(v58);
    if (!v58) {
      goto LABEL_64;
    }
    v60 = GetConfig(v58);
    v58 = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v60, 0x54u, 0);
    uint64_t v61 = 3;
    if (a5 <= 100.0 || a5 >= 1000.0 || !*(unsigned char *)v58) {
      goto LABEL_65;
    }
    double v62 = a5 / 10000.0;
    if (a5 < 0.0) {
      double v62 = 0.0;
    }
    long double v63 = pow(v62, 0.159301758);
    double v64 = pow((v63 * 18.8515625 + 0.8359375) / (v63 * 18.6875 + 1.0), 78.84375);
    if (fabs(v64 + -0.508078422) > 0.02 && fabs(v64 + -0.589110431) > 0.02 && fabs(v64 + -0.670599738) > 0.02)
    {
      *(double *)&long long v172 = a5;
      uint64_t v61 = 4;
    }
    else
    {
LABEL_64:
      uint64_t v61 = 3;
    }
  }
  else
  {
    uint64_t v61 = 1;
  }
LABEL_65:
  double v65 = (double)(unint64_t)(a7 * 1000000.0 + 0.5) / 1000000.0;
  v66 = GetConfig(v58);
  if (v66)
  {
    v67 = GetConfig((HDRConfig *)v66);
    if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v67, 0x58u, 0)) {
      double v65 = 0.005;
    }
  }
  bzero(buf, 0x25FuLL);
  int v164 = 0;
  int v68 = convertMetaDataToPayLoad((uint64_t)a4, (char *)buf);
  int v74 = MrParseMds(buf, v68, v69, v70, v71, v72, v73, (uint64_t)&self->mrCfg, &v164, (uint64_t)p_mdsExt, (uint64_t)p_mr);
  if (v74 < 0)
  {
    int v135 = v74;
    if (!enableLogInstance)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v178 = 67109120;
        *(_DWORD *)&v178[4] = v135;
        v139 = &_os_log_internal;
        v140 = " [1.419.54] MR81: metadataReconstruction: Error: ParseMds ret = %d";
        goto LABEL_198;
      }
      goto LABEL_199;
    }
    if (logInstanceID) {
      uint64_t v136 = logInstanceID;
    }
    else {
      uint64_t v136 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v178 = 134218240;
      *(void *)&v178[4] = WORD1(v136);
      *(_WORD *)&v178[12] = 1024;
      *(_DWORD *)v179 = v135;
      v137 = &_os_log_internal;
      v138 = " [1.419.54] #%04llx MR81: metadataReconstruction: Error: ParseMds ret = %d";
      goto LABEL_180;
    }
    goto LABEL_181;
  }
  v161 = self;
  uint64_t v163 = 0;
  v75 = (double *)v171;
  uint64_t v76 = v61;
  do
  {
    double v77 = *v75;
    v161->mrCfg.sigEnv[1].Min = v65;
    v161->mrCfg.sigEnv[1].Max = v77;
    int v78 = hdrpMetadataReconstruction(p_mrCfg, p_mdsExt, 0, (uint64_t)p_mr);
    int v79 = v78;
    if (v78 < 0)
    {
      if (!enableLogInstance)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v178 = 67109120;
          *(_DWORD *)&v178[4] = v79;
          v139 = &_os_log_internal;
          v140 = " [1.419.54] MR81: metadataReconstruction: Error: ret = %d";
          goto LABEL_198;
        }
        goto LABEL_199;
      }
      if (logInstanceID) {
        uint64_t v136 = logInstanceID;
      }
      else {
        uint64_t v136 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v178 = 134218240;
        *(void *)&v178[4] = WORD1(v136);
        *(_WORD *)&v178[12] = 1024;
        *(_DWORD *)v179 = v79;
        v137 = &_os_log_internal;
        v138 = " [1.419.54] #%04llx MR81: metadataReconstruction: Error: ret = %d";
        goto LABEL_180;
      }
LABEL_181:
      prevLogInstanceID = v136;
      goto LABEL_199;
    }
    if (!v78)
    {
      if (!enableLogInstance)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(void *)v178 = 67109120;
          v139 = &_os_log_internal;
          v140 = " [1.419.54] MR81: metadataReconstruction: Warning: ret = %d [no change]";
          goto LABEL_198;
        }
        goto LABEL_199;
      }
      if (logInstanceID) {
        uint64_t v141 = logInstanceID;
      }
      else {
        uint64_t v141 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v178 = 134218240;
        *(void *)&v178[4] = WORD1(v141);
        *(_WORD *)&v178[12] = 1024;
        *(_DWORD *)v179 = 0;
        v142 = &_os_log_internal;
        v143 = " [1.419.54] #%04llx MR81: metadataReconstruction: Warning: ret = %d [no change]";
LABEL_188:
        _os_log_impl(&dword_22224D000, v142, OS_LOG_TYPE_DEFAULT, v143, v178, 0x12u);
      }
LABEL_189:
      prevLogInstanceID = v141;
      goto LABEL_199;
    }
    int MdsExtFxpMr = MrGetMdsExtFxpMr(&v163, (uint64_t)p_mr);
    int v81 = MdsExtFxpMr;
    if (MdsExtFxpMr < 0)
    {
      if (!enableLogInstance)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v178 = 67109120;
          *(_DWORD *)&v178[4] = v81;
          v139 = &_os_log_internal;
          v140 = " [1.419.54] MR81: metadataReconstruction: Error: GetMdsExtFxpMr ret = %d";
          goto LABEL_198;
        }
        goto LABEL_199;
      }
      if (logInstanceID) {
        uint64_t v136 = logInstanceID;
      }
      else {
        uint64_t v136 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v178 = 134218240;
        *(void *)&v178[4] = WORD1(v136);
        *(_WORD *)&v178[12] = 1024;
        *(_DWORD *)v179 = v81;
        v137 = &_os_log_internal;
        v138 = " [1.419.54] #%04llx MR81: metadataReconstruction: Error: GetMdsExtFxpMr ret = %d";
LABEL_180:
        _os_log_impl(&dword_22224D000, v137, OS_LOG_TYPE_DEFAULT, v138, v178, 0x12u);
      }
      goto LABEL_181;
    }
    if (!MdsExtFxpMr)
    {
      if (!enableLogInstance)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(void *)v178 = 67109120;
          v139 = &_os_log_internal;
          v140 = " [1.419.54] MR81: metadataReconstruction: Warning: GetMdsExtFxpMr ret = %d [no change]";
          goto LABEL_198;
        }
        goto LABEL_199;
      }
      if (logInstanceID) {
        uint64_t v141 = logInstanceID;
      }
      else {
        uint64_t v141 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v178 = 134218240;
        *(void *)&v178[4] = WORD1(v141);
        *(_WORD *)&v178[12] = 1024;
        *(_DWORD *)v179 = 0;
        v142 = &_os_log_internal;
        v143 = " [1.419.54] #%04llx MR81: metadataReconstruction: Warning: GetMdsExtFxpMr ret = %d [no change]";
        goto LABEL_188;
      }
      goto LABEL_189;
    }
    uint64_t v82 = v163;
    copyL2L8L10(v163, (uint64_t)v177, (uint64_t)v176, (uint64_t)v175, (int *)&v166 + 1, (int *)&v166, (int *)&v165);
    ++v75;
    --v76;
  }
  while (v76);
  uint64_t v154 = v61;
  v155 = p_mrCfg;
  v151 = a3;
  uint64_t v83 = invalidateDMDataL2L4L5L6L8L10((uint64_t)a4);
  uint64_t v84 = 0;
  a4->var15 = *(unsigned __int16 *)(v82 + 76);
  a4->var16 = *(unsigned __int16 *)(v82 + 78);
  uint64_t v156 = v82;
  uint64_t v85 = v82 + 8;
  var4 = a4->var4;
  v87 = &_os_log_internal;
  do
  {
    for (uint64_t i = 0; i != 3; ++i)
    {
      int v89 = var4[i];
      int v90 = *(__int16 *)(v85 + 2 * i);
      if (v89 != v90)
      {
        if (enableLogInstance)
        {
          if (logInstanceID) {
            uint64_t v91 = logInstanceID;
          }
          else {
            uint64_t v91 = prevLogInstanceID;
          }
          uint64_t v83 = os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT);
          if (v83)
          {
            *(_DWORD *)v178 = 134219008;
            *(void *)&v178[4] = WORD1(v91);
            *(_WORD *)&v178[12] = 1024;
            *(_DWORD *)v179 = v84;
            *(_WORD *)&v179[4] = 1024;
            *(_DWORD *)v180 = i;
            *(_WORD *)&v180[4] = 1024;
            int v181 = v89;
            __int16 v182 = 1024;
            int v183 = v90;
            _os_log_impl(&dword_22224D000, v87, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx MR81: metadataReconstruction: Warning: YCCtoRGB_coef [%d][%d] changed, %d/%d", v178, 0x24u);
          }
          prevLogInstanceID = v91;
        }
        else
        {
          uint64_t v83 = os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT);
          if (v83)
          {
            *(_DWORD *)v178 = 67109888;
            *(_DWORD *)&v178[4] = v84;
            *(_WORD *)&v178[8] = 1024;
            *(_DWORD *)&v178[10] = i;
            *(_WORD *)v179 = 1024;
            *(_DWORD *)&v179[2] = v89;
            *(_WORD *)v180 = 1024;
            *(_DWORD *)&v180[2] = v90;
            _os_log_impl(&dword_22224D000, v87, OS_LOG_TYPE_DEFAULT, " [1.419.54] MR81: metadataReconstruction: Warning: YCCtoRGB_coef [%d][%d] changed, %d/%d", v178, 0x1Au);
          }
        }
      }
    }
    ++v84;
    v85 += 6;
    var4 += 3;
  }
  while (v84 != 3);
  uint64_t v92 = 0;
  v93 = &_os_log_internal;
  do
  {
    unsigned int v94 = a4->var5[v92];
    int v95 = *(_DWORD *)(v156 + 28 + 4 * v92);
    if (v94 != v95)
    {
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v96 = logInstanceID;
        }
        else {
          uint64_t v96 = prevLogInstanceID;
        }
        uint64_t v83 = os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT);
        if (v83)
        {
          *(_DWORD *)v178 = 134218752;
          *(void *)&v178[4] = WORD1(v96);
          *(_WORD *)&v178[12] = 1024;
          *(_DWORD *)v179 = v92;
          *(_WORD *)&v179[4] = 1024;
          *(_DWORD *)v180 = v94;
          *(_WORD *)&v180[4] = 1024;
          int v181 = v95;
          _os_log_impl(&dword_22224D000, v93, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx MR81: metadataReconstruction: Warning: YCCtoRGB_offset[%d] changed, %u/%u", v178, 0x1Eu);
        }
        prevLogInstanceID = v96;
      }
      else
      {
        uint64_t v83 = os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT);
        if (v83)
        {
          *(_DWORD *)v178 = 67109632;
          *(_DWORD *)&v178[4] = v92;
          *(_WORD *)&v178[8] = 1024;
          *(_DWORD *)&v178[10] = v94;
          *(_WORD *)v179 = 1024;
          *(_DWORD *)&v179[2] = v95;
          _os_log_impl(&dword_22224D000, v93, OS_LOG_TYPE_DEFAULT, " [1.419.54] MR81: metadataReconstruction: Warning: YCCtoRGB_offset[%d] changed, %u/%u", v178, 0x14u);
        }
      }
    }
    ++v92;
  }
  while (v92 != 3);
  uint64_t v97 = 0;
  uint64_t v98 = v156 + 42;
  var6 = a4->var6;
  v100 = &_os_log_internal;
  do
  {
    for (uint64_t j = 0; j != 3; ++j)
    {
      int v102 = var6[j];
      int v103 = *(__int16 *)(v98 + 2 * j);
      if (v102 != v103)
      {
        if (enableLogInstance)
        {
          if (logInstanceID) {
            uint64_t v104 = logInstanceID;
          }
          else {
            uint64_t v104 = prevLogInstanceID;
          }
          uint64_t v83 = os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT);
          if (v83)
          {
            *(_DWORD *)v178 = 134219008;
            *(void *)&v178[4] = WORD1(v104);
            *(_WORD *)&v178[12] = 1024;
            *(_DWORD *)v179 = v97;
            *(_WORD *)&v179[4] = 1024;
            *(_DWORD *)v180 = j;
            *(_WORD *)&v180[4] = 1024;
            int v181 = v102;
            __int16 v182 = 1024;
            int v183 = v103;
            _os_log_impl(&dword_22224D000, v100, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx MR81: metadataReconstruction: Warning: RGBtoLMS_coef [%d][%d] changed, %d/%d", v178, 0x24u);
          }
          prevLogInstanceID = v104;
        }
        else
        {
          uint64_t v83 = os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT);
          if (v83)
          {
            *(_DWORD *)v178 = 67109888;
            *(_DWORD *)&v178[4] = v97;
            *(_WORD *)&v178[8] = 1024;
            *(_DWORD *)&v178[10] = j;
            *(_WORD *)v179 = 1024;
            *(_DWORD *)&v179[2] = v102;
            *(_WORD *)v180 = 1024;
            *(_DWORD *)&v180[2] = v103;
            _os_log_impl(&dword_22224D000, v100, OS_LOG_TYPE_DEFAULT, " [1.419.54] MR81: metadataReconstruction: Warning: RGBtoLMS_coef [%d][%d] changed, %d/%d", v178, 0x1Au);
          }
        }
      }
    }
    ++v97;
    v98 += 6;
    var6 += 3;
  }
  while (v97 != 3);
  *(int32x4_t *)a4->var4 = vmovl_s16(*(int16x4_t *)(v156 + 8));
  *(int32x4_t *)&a4->var4[4] = vmovl_s16(*(int16x4_t *)(v156 + 16));
  a4->var4[8] = *(__int16 *)(v156 + 24);
  a4->var5[0] = *(_DWORD *)(v156 + 28);
  a4->var5[1] = *(_DWORD *)(v156 + 32);
  a4->var5[2] = *(_DWORD *)(v156 + 36);
  *(int32x4_t *)a4->var6 = vmovl_s16(*(int16x4_t *)(v156 + 42));
  *(int32x4_t *)&a4->var6[4] = vmovl_s16(*(int16x4_t *)(v156 + 50));
  a4->var6[8] = *(__int16 *)(v156 + 58);
  a4->var21.var1 = *(_WORD *)(v156 + 120);
  a4->var21.var3 = *(_WORD *)(v156 + 124);
  a4->var21.var2 = *(_WORD *)(v156 + 122);
  a4->var23.var0 = 1;
  a4->var23.var1 = *(_WORD *)(v156 + 126);
  a4->var23.var2 = *(_WORD *)(v156 + 128);
  a4->var23.var3 = *(_WORD *)(v156 + 130);
  ++a4->var18;
  if (*(__int16 *)(v156 + 692) != -1)
  {
    v105 = GetConfig((HDRConfig *)v83);
    if (v105)
    {
      v106 = GetConfig((HDRConfig *)v105);
      if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v106, 0x55u, 0))
      {
        a4->var24.var0 = 1;
        *(_DWORD *)&a4->var24.var1 = *(_DWORD *)(v156 + 692);
        ++a4->var18;
      }
    }
  }
  uint64_t v107 = v154;
  if (v161->mrCfg.mrCtrl.DmVer != 4)
  {
LABEL_126:
    uint64_t v114 = v166;
    unsigned int v115 = HIDWORD(v166);
    uint64_t v116 = v165;
    if (HIDWORD(v166))
    {
      if (SHIDWORD(v166) >= 1)
      {
        unsigned int var18 = a4->var18;
        unint64_t v118 = (unint64_t)v177 | 0xE;
        p_var7 = &a4->var22[0].var7;
        uint64_t v120 = HIDWORD(v166);
        do
        {
          *(void *)(p_var7 - 6) = *(void *)(v118 - 12);
          *(p_var7 - 2) = *(_WORD *)(v118 - 4);
          *(_DWORD *)(p_var7 - 1) = *(_DWORD *)(v118 - 2);
          *(p_var7 - 7) = 1;
          v118 += 16;
          p_var7 += 8;
          --v120;
        }
        while (v120);
        a4->unsigned int var18 = var18 + v115;
      }
      a4->var19 = v115;
    }
    if (v114)
    {
      if ((int)v114 >= 1)
      {
        unint64_t v121 = 0;
        unsigned int v122 = a4->var18;
        do
        {
          v123 = (char *)a4 + v121;
          v123[330] = v176[v121 + 4];
          *(void *)&a4->var27[v121 / 0x22].var3 = *(void *)&v176[v121 + 6];
          *((_DWORD *)v123 + 85) = *(_DWORD *)&v176[v121 + 14];
          *((_WORD *)v123 + 164) = 10;
          int v124 = *(unsigned __int16 *)&v176[v121 + 18];
          if (v124 != 2048)
          {
            *((_WORD *)v123 + 172) = v124;
            *((_WORD *)v123 + 164) = 12;
          }
          *((_WORD *)v123 + 173) = 2048;
          *((_DWORD *)v123 + 87) = -2139062144;
          *((_WORD *)v123 + 176) = -32640;
          *(_DWORD *)(v123 + 354) = -2139062144;
          *((_WORD *)v123 + 179) = -32640;
          v121 += 34;
          *((_WORD *)v123 + 163) = 1;
        }
        while (34 * v114 != v121);
        a4->unsigned int var18 = v122 + v114;
      }
      a4->var20 = v114;
      *(_WORD *)&a4->var31.var1 = 512;
      if (!a4->var31.var0)
      {
        a4->var31.var0 = 1;
        ++a4->var18;
      }
    }
    if ((int)v116 >= 1)
    {
      unint64_t v125 = 0;
      unsigned int v126 = a4->var18;
      do
      {
        v127 = (char *)a4 + v125;
        v127[522] = v175[v125 + 4];
        *((_DWORD *)v127 + 131) = *(_DWORD *)&v175[v125 + 6];
        unsigned int v128 = v175[v125 + 10];
        v127[528] = v128;
        *(_OWORD *)&a4->var29[v125 / 0x1C].var6 = *(_OWORD *)&v175[v125 + 12];
        if (v128 <= 0x12) {
          __int16 v129 = 5;
        }
        else {
          __int16 v129 = 21;
        }
        *((_WORD *)v127 + 260) = v129;
        *((_WORD *)v127 + 259) = 1;
        v125 += 28;
      }
      while (28 * v116 != v125);
      a4->unsigned int var18 = v126 + v116;
    }
    if ((int)v114 >= 1)
    {
      uint64_t v130 = 0;
      p_var2 = &a4->var27[0].var2;
      v132 = &a4->var29[0].var2;
      do
      {
        unsigned __int8 *v132 = v130 - 76;
        v132 += 28;
        unsigned __int8 *p_var2 = v130 - 76;
        p_var2 += 34;
        ++v130;
      }
      while (v114 != v130);
    }
    updateComposerData((uint64_t)v151);
    v35 = GetConfig(v133);
    if (!v35) {
      return (int)v35;
    }
    v134 = GetConfig((HDRConfig *)v35);
    if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v134, 0x52u, 0)) {
      MrCacheUpdateTgt((uint64_t)a4, (uint64_t)v161->mrCache.YCCtoRGB_coef);
    }
LABEL_20:
    LODWORD(v35) = 0;
    return (int)v35;
  }
  v161->mrCfg.mrCtrl.DmVer = 3;
  v161->mrCfg.sigEnv[0].SupportDms = 4;
  v161->mrCfg.sigEnv[1].SupportDms = 8;
  v161->mdsExt.dm_version_index = 1;
  bzero(p_mdsExtBase, 0xBE0uLL);
  *(void *)&v161->mr.mdsBase.mdsExtBase.trim2.TrimLevel = 0x700000002;
  *(void *)&v161->mr.mdsBase.mdsExtBase.trim8.TrimLevel = 0x1500000008;
  *(void *)&v161->mr.mdsBase.mdsExtBase.trim10.TrimLevel = 0xC0000000ALL;
  v161->mr.mdsBase.mdsExtBase.filtered_mean_PQ = -1.0;
  bzero(p_mdsExtBaseFxp, 0x2BCuLL);
  *(void *)&v161->mr.mdsBase.mdsExtBaseFxp.trim2.TrimLevel = 0x700000002;
  *(void *)&p_trim8->TrimLevel = 0x1500000008;
  *(void *)&p_trim8[1].TrimLevel = 0xC0000000ALL;
  p_trim8[1].Trima[3][9] = -1;
  v108 = (double *)v171;
  while (1)
  {
    double v109 = *v108;
    v161->mrCfg.sigEnv[1].Min = v65;
    v161->mrCfg.sigEnv[1].Max = v109;
    int v110 = hdrpMetadataReconstruction(v155, p_mdsExt, 0, (uint64_t)p_mr);
    int v111 = v110;
    if (v110 < 0)
    {
      if (!enableLogInstance)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v178 = 67109120;
          *(_DWORD *)&v178[4] = v111;
          v139 = &_os_log_internal;
          v140 = " [1.419.54] MR81: metadataReconstruction: Error: ret = %d";
          goto LABEL_198;
        }
        goto LABEL_199;
      }
      if (logInstanceID) {
        uint64_t v144 = logInstanceID;
      }
      else {
        uint64_t v144 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v178 = 134218240;
        *(void *)&v178[4] = WORD1(v144);
        *(_WORD *)&v178[12] = 1024;
        *(_DWORD *)v179 = v111;
        v145 = &_os_log_internal;
        v146 = " [1.419.54] #%04llx MR81: metadataReconstruction: Error: ret = %d";
        goto LABEL_219;
      }
LABEL_220:
      prevLogInstanceID = v144;
      goto LABEL_199;
    }
    if (!v110)
    {
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v147 = logInstanceID;
        }
        else {
          uint64_t v147 = prevLogInstanceID;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v178 = 134218240;
          *(void *)&v178[4] = WORD1(v147);
          *(_WORD *)&v178[12] = 1024;
          *(_DWORD *)v179 = 0;
          v148 = &_os_log_internal;
          v149 = " [1.419.54] #%04llx MR81: metadataReconstruction: Warning: ret = %d [no change]";
          goto LABEL_227;
        }
LABEL_228:
        prevLogInstanceID = v147;
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)v178 = 67109120;
        v139 = &_os_log_internal;
        v140 = " [1.419.54] MR81: metadataReconstruction: Warning: ret = %d [no change]";
        goto LABEL_198;
      }
      goto LABEL_199;
    }
    int v112 = MrGetMdsExtFxpMr(&v163, (uint64_t)p_mr);
    int v113 = v112;
    if (v112 < 0) {
      break;
    }
    if (!v112)
    {
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v147 = logInstanceID;
        }
        else {
          uint64_t v147 = prevLogInstanceID;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v178 = 134218240;
          *(void *)&v178[4] = WORD1(v147);
          *(_WORD *)&v178[12] = 1024;
          *(_DWORD *)v179 = 0;
          v148 = &_os_log_internal;
          v149 = " [1.419.54] #%04llx MR81: metadataReconstruction: Warning: GetMdsExtFxpMr ret = %d [no change]";
LABEL_227:
          _os_log_impl(&dword_22224D000, v148, OS_LOG_TYPE_DEFAULT, v149, v178, 0x12u);
        }
        goto LABEL_228;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)v178 = 67109120;
        v139 = &_os_log_internal;
        v140 = " [1.419.54] MR81: metadataReconstruction: Warning: GetMdsExtFxpMr ret = %d [no change]";
LABEL_198:
        _os_log_impl(&dword_22224D000, v139, OS_LOG_TYPE_DEFAULT, v140, v178, 8u);
      }
      goto LABEL_199;
    }
    copyL2L8L10(v163, (uint64_t)v177, (uint64_t)v176, (uint64_t)v175, (int *)&v166 + 1, (int *)&v166, (int *)&v165);
    ++v108;
    if (!--v107) {
      goto LABEL_126;
    }
  }
  if (enableLogInstance)
  {
    if (logInstanceID) {
      uint64_t v144 = logInstanceID;
    }
    else {
      uint64_t v144 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v178 = 134218240;
      *(void *)&v178[4] = WORD1(v144);
      *(_WORD *)&v178[12] = 1024;
      *(_DWORD *)v179 = v113;
      v145 = &_os_log_internal;
      v146 = " [1.419.54] #%04llx MR81: metadataReconstruction: Error: GetMdsExtFxpMr ret = %d";
LABEL_219:
      _os_log_impl(&dword_22224D000, v145, OS_LOG_TYPE_DEFAULT, v146, v178, 0x12u);
    }
    goto LABEL_220;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v178 = 67109120;
    *(_DWORD *)&v178[4] = v113;
    v139 = &_os_log_internal;
    v140 = " [1.419.54] MR81: metadataReconstruction: Error: GetMdsExtFxpMr ret = %d";
    goto LABEL_198;
  }
LABEL_199:
  LODWORD(v35) = -1;
  return (int)v35;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)DolbyVisionMR;
  [(DolbyVisionMR *)&v2 dealloc];
}

@end