@interface MSRHDRProcessingByCapabilities
- (MSRHDRProcessingByCapabilities)init;
- (float)getDolby84DegammaScale;
- (float)getDolby84PostDegammaScale;
- (int)getLumaShiftBits;
- (int)getOotfLumaShiftBits;
- (unint64_t)getDegammaLutSize;
- (unint64_t)getRegammaLutSize;
- (unint64_t)getTmLutSize;
- (unsigned)polynomialTableScale;
- (void)dovi_ootf_getTmLutInput:(unint64_t)a3 lutInput:(float *)a4;
- (void)getDegammaLutInput:(float *)a3;
- (void)getRegammaLutInput:(float *)a3;
- (void)getTmUnequalLutInput:(unint64_t)a3 lutInput:(float *)a4;
- (void)hdr10_getTmLutInput:(unint64_t)a3 lutInput:(float *)a4;
- (void)hdr10_tm_updateLUT:(int64_t)a3 ScalingFactorBuffer:(float *)a4 LumaMixFactorBuffer:(float *)a5;
- (void)hlg_getTmLutInput:(unint64_t)a3 lutInput:(float *)a4;
- (void)hlg_tm_updateLUT:(int64_t)a3 ScalingFactorBuffer:(float *)a4;
- (void)populateMSRColorConfigStageB02HDR10:(id *)a3 DMConfig:(id *)a4;
- (void)populateMSRColorConfigStageB02HLG:(id *)a3 hdrControl:(id *)a4;
- (void)populateMSRColorConfigStageHwOOTF:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10;
- (void)setupHardwareConfigUnit;
- (void)setupMSRMappingTableWithMetadata:(id *)a3;
- (void)setupMSRPolynomialTableForHDR10;
- (void)updateMmrReshapeChromaForComponent:(unsigned __int16)a3 mmrReshapeChroma:(int)a4;
- (void)updateMmrTableForComponent:(unsigned __int16)a3 mmrClipValMin:(unsigned __int16 *)a4 mmrClipValMax:(unsigned __int16 *)a5 mmrCoeff:(float *)a6;
- (void)updatePolynomialTablesForComponent:(unsigned __int16 *)a3 Component:(unsigned __int16)a4 TableSize:(unint64_t)a5;
@end

@implementation MSRHDRProcessingByCapabilities

- (MSRHDRProcessingByCapabilities)init
{
  v4.receiver = self;
  v4.super_class = (Class)MSRHDRProcessingByCapabilities;
  v2 = [(MSRHDRProcessing *)&v4 init];
  if (v2)
  {
    if (qword_26ABE1E28 != -1) {
      dispatch_once(&qword_26ABE1E28, &__block_literal_global_2);
    }
    v2->super._mmrEnable = 0;
    avdHistSupport = _MergedGlobals_6;
    unequalLUTSupport = byte_26ABE1E19;
  }
  return v2;
}

- (void)setupHardwareConfigUnit
{
  v22.receiver = self;
  v22.super_class = (Class)MSRHDRProcessingByCapabilities;
  Config = (HDRConfig *)[(MSRHDRProcessing *)&v22 setupHardwareConfigUnit];
  if (dword_26ABE1E20 >= 1)
  {
    msrCU = (int32x2_t *)self->super._msrCU;
    msrCU[4611] = (int32x2_t)0x140462617366;
    int32x2_t *msrCU = vadd_s32(*msrCU, (int32x2_t)0x140400000001);
  }
  if (byte_26ABE1E1A)
  {
    v5 = self->super._msrCU;
    v5->var5 = (MSRHcuEntryHeader_t)0xC066726172;
    v5->var0 = (MSRHcuHeader_t)vadd_s32((int32x2_t)v5->var0, (int32x2_t)0xC000000001);
  }
  if (byte_26ABE1E19)
  {
    self->super._msrCU->var7 = (MSRHcuEntryHeader_t)0x17D866726173;
    Config = (HDRConfig *)GetConfig(Config);
    if (Config)
    {
      v6 = GetConfig(Config);
      Config = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v6, 0x24u, 0);
      int v7 = *(unsigned __int8 *)Config;
      self->super._enableUnequalSpacingLUT = v7;
      if (v7) {
        self->super._msrCU->var0 = (MSRHcuHeader_t)vadd_s32((int32x2_t)self->super._msrCU->var0, (int32x2_t)0x17D800000001);
      }
    }
    else
    {
      self->super._enableUnequalSpacingLUT = 0;
    }
  }
  if (byte_26ABE1E1B)
  {
    self->super._msrCU->var9 = (MSRHcuEntryHeader_t)0x2C66726175;
    ConfigEntryValue = (HDRConfig *)GetConfig(Config);
    if (ConfigEntryValue)
    {
      v9 = GetConfig(ConfigEntryValue);
      ConfigEntryValue = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v9, 0x2Au, 0);
      BOOL v10 = *(unsigned char *)ConfigEntryValue != 0;
    }
    else
    {
      BOOL v10 = 0;
    }
    self->super.super._enableHwOOTF = v10;
    v11 = (HDRConfig *)GetConfig(ConfigEntryValue);
    if (v11)
    {
      v12 = GetConfig(v11);
      v11 = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v12, 0x2Bu, 0);
      BOOL v13 = *(unsigned char *)v11 != 0;
    }
    else
    {
      BOOL v13 = 0;
    }
    self->super.super._enableHwOotfForHLG = v13;
    v14 = (HDRConfig *)GetConfig(v11);
    if (v14)
    {
      v15 = GetConfig(v14);
      v14 = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v15, 0x2Cu, 0);
      BOOL v16 = *(unsigned char *)v14 != 0;
    }
    else
    {
      BOOL v16 = 0;
    }
    self->super.super._enableHwOotfForDolby84 = v16;
    Config = (HDRConfig *)GetConfig(v14);
    if (Config)
    {
      v17 = GetConfig(Config);
      Config = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v17, 0x2Du, 0);
      BOOL v18 = *(unsigned char *)Config != 0;
    }
    else
    {
      BOOL v18 = 0;
    }
    self->super._enableFp16Regamma = v18;
    if (self->super.super._enableHwOOTF) {
      self->super._msrCU->var0 = (MSRHcuHeader_t)vadd_s32((int32x2_t)self->super._msrCU->var0, (int32x2_t)0x2C00000001);
    }
  }
  if (byte_26ABE1E1C)
  {
    v19 = GetConfig(Config);
    if (v19)
    {
      v20 = GetConfig((HDRConfig *)v19);
      BOOL v21 = *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v20, 0x2Du, 0) != 0;
    }
    else
    {
      BOOL v21 = 0;
    }
    self->super._enableFp16Regamma = v21;
  }
}

- (void)setupMSRPolynomialTableForHDR10
{
  v4.receiver = self;
  v4.super_class = (Class)MSRHDRProcessingByCapabilities;
  [(MSRHDRProcessing *)&v4 setupMSRPolynomialTableForHDR10];
  if (byte_26ABE1E1A)
  {
    for (int i = 0; i != 3; ++i)
      [(MSRHDRProcessingByCapabilities *)self updateMmrReshapeChromaForComponent:(unsigned __int16)i mmrReshapeChroma:1];
  }
}

- (void)setupMSRMappingTableWithMetadata:(id *)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (byte_26ABE1E1A)
  {
    unsigned int v5 = a3->var0 + 8;
    uint64_t v21 = (1 << (LOBYTE(a3->var0) + 8));
    v6 = malloc_type_malloc(6 << (LOBYTE(a3->var0) + 8), 0xDB60AE93uLL);
    int v7 = malloc_type_calloc(0x2CuLL, 4uLL, 0x100004052888210uLL);
    v9 = v7;
    if (v6) {
      BOOL v10 = v7 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
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
          *(_DWORD *)buf = 134217984;
          uint64_t v26 = WORD1(v11);
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"polyBuf && mmrCoefBuf\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingByCapabilities.mm\" at line 254\n", buf, 0xCu);
        }
        prevLogInstanceID = v11;
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"polyBuf && mmrCoefBuf\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingByCapabilities.mm\" at line 254\n", buf, 2u);
      }
    }
    uint64_t v12 = 0;
    int v13 = -22;
    v14 = &_os_log_internal;
    uint64_t v15 = 276;
    *(void *)&long long v8 = 134217984;
    long long v20 = v8;
    do
    {
      unsigned int v16 = *(unsigned int *)((char *)&a3->var0 + v15);
      if (v16 >= 2)
      {
        if (enableLogInstance)
        {
          if (logInstanceID) {
            uint64_t v17 = logInstanceID;
          }
          else {
            uint64_t v17 = prevLogInstanceID;
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            uint64_t v26 = WORD1(v17);
            _os_log_impl(&dword_22224D000, v14, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"metadata->mapping_idc[0][0][cmp][0] == 0 || metadata->mapping_idc[0][0][cmp][0] == 1\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingByCapabilities.mm\" at line 257\n", buf, 0xCu);
          }
          prevLogInstanceID = v17;
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22224D000, v14, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"metadata->mapping_idc[0][0][cmp][0] == 0 || metadata->mapping_idc[0][0][cmp][0] == 1\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingByCapabilities.mm\" at line 257\n", buf, 2u);
        }
        unsigned int v16 = *(unsigned int *)((char *)&a3->var0 + v15);
      }
      if (v16 && (v16 != 1 || [(MSRHDRProcessing *)self isMMREnabled]))
      {
        if (!v12)
        {
          if (enableLogInstance)
          {
            if (logInstanceID) {
              uint64_t v18 = logInstanceID;
            }
            else {
              uint64_t v18 = prevLogInstanceID;
            }
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v20;
              uint64_t v26 = WORD1(v18);
              _os_log_impl(&dword_22224D000, v14, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"cmp != 0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingByCapabilities.mm\" at line 272\n", buf, 0xCu);
            }
            prevLogInstanceID = v18;
          }
          else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22224D000, v14, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"cmp != 0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingByCapabilities.mm\" at line 272\n", buf, 2u);
          }
        }
        createMmrTableForComponent((uint64_t)a3, v12, (uint64_t)v23, (uint64_t)v22, &v9[v13 & 0xFFFFFFFE]);
        [(MSRHDRProcessingByCapabilities *)self updateMmrTableForComponent:(unsigned __int16)v12 mmrClipValMin:v23 mmrClipValMax:v22 mmrCoeff:&v9[v13 & 0xFFFFFFFE]];
        uint64_t v19 = 0;
      }
      else
      {
        createPolynomialTableForComponent((int *)a3, v12, (uint64_t)v6 + 2 * (v12 << v5));
        [(MSRHDRProcessingByCapabilities *)self updatePolynomialTablesForComponent:v6 Component:(unsigned __int16)v12 TableSize:v21];
        uint64_t v19 = 1;
      }
      -[MSRHDRProcessingByCapabilities updateMmrReshapeChromaForComponent:mmrReshapeChroma:](self, "updateMmrReshapeChromaForComponent:mmrReshapeChroma:", (unsigned __int16)v12++, v19, v20);
      v13 += 22;
      v15 += 36;
    }
    while (v12 != 3);
    free(v9);
    free(v6);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)MSRHDRProcessingByCapabilities;
    [(MSRHDRProcessing *)&v24 setupMSRMappingTableWithMetadata:a3];
  }
}

- (unsigned)polynomialTableScale
{
  if (byte_26ABE1E1A) {
    return 16;
  }
  v3.receiver = self;
  v3.super_class = (Class)MSRHDRProcessingByCapabilities;
  return [(MSRHDRProcessing *)&v3 polynomialTableScale];
}

- (void)updatePolynomialTablesForComponent:(unsigned __int16 *)a3 Component:(unsigned __int16)a4 TableSize:(unint64_t)a5
{
  if (byte_26ABE1E1A)
  {
    self->super._reshapeLUTCreated = 1;
    self->super._reshapeLUTSize = a5;
    if (a5)
    {
      unsigned int v5 = &a3[a4 * a5];
      v6 = self->super._reshapeLUT[(unint64_t)a4];
      do
      {
        __int16 v7 = *v5++;
        *v6++ = 4 * v7;
        --a5;
      }
      while (a5);
    }
  }
}

- (void)updateMmrTableForComponent:(unsigned __int16)a3 mmrClipValMin:(unsigned __int16 *)a4 mmrClipValMax:(unsigned __int16 *)a5 mmrCoeff:(float *)a6
{
  if (byte_26ABE1E1A)
  {
    msrCU = self->super._msrCU;
    var4 = msrCU->var6.var4;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFDLL;
    do
    {
      *(var4 - 3) = a4[v8 + 3];
      *var4++ = a5[v8 + 3];
      ++v8;
    }
    while (v8 * 2);
    if (a3 == 1)
    {
      uint64_t v9 = 42044;
    }
    else
    {
      if (a3 != 2) {
        return;
      }
      uint64_t v9 = 42132;
    }
    BOOL v10 = (char *)msrCU + v9;
    for (uint64_t i = 0; i != 22; ++i)
      *(float *)&v10[i * 4] = a6[i];
  }
}

- (void)updateMmrReshapeChromaForComponent:(unsigned __int16)a3 mmrReshapeChroma:(int)a4
{
  if (byte_26ABE1E1A)
  {
    p_var6 = &self->super._msrCU->var6;
    self->super._msrCU->var6.var2 = 4;
    if (a3 == 2)
    {
      p_var6->var1 = a4 != 0;
    }
    else if (a3 == 1)
    {
      p_var6->var0 = a4 != 0;
    }
  }
}

- (unint64_t)getDegammaLutSize
{
  v3.receiver = self;
  v3.super_class = (Class)MSRHDRProcessingByCapabilities;
  unint64_t result = [(MSRHDRProcessing *)&v3 getDegammaLutSize];
  if (dword_26ABE1E20 > 0) {
    return 1281;
  }
  return result;
}

- (void)getDegammaLutInput:(float *)a3
{
  if (dword_26ABE1E20 < 1)
  {
    v9.receiver = self;
    v9.super_class = (Class)MSRHDRProcessingByCapabilities;
    [(MSRHDRProcessing *)&v9 getDegammaLutInput:a3];
  }
  else
  {
    uint64_t v3 = 0;
    int64x2_t v4 = (int64x2_t)xmmword_2222D09C0;
    uint64x2_t v5 = (uint64x2_t)vdupq_n_s64(0x401uLL);
    int64x2_t v6 = vdupq_n_s64(2uLL);
    do
    {
      if (vmovn_s64((int64x2_t)vcgtq_u64(v5, (uint64x2_t)v4)).u8[0]) {
        a3[v3] = (float)v3 * 0.00097656;
      }
      if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x401uLL), *(uint64x2_t *)&v4)).i32[1]) {
        a3[v3 + 1] = (float)(v3 + 1) * 0.00097656;
      }
      v3 += 2;
      int64x2_t v4 = vaddq_s64(v4, v6);
    }
    while (v3 != 1026);
    uint64_t v7 = 0;
    float v8 = 1.0;
    do
    {
      a3[v7 + 1024] = v8;
      float v8 = v8 + 0.03125;
      ++v7;
    }
    while (v7 != 257);
  }
}

- (unint64_t)getRegammaLutSize
{
  v3.receiver = self;
  v3.super_class = (Class)MSRHDRProcessingByCapabilities;
  return [(MSRHDRProcessing *)&v3 getRegammaLutSize];
}

- (void)getRegammaLutInput:(float *)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MSRHDRProcessingByCapabilities;
  [(MSRHDRProcessing *)&v3 getRegammaLutInput:a3];
}

- (unint64_t)getTmLutSize
{
  if (self->super._enableUnequalSpacingLUT) {
    return 754;
  }
  v3.receiver = self;
  v3.super_class = (Class)MSRHDRProcessingByCapabilities;
  return [(MSRHDRProcessing *)&v3 getTmLutSize];
}

- (void)getTmUnequalLutInput:(unint64_t)a3 lutInput:(float *)a4
{
  int v4 = 0;
  float v5 = 0.000000059605;
  float v6 = 0.0;
  do
  {
    if (v4 > 15)
    {
      if (v4 == 17)
      {
LABEL_9:
        int v7 = 1;
        goto LABEL_12;
      }
      if (v4 == 16)
      {
        int v7 = 496;
        goto LABEL_12;
      }
    }
    else
    {
      if (!v4)
      {
        int v7 = 32;
        goto LABEL_12;
      }
      if (v4 == 15) {
        goto LABEL_9;
      }
    }
    int v7 = 16;
    do
    {
LABEL_12:
      *a4++ = v6;
      float v6 = v5 + v6;
      --v7;
    }
    while (v7);
    if (v4 == 15) {
      float v8 = v5;
    }
    else {
      float v8 = 0.0;
    }
    float v6 = v6 - v8;
    if (v4 != 17 && v4 != 15) {
      float v5 = v5 + v5;
    }
    ++v4;
  }
  while (v4 != 18);
}

- (void)hdr10_getTmLutInput:(unint64_t)a3 lutInput:(float *)a4
{
  if (self->super._enableUnequalSpacingLUT)
  {
    [(MSRHDRProcessingByCapabilities *)self getTmUnequalLutInput:a3 lutInput:a4];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)MSRHDRProcessingByCapabilities;
    [(MSRHDRProcessing *)&v4 hdr10_getTmLutInput:a3 lutInput:a4];
  }
}

- (void)hlg_getTmLutInput:(unint64_t)a3 lutInput:(float *)a4
{
  if (self->super._enableUnequalSpacingLUT)
  {
    [(MSRHDRProcessingByCapabilities *)self getTmUnequalLutInput:a3 lutInput:a4];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)MSRHDRProcessingByCapabilities;
    [(MSRHDRProcessing *)&v4 hlg_getTmLutInput:a3 lutInput:a4];
  }
}

- (void)dovi_ootf_getTmLutInput:(unint64_t)a3 lutInput:(float *)a4
{
  if (self->super._enableUnequalSpacingLUT)
  {
    [(MSRHDRProcessingByCapabilities *)self getTmUnequalLutInput:a3 lutInput:a4];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)MSRHDRProcessingByCapabilities;
    [(MSRHDRProcessing *)&v4 dovi_ootf_getTmLutInput:a3 lutInput:a4];
  }
}

- (void)hdr10_tm_updateLUT:(int64_t)a3 ScalingFactorBuffer:(float *)a4 LumaMixFactorBuffer:(float *)a5
{
  if (self->super._enableUnequalSpacingLUT)
  {
    if (a3 == 6)
    {
      self->_unequalSpacingTmLutMode = 1;
      memcpy(self->_toneMapLUT0, a4, sizeof(self->_toneMapLUT0));
      memcpy(self->_toneMapLUT2, a4 + 257, sizeof(self->_toneMapLUT2));
      for (uint64_t i = 0; i != 257; ++i)
        self->_toneMapLUT1[i] = a5[i] * 0.015625;
      for (uint64_t j = 0; j != 497; ++j)
        self->_toneMapLUT3[j] = a5[j + 257] * 0.015625;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MSRHDRProcessingByCapabilities;
    [(MSRHDRProcessing *)&v10 hdr10_tm_updateLUT:a3 ScalingFactorBuffer:a4 LumaMixFactorBuffer:a5];
  }
}

- (void)hlg_tm_updateLUT:(int64_t)a3 ScalingFactorBuffer:(float *)a4
{
  if (self->super._enableUnequalSpacingLUT)
  {
    if (a3 == 6)
    {
      self->_unequalSpacingTmLutMode = 1;
      memcpy(self->_toneMapLUT0, a4, sizeof(self->_toneMapLUT0));
      memcpy(self->_toneMapLUT2, a4 + 257, sizeof(self->_toneMapLUT2));
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MSRHDRProcessingByCapabilities;
    [(MSRHDRProcessing *)&v6 hlg_tm_updateLUT:a3 ScalingFactorBuffer:a4];
  }
}

- (int)getLumaShiftBits
{
  if (self->super._enableUnequalSpacingLUT) {
    return 7;
  }
  else {
    return 15;
  }
}

- (void)populateMSRColorConfigStageB02HDR10:(id *)a3 DMConfig:(id *)a4
{
  if (self->super._enableUnequalSpacingLUT)
  {
    msrCU = self->super._msrCU;
    a3->var2.var0.var0[3946] = 8;
    msrCU->var8.var0 = self->_unequalSpacingTmLutMode;
    msrCU->var8.var1 = 0;
    msrCU->var8.var3 = [(MSRHDRProcessingByCapabilities *)self getLumaShiftBits];
    msrCU->var8.var7 = 0;
    *(_WORD *)&msrCU->var8.var4 = 512;
    msrCU->var8.var2 = 21;
    var8 = msrCU->var8.var8;
    uint64_t v8 = -3;
    do
    {
      *(var8 - 4) = vcvts_n_s32_f32(*(&a4[1].var28 + (((_BYTE)v8 - 1) & 3)), 7uLL);
      *var8++ = 128;
    }
    while (!__CFADD__(v8++, 1));
    *(_OWORD *)msrCU->var8.var9 = 0u;
    *(_OWORD *)&msrCU->var8.var9[4] = 0u;
    memcpy(self->super._msrCU->var8.var10, self->_toneMapLUT0, sizeof(self->super._msrCU->var8.var10));
    memcpy(self->super._msrCU->var8.var12, self->_toneMapLUT2, sizeof(self->super._msrCU->var8.var12));
    memcpy(self->super._msrCU->var8.var11, self->_toneMapLUT1, sizeof(self->super._msrCU->var8.var11));
    var13 = self->super._msrCU->var8.var13;
    memcpy(var13, self->_toneMapLUT3, 0x7C4uLL);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MSRHDRProcessingByCapabilities;
    [(MSRHDRProcessing *)&v11 populateMSRColorConfigStageB02HDR10:a3 DMConfig:a4];
  }
}

- (void)populateMSRColorConfigStageB02HLG:(id *)a3 hdrControl:(id *)a4
{
  if (self->super._enableUnequalSpacingLUT)
  {
    msrCU = self->super._msrCU;
    a3->var2.var0.var0[3946] = 8;
    msrCU->var8.var0 = self->_unequalSpacingTmLutMode;
    msrCU->var8.var1 = 0;
    unsigned __int8 v7 = [(MSRHDRProcessingByCapabilities *)self getLumaShiftBits];
    uint64_t v8 = 0;
    msrCU->var8.var3 = v7;
    msrCU->var8.var7 = 0;
    *(_WORD *)&msrCU->var8.var4 = 0;
    msrCU->var8.var2 = 24;
    do
    {
      unsigned int var15 = a4->var15;
      if (var15 == 1) {
        objc_super v10 = (char *)&RGB709toHLGY_coeff;
      }
      else {
        objc_super v10 = (char *)&RGB2020toHLGY_coeff;
      }
      if (var15 == 12) {
        objc_super v11 = (char *)&RGBP3toHLGY_coeff;
      }
      else {
        objc_super v11 = v10;
      }
      int v12 = (int)(float)(*(float *)&v11[v8 * 4] * 127.0);
      msrCU->var8.var8[v8] = v12;
      msrCU->var8.var6[v8++] = v12;
    }
    while (v8 != 3);
    *(_OWORD *)msrCU->var8.var9 = 0u;
    *(_OWORD *)&msrCU->var8.var9[4] = 0u;
    memcpy(self->super._msrCU->var8.var10, self->_toneMapLUT0, sizeof(self->super._msrCU->var8.var10));
    var12 = self->super._msrCU->var8.var12;
    memcpy(var12, self->_toneMapLUT2, 0x7C4uLL);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MSRHDRProcessingByCapabilities;
    [(MSRHDRProcessing *)&v14 populateMSRColorConfigStageB02HLG:a3 hdrControl:a4];
  }
}

- (void)populateMSRColorConfigStageHwOOTF:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10
{
  if (byte_26ABE1E1B)
  {
    p_var10 = &self->super._msrCU->var10;
    if (a4)
    {
      p_var10->var0 = 1;
      p_var10->var1 = 24;
      p_var10->var2 = [(MSRHDRProcessingByCapabilities *)self getOotfLumaShiftBits];
      p_var10->var5 = 0.0;
      p_var10->var3 = 0;
      unsigned int var15 = a9->var15;
      uint64_t v18 = (int *)&RGB2020toHLGY_coeff;
      if (var15 == 1) {
        uint64_t v18 = (int *)&RGB709toHLGY_coeff;
      }
      if (var15 == 12) {
        uint64_t v19 = (int *)&RGBP3toHLGY_coeff;
      }
      else {
        uint64_t v19 = v18;
      }
      var6 = ($E4EA47D51A0A0172262EFFCA331250D8 *)p_var10->var6;
      uint64_t v21 = 3;
      do
      {
        int v22 = *v19++;
        var6->var0 = v22;
        LODWORD(var6[-1].var6[0]) = v22;
        var6 = ($E4EA47D51A0A0172262EFFCA331250D8 *)((char *)var6 + 4);
        --v21;
      }
      while (v21);
      p_var10->var7 = a6[1].var3 + 1.0;
      v23.receiver = self;
      v23.super_class = (Class)MSRHDRProcessingByCapabilities;
      [(MSRHDRProcessing *)&v23 populateMSRColorConfigStageHwOOTF:a3 Enabled:1 Prefix:a5 DMConfig:a6 DMData:a7 tcControl:a8 hdrControl:a9 MSRHDRContext:a10];
    }
    else
    {
      p_var10->var0 = 0;
    }
  }
}

- (int)getOotfLumaShiftBits
{
  if (byte_26ABE1E1B) {
    return 15;
  }
  else {
    return 0;
  }
}

- (float)getDolby84DegammaScale
{
  LODWORD(v2) = 1.0;
  if (!self->super.super._enableHwOotfForDolby84)
  {
    v4.receiver = self;
    v4.super_class = (Class)MSRHDRProcessingByCapabilities;
    [(MSRHDRProcessing *)&v4 getDolby84DegammaScale];
  }
  return *(float *)&v2;
}

- (float)getDolby84PostDegammaScale
{
  LODWORD(v2) = 10.0;
  if (!self->super.super._enableHwOotfForDolby84)
  {
    v4.receiver = self;
    v4.super_class = (Class)MSRHDRProcessingByCapabilities;
    [(MSRHDRProcessing *)&v4 getDolby84PostDegammaScale];
  }
  return *(float *)&v2;
}

@end