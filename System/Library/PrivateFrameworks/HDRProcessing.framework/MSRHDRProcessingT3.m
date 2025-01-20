@interface MSRHDRProcessingT3
- (MSRHDRProcessingT3)init;
- (int)getLumaShiftBits;
- (unint64_t)getTmLutSize;
- (void)dovi_ootf_getTmLutInput:(unint64_t)a3 lutInput:(float *)a4;
- (void)getTmUnequalLutInput:(unint64_t)a3 lutInput:(float *)a4;
- (void)hdr10_getTmLutInput:(unint64_t)a3 lutInput:(float *)a4;
- (void)hdr10_tm_updateLUT:(int64_t)a3 ScalingFactorBuffer:(float *)a4 LumaMixFactorBuffer:(float *)a5;
- (void)hlg_getTmLutInput:(unint64_t)a3 lutInput:(float *)a4;
- (void)hlg_tm_updateLUT:(int64_t)a3 ScalingFactorBuffer:(float *)a4;
- (void)populateMSRColorConfigStageB02HDR10:(id *)a3 DMConfig:(id *)a4;
- (void)populateMSRColorConfigStageB02HLG:(id *)a3 hdrControl:(id *)a4;
- (void)setupHardwareConfigUnit;
@end

@implementation MSRHDRProcessingT3

- (MSRHDRProcessingT3)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSRHDRProcessingT3;
  result = [(MSRHDRProcessingT2 *)&v3 init];
  unequalLUTSupport = 1;
  return result;
}

- (void)setupHardwareConfigUnit
{
  v7.receiver = self;
  v7.super_class = (Class)MSRHDRProcessingT3;
  objc_super v3 = (HDRConfig *)[(MSRHDRProcessingT2 *)&v7 setupHardwareConfigUnit];
  self->super.super.super._msrCU->var7 = (MSRHcuEntryHeader_t)0x17D866726173;
  Config = GetConfig(v3);
  if (Config)
  {
    v5 = GetConfig((HDRConfig *)Config);
    int v6 = *(unsigned __int8 *)HDRConfig::GetConfigEntryValue((uint64_t)v5, 0x24u, 0);
    self->super.super.super._enableUnequalSpacingLUT = v6;
    if (v6) {
      self->super.super.super._msrCU->var0 = (MSRHcuHeader_t)vadd_s32((int32x2_t)self->super.super.super._msrCU->var0, (int32x2_t)0x17D800000001);
    }
  }
  else
  {
    self->super.super.super._enableUnequalSpacingLUT = 0;
  }
}

- (unint64_t)getTmLutSize
{
  if (self->super.super.super._enableUnequalSpacingLUT) {
    return 754;
  }
  v3.receiver = self;
  v3.super_class = (Class)MSRHDRProcessingT3;
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
  if (self->super.super.super._enableUnequalSpacingLUT)
  {
    [(MSRHDRProcessingT3 *)self getTmUnequalLutInput:a3 lutInput:a4];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)MSRHDRProcessingT3;
    [(MSRHDRProcessing *)&v4 hdr10_getTmLutInput:a3 lutInput:a4];
  }
}

- (void)hlg_getTmLutInput:(unint64_t)a3 lutInput:(float *)a4
{
  if (self->super.super.super._enableUnequalSpacingLUT)
  {
    [(MSRHDRProcessingT3 *)self getTmUnequalLutInput:a3 lutInput:a4];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)MSRHDRProcessingT3;
    [(MSRHDRProcessing *)&v4 hlg_getTmLutInput:a3 lutInput:a4];
  }
}

- (void)dovi_ootf_getTmLutInput:(unint64_t)a3 lutInput:(float *)a4
{
  if (self->super.super.super._enableUnequalSpacingLUT)
  {
    [(MSRHDRProcessingT3 *)self getTmUnequalLutInput:a3 lutInput:a4];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)MSRHDRProcessingT3;
    [(MSRHDRProcessing *)&v4 dovi_ootf_getTmLutInput:a3 lutInput:a4];
  }
}

- (void)hdr10_tm_updateLUT:(int64_t)a3 ScalingFactorBuffer:(float *)a4 LumaMixFactorBuffer:(float *)a5
{
  if (self->super.super.super._enableUnequalSpacingLUT)
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
    v10.super_class = (Class)MSRHDRProcessingT3;
    [(MSRHDRProcessing *)&v10 hdr10_tm_updateLUT:a3 ScalingFactorBuffer:a4 LumaMixFactorBuffer:a5];
  }
}

- (void)hlg_tm_updateLUT:(int64_t)a3 ScalingFactorBuffer:(float *)a4
{
  if (self->super.super.super._enableUnequalSpacingLUT)
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
    v6.super_class = (Class)MSRHDRProcessingT3;
    [(MSRHDRProcessing *)&v6 hlg_tm_updateLUT:a3 ScalingFactorBuffer:a4];
  }
}

- (int)getLumaShiftBits
{
  return 7;
}

- (void)populateMSRColorConfigStageB02HDR10:(id *)a3 DMConfig:(id *)a4
{
  if (self->super.super.super._enableUnequalSpacingLUT)
  {
    msrCU = self->super.super.super._msrCU;
    a3->var2.var0.var0[3946] = 8;
    msrCU->var8.var0 = self->_unequalSpacingTmLutMode;
    msrCU->var8.var1 = 0;
    msrCU->var8.var3 = [(MSRHDRProcessingT3 *)self getLumaShiftBits];
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
    memcpy(self->super.super.super._msrCU->var8.var10, self->_toneMapLUT0, sizeof(self->super.super.super._msrCU->var8.var10));
    memcpy(self->super.super.super._msrCU->var8.var12, self->_toneMapLUT2, sizeof(self->super.super.super._msrCU->var8.var12));
    memcpy(self->super.super.super._msrCU->var8.var11, self->_toneMapLUT1, sizeof(self->super.super.super._msrCU->var8.var11));
    var13 = self->super.super.super._msrCU->var8.var13;
    memcpy(var13, self->_toneMapLUT3, 0x7C4uLL);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MSRHDRProcessingT3;
    [(MSRHDRProcessing *)&v11 populateMSRColorConfigStageB02HDR10:a3 DMConfig:a4];
  }
}

- (void)populateMSRColorConfigStageB02HLG:(id *)a3 hdrControl:(id *)a4
{
  if (self->super.super.super._enableUnequalSpacingLUT)
  {
    msrCU = self->super.super.super._msrCU;
    a3->var2.var0.var0[3946] = 8;
    msrCU->var8.var0 = self->_unequalSpacingTmLutMode;
    msrCU->var8.var1 = 0;
    unsigned __int8 v7 = [(MSRHDRProcessingT3 *)self getLumaShiftBits];
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
    memcpy(self->super.super.super._msrCU->var8.var10, self->_toneMapLUT0, sizeof(self->super.super.super._msrCU->var8.var10));
    var12 = self->super.super.super._msrCU->var8.var12;
    memcpy(var12, self->_toneMapLUT2, 0x7C4uLL);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MSRHDRProcessingT3;
    [(MSRHDRProcessing *)&v14 populateMSRColorConfigStageB02HLG:a3 hdrControl:a4];
  }
}

@end