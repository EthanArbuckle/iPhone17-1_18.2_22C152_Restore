@interface MSRHDRProcessingT4
- (MSRHDRProcessingT4)init;
- (float)getDolby84DegammaScale;
- (float)getDolby84PostDegammaScale;
- (int)getOotfLumaShiftBits;
- (void)populateMSRColorConfigStageHwOOTF:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10;
- (void)setupHardwareConfigUnit;
@end

@implementation MSRHDRProcessingT4

- (MSRHDRProcessingT4)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSRHDRProcessingT4;
  return [(MSRHDRProcessingT3 *)&v3 init];
}

- (void)setupHardwareConfigUnit
{
  v16.receiver = self;
  v16.super_class = (Class)MSRHDRProcessingT4;
  objc_super v3 = (HDRConfig *)[(MSRHDRProcessingT3 *)&v16 setupHardwareConfigUnit];
  self->super.super.super.super._msrCU->var9 = (MSRHcuEntryHeader_t)0x2C66726175;
  Config = (HDRConfig *)GetConfig(v3);
  if (Config)
  {
    v5 = GetConfig(Config);
    Config = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v5, 0x2Au, 0);
    BOOL v6 = *(unsigned char *)Config != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  self->super.super.super.super.super._enableHwOOTF = v6;
  ConfigEntryValue = (HDRConfig *)GetConfig(Config);
  if (ConfigEntryValue)
  {
    v8 = GetConfig(ConfigEntryValue);
    ConfigEntryValue = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v8, 0x2Bu, 0);
    BOOL v9 = *(unsigned char *)ConfigEntryValue != 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  self->super.super.super.super.super._enableHwOotfForHLG = v9;
  v10 = (HDRConfig *)GetConfig(ConfigEntryValue);
  if (v10)
  {
    v11 = GetConfig(v10);
    v10 = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v11, 0x2Cu, 0);
    BOOL v12 = *(unsigned char *)v10 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  self->super.super.super.super.super._enableHwOotfForDolby84 = v12;
  v13 = GetConfig(v10);
  if (v13)
  {
    v14 = GetConfig((HDRConfig *)v13);
    BOOL v15 = *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v14, 0x2Du, 0) != 0;
  }
  else
  {
    BOOL v15 = 0;
  }
  self->super.super.super.super._enableFp16Regamma = v15;
  if (self->super.super.super.super.super._enableHwOOTF) {
    self->super.super.super.super._msrCU->var0 = (MSRHcuHeader_t)vadd_s32((int32x2_t)self->super.super.super.super._msrCU->var0, (int32x2_t)0x2C00000001);
  }
}

- (void)populateMSRColorConfigStageHwOOTF:(id *)a3 Enabled:(BOOL)a4 Prefix:(char *)a5 DMConfig:(id *)a6 DMData:(id *)a7 tcControl:(ToneCurve_Control *)a8 hdrControl:(id *)a9 MSRHDRContext:(MSRHDRContext *)a10
{
  p_var10 = &self->super.super.super.super._msrCU->var10;
  if (a4)
  {
    p_var10->var0 = 1;
    p_var10->var1 = 24;
    p_var10->var2 = [(MSRHDRProcessingT4 *)self getOotfLumaShiftBits];
    p_var10->var5 = 0.0;
    p_var10->var3 = 0;
    unsigned int var15 = a9->var15;
    v18 = (int *)&RGB2020toHLGY_coeff;
    if (var15 == 1) {
      v18 = (int *)&RGB709toHLGY_coeff;
    }
    if (var15 == 12) {
      v19 = (int *)&RGBP3toHLGY_coeff;
    }
    else {
      v19 = v18;
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
    v23.super_class = (Class)MSRHDRProcessingT4;
    [(MSRHDRProcessing *)&v23 populateMSRColorConfigStageHwOOTF:a3 Enabled:1 Prefix:a5 DMConfig:a6 DMData:a7 tcControl:a8 hdrControl:a9 MSRHDRContext:a10];
  }
  else
  {
    p_var10->var0 = 0;
  }
}

- (int)getOotfLumaShiftBits
{
  return 15;
}

- (float)getDolby84DegammaScale
{
  LODWORD(v2) = 1.0;
  if (!self->super.super.super.super.super._enableHwOotfForDolby84)
  {
    v4.receiver = self;
    v4.super_class = (Class)MSRHDRProcessingT4;
    [(MSRHDRProcessing *)&v4 getDolby84DegammaScale];
  }
  return *(float *)&v2;
}

- (float)getDolby84PostDegammaScale
{
  LODWORD(v2) = 10.0;
  if (!self->super.super.super.super.super._enableHwOotfForDolby84)
  {
    v4.receiver = self;
    v4.super_class = (Class)MSRHDRProcessingT4;
    [(MSRHDRProcessing *)&v4 getDolby84PostDegammaScale];
  }
  return *(float *)&v2;
}

@end