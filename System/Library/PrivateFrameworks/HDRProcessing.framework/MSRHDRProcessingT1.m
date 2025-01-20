@interface MSRHDRProcessingT1
- (unint64_t)getDegammaLutSize;
- (void)getDegammaLutInput:(float *)a3;
- (void)setupHardwareConfigUnit;
@end

@implementation MSRHDRProcessingT1

- (void)setupHardwareConfigUnit
{
  v4.receiver = self;
  v4.super_class = (Class)MSRHDRProcessingT1;
  [(MSRHDRProcessing *)&v4 setupHardwareConfigUnit];
  msrCU = (int32x2_t *)self->super._msrCU;
  msrCU[4611] = (int32x2_t)0x140462617366;
  int32x2_t *msrCU = vadd_s32(*msrCU, (int32x2_t)0x140400000001);
}

- (unint64_t)getDegammaLutSize
{
  return 1281;
}

- (void)getDegammaLutInput:(float *)a3
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

@end