@interface MSRHDRProcessingT5
- (MSRHDRProcessingT5)init;
- (unint64_t)getDegammaLutSize;
- (unint64_t)getRegammaLutSize;
- (void)getDegammaLutInput:(float *)a3;
- (void)getRegammaLutInput:(float *)a3;
- (void)setupHardwareConfigUnit;
@end

@implementation MSRHDRProcessingT5

- (MSRHDRProcessingT5)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSRHDRProcessingT5;
  return [(MSRHDRProcessingT4 *)&v3 init];
}

- (void)setupHardwareConfigUnit
{
  v2.receiver = self;
  v2.super_class = (Class)MSRHDRProcessingT5;
  [(MSRHDRProcessingT4 *)&v2 setupHardwareConfigUnit];
}

- (unint64_t)getDegammaLutSize
{
  return 97;
}

- (void)getDegammaLutInput:(float *)a3
{
  uint64_t v3 = 0;
  float v4 = -0.00097656;
  float v5 = 0.00048828;
  do
  {
    int v6 = dword_2222D3A0C[v3];
    if (v6 <= 1) {
      int v6 = 1;
    }
    do
    {
      float v4 = v5 + v4;
      *a3++ = v4;
      --v6;
    }
    while (v6);
    if (v3 == 5) {
      float v7 = 16.0;
    }
    else {
      float v7 = 2.0;
    }
    float v5 = v5 * v7;
    ++v3;
  }
  while (v3 != 8);
}

- (unint64_t)getRegammaLutSize
{
  return 113;
}

- (void)getRegammaLutInput:(float *)a3
{
  int v3 = 0;
  float v4 = 9.3132e-10;
  float v5 = -9.3132e-10;
  do
  {
    if (v3 == 27) {
      int v6 = 1;
    }
    else {
      int v6 = 4;
    }
    if (v3 == 1) {
      int v6 = 7;
    }
    if (!v3) {
      int v6 = 5;
    }
    do
    {
      float v5 = v4 + v5;
      *a3++ = v5;
      --v6;
    }
    while (v6);
    float v7 = v4 * 4.0;
    if (v3 != 26) {
      float v4 = v4 + v4;
    }
    if (!v3) {
      float v4 = v7;
    }
    ++v3;
  }
  while (v3 != 28);
}

@end