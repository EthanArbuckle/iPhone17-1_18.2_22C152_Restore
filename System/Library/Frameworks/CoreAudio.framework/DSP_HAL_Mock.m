@interface DSP_HAL_Mock
+ (BOOL)hasTestHooks;
+ (unsigned)mockDSPPropertyCooldownMilliseconds;
+ (void)setTestHooks:(void *)a3;
- (id)createFactory:(int)a3;
@end

@implementation DSP_HAL_Mock

+ (unsigned)mockDSPPropertyCooldownMilliseconds
{
  return 2000;
}

+ (BOOL)hasTestHooks
{
  return gMockTestHooks != 0;
}

+ (void)setTestHooks:(void *)a3
{
  gMockTestHooks = (uint64_t)a3;
}

- (id)createFactory:(int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    v4 = objc_alloc_init(DSP_HAL_Mock_Factory);
    [(DSP_HAL_Mock_Factory *)v4 setFeatureFlag:v3];
  }
  else
  {
    v5 = objc_alloc_init(DSP_HAL_Bypass);
    v6 = v5;
    if (v5)
    {
      uint64_t v7 = [(DSP_HAL_Bypass *)v5 createFactory];
    }
    else
    {
      uint64_t v7 = 0;
    }

    v4 = (DSP_HAL_Mock_Factory *)v7;
  }

  return v4;
}

@end