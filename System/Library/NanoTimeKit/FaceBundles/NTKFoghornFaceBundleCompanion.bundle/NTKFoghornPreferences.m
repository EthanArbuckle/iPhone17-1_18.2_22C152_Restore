@interface NTKFoghornPreferences
+ (BOOL)depthDemoMode;
+ (BOOL)elevationDemoMode;
+ (BOOL)harmoniaDemoMode;
+ (BOOL)statusIndicatorMove;
+ (BOOL)timeViewUseStretchAnimation;
+ (double)depthDemoRate;
+ (double)depthDemoValue;
+ (double)elevationDemoAccuracy;
+ (double)elevationDemoPrecision;
+ (double)elevationDemoRate;
+ (double)elevationDemoValue;
+ (int64_t)harmoniaDemoOvernightScenario;
+ (int64_t)harmoniaDemoTrainingScenario;
+ (unint64_t)timeViewAnimationSnapStyle;
@end

@implementation NTKFoghornPreferences

+ (BOOL)depthDemoMode
{
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  sub_246B0FC88((uint64_t)v3);
  return v3[0];
}

+ (double)depthDemoValue
{
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  sub_246B0FC88((uint64_t)v3);
  return *((double *)v3 + 1);
}

+ (double)depthDemoRate
{
  uint64_t v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  sub_246B0FC88((uint64_t)&v3);
  return *(double *)&v4;
}

+ (BOOL)elevationDemoMode
{
  uint64_t v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  sub_246B0FC88((uint64_t)&v3);
  return BYTE8(v4);
}

+ (double)elevationDemoValue
{
  uint64_t v8 = 0;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  memset(v3, 0, sizeof(v3));
  sub_246B0FC88((uint64_t)v3);
  return *(double *)&v4;
}

+ (double)elevationDemoRate
{
  uint64_t v8 = 0;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  memset(v3, 0, sizeof(v3));
  sub_246B0FC88((uint64_t)v3);
  return *((double *)&v4 + 1);
}

+ (double)elevationDemoAccuracy
{
  uint64_t v7 = 0;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v4 = 0u;
  memset(v3, 0, sizeof(v3));
  sub_246B0FC88((uint64_t)v3);
  return *(double *)&v4;
}

+ (double)elevationDemoPrecision
{
  uint64_t v7 = 0;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v4 = 0u;
  memset(v3, 0, sizeof(v3));
  sub_246B0FC88((uint64_t)v3);
  return *((double *)&v4 + 1);
}

+ (BOOL)statusIndicatorMove
{
  uint64_t v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  memset(v3, 0, sizeof(v3));
  sub_246B0FC88((uint64_t)v3);
  return v4;
}

+ (BOOL)timeViewUseStretchAnimation
{
  uint64_t v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  memset(v3, 0, sizeof(v3));
  sub_246B0FC88((uint64_t)v3);
  return BYTE1(v4);
}

+ (unint64_t)timeViewAnimationSnapStyle
{
  uint64_t v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  memset(v3, 0, sizeof(v3));
  sub_246B0FC88((uint64_t)v3);
  return *((void *)&v4 + 1);
}

+ (BOOL)harmoniaDemoMode
{
  uint64_t v5 = 0;
  long long v4 = 0u;
  memset(v3, 0, sizeof(v3));
  sub_246B0FC88((uint64_t)v3);
  return v4;
}

+ (int64_t)harmoniaDemoOvernightScenario
{
  uint64_t v5 = 0;
  long long v4 = 0u;
  memset(v3, 0, sizeof(v3));
  sub_246B0FC88((uint64_t)v3);
  return *((void *)&v4 + 1);
}

+ (int64_t)harmoniaDemoTrainingScenario
{
  int64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  sub_246B0FC88((uint64_t)v3);
  return v4;
}

@end