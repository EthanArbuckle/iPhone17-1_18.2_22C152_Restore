@interface MLProgramEngine
+ (Class)containerClass;
+ (int)gpuEngine;
+ (int)gpuPrecision;
@end

@implementation MLProgramEngine

+ (int)gpuPrecision
{
  v2 = +[MLFeatureFlags sharedFeatureFlags];
  int v3 = [v2 isMPSGraphEnabled];
  int v4 = 65552;

  if (v3)
  {
    v5 = +[MLFeatureFlags sharedFeatureFlags];
    int v6 = [v5 isMPSGraphFP16Enabled];

    if (v6) {
      return 65552;
    }
    else {
      return 65568;
    }
  }
  return v4;
}

+ (int)gpuEngine
{
  v2 = +[MLFeatureFlags sharedFeatureFlags];
  int v3 = [v2 isMPSGraphEnabled];

  if (v3) {
    return 50005;
  }
  else {
    return 5;
  }
}

+ (Class)containerClass
{
  return (Class)objc_opt_class();
}

@end