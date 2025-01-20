@interface GEORPProblemOptInRequestConfig
+ (id)standardConfig;
- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (unint64_t)urlType;
@end

@implementation GEORPProblemOptInRequestConfig

+ (id)standardConfig
{
  if (_MergedGlobals_178 != -1) {
    dispatch_once(&_MergedGlobals_178, &__block_literal_global_1);
  }
  v2 = (void *)qword_1EB29F3D0;

  return v2;
}

void __48__GEORPProblemOptInRequestConfig_standardConfig__block_invoke()
{
  v0 = objc_alloc_init(GEORPProblemOptInRequestConfig);
  v1 = (void *)qword_1EB29F3D0;
  qword_1EB29F3D0 = (uint64_t)v0;
}

- (unint64_t)urlType
{
  return 25;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($C4D369C9F02205611300857CFD58F739)2853;
}

@end