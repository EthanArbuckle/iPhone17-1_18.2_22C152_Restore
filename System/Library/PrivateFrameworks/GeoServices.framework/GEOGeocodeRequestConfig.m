@interface GEOGeocodeRequestConfig
+ (id)standardConfig;
- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (id)serviceTypeNumber;
- (unint64_t)urlType;
@end

@implementation GEOGeocodeRequestConfig

+ (id)standardConfig
{
  if (_MergedGlobals_216 != -1) {
    dispatch_once(&_MergedGlobals_216, &__block_literal_global_57);
  }
  v2 = (void *)qword_1EB29F878;

  return v2;
}

void __41__GEOGeocodeRequestConfig_standardConfig__block_invoke()
{
  v0 = objc_alloc_init(GEOGeocodeRequestConfig);
  v1 = (void *)qword_1EB29F878;
  qword_1EB29F878 = (uint64_t)v0;
}

- (unint64_t)urlType
{
  return 16;
}

- (id)serviceTypeNumber
{
  return (id)[NSNumber numberWithInt:9];
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($C4D369C9F02205611300857CFD58F739)2855;
}

@end