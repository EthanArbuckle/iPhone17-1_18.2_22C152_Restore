@interface _GEOOfflineDataSizeEstimationServiceRequestConfig
+ (id)standardConfig;
- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (id)serviceTypeNumber;
- (unint64_t)urlType;
@end

@implementation _GEOOfflineDataSizeEstimationServiceRequestConfig

+ (id)standardConfig
{
  if (_MergedGlobals_262 != -1) {
    dispatch_once(&_MergedGlobals_262, &__block_literal_global_118);
  }
  v2 = (void *)qword_1EB29FE28;

  return v2;
}

- (unint64_t)urlType
{
  return 61;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($C4D369C9F02205611300857CFD58F739)2859;
}

- (id)serviceTypeNumber
{
  return 0;
}

@end