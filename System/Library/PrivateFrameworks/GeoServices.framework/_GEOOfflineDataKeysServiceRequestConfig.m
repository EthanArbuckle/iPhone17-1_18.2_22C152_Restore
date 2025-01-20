@interface _GEOOfflineDataKeysServiceRequestConfig
+ (id)standardConfig;
- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (id)serviceTypeNumber;
- (unint64_t)urlType;
@end

@implementation _GEOOfflineDataKeysServiceRequestConfig

+ (id)standardConfig
{
  if (_MergedGlobals_260 != -1) {
    dispatch_once(&_MergedGlobals_260, &__block_literal_global_115);
  }
  v2 = (void *)qword_1EB29FE08;

  return v2;
}

- (unint64_t)urlType
{
  return 60;
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