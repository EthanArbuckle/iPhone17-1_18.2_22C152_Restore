@interface GEORPFeedbackLookupConfig
+ (id)standardConfig;
- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (double)timeout;
- (unint64_t)urlType;
@end

@implementation GEORPFeedbackLookupConfig

+ (id)standardConfig
{
  if (qword_1EB29F4A0 != -1) {
    dispatch_once(&qword_1EB29F4A0, &__block_literal_global_20);
  }
  v2 = (void *)qword_1EB29F4A8;

  return v2;
}

void __43__GEORPFeedbackLookupConfig_standardConfig__block_invoke()
{
  v0 = objc_alloc_init(GEORPFeedbackLookupConfig);
  v1 = (void *)qword_1EB29F4A8;
  qword_1EB29F4A8 = (uint64_t)v0;
}

- (unint64_t)urlType
{
  return 43;
}

- (double)timeout
{
  return GEOConfigGetDouble(GeoServicesConfig_FeedbackLookupRequestTimeout, (uint64_t)off_1E9114938);
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($C4D369C9F02205611300857CFD58F739)2853;
}

@end