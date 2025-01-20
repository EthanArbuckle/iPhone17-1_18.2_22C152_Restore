@interface GEORPFeedbackSubmissionConfig
+ (id)standardConfig;
- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (unint64_t)urlType;
@end

@implementation GEORPFeedbackSubmissionConfig

+ (id)standardConfig
{
  if (qword_1EB29F490 != -1) {
    dispatch_once(&qword_1EB29F490, &__block_literal_global_11);
  }
  v2 = (void *)qword_1EB29F498;

  return v2;
}

void __47__GEORPFeedbackSubmissionConfig_standardConfig__block_invoke()
{
  v0 = objc_alloc_init(GEORPFeedbackSubmissionConfig);
  v1 = (void *)qword_1EB29F498;
  qword_1EB29F498 = (uint64_t)v0;
}

- (unint64_t)urlType
{
  return 42;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($C4D369C9F02205611300857CFD58F739)2853;
}

@end