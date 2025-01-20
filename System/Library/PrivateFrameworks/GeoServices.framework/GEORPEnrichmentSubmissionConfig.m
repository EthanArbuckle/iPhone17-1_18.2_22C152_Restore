@interface GEORPEnrichmentSubmissionConfig
+ (id)standardConfig;
- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (int)analyticNetworkServiceTypeForRequest:(id)a3 traits:(id)a4;
- (unint64_t)urlType;
@end

@implementation GEORPEnrichmentSubmissionConfig

+ (id)standardConfig
{
  if (_MergedGlobals_181 != -1) {
    dispatch_once(&_MergedGlobals_181, &__block_literal_global_7);
  }
  v2 = (void *)qword_1EB29F488;

  return v2;
}

void __49__GEORPEnrichmentSubmissionConfig_standardConfig__block_invoke()
{
  v0 = objc_alloc_init(GEORPEnrichmentSubmissionConfig);
  v1 = (void *)qword_1EB29F488;
  qword_1EB29F488 = (uint64_t)v0;
}

- (unint64_t)urlType
{
  return 53;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($C4D369C9F02205611300857CFD58F739)2853;
}

- (int)analyticNetworkServiceTypeForRequest:(id)a3 traits:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 feedbackRequestParameters];
    v6 = [v5 submissionParameters];
    v7 = [v6 details];
    int v8 = [v7 hasIncidentFeedback];

    if (v8) {
      int v9 = 28;
    }
    else {
      int v9 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [request isKindOfClass:GEORPFeedbackRequest.class]", v11, 2u);
    }
    int v9 = 0;
  }

  return v9;
}

@end