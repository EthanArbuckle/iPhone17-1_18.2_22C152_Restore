@interface GEORPFeedbackRequester
+ (id)sharedInstance;
- (id)_requestConfigForRequest:(id)a3;
- (id)_validateResponse:(id)a3;
- (void)startWithRequest:(id)a3 traits:(id)a4 completionHandler:(id)a5;
@end

@implementation GEORPFeedbackRequester

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__GEORPFeedbackRequester_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB29F4B8 != -1) {
    dispatch_once(&qword_1EB29F4B8, block);
  }
  v2 = (void *)qword_1EB29F4B0;

  return v2;
}

void __40__GEORPFeedbackRequester_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB29F4B0;
  qword_1EB29F4B0 = (uint64_t)v1;
}

- (id)_requestConfigForRequest:(id)a3
{
  id v3 = a3;
  v4 = +[GEORPFeedbackSubmissionConfig standardConfig];
  v5 = [v3 feedbackRequestParameters];
  char v6 = [v3 isPOIEnrichment];

  if (v6)
  {
    v7 = off_1E53D5788;
  }
  else
  {
    if (![v5 hasLayoutConfigParameters]) {
      goto LABEL_6;
    }
    v7 = off_1E53D58C8;
  }
  uint64_t v8 = [(__objc2_class *)*v7 standardConfig];

  v4 = (void *)v8;
LABEL_6:

  return v4;
}

- (void)startWithRequest:(id)a3 traits:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = GEOFindOrCreateLog("com.apple.greentea", "GEO");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO) && [v8 hasGreenTeaWithValue:1]) {
    GEOGreenTeaLog(v11, (uint64_t)"RAP", 0);
  }

  v12 = [(GEORPFeedbackRequester *)self _requestConfigForRequest:v8];
  if (!v9)
  {
    v13 = +[GEOMapService sharedService];
    id v9 = [v13 defaultTraits];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__GEORPFeedbackRequester_startWithRequest_traits_completionHandler___block_invoke;
  v15[3] = &unk_1E53D7E50;
  id v16 = v10;
  id v14 = v10;
  [(GEOServiceRequester *)self _startWithRequest:v8 traits:v9 auditToken:0 config:v12 throttleToken:0 options:0 completionHandler:v15];
}

uint64_t __68__GEORPFeedbackRequester_startWithRequest_traits_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_validateResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = -8;
LABEL_9:
    v7 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:v6];
    goto LABEL_10;
  }
  int v4 = [v3 status];
  if (v4)
  {
    uint64_t v5 = -7;
    if (v4 == 20) {
      uint64_t v5 = -8;
    }
    if (v4 == 5) {
      uint64_t v6 = -10;
    }
    else {
      uint64_t v6 = v5;
    }
    goto LABEL_9;
  }
  v7 = 0;
LABEL_10:

  return v7;
}

@end