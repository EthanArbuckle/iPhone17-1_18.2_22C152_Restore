@interface GEOOfflineDataSizeEstimationServiceRequester
- (void)startWithRequest:(id)a3 traits:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
@end

@implementation GEOOfflineDataSizeEstimationServiceRequester

- (void)startWithRequest:(id)a3 traits:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  v13 = GEOFindOrCreateLog("com.apple.greentea", "GEO");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO) && [v10 hasGreenTeaWithValue:1]) {
    GEOGreenTeaLog(v13, (uint64_t)"OfflineDataService", 0);
  }

  v14 = +[GEOApplicationAuditToken currentProcessAuditToken];
  v15 = +[_GEOOfflineDataSizeEstimationServiceRequestConfig standardConfig];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __98__GEOOfflineDataSizeEstimationServiceRequester_startWithRequest_traits_options_completionHandler___block_invoke;
  v17[3] = &unk_1E53D7E50;
  id v18 = v11;
  id v16 = v11;
  [(GEOServiceRequester *)self _startWithRequest:v10 traits:v12 auditToken:v14 config:v15 throttleToken:0 options:a5 completionHandler:v17];
}

uint64_t __98__GEOOfflineDataSizeEstimationServiceRequester_startWithRequest_traits_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end