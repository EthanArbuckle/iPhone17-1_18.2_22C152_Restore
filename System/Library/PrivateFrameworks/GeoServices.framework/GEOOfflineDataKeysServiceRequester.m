@interface GEOOfflineDataKeysServiceRequester
- (void)startWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7;
@end

@implementation GEOOfflineDataKeysServiceRequester

- (void)startWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  v16 = GEOFindOrCreateLog("com.apple.greentea", "GEO");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO) && [v12 hasGreenTeaWithValue:1]) {
    GEOGreenTeaLog(v16, (uint64_t)"OfflineDataService", 0);
  }

  v17 = +[_GEOOfflineDataKeysServiceRequestConfig standardConfig];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __99__GEOOfflineDataKeysServiceRequester_startWithRequest_traits_auditToken_options_completionHandler___block_invoke;
  v19[3] = &unk_1E53D7E50;
  id v20 = v13;
  id v18 = v13;
  [(GEOServiceRequester *)self _startWithRequest:v12 traits:v15 auditToken:v14 config:v17 throttleToken:0 options:a6 completionHandler:v19];
}

uint64_t __99__GEOOfflineDataKeysServiceRequester_startWithRequest_traits_auditToken_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end