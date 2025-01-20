@interface GEOGeocodeRequester
+ (id)sharedGeocodeRequester;
- (void)batchReverseGeocode:(id)a3 auditToken:(id)a4 success:(id)a5 networkActivity:(id)a6 error:(id)a7;
@end

@implementation GEOGeocodeRequester

+ (id)sharedGeocodeRequester
{
  if (qword_1EB29F880 != -1) {
    dispatch_once(&qword_1EB29F880, &__block_literal_global_8_0);
  }
  v2 = (void *)qword_1EB29F888;

  return v2;
}

void __45__GEOGeocodeRequester_sharedGeocodeRequester__block_invoke()
{
  v0 = objc_alloc_init(GEOGeocodeRequester);
  v1 = (void *)qword_1EB29F888;
  qword_1EB29F888 = (uint64_t)v0;
}

- (void)batchReverseGeocode:(id)a3 auditToken:(id)a4 success:(id)a5 networkActivity:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (void (**)(id, uint64_t))a6;
  id v16 = a7;
  if (v15) {
    v15[2](v15, 1);
  }
  v17 = GEOFindOrCreateLog("com.apple.greentea", "GEO");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO) && [v12 hasGreenTeaWithValue:1]) {
    GEOGreenTeaLog(v17, (uint64_t)"RevGeoCode", v13);
  }

  v18 = +[GEOMapService sharedService];
  v19 = [v18 defaultTraits];

  v20 = +[GEOGeocodeRequestConfig standardConfig];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __84__GEOGeocodeRequester_batchReverseGeocode_auditToken_success_networkActivity_error___block_invoke;
  v24[3] = &unk_1E53DFA50;
  v25 = v15;
  id v26 = v14;
  id v27 = v16;
  id v21 = v16;
  id v22 = v14;
  v23 = v15;
  [(GEOServiceRequester *)self _startWithRequest:v12 traits:v19 auditToken:v13 config:v20 throttleToken:0 options:0 completionHandler:v24];
}

void __84__GEOGeocodeRequester_batchReverseGeocode_auditToken_success_networkActivity_error___block_invoke(void *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = a1[4];
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  if (v10)
  {
    uint64_t v7 = a1[5];
    if (!v7) {
      goto LABEL_9;
    }
    v8 = *(void (**)(void))(v7 + 16);
  }
  else
  {
    uint64_t v9 = a1[6];
    if (!v9) {
      goto LABEL_9;
    }
    v8 = *(void (**)(void))(v9 + 16);
  }
  v8();
LABEL_9:
}

@end