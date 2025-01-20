@interface FAFetchFamilyCircleRequest
- (BOOL)doNotFetchFromServer;
- (BOOL)forceServerFetch;
- (BOOL)promptUserToResolveAuthenticatonFailure;
- (BOOL)signedInAccountShouldBeApprover;
- (FAFetchFamilyCircleRequest)init;
- (NSArray)expectedAltDSIDs;
- (NSArray)expectedDSIDs;
- (NSDictionary)serverResponse;
- (NSString)context;
- (id)fetchCachedFamilyCircle:(id *)a3;
- (id)fetchCachedFamilyCircleWithCache:(id)a3 deviceInfo:(id)a4 error:(id *)a5;
- (id)fetchFamilyCircleWithError:(id *)a3;
- (id)requestOptions;
- (int64_t)qualityOfService;
- (unint64_t)_cachePolicy;
- (unint64_t)cachePolicy;
- (void)_cachePolicy;
- (void)setCachePolicy:(unint64_t)a3;
- (void)setContext:(id)a3;
- (void)setDoNotFetchFromServer:(BOOL)a3;
- (void)setExpectedAltDSIDs:(id)a3;
- (void)setExpectedDSIDs:(id)a3;
- (void)setForceServerFetch:(BOOL)a3;
- (void)setPromptUserToResolveAuthenticatonFailure:(BOOL)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setSignedInAccountShouldBeApprover:(BOOL)a3;
- (void)startRequestWithCompletionHandler:(id)a3;
@end

@implementation FAFetchFamilyCircleRequest

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (FAFetchFamilyCircleRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)FAFetchFamilyCircleRequest;
  result = [(FAFamilyCircleRequest *)&v3 init];
  if (result) {
    result->_cachePolicy = 1;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_serverResponse, 0);
  objc_storeStrong((id *)&self->_expectedAltDSIDs, 0);
  objc_storeStrong((id *)&self->_expectedDSIDs, 0);
}

- (id)fetchCachedFamilyCircle:(id *)a3
{
  v5 = objc_alloc_init(FADeviceInfo);
  v6 = [MEMORY[0x1E4F179C8] defaultStore];
  v7 = [FAFamilyCircleCache alloc];
  v8 = objc_msgSend(v6, "aa_primaryAppleAccount");
  v9 = [(FAFamilyCircleCache *)v7 initWithAccount:v8];

  v10 = [(FAFetchFamilyCircleRequest *)self fetchCachedFamilyCircleWithCache:v9 deviceInfo:v5 error:a3];

  return v10;
}

- (id)fetchCachedFamilyCircleWithCache:(id)a3 deviceInfo:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = _FALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = self;
    _os_log_impl(&dword_1D252C000, v10, OS_LOG_TYPE_DEFAULT, "Starting in process family request: %@", buf, 0xCu);
  }

  char v11 = [v9 unlockedSinceBoot];
  if (v11)
  {
    id v17 = 0;
    v12 = [v8 loadWithError:&v17];
    id v13 = v17;
    v14 = [v12 familyCircleIfFresh];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fa_familyErrorWithCode:", -1010);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 0;
  }
  v15 = _FALogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v14;
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_impl(&dword_1D252C000, v15, OS_LOG_TYPE_DEFAULT, "Family request came back with response: %@ - %@", buf, 0x16u);
  }

  if (a5) {
    *a5 = v13;
  }

  return v14;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__FAFetchFamilyCircleRequest_startRequestWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E6924B90;
  id v5 = v4;
  id v16 = v5;
  v6 = [(FAFamilyCircleRequest *)self serviceRemoteObjectWithErrorHandler:v15];
  v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = self;
    _os_log_impl(&dword_1D252C000, v7, OS_LOG_TYPE_DEFAULT, "Starting family request: %@", buf, 0xCu);
  }

  unint64_t v8 = [(FAFetchFamilyCircleRequest *)self _cachePolicy];
  BOOL v9 = [(FAFetchFamilyCircleRequest *)self signedInAccountShouldBeApprover];
  v10 = [(FAFetchFamilyCircleRequest *)self context];
  char v11 = [(FAFetchFamilyCircleRequest *)self requestOptions];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__FAFetchFamilyCircleRequest_startRequestWithCompletionHandler___block_invoke_23;
  v13[3] = &unk_1E69259F8;
  v13[4] = self;
  id v14 = v5;
  id v12 = v5;
  [v6 fetchFamilyCircleWithCachePolicy:v8 signedInAccountShouldBeApprover:v9 context:v10 options:v11 replyBlock:v13];
}

void __64__FAFetchFamilyCircleRequest_startRequestWithCompletionHandler___block_invoke_23(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  unint64_t v9 = a3;
  unint64_t v10 = a4;
  char v11 = _FALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412802;
    id v15 = v8;
    __int16 v16 = 2112;
    unint64_t v17 = v9;
    __int16 v18 = 2112;
    unint64_t v19 = v10;
    _os_log_impl(&dword_1D252C000, v11, OS_LOG_TYPE_DEFAULT, "Family request came back with response: %@ - %@ - %@", (uint8_t *)&v14, 0x20u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
  uint64_t v12 = *(void *)(a1 + 40);
  if (v9 | v10)
  {
    (*(void (**)(uint64_t, unint64_t, unint64_t))(v12 + 16))(v12, v9, v10);
  }
  else
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "fa_familyErrorWithCode:", -1015);
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
}

- (BOOL)signedInAccountShouldBeApprover
{
  return self->_signedInAccountShouldBeApprover;
}

- (id)requestOptions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)FAFetchFamilyCircleRequest;
  objc_super v3 = [(FAFamilyCircleRequest *)&v11 requestOptions];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[FAFetchFamilyCircleRequest promptUserToResolveAuthenticatonFailure](self, "promptUserToResolveAuthenticatonFailure"));
  [v4 setObject:v5 forKeyedSubscript:@"promptUserToResolveAuthenticatonFailure"];

  if ([(FAFetchFamilyCircleRequest *)self qualityOfService])
  {
    v6 = _FALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = FALogStringForQualityOfService([(FAFetchFamilyCircleRequest *)self qualityOfService]);
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_1D252C000, v6, OS_LOG_TYPE_DEFAULT, "Client set desired QOS - %@", buf, 0xCu);
    }
    id v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[FAFetchFamilyCircleRequest qualityOfService](self, "qualityOfService"));
    [v4 setObject:v8 forKeyedSubscript:@"FAQualityOfServiceOptionKey"];
  }
  unint64_t v9 = (void *)[v4 copy];

  return v9;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (BOOL)promptUserToResolveAuthenticatonFailure
{
  return self->_promptUserToResolveAuthenticatonFailure;
}

- (NSString)context
{
  return self->_context;
}

- (unint64_t)_cachePolicy
{
  if ([(FAFetchFamilyCircleRequest *)self doNotFetchFromServer])
  {
    objc_super v3 = _FALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[FAFetchFamilyCircleRequest _cachePolicy](v3);
    }

    self->_cachePolicy = 0;
  }
  if (![(FAFetchFamilyCircleRequest *)self forceServerFetch]) {
    return self->_cachePolicy;
  }
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[FAFetchFamilyCircleRequest _cachePolicy](v4);
  }

  unint64_t result = 2;
  self->_cachePolicy = 2;
  return result;
}

- (BOOL)forceServerFetch
{
  return self->_forceServerFetch;
}

- (BOOL)doNotFetchFromServer
{
  return self->_doNotFetchFromServer;
}

void __64__FAFetchFamilyCircleRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D252C000, v4, OS_LOG_TYPE_DEFAULT, "FAFetchFamilyCircleRequest: Error from service - %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchFamilyCircleWithError:(id *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__8;
  v37 = __Block_byref_object_dispose__8;
  id v38 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__8;
  v31 = __Block_byref_object_dispose__8;
  id v32 = 0;
  int v5 = _FASignpostLogSystem();
  os_signpost_id_t v6 = _FASignpostCreate(v5);
  uint64_t v8 = v7;

  unint64_t v9 = _FASignpostLogSystem();
  unint64_t v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D252C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "FetchFamilyCircleRequestSync", "", buf, 2u);
  }

  objc_super v11 = _FASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[FAFetchFamilyCircleRequest fetchFamilyCircleWithError:](v6, v11);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __57__FAFetchFamilyCircleRequest_fetchFamilyCircleWithError___block_invoke;
  v26[3] = &unk_1E69257C0;
  v26[4] = &v33;
  uint64_t v12 = [(FAFamilyCircleRequest *)self synchronousRemoteObjectWithErrorHandler:v26];
  unint64_t v13 = [(FAFetchFamilyCircleRequest *)self _cachePolicy];
  BOOL v14 = [(FAFetchFamilyCircleRequest *)self signedInAccountShouldBeApprover];
  id v15 = [(FAFetchFamilyCircleRequest *)self context];
  __int16 v16 = [(FAFetchFamilyCircleRequest *)self requestOptions];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __57__FAFetchFamilyCircleRequest_fetchFamilyCircleWithError___block_invoke_2;
  v25[3] = &unk_1E6925A20;
  v25[4] = &v33;
  v25[5] = &v27;
  [v12 fetchFamilyCircleWithCachePolicy:v13 signedInAccountShouldBeApprover:v14 context:v15 options:v16 replyBlock:v25];

  if (a3) {
    *a3 = (id) v34[5];
  }
  unint64_t Nanoseconds = _FASignpostGetNanoseconds(v6, v8);
  __int16 v18 = _FASignpostLogSystem();
  unint64_t v19 = v18;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    int v20 = [(id)v34[5] code];
    *(_DWORD *)buf = 67240192;
    LODWORD(v40) = v20;
    _os_signpost_emit_with_name_impl(&dword_1D252C000, v19, OS_SIGNPOST_INTERVAL_END, v6, "FetchFamilyCircleRequestSync", " ErrorCode=%{public,signpost.telemetry:number1,name=ErrorCode}d ", buf, 8u);
  }

  id v21 = _FASignpostLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    int v24 = [(id)v34[5] code];
    *(_DWORD *)buf = 134218496;
    os_signpost_id_t v40 = v6;
    __int16 v41 = 2048;
    double v42 = (double)Nanoseconds / 1000000000.0;
    __int16 v43 = 1026;
    int v44 = v24;
    _os_log_debug_impl(&dword_1D252C000, v21, OS_LOG_TYPE_DEBUG, "END [%lld] %fs:FetchFamilyCircleRequestSync  ErrorCode=%{public,signpost.telemetry:number1,name=ErrorCode}d ", buf, 0x1Cu);
  }

  id v22 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v22;
}

void __57__FAFetchFamilyCircleRequest_fetchFamilyCircleWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __57__FAFetchFamilyCircleRequest_fetchFamilyCircleWithError___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = _FALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412802;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl(&dword_1D252C000, v10, OS_LOG_TYPE_DEFAULT, "Synchronous family request came back with response: %@ - %@ - %@", (uint8_t *)&v16, 0x20u);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;
  id v13 = v9;

  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v8;
}

- (NSArray)expectedDSIDs
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExpectedDSIDs:(id)a3
{
}

- (NSArray)expectedAltDSIDs
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExpectedAltDSIDs:(id)a3
{
}

- (void)setSignedInAccountShouldBeApprover:(BOOL)a3
{
  self->_signedInAccountShouldBeApprover = a3;
}

- (void)setForceServerFetch:(BOOL)a3
{
  self->_forceServerFetch = a3;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setDoNotFetchFromServer:(BOOL)a3
{
  self->_doNotFetchFromServer = a3;
}

- (void)setPromptUserToResolveAuthenticatonFailure:(BOOL)a3
{
  self->_promptUserToResolveAuthenticatonFailure = a3;
}

- (NSDictionary)serverResponse
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void)setContext:(id)a3
{
}

- (void)fetchFamilyCircleWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D252C000, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: FetchFamilyCircleRequestSync ", (uint8_t *)&v2, 0xCu);
}

- (void)_cachePolicy
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D252C000, log, OS_LOG_TYPE_ERROR, "Deprecated - doNotFetchFromServer set, please use FACachePolicy", v1, 2u);
}

- (void)fetchCachedFamilyCircle:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D252C000, a2, OS_LOG_TYPE_ERROR, "fetchCachedFamilyCircle exception %@", (uint8_t *)&v2, 0xCu);
}

@end